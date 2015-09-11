---
title: GraphWalker WebSopcket API
layout: default
---

# GraphWalker WebSopcket API


## loadModel : client -> server
Loads a model into the GraphWalker machine.

The first model loaded, will be the one where the execution starts.
Several models can be loaded. Every model which is loaded, will have it's own context in the machine.
 
### Request
For the request, see [The graph in JSON](json_graph.html)

### Response
~~~
{
    "type": "loadModel",
    "success": boolean,
    "msg": "If success is false, an message will returned"
}
~~~

## start : client -> server
Starts the machine. No more loadModel calls are allowed. 

### Request
~~~
{
    "type": "start"
}
~~~

### Response
~~~
{
    "type": "start",
    "success": boolean,
    "msg": "If success is false, a message will returned",
}
~~~

## getNext : client -> server
Gets the next element from the the GraphWalker machine

### Request
~~~
{
    "type": "getNext"
}
~~~

### Response
~~~
{
    "type": "getNext",
    "id": "Element id",
    "name": "Element name"
    "success": boolean,
    "msg": "If success is false, a message will returned",
}
~~~

## hasNext : client -> server
Checks if the machine has more steps to generate.

### Request
~~~
{
    "type": "hasNext"
}
~~~

### Response
~~~
{
    "type": "hasNext",
    "hasNext": boolean,
    "success": boolean,
    "msg": "If success is false, a message will returned"
}
~~~

## restart : client -> server
Will restart the machine. Any previously loaded models will be destroyed.

### Request
~~~
{
    "type": "restart"
}
~~~

### Response
~~~
{
    "type": "restart",
    "success": boolean,
    "msg": "If success is false, a message will returned"
}
~~~

## getData : client -> server
Asks the machine to return all data from the current model context.

### Request
~~~
{
    "type": "getData"
}
~~~

### Response
~~~
{
    "type": "getData",
    "success": boolean,
    "msg": "If success is false, a message will returned",
    "data": {
        :
        :
    }
}
~~~

## visitedElement : server -> client
When the graph is executed by the server, it will send updates regarding the model state.

### Message
~~~
{
    "type": "visitedElement",
    "id": "The id of the graph element.",
    "visitedCount": "<The number of times GraphWalker has visited (passed) this element>
}
~~~

