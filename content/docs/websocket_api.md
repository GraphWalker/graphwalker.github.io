---
title: GraphWalker WebSopcket API
tags: [example]
keywords: example
sidebar: sidebar
permalink: /websocket_api/
toc: false
summary: This is a summary
---


GraphWalker can be run as a WebSocket service.This page describes the API that can be used to
interact with the service.



## loadModel
Loads a model into the service. The model must use JSON notation for a GraphWalker model.
 
**Request**

An example of a request for loading  a model: 

```json
{
  "command":"loadModel",
  "model":{
    "name":"Small model",
    "id":"m1",
    "generator":"random(edge_coverage(100))",
    "startElementId":"e0",
    "vertices":[
      {
        "name":"v_VerifySomeAction",
        "id":"n0",
        "requirements":[
          "UC01 2.2.1"
        ]
      },
      {
        "name":"v_VerifySomeOtherAction",
        "id":"n1"
      }
    ],
    "edges":[
      {
        "name":"e_FirstAction",
        "id":"e0",
        "actions":[
          "index = 0;",
          "str = '';"
        ],
        "targetVertexId":"n0"
      },
      {
        "name":"e_AnotherAction",
        "id":"e1",
        "guard":"index <= 3",
        "sourceVertexId":"n0",
        "targetVertexId":"n1"
      },
      {
        "name":"e_SomeOtherAction",
        "id":"e2",
        "actions":[
          "index++;"
        ],
        "sourceVertexId":"n1",
        "targetVertexId":"n1"
      },
      {
        "id":"e3",
        "sourceVertexId":"n1",
        "targetVertexId":"n0"
      }
    ]
  }
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

```json
{
    "command": "loadModel",
    "success": boolean,
    "msg": "If success is false, an message will returned"
}
```

## start
Starts the machine. No more loadModel calls are allowed. 

**Request**

```json
{
    "type": "start"
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

```json
{
    "type": "start",
    "success": boolean,
    "msg": "If success is false, a message will returned",
}
```

## getNext
Gets the next element from the the GraphWalker machine

**Request**

```json
{
    "type": "getNext"
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

```json
{
    "type": "getNext",
    "id": "Element id",
    "name": "Element name"
    "success": boolean,
    "msg": "If success is false, a message will returned",
}
```

## hasNext
Checks if the machine has more steps to generate.

**Request**

```json
{
    "type": "hasNext"
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

```json
{
    "type": "hasNext",
    "hasNext": boolean,
    "success": boolean,
    "msg": "If success is false, a message will returned"
}
```

## restart
Will restart the machine. Any previously loaded models will be destroyed.

**Request**

```json
{
    "type": "restart"
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

```json
{
    "type": "restart",
    "success": boolean,
    "msg": "If success is false, a message will returned"
}
```

## getData
Asks the machine to return all data from the current model context.

**Request**

```json
{
    "type": "getData"
}
```

**Response**

```json
{
    "type": "getData",
    "success": boolean,
    "msg": "If success is false, a message will returned",
    "data": {
        :
        :
    }
}
```

## getModel
Will return the model with the given id **modelId** from the service.

**Request**

```json
{
  "command":"getModel",
  "modelId":"someId"
}
```

**Response**

```json
TODO: Add response here
```

## addModel
Asks the service to create a new empty model with the given **id**.

**Request**

```json
 {
   "command": "addModel",
   "id": "someModelId"
 }
```

**Response**

```json
TODO: Add response here
```

## removeModel
Removes the model with the given modelId from the service.

**Request**

```json
 {
  "command":"removeModel",
  "id": "someModelId"
 }
```

**Response**

```json
TODO: Add response here
```

## addVertex
Adds a vertex to the model with the given **modelId** and **vertexId** to the service.

**Request**

```json
 {
  "command": "addVertex",
  "modelId": "somModelId",
  "vertexId": "someVertexId"
 }
```

**Response**

```json
TODO: Add response here
```

## addEdge
Adds an edge to the model with the given **modelId** and **edgeId** to the service.

**Request**

```json
 {
  "command": "addEdge",
  "modelId": "somModelId",
  "edgeId": "someEdgeId"
 }
```

**Response**

```json
TODO: Add response here
```

## updateVertex
Updates attribute(s) to the vertex with given **id** and **modelId** from the service.

**Request**

```json
 {
  "command": "updateVertex",
  "modelId": "somModelId",
  TODO: Add more info here
 }
```

**Response**

```
TODO: Add response here
```

## updatEdge
Updates attribute(s) to the edge with given **id** and **modelId** from the service.

**Request**

```json
 {
  "command": "updateEdge",
  "modelId": "somModelId",
  TODO: Add more info here
 }
```

**Response**

```
TODO: Add response here
```

## removeVertex
Removes the vertex with the given **modelId** and **vertexId** to the service.

**Request**

```json
 {
  "command": "removeVertex",
  "modelId": "somModelId",
  "vertexId": "someVertexId"
 }
```

**Response**

```
TODO: Add response here
```

## removeEdge
Removes the edge with the given **modelId** and **edgeId** to the service.

**Request**

```json
 {
  "command": "removeEdge",
  "modelId": "somModelId",
  "edgeId": "someEdgeId"
 }
```

**Response**

```
TODO: Add response here
```

## visitedElement
When the graph is executed by the server, it will send updates regarding the model state.

**Message**

```json
{
    "type": "visitedElement",
    "id": "The id of the graph element.",
    "visitedCount": "<The number of times GraphWalker has visited (passed) this element>
}
```

