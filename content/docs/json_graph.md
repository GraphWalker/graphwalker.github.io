---
title: Graph in JSON
keywords: json, graph
toc: false
---


## type
The message type is **loadModel**. Message types defines what type of information this message carries.

## model
### model.name
The name of the model
### model.generator
The generator(s) and the stop condition(s) associated with this model. See also: [Path generators and stop conditions](/docs/path_generators_and_stop_conditions)
### model.vertices
A list of the vertices in the model.
#### model.vertices[].name
The name of the vertex
#### model.vertices[].id
The unique id of the vertex
#### model.vertices[].startElement
This sets the current vertex as the starting element in the graph. This is where the execution starts.
### model.edges
A list of the edges in the model.
#### model.edges[].name
The name of the edge
#### model.edges[].id
The unique id of the edge
#### model.edges[].srcVertexId
The source vertex id of the edge. The id must exist in the model.vertices[]
#### model.edges[].dstVertexId
The destination vertex id of the edge. The id must exist in the model.vertices[]
#### model.edges[].startElement
This sets the current edge as the starting element in the graph. This is where the execution starts.
#### model.edges[].actions
A list of action's that should be executed when the edge is visited. The default is javascript.
#### model.edges[].actions[].action
The actions. It represents 1 javascript statement. The statement must be terminated with a semicolon

# Example
~~~
{  
   "type":"loadModel",
   "model":{  
      "name":"Small model",
      "generator":"random(edge_coverage(100))",
      "vertices":[  
         {  
            "name":"v_VerifySomeAction",
            "id":"n0"
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
            "dstVertexId":"n0",
            "startElement":"true",
            "actions":[  
               {  
                  "action":"x=0;"
               },
               {  
                  "action":"y=0;"
               }
            ]
         },
         {  
            "name":"e_AnotherAction",
            "id":"e1",
            "srcVertexId":"n0",
            "dstVertexId":"n1",
            "actions":[  
               {  
                  "action":"y+=1;"
               }
            ]
         },
         {  
            "name":"e_SomeOtherAction",
            "id":"e2",
            "srcVertexId":"n1",
            "dstVertexId":"n1",
            "actions":[  
               {  
                  "action":"x+=1;"
               }
            ]
         },
         {  
            "name":"e_SomeOtherAction",
            "id":"e3",
            "srcVertexId":"n1",
            "dstVertexId":"n0",
            "actions":[  
               {  
                  "action":"y+=1;"
               }
            ]
         }
      ]
   }
}
~~~

