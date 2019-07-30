---
title: GraphWalker WebSocket API - start
tags: [API]
keywords: api, websocket, start
sidebar: sidebar
permalink: /websocket-start/
toc: false
---



## Start
The Websocket message command `start` is used to load model(s) and start the service. The model must use JSON notation for a GraphWalker model.
 
**Request**

An example of a request for loading and starting a model. The model(s) are within the `gw3` tag.

```json
{
  "command":"start",
  "gw3":{
   "name":"A small test model",
   "models":[
    {
      "name":"Small model",
      "generator":"random(edge_coverage(100))",
      "startElementId":"e0",
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
        "targetVertexId":"n0"
       },
       {
        "name":"e_AnotherAction",
        "id":"e1",
        "sourceVertexId":"n0",
        "targetVertexId":"n1"
       },
       {
        "name":"e_SomeOtherAction",
        "id":"e2",
        "sourceVertexId":"n1",
        "targetVertexId":"n1"
       },
       {
        "name":"e_SomeOtherAction",
        "id":"e3",
        "sourceVertexId":"n1",
        "targetVertexId":"n0"
       }
      ]
    }
   ]
  }
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

```json
{
  "command": "start",
  "success": boolean,
  "msg": "If success is false, a message will be returned"
}
```
