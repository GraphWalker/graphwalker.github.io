---
title: GraphWalker WebSocket API - getNext
tags: [API]
keywords: api, websocket, getNext
sidebar: sidebar
permalink: /websocket-getnext/
toc: false
---



## GetNext
The Websocket message command `getNext` is used to get the next element from the path generation. GraphWalker will, given the path generator, calculate what the next element should be, and step one step forward in the execution of the model. The element name is returned in the response.
 
**Request**

```json
{
  "command":"getNext"
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

```json
{  
  "elementId":"<The id of the element>",
  "modelId":"<The id of the model>",
  "success":true,
  "name":"<The name of the element>",
  "command":"getNext"
}
```
