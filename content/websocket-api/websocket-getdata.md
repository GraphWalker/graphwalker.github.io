---
title: GraphWalker WebSocket API - getData
tags: [API]
keywords: api, websocket, getData
sidebar: sidebar
permalink: /websocket-getdata/
toc: false
---



## GetData
The Websocket message command `getData` is used to ask GraphWalker for the current data values of the current model.
 
**Request**

```json
{
  "command":"getData"
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

This is an example of a getData response.

```json
{
  "data":{
    "x":"1",
    "y":"2"
  },
  "success":true,
  "command":"getData"
}
```