---
title: GraphWalker WebSocket API - hasNext
tags: [api]
keywords: api, websocket, hasNext
sidebar: sidebar
permalink: /websocket-hasnext/
toc: false
---





## hasNext
The Websocket message command `hasNext` is used to ask GraphWalker if there are any elements left to execute in the model. If all stop conditions for the current model are fulfilled, the response will return **false** for the **hasNext** property.
 
**Request**

```json
{
  "command":"hasNext"
}
```

**Response**

If the request was successful **"success"** will be **"true"**.

```json
{
  "success":true,
  "hasNext":<If there are more elements to be executed, true will be returned. Otherwise false>,
  "command":"hasNext"
}
```
