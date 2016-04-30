---
title: GraphWalker Restful API - restart
tags: [api]
keywords: api, restful, rest, restart
sidebar: sidebar
permalink: /rest-restart/
toc: false
---



## restart

The call `restart` will reset currently load model(s) to it's initial states.
 
**PUT Request**

http://service-host:8887/graphwalker/restart

**Response**

If the request was successful **"result"** will be **"ok"**.

```json
{
  "result":"ok",
}
```

## Example

From a Linux terminal, using curl:

```
curl -X PUT http://localhost:8887/graphwalker/restart
{"result":"ok"}
```
