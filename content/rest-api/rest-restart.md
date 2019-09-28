---
title: GraphWalker Restful API - restart
tags: [API]
keywords: api, restful, rest, restart
sidebar: sidebar
permalink: /rest-restart/
toc: false
---



## Restart

The Rest call `restart` will reset currently loaded model(s) to their initial states.
 
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
