---
title: GraphWalker Restful API - hasNext
tags: [api]
keywords: api, restful, rest, hasNext
sidebar: sidebar
permalink: /rest-hasnext/
toc: false
---



## hasNext

The Rest call `hasNext` queries the service if there is anymore elements to fetch. If yes, then the fulfilment
  of the stop conditions has not yet been reached.
 
**POST Request**

http://service-host:8887/graphwalker/hasNext

**Response**

If the request was successful **"result"** will be **"ok"**.
If there are more elements to get, **hasNext** will be **true**.

```json
{
  "result":"ok",
  "hasNext":"true"
}
```

## Example

From a Linux terminal, using curl:

```
curl http://localhost:8887/graphwalker/hasNext
{"result":"ok","hasNext":"true"}
```
