---
title: GraphWalker Restful API - setData
tags: [api]
keywords: api, restful, rest, setData
sidebar: sidebar
permalink: /rest-setdata/
toc: false
---



## setData

The call `setData` is used to set data in the current model.
 
**PUT Request**

http://service-host:8887/graphwalker/setData/<JAVA SCRIPT>

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
curl -X PUT http://localhost:8887/graphwalker/setData/MAX_BOOKS=6;
{"result":"ok","data":{"num_of_books":"0","MAX_BOOKS":"5"}}
```
