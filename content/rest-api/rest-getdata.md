---
title: GraphWalker Restful API - getData
tags: [api]
keywords: api, restful, rest, getData
sidebar: sidebar
permalink: /rest-getdata/
toc: false
---



## getData

The call `getData` is used to ask GraphWalker for the current data values of the current model.
 
**POST Request**

http://service-host:8887/graphwalker/getData

**Response**

If the request was successful **"result"** will be **"ok"**.
The **data** part will hold the data as a key value elements.

```json
{
  "result":"ok",
  "data":
  {
    "num_of_books":"0",
    "MAX_BOOKS":"5"
  }
}
```

## Example

From a Linux terminal, using curl:

```
curl http://localhost:8887/graphwalker/getData
{"result":"ok","data":{"num_of_books":"0","MAX_BOOKS":"5"}}
```
