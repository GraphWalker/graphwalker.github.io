---
title: GraphWalker Restful API - getNext
tags: [API]
keywords: api, restful, rest, getNext
sidebar: sidebar
permalink: /rest-getnext/
toc: false
---



## GetNext

The Rest call `getNext` is used to get the next element from the path generation. GraphWalker will,
given the path generator, calculate what the next element should be and step one step forward in the execution of
the model. The element name is returned in the response.
 
**GET Request**

http://service-host:8887/graphwalker/getNext

**Response**

If the request was successful **"result"** will be **"ok"**. <br>
**"currentElementName"** will hold the name of the element.

```json
{
  "result":"ok",
  "currentElementName":"<The name of the element>"
}
```

## Example

From a Linux terminal, using curl:

```
curl http://localhost:8887/graphwalker/getNext
{"result":"ok","currentElementName":"e_init"}
```
