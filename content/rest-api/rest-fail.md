---
title: GraphWalker API - fail
tags: [api]
keywords: api, restful, rest, fail
sidebar: sidebar
permalink: /rest-fail/
toc: false
---



## fail

The call `fail` terminate the path generation of the test session.
 
**PUT Request**

http://service-host:8887/graphwalker/fail/String%20to%20explain%20the%20failure

**Response**

```json
{
  "result":"<Not applicable>"
}
```

## Example

From a Linux terminal, using curl:

```
curl -X PUT http://localhost:8887/graphwalker/fail/String%20to%20explain%20the%20failure
{"result":"nok","error":"java.lang.Throwable: String to explain the failure"}
```
