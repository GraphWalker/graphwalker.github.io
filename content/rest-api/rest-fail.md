---
title: GraphWalker API - fail
tags: [API]
keywords: api, restful, rest, fail
sidebar: sidebar
permalink: /rest-fail/
toc: false
---



## Fail

The Rest call `fail` terminates the path generation of the test session.
 
**PUT Request**

http://service-host:8887/graphwalker/fail/String%20to%20explain%20the%20failure

**Response**

```json
{
  "result":"nok"
}
```

## Example

From a Linux terminal, using curl:

```
curl -X PUT http://localhost:8887/graphwalker/fail/String%20to%20explain%20the%20failure
{"result":"nok","error":"java.lang.Throwable: String to explain the failure"}
```
