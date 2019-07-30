---
title: GraphWalker API - getStatistics
tags: [API]
keywords: api, restful, rest, getStatistics
sidebar: sidebar
permalink: /rest-getstatistics/
toc: false
---



## GetStatistics

The Rest call `getStatistics` will fetch the current statistics of the session.
 
**POST Request**

http://service-host:8887/graphwalker/getStatistics

**Response**

If the request was successful **"result"** will be **"ok"**.

```json
{
    "edgeCoverage":                   <The coverage of edges in percent>,
    "result":                         <Either "OK" or "NOK">,
    "totalNumberOfEdges":             <Total number of edges in the model>,
    "totalNumberOfUnvisitedEdges":    <Number of edges not yet visited, or executed in the model>,
    "totalNumberOfUnvisitedVertices": <Number of vertices not yet visited, or executed in the model>,
    "totalNumberOfVertices":          <Total number of vertices in the model>,
    "totalNumberOfVisitedEdges":      <Number of edges visited, or executed in the model>,
    "totalNumberOfVisitedVertices":   <Number of vertices visited, or executed in the model>,
    "vertexCoverage":                 <The coverage of vertices in percent>
}
```

## Example

From a Linux terminal, using curl:

```
curl http://localhost:8887/graphwalker/getStatistics
{"result":"ok","vertexCoverage":85,"totalNumberOfEdges":12,"totalNumberOfVisitedVertices":6,"totalNumberOfUnvisitedVertices":1,"totalNumberOfVisitedEdges":6,"edgeCoverage":50,"totalNumberOfVertices":7,"totalNumberOfUnvisitedEdges":6}
```

Or, using the `python -m json.tool` to prettify the output:

```
curl -s http://localhost:8887/graphwalker/getStatistics | python -m json.tool
{
    "edgeCoverage": 50,
    "result": "ok",
    "totalNumberOfEdges": 12,
    "totalNumberOfUnvisitedEdges": 6,
    "totalNumberOfUnvisitedVertices": 1,
    "totalNumberOfVertices": 7,
    "totalNumberOfVisitedEdges": 6,
    "totalNumberOfVisitedVertices": 6,
    "vertexCoverage": 85
}
```
