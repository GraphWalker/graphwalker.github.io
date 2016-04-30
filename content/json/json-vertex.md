---
title: GraphWalker JSON file format - Vertex
tags: [JSON]
keywords: api, file format, json, vertex
sidebar: sidebar
permalink: /json-vertex/
toc: false
---


A single GraphWalker vertex representation in JSON

## Vertex

```json
{
    "id": "<The unique id of the vertex>",
    "name": "<The name of the vertex>",
    "properties": {
        "key1": <value1>,
        "key2": "<value2>"
    },
    "sharedState": "<SHARED STATE NAME>"
}
```

### properties

The properties list is not mandatory. I can be used to store key / value data of different kinds.

### sharedState

The sharedState is a mechanism that allows GraphWalker to jump between states in different models during execution.
During path generation, if a vertex with a `sharedState` is encountered, GraphWalker will look in all the other graphs
 and see if there is vertices with the same sharedState name. If true, GraphWalker can choose to jump over to any one
 of those vertices.

The sharedState is not mandatory.


## Example

This is an example of an edge.

```json
{
    "id": "n0",
    "name": "v_OwnerInformation",
    "properties": {
        "x": -177.34375,
        "y": 35.1875
    },
    "sharedState": "OwnerInformation"
}
```