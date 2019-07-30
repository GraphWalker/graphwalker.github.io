---
title: GraphWalker JSON file format - Edge
tags: [JSON]
keywords: api, file format, json, edge
sidebar: sidebar
permalink: /json-edge/
toc: false
---


A single GraphWalker edge representation in JSON.

## Edge

```json
{
    "id": "<The unique id of the edge>",
    "name": "<The name of the edge>",
    "sourceVertexId": "<The id of the source vertex of this edge>",
    "targetVertexId": "<The id of the target, or destination vertex of this edge>",
    "guard": "<The conditional expression which enables the accessibility of this edge>",
    "actions": [
        <ACTION IN JSON FORMAT>,
        <ACTION IN JSON FORMAT>
    ],
}
```

See the format of [action in JSON format](/json-action/).


## Example

This is an example of an edge from the [PetClinic](/petclinic/) test.

```json
{
    "actions": [
        " numOfPets++;"
    ],
    "id": "e0",
    "name": "e_AddPetSuccessfully",
    "guard": "numOfPets <= 10",
    "sourceVertexId": "n1",
    "targetVertexId": "n0"
}
```