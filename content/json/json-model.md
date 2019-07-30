---
title: GraphWalker JSON file format - Model
tags: [JSON]
keywords: api, file format, json, model
sidebar: sidebar
permalink: /json-model/
toc: false
---


A single GraphWalker model representation in JSON.

## Model

```json
{
    "generator": "<The generator of the model>",
    "id": "<The unique id of the model>",
    "name": "<The name of the model>",
    "actions": [
        <ACTION IN JSON FORMAT>,
        <ACTION IN JSON FORMAT>
    ]
    "edges": [
        <EDGE IN JSON FORMAT>,
        <EDGE IN JSON FORMAT>
    ],
    "vertices": [
        <VERTEX IN JSON FORMAT>,
        <VERTEX IN JSON FORMAT>
    ]
}
```

See the format of [edge in JSON format](/json-edge/).

See the format of [vertex in JSON format](/json-vertex/).

See the format of [action in JSON format](/json-action/).


## Example

This is one of the models in the [PetClinic](/petclinic/) test.

```json
{
    "generator": "quick_random(edge_coverage(100))",
    "id": "5f1149c3-2853-47e6-838d-691bf30406a8",
    "name": "OwnerInformationSharedState",
    "actions": [
        "numOfPets=0;"
    ],
    "edges": [
        {
            "actions": [
                " numOfPets++;"
            ],
            "id": "e0",
            "name": "e_AddPetSuccessfully",
            "sourceVertexId": "n1",
            "targetVertexId": "n0"
        },
        {
            "id": "e1",
            "name": "e_AddNewPet",
            "sourceVertexId": "n0",
            "targetVertexId": "n1"
        },
        {
            "guard": "numOfPets>0",
            "id": "e2",
            "name": "e_EditPet",
            "sourceVertexId": "n0",
            "targetVertexId": "n2"
        },
        {
            "id": "e3",
            "name": "e_UpdatePet",
            "sourceVertexId": "n2",
            "targetVertexId": "n0"
        },
        {
            "id": "e4",
            "name": "e_AddPetFailed",
            "sourceVertexId": "n1",
            "targetVertexId": "n1"
        },
        {
            "guard": "numOfPets>0",
            "id": "e5",
            "name": "e_AddVisit",
            "sourceVertexId": "n0",
            "targetVertexId": "n3"
        },
        {
            "id": "e6",
            "name": "e_VisitAddedSuccessfully",
            "sourceVertexId": "n3",
            "targetVertexId": "n0"
        },
        {
            "id": "e7",
            "name": "e_VisitAddedFailed",
            "sourceVertexId": "n3",
            "targetVertexId": "n3"
        },
        {
            "id": "e8",
            "name": "e_FindOwners",
            "sourceVertexId": "n0",
            "targetVertexId": "n4"
        }
    ],
    "vertices": [
        {
            "id": "n0",
            "name": "v_OwnerInformation",
            "properties": {
                "x": -177.34375,
                "y": 35.1875
            },
            "sharedState": "OwnerInformation"
        },
        {
            "id": "n1",
            "name": "v_NewPet",
            "properties": {
                "x": 252.65625,
                "y": 90.1875
            }
        },
        {
            "id": "n2",
            "name": "v_Pet",
            "properties": {
                "x": 253.65625,
                "y": -235.8125
            }
        },
        {
            "id": "n3",
            "name": "v_NewVisit",
            "properties": {
                "x": -46.34375,
                "y": -321.8125
            }
        },
        {
            "id": "n4",
            "name": "v_FindOwners",
            "properties": {
                "x": -256.34375,
                "y": -207.8125
            },
            "sharedState": "FindOwners"
        }
    ]
}
```