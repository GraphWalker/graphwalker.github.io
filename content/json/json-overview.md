---
title: GraphWalker JSON file format - Overview
tags: [JSON]
keywords: api, file format, json, overview
sidebar: sidebar
permalink: /json-overview/
toc: false
---


GraphWalker accepts file formats in JSON. Multiple models and their data can be stored in one single JSON file.

## File format

```json
{
  "name": "<Name of the test>",
  "models": [
    {
      <MODEL IN JSON FORMAT>
    },
    {
      <MODEL IN JSON FORMAT>
    }
  ]
}
```

See the format of [model in JSON format](/json-model/).


## Example

This is the [PetClinic](/petclinic/) test in one single json file.

```json
{
    "name": "VISMODEL",
    "models": [
        {
            "edges": [
                {
                    "id": "e0",
                    "name": "e_AddOwner",
                    "sourceVertexId": "n0",
                    "targetVertexId": "n1"
                },
                {
                    "id": "e1",
                    "name": "e_FindOwners",
                    "sourceVertexId": "n1",
                    "targetVertexId": "n0"
                },
                {
                    "id": "e2",
                    "name": "e_Search",
                    "sourceVertexId": "n0",
                    "targetVertexId": "n2"
                },
                {
                    "id": "e3",
                    "name": "e_FindOwners",
                    "sourceVertexId": "n2",
                    "targetVertexId": "n0"
                }
            ],
            "generator": "quick_random(edge_coverage(100))",
            "id": "476fb419-3d7d-4492-802e-6695fe93f595",
            "name": "FindOwnersSharedState",
            "vertices": [
                {
                    "id": "n0",
                    "name": "v_FindOwners",
                    "properties": {
                        "x": 0,
                        "y": 0
                    },
                    "sharedState": "FindOwners"
                },
                {
                    "id": "n1",
                    "name": "v_NewOwner",
                    "properties": {
                        "x": 199.65625,
                        "y": -137.8125
                    },
                    "sharedState": "NewOwner"
                },
                {
                    "id": "n2",
                    "name": "v_Owners",
                    "properties": {
                        "x": -78.34375,
                        "y": -201.8125
                    }
                }
            ]
        },
        {
            "edges": [
                {
                    "id": "e0",
                    "name": "e_IncorrectData",
                    "sourceVertexId": "n0",
                    "targetVertexId": "n1"
                },
                {
                    "id": "e1",
                    "sourceVertexId": "n1",
                    "targetVertexId": "n0"
                },
                {
                    "id": "e2",
                    "name": "e_CorrectData",
                    "sourceVertexId": "n0",
                    "targetVertexId": "n2"
                }
            ],
            "generator": "quick_random(edge_coverage(100))",
            "id": "b23d193c-287a-4eb9-a318-52ead7680ff7",
            "name": "NewOwnerSharedState",
            "vertices": [
                {
                    "id": "n0",
                    "name": "v_NewOwner",
                    "properties": {
                        "x": 0,
                        "y": 0
                    },
                    "sharedState": "NewOwner"
                },
                {
                    "id": "n1",
                    "name": "v_IncorrectData",
                    "properties": {
                        "x": -363.34375,
                        "y": -199.8125
                    }
                },
                {
                    "id": "n2",
                    "name": "v_OwnerInformation",
                    "properties": {
                        "x": 71.65625,
                        "y": -177.8125
                    },
                    "sharedState": "OwnerInformation"
                }
            ]
        },
        {
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
            "generator": "quick_random(edge_coverage(100))",
            "id": "5f1149c3-2853-47e6-838d-691bf30406a8",
            "name": "OwnerInformationSharedState",
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
        },
        {
            "edges": [
                {
                    "id": "e0",
                    "name": "e_FindOwners",
                    "sourceVertexId": "n0",
                    "targetVertexId": "n1"
                },
                {
                    "id": "e1",
                    "name": "e_HomePage",
                    "sourceVertexId": "n1",
                    "targetVertexId": "n0"
                },
                {
                    "id": "e2",
                    "name": "e_Veterinarians",
                    "sourceVertexId": "n0",
                    "targetVertexId": "n2"
                },
                {
                    "id": "e3",
                    "name": "e_HomePage",
                    "sourceVertexId": "n2",
                    "targetVertexId": "n0"
                },
                {
                    "id": "e4",
                    "name": "e_Veterinarians",
                    "sourceVertexId": "n1",
                    "targetVertexId": "n2"
                },
                {
                    "id": "e5",
                    "name": "e_FindOwners",
                    "sourceVertexId": "n2",
                    "targetVertexId": "n1"
                },
                {
                    "id": "e6",
                    "name": "e_StartBrowser",
                    "targetVertexId": "n0"
                }
            ],
            "generator": "quick_random(edge_coverage(100))",
            "id": "3f6b365f-7011-4db6-b0cc-e19aa453d9b8",
            "name": "PetClinicSharedState",
            "startElementId": "e6",
            "vertices": [
                {
                    "id": "n0",
                    "name": "v_HomePage",
                    "properties": {
                        "x": 0,
                        "y": 0
                    },
                    "sharedState": "HomePage"
                },
                {
                    "id": "n1",
                    "name": "v_FindOwners",
                    "properties": {
                        "x": 265.65625,
                        "y": -74.8125
                    },
                    "sharedState": "FindOwners"
                },
                {
                    "id": "n2",
                    "name": "v_Veterinarians",
                    "properties": {
                        "x": -103.34375,
                        "y": -139.8125
                    },
                    "sharedState": "Veterinarians"
                }
            ]
        },
        {
            "edges": [
                {
                    "id": "e0",
                    "name": "e_Search",
                    "sourceVertexId": "n0",
                    "targetVertexId": "n1"
                },
                {
                    "id": "e1",
                    "sourceVertexId": "n1",
                    "targetVertexId": "n0"
                }
            ],
            "generator": "quick_random(edge_coverage(100))",
            "id": "368a9635-c59a-4285-ad01-cf75b0baa978",
            "name": "VeterinariensSharedState",
            "vertices": [
                {
                    "id": "n0",
                    "name": "v_Veterinarians",
                    "properties": {
                        "x": 0,
                        "y": 0
                    },
                    "sharedState": "Veterinarians"
                },
                {
                    "id": "n1",
                    "name": "v_SearchResult",
                    "properties": {
                        "x": 158.65625,
                        "y": -114.8125
                    }
                }
            ]
        }
    ]
}
```