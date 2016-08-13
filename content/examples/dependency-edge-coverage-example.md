---
title: Dependency Edge Coverage Example
tags: [example]
keywords: example
sidebar: sidebar
permalink: /dependency-edge-coverage-example/
toc: false
---


This is an example on how to use GraphWalker's dependency edge coverage stop condition.

## Edge Dependency Definition

In the real product usage not every edge from the designed (anticipated) model has the same importance. Some edges are more used than others, and therefore they have higher business value. One way to depict the importance of a certain edge is by using the dependency value. The dependency of a certain edge shows how much the target vertex depends on the source vertex. The dependency value of the edges can be obtained by applying process mining techniques over production log files. With process mining (the heuristic miner) one can obtain a model of actual usage of a certain product, including the edge dependency. With the dependency edge coverage stop condition only the business "important" edges can be tested, i.e. only the one with high dependency. More info can be found on the [following link](https://www.slideshare.net/secret/md1XfwKjBx1jUz)

## Example Model

<img src="/images/DependencyModel.png" alt="DependencyModel">

## JSON File Format

```json
{
  "models": [
    {
      "name": "Dependency model",
      "generator": "random(dependency_edge_coverage(80))",
      "startElementId": "e0",
      "vertices": [
        {
          "name": "v_VerifySomeAction",
          "id": "n0"
        },
        {
          "name": "v_VerifySomeOtherAction",
          "id": "n1"
        }
      ],
      "edges": [
        {
          "name": "e_FirstAction",
          "id": "e0",
          "targetVertexId": "n0",
          "dependency": "100"
        },
        {
          "name": "e_AnotherAction",
          "id": "e1",
          "sourceVertexId": "n0",
          "targetVertexId": "n1",
          "dependency": "100"
        },
        {
          "name": "e_SomeOtherAction",
          "id": "e2",
          "sourceVertexId": "n1",
          "targetVertexId": "n1",
          "dependency": "85"
        },
        {
          "name": "e_SomeOtherAction",
          "id": "e3",
          "sourceVertexId": "n1",
          "targetVertexId": "n0",
          "dependency": "15"
        }
      ]
    }
  ]
}
```

## Get the C# example source code

```
git clone https://github.com/GraphWalker/graphwalker-example.git
cd graphwalker-example/c-sharp-websocket/SmallModel
```

## Run the test

In a terminal, start GraphWalker as a REST service

```
java -jar graphwalker-cli-3.4.2.jar -d all online --service RESTFUL

```

Upload the model 'DependencyModel.json' to the service using curl (or you can use any tool to make a http post request to the REST service):

```
curl -vH "Content-Type: text/plain" --data @DependencyModel.json http://localhost:8887/graphwalker/load
{"result":"ok"}
```

In the folder of `graphwalker-example/c-sharp-websocket/SmallModel` build the C# project, on linux:

```
xbuild
```

Then run the test, on linux:

```
mono SmallModel/bin/Debug/SmallModel.exe
```

## What happened

After running the test we expect that graphwalker [follow this link to find out how does the SmallModel behave](http://graphwalker.github.io/c-sharp-example/) will stop running after visiting the edges that have dependency higher or equal to the one set in the model: random(dependency_edge_coverage(80))". The results below  show that only the edges with dependency higher or equal to 80%, such as e_FirstAction, e_AnotherAction, and e_SomeOtherAction have been visited. 

```
SmallModel.e_FirstAction
{}
SmallModel.v_VerifySomeAction
{}
SmallModel.e_AnotherAction
{}
SmallModel.v_VerifySomeOtherAction
{}
SmallModel.e_SomeOtherAction
{}
SmallModel.v_VerifySomeOtherAction
{}
{
  "totalFailedNumberOfModels": 0,
  "totalNotExecutedNumberOfModels": 0,
  "totalNumberOfUnvisitedVertices": 0,
  "verticesNotVisited": [],
  "totalNumberOfModels": 1,
  "totalCompletedNumberOfModels": 1,
  "totalNumberOfVisitedEdges": 3,
  "totalIncompleteNumberOfModels": 0,
  "edgesNotVisited": [
    {
      "modelName": "Dependency model",
      "edgeId": "e3",
      "edgeName": "e_SomeOtherAction"
    }
  ],
  "result": "ok",
  "vertexCoverage": 100,
  "totalNumberOfEdges": 4,
  "totalNumberOfVisitedVertices": 2,
  "edgeCoverage": 75,
  "totalNumberOfVertices": 2,
  "totalNumberOfUnvisitedEdges": 1
}

```

Moreover, in the summary part next to the detailed results,is concluded that the total number of completed models is 1, which is expected, the total number of visited edges is 3, and the total number of unvisited edges is 1 and that is:  

```
"modelName": "Dependency model",
"edgeId": "e3",
"edgeName": "e_SomeOtherAction"
```