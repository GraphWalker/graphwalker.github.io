---
title: GraphWalker WebSocket API - visitedElement
tags: [API]
keywords: api, websocket, visitedElement
sidebar: sidebar
permalink: /websocket-visitedelement/
toc: false
---



## VisitedElement
The message **visitedElement** is sent from GraphWalker whenever a **getNext** has happened. This message can be used to visualize the progress of the execution.
 
**Message**

```json
{
  "elementId":"<The id of the element>",
  "visitedCount":<The number of times this element has been visited>,
  "stopConditionFulfillment":<A float between 0 and 1, meaning how close to fulfillment the stop condition of the execution is. 1 is complete fulfillment.>,
  "data":{
    "x":"1",
    "y":"2"
  },
  "modelId":"<The id of the model>",
  "totalCount":<Total number of elements visited>,
  "command":"visitedElement"
}
```
