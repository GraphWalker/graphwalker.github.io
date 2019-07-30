---
title: Introduction to test selection
tags: [introduction, work_flow]
keywords: introduction, work flow
sidebar: sidebar
permalink: /Tests_selection/
toc: false
---

### Test selection step

GraphWalker supports special rules that help you select a sequence of actions and states you would like to cover by tests in your model.  
Those rules consists of two parts - "how to cover" and "what to cover". The pattern is illustrated here:  

<img src="/images/SelectionRulePattern.png" alt="Selection rule pattern">

And examples could look like this:  
**random(edge_coverage(100))** - walk through the model randomly until all (100%) edges have been reached
<img src="/images/LoginWithAllCoveredEdges.png" alt="LoginWithAllCoveredEdges">

**a_star(reached_vertex(v_Browse))** - generate a shortest path through the model to the vertex "v_Browse"  
<img src="/images/LoginWithReached_v_Browse.png" alt="LoginWithReached_v_Browse">

GraphWalker has plenty of ways to cover your model, both exhaustively and effectively.   
The full list of path generation methods can be seen in [generators and stop conditions](/generators_and_stop_conditions).  
After choosing test selection criteria you can go to the selection of [test path generation type](/Test_paths_generation)
