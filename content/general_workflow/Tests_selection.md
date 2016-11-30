---
title: Introduction into a test selection
tags: [introduction, work flow]
keywords: introduction, work flow
sidebar: sidebar
permalink: /Tests_selection/
toc: false
---

### Tests selection step

The GraphWalker supports special rules which help you to select a sequence of actions and states which you would like to cover by your tests in your model.  
Those rules consist of two parts - "how to cover" and "what to cover". The pattern is illustrated below.  

<img src="/images/SelectionRulePattern.png" alt="Selection rule pattern">

And examples would look like the next:  
**random(edge_coverage(100))** - walk through the model randomly until reach all (100%) edges  
<img src="/images/LoginWithAllCoveredEdges.png" alt="LoginWithAllCoveredEdges">

**a_star(reached_vertex(v_Browse))** - generate a shortest path through the model to the vertex "v_Browse"  
<img src="/images/LoginWithReached_v_Browse.png" alt="LoginWithReached_v_Browse">

The GW has a plenty of ways how to cover your model both exhaustive and effective.   
The full list of path generation methods you can see in [generators and stop conditions](/generators_and_stop_conditions).  
After choosing of test selection criteria you may go to the selection of [test path generation type](/Test_paths_generation)
