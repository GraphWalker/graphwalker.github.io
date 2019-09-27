---
title: Features of GraphWalker
tags: [introduction, work_flow]
keywords: features
sidebar: sidebar
permalink: /features/
toc: false
---

## The feature set of GraphWalker

### Path generation

* From a given set of graphs, generators and stop conditions, GraphWalker will generate a path through the graphs.<br>{: style=""}

  Your Model-Based test design consists of 1 or many graphs. Each graph will have its own set of generator(s) and stop conditions(s). Only when all stop conditions for all generators in all graphs are fulfilled is the generation of the path done.
  {: style="color:gray; font-size: 90%"}
  
* The path represents your test, or test case if you will.<br>{: style=""}

  The path is used by your test, to call the corresponding methods or functions in the order that is determined by the path.
  {: style="color:gray; font-size: 90%"}

* The path is a series of elements; the elements are pairs of edges and vertices.<br>{: style=""}

  It is like a test script, where an action is always followed by a verification. The path could look like:<br>  
  {: style="color:gray; font-size: 90%"}

  |Step|Label           |Element type|
  |----|----------------|------------|
  |1   |Do something    |Edge        |
  |2   |Verify something|Vertex      |
  |3   |Do something    |Edge        |
  |4   |Verify something|Vertex      |
  |5   |Do something    |Edge        |
  |6   |Verify something|Vertex      |
  |:   |:               |:           |
  {: style="color:gray; font-size: 90%"}


* An edge represents an action, a transition.<br>{: style=""}

  An action could be an API call, a button click, a timeout, etc. Anything that moves your System Under Test into a new state that you want to verify. But remember, there is no verification going on in the edge. That happens only in the vertex. 
  {: style="color:gray; font-size: 90%"}

* A vertex represents verification(s).<br>{: style=""}

  A verification is where you would have assertions in your code. It is here that you verify that an API call returns the correct values, that a button click actually did close a dialog, or that when the timeout should have occurred, the System Under Test triggered the expected event.
  {: style="color:gray; font-size: 90%"}


### Offline

In offline mode the path generation is done once, and it is not directly connected to any test automation code. The path needs to be stored in some intermediate format. Typically, the path is generated from command line, and the output stored on file. The content of the file is then used by your test automation to drive tests.

Offline mode is described in detail [here](/Test_paths_generation/#offline).

### Online

In online mode the path generation is done during the execution of the test, run-time. This means that GraphWalker needs to be embedded in your test automation code. This adds a bit of complexity, but there are advantages, such as direct access to graph execution context and no need to handle intermediate storing of paths.

Online mode is described in detail [here](/Test_paths_generation/#online).

## What GraphWalker does not do

### Test execution

GraphWalker does not interact with your system under test. You need some other tool do that. If, for instance, you want to test a web application, you would perhaps use [Selenium](http://www.seleniumhq.org/) to do that, or if your target is a mobile app, then [Appium](http://appium.io/) might be your choice.


### Graph editing

Currently, the graphs are edited using an external tool called [yEd from yWorks](https://www.yworks.com/products/yed).

A web editor supporting editing of directed graphs is underway, and is expected to be included in the 4.0 release of GraphWalker.

