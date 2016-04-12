---
title: Features of GraphWalker
tags: [introduction, workflow]
keywords: features
sidebar: sidebar
permalink: /features/
toc: false
---

## The feature set of GraphWalker

### Path generation

* From a given set of graphs, generators and stop conditions, GraphWalker will generate a path through the graphs.
* The path represents your test, or test case if you will. 
* The path consists of pairs of edges and vertices.
* An egde represents an action, a transition.
* A vertex represents a point of verification(s).


### Offline

The path generation can be generated from command line, and the output stored on file. The content of the file is then used to drive your test.

### Online

The path generation is done during the execution of the test, run-time.

## What GraphWalker does not do

### Test execution

GraphWalker does not interact with your system under test. You need some other tool do that. If, for instance, you want to test a web application, you would perhaps use [Selenium](http://www.seleniumhq.org/) to do that. Or, if your target is a mobile app, then [Appium](http://appium.io/) might be you choice.


### Graph editing

Today, the graphs are edited using an external tool called [yEd from yWorks](https://www.yworks.com/products/yed).

A webeditor supporting editing of directed graphs is underway, and is expected to be included in the 4.0 release of GraphWalker.

