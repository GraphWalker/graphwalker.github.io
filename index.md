---
title: Getting started overview
summary: "GraphWalker is a open source Model-based testing tool for test automation. It's designed to make it easy to design your tests using graphs."
tags: [getting_started]
sidebar: sidebar
type: homepage
toc: false
---

## Overview 

GraphWalker is a [Model-Based testing](https://en.wikipedia.org/wiki/Model-based_testing) tool. It reads models in the shape of [directed graphs](https://en.wikipedia.org/wiki/Directed_graph), and generate [test] paths from these graphs.

<img src="/images/Login-small.png" alt="Model" align="right">

A model can look like the one to the right. The model is collection of arrows and nodes and together they create a graph.

* An arrow represents an action.
* A node represents a verification.

## What it does

Given the graph, GraphWalker generates a path from the graph. This path is then provided to the tool of your choice to execute the test.

Have a look at what features [GraphWalker offers](/features/).

## How to get it

Either [download the standalone jar file](/download/), or include GraphWalker in your java project. The latest release version is 3.4.2.

In your maven project, add this to your pom.xml file:

```xml
<dependency>
   <groupId>org.graphwalker</groupId>
   <artifactId>graphwalker-core</artifactId>
   <version>3.4.2</version>
</dependency>
```

