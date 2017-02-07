---
title: Getting started overview
summary: "GraphWalker is an open source Model-based testing tool for test automation. It's designed to make it easy to design your tests using graphs."
tags: [getting_started]
sidebar: sidebar
type: homepage
toc: false
---

## Overview 

GraphWalker is an [Model-Based testing](https://en.wikipedia.org/wiki/Model-based_testing) tool. It reads models in the shape of [directed graphs](https://en.wikipedia.org/wiki/Directed_graph), and generate [test] paths from these graphs.

A model can look like the one to the next. The model is collection of arrows and nodes and together they create a graph.

<img src="/images/Login.png" alt="Model">  

* An arrow represents an action.
* A node represents a verification.

## What GraphWalker does

Given a model and a generator rule, GraphWalker by mathematical algorithms generates a path which corresponds to your test idea. Next image illustrate such result.
  
<img src="/images/LoginWithPath.png" alt="LoginWithPath">  

Then this path would be provided to the tool of your choice to execute the test.  
In another words GraphWalker is a test generation tool.  

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

## Announcements

If you are a user of the project, please follow the announcements made on our [forum](https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!forum/graphwalker-3)

There will be important information regarding new upcoming versions and deprecation of old ones published there.
