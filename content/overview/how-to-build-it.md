---
title: How to build GraphWalker
tags: [build]
keywords: how to, build
sidebar: sidebar
permalink: /how-to-build-it/
toc: false
---


## Pre-install the requirements

 * Install Java JDK 7 or 8
 * Install [Maven](http://maven.apache.org/download.cgi)
 * Git

## Get the source code

Get the latest source code from GitHub:

```
git clone https://github.com/GraphWalker/graphwalker-project.git
```

## Build the GraphWalker standalone jar

```
cd graphwalker-project
mvn package -pl graphwalker-cli -am
```

The location of the jar file is:

```
graphwalker-cli/target/graphwalker-cli-3.4.1.jar
```
