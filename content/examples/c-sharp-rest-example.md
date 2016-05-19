---
title: C-Sharp REST Example
tags: [example]
keywords: example
sidebar: sidebar
permalink: /c-sharp-rest-example/
toc: false
---


This example will run simulated test using GraphWalker started as a WebSocket REST service.

## Pre-requisites

* Download [latest GraphWalker standalone jar](http://graphwalker.github.io/content/archive/graphwalker-cli-3.4.2.jar) 
* Java JRE version 8 installed
* C# installed
* git installed

## Get the C# example source code

```
git clone https://github.com/GraphWalker/graphwalker-example.git
cd graphwalker-example/c-sharp-rest/SmallModel
```

## Run the test

In a terminal, start GraphWalker as a REST service

```
cd SmallModel
java -jar graphwalker-cli-3.4.2.jar -d all online -s RESTFUL -m SmallModel.graphml "random(edge_coverage(100))"`
May 02, 2016 3:02:55 PM com.sun.jersey.server.impl.application.WebApplicationImpl _initiate
INFO: Initiating Jersey application, version 'Jersey: 1.18.3 12/01/2014 08:23 AM'
May 02, 2016 3:02:55 PM org.glassfish.grizzly.http.server.NetworkListener start
INFO: Started listener bound to [0.0.0.0:8887]
May 02, 2016 3:02:55 PM org.glassfish.grizzly.http.server.HttpServer start
INFO: [HttpServer] Started.
Try http://localhost:8887/graphwalker/hasNext or http://localhost:8887/graphwalker/getNext
Press Control+C to end...
```

In the folder of `graphwalker-example/c-sharp-rest/SmallModel` build the C# project, on linux:

```
xbuild
```

Then run the test, on linux:

```
mono SmallModel/bin/Debug/SmallModel.exe
SmallModel.e_FirstAction
{
  "x": "0",
  "y": "0"
}
SmallModel.v_VerifySomeAction
{
  "x": "0",
  "y": "0"
}
SmallModel.e_SomeOtherAction
{
  "x": "0",
  "y": "1"
}
SmallModel.v_VerifySomeOtherAction
{
  "x": "0",
  "y": "1"
}
SmallModel.e_AnotherAction
{
  "x": "0",
  "y": "2"
}
SmallModel.v_VerifySomeAction
{
  "x": "0",
  "y": "2"
}
SmallModel.e_SomeOtherAction
{
  "x": "0",
  "y": "3"
}
SmallModel.v_VerifySomeOtherAction
{
  "x": "0",
  "y": "3"
}
SmallModel.e_SomeOtherAction
{
  "x": "1",
  "y": "3"
}
SmallModel.v_VerifySomeOtherAction
{
  "x": "1",
  "y": "3"
}
```

