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

In the folder of `graphwalker-example/c-sharp-websocket/SmallModel` build the C# project, on linux:

```
xbuild
```

Then run the test, on linux:

```
mono SmallModel/bin/Debug/SmallModel.exe
Will connect to GraphWalker server...                                                                                                   
Connected!                                                                                                                              
Receiving message: {"success":true,"command":"start"}                                                                                   
GraphWalker machine started ok                                                                                                          
Receiving message: {"success":true,"hasNext":true,"command":"hasNext"}                                                                  
hasNext returned true
:
:
:
```

## What happened

<img src="/images/SmallModel.png" alt="SmallModel">

When executed, the SmallModel program will connect to the GraphWalker service, load and start running a [model in JSON notation](https://github.com/GraphWalker/graphwalker-example/blob/eaf01de97a1c2ef28eed404ef78d30eb959f7959/c-sharp-websocket/SmallModel/SmallModel/Program.cs#L144-L212).

The GraphWalker Websocket service will get messages from [Program.cs](https://github.com/GraphWalker/graphwalker-example/blob/b24d6fe35c04cf2ee6b9fbad2f06b9d2c72e0358/c-sharp-websocket/SmallModel/SmallModel/Program.cs), and query the service for steps to execute. The steps are implemented in C# code in [SmallModel.cs](https://github.com/GraphWalker/graphwalker-example/blob/b24d6fe35c04cf2ee6b9fbad2f06b9d2c72e0358/c-sharp-websocket/SmallModel/SmallModel/SmallModel.cs)

The psuedo code would look something like the:

```
while hasNext()
  step = getNext()
  "Call method step in C# SmallModel class"
  invoke SmallModel.'step'
  print getData()
```

The actual C# code that queries the Websocket service:

```cs
public void run ()
{
  // Create the thread object, passing in the
  // GraphWalkerClientWorker.connect method via a ThreadStart delegate.
  // This does not start the thread.
  GraphWalkerClientWorker worker = new GraphWalkerClientWorker ();
  Thread workerThread = new Thread (worker.connect);

  // Start the thread
  workerThread.Start ();

  // Spin for a while waiting for the started thread to become
  // alive:
  while (!workerThread.IsAlive)
    ;

  worker.connectedEvent.WaitOne ();

  worker.start (model);
  worker.startEvent.WaitOne ();

  Type smallModelType = typeof(SmallModel);
  ConstructorInfo ctor = smallModelType.GetConstructor(System.Type.EmptyTypes);

  while (true) {
    worker.hasNext ();
    worker.hasNextEvent.WaitOne ();
    if (!worker.isHasNext)
      break;

    worker.getNext ();
    worker.getNextEvent.WaitOne ();
    string methodName = (string)worker.getMessage();

    object instance = ctor.Invoke(null);
    MethodInfo methodInfo = smallModelType.GetMethod(methodName);
    methodInfo.Invoke(instance, new object[]{});

    worker.getData ();
    worker.getDataEvent.WaitOne ();
    Console.WriteLine("Data: " + worker.getDataObject().ToString());
  }
  worker.disconnect();
  workerThread.Join ();
}
```
