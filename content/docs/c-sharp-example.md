---
title: C-Sharp Example
tags: [example]
keywords: example
sidebar: sidebar
permalink: /c-sharp-example/
toc: false
---


This is an example on how to use GraphWalker's Websocket in order to run tests written in C#.

## Pre-requisites

* Download [latest GraphWalker standalone jar](http://graphwalker.org/archive/graphwalker-cli-3.4.0.jar) 
* Java JRE version 8 installed
* C# installed
* git installed

## Get the C# example source code

```
git clone https://github.com/GraphWalker/graphwalker-example.git
cd graphwalker-example/c-sharp-websocket/SmallModel
```

## Run the test

In a terminal, start GraphWalker as a Websocket service

```
java -jar graphwalker-cli-3.4.0.jar -d all online
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

When executed, the SmallModel program will connect to the GraphWalker service, and load and start running a [model in JSON notation](https://github.com/GraphWalker/graphwalker-example/blob/b24d6fe35c04cf2ee6b9fbad2f06b9d2c72e0358/c-sharp-websocket/SmallModel/SmallModel/Program.cs#L144-L191).
![Alt text](/images/SmallModel.png "The model")

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
