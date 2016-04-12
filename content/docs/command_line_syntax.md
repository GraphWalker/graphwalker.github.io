---
title: The GraphWalker command line syntax
tags: [cli]
keywords: cli, documentation, command line, syntax
sidebar: sidebar
permalink: /cli/
toc: false
---


Complete command line syntax manual. To make it easier to read, the command:

```
java -jar <path to GraphWalker standalone jar>/graphwalker-cli-3.N.N-SNAPSHOT.jar
```

is a bash script:

```
cat $(which gw3)
#!/bin/bash

java -jar /home/krikar/dev/mbt/gw3/graphwalker-cli/target/graphwalker-cli-3.N.N-SNAPSHOT.jar "$@"
```

## Global options

The global options affect all commands. Some options, like version, exits the program directly.

* --debug, -d<br>
Sets the log level: OFF, ERROR, WARN, INFO, DEBUG, TRACE, ALL.
Default: OFF<br>

* --help, -h<br>
Prints help text

* --version -v<br>
Prints the version of GraphWalker

## offline

Offline means generating a test sequence once, that can be later run automatically. Or, just generating a sequence to prove that the model with the path generator(s) together with the stop condition(s) works.

The syntax is:

```
gw3 GLOBAL_OPTIONS offline OPTIONS -m <model-file> "GENERATOR(STOP_CONDITION)"
```

Please note that the ***"GENERATOR(STOP_CONDITION)"*** should be enclosed with double-quotes.

Options

* --json, -j<br>
Returns data formatted as json.<br>
Default is true

* --model, -m <br>
The model, as a graphml file followed by generator with stop condition.<br>
This options can occur multiple times.<br>
[Read more about path generators and stop conditions](/docs/path_generators_and_stop_conditions)

* --unvisited, -u<br>
Will also print the remaining unvisited elements in the model.<br>
Default is false.

* --verbose, -o<br>
Will print more details<br>
Default is false.

**Example:**<br>
```
gw3 offline -m model.graphml "random(edge_coverage(100))"
```

The abose is readlike: Use the model ***model.graphml***, and generate a path using the random path generator, and stop when the edge coverage is 100%


## online

Online testing means that a model-based testing tool connects directly to an SUT and tests it dynamically. GraphWalker will start as a WebSocket (default) or a HTTP REST server.

[Read more about the difference between using GraphWalker as a RESTFUL or a WebSocket service](/docs/restful_vs_websocket)

Options

* --json, -j<br>
Returns data formatted as json.<br>
Default is true

* --model, -m <br>
The model, as a graphml file followed by generator with stop condition.<br>
This options can occur multiple times.<br>

* --port, -p<br>
Sets the port of the service
Default is 8887

* --service, -s<br>
Selects which kind of service to start. Either WEBSOCKET [default],
or RESTFUL
Default is WEBSOCKET

* --start-element, -e<br>
Sets the starting element in the [first] model.
Default is <empty string>

* --unvisited, -u<br>
Will also print the remaining unvisited elements in the model.
Default is false

* --verbose, -o<br>
Will print more details
Default is false


## methods

Generates a list of unique names of vertices and edges in the model.

Options

* --model, -m <br>
The model(s), as a graphml file.<br>
This options can occur multiple times.

## requirements

Generates a list of unique names of the requirements found in the model.

Options

* --model, -m <br>
The model(s), as a graphml file.<br>
This options can occur multiple times.


## source

Will generate source code using the provided model and a template.

Options

* --input, -i<br>
This command requires an input model file, and an input template.


## convert

Convert a graph in file format, to some other format.

Options

* --input, -i<br>
This command requires an input file, and an output file.



**Example:**

```
gw3 convert -i Login.graphml Login.java
```

Printing the content of Login.java:

```java
import org.graphwalker.core.condition.*;
import org.graphwalker.core.generator.*;
import org.graphwalker.core.machine.*;
import org.graphwalker.core.model.*;

public class login {

  public final class ModelTestContext extends ExecutionContext {
  }

  public static void main(String... aArgs) {
    login modeltest = new login();
    modeltest.run();
  }

  private void run() {
    Vertex v_ClientNotRunning = new Vertex().setName("v_ClientNotRunning").setId("n0");
Vertex v_LoginPrompted = new Vertex().setName("v_LoginPrompted").setId("n1");
Vertex v_Browse = new Vertex().setName("v_Browse").setId("n2");


    Model model = new Model();
    model.addEdge( new Edge().setTargetVertex(v_ClientNotRunning).setName("e_Init").setId("e0").addAction(new Action("rememberMe=false;")).addAction(new Action("validLogin=false;")));
model.addEdge( new Edge().setSourceVertex(v_ClientNotRunning).setTargetVertex(v_LoginPrompted).setName("e_StartClient").setId("e1").setGuard(new Guard("!rememberMe||!validLogin")));
model.addEdge( new Edge().setSourceVertex(v_LoginPrompted).setTargetVertex(v_Browse).setName("e_ValidPremiumCredentials").setId("e2").addAction(new Action("validLogin=true;")));
model.addEdge( new Edge().setSourceVertex(v_Browse).setTargetVertex(v_LoginPrompted).setName("e_Logout").setId("e3"));
model.addEdge( new Edge().setSourceVertex(v_Browse).setTargetVertex(v_ClientNotRunning).setName("e_Exit").setId("e4"));
model.addEdge( new Edge().setSourceVertex(v_LoginPrompted).setTargetVertex(v_LoginPrompted).setName("e_ToggleRememberMe").setId("e5").addAction(new Action("rememberMe=!rememberMe;")));
model.addEdge( new Edge().setSourceVertex(v_LoginPrompted).setTargetVertex(v_ClientNotRunning).setName("e_Close").setId("e6"));
model.addEdge( new Edge().setSourceVertex(v_ClientNotRunning).setTargetVertex(v_Browse).setName("e_StartClient").setId("e7").setGuard(new Guard("rememberMe&&validLogin")));
model.addEdge( new Edge().setSourceVertex(v_LoginPrompted).setTargetVertex(v_LoginPrompted).setName("e_InvalidCredentials").setId("e8").addAction(new Action("validLogin=false;")));


    Context context = new ModelTestContext();
    context.setModel(model.build()).setPathGenerator(new RandomPath(new EdgeCoverage(100)));
    context.setNextElement(context.getModel().findElements("e_Init").get(0));

    Machine machine = new SimpleMachine(context);
    while (machine.hasNextStep()) {
      machine.getNextStep();
      System.out.println(context.getCurrentElement().getName());
    }
  }
}
```

**Example:**

```
gw3 convert -i Login.graphml Login.gw3
```

Printing the content of Login.gw3 (prettified using `cat Login.gw3 | python -m json.tool`):

```json
{
   "name":"Login",
   "id":"9317cc3c-49db-4a33-8e0f-a5faf8421e68",
   "startElementId":"e0",
   "vertices":[
      {
         "id":"n0",
         "name":"v_ClientNotRunning",
         "properties":{
            "x":1123.2486275337837,
            "description":"Start the client process",
            "y":257.184751203258
         }
      },
      {
         "id":"n1",
         "name":"v_LoginPrompted",
         "properties":{
            "x":1083.8359375,
            "description":"Thus shla be prompted for user credentilas",
            "y":376.184751203258
         }
      },
      {
         "id":"n2",
         "name":"v_Browse",
         "properties":{
            "x":1102.4111328125,
            "description":"A successful login is expected.\nThe user is presented with the initial view of the client.",
            "y":514.184751203258
         }
      }
   ],
   "edges":[
      {
         "id":"e0",
         "name":"e_Init",
         "actions":[
            "rememberMe\u003dfalse;",
            "validLogin\u003dfalse;"
         ],
         "properties":{
            "description":"Remove all cache and user settings from file system."
         },
         "targetVertexId":"n0"
      },
      {
         "id":"e1",
         "name":"e_StartClient",
         "guard":"!rememberMe||!validLogin",
         "sourceVertexId":"n0",
         "targetVertexId":"n1"
      },
      {
         "id":"e2",
         "name":"e_ValidPremiumCredentials",
         "actions":[
            "validLogin\u003dtrue;"
         ],
         "properties":{
            "description":"Log in a s Premium user, using valid credentials"
         },
         "sourceVertexId":"n1",
         "targetVertexId":"n2"
      },
      {
         "id":"e3",
         "name":"e_Logout",
         "properties":{
            "description":"Logout current user from Spotify"
         },
         "sourceVertexId":"n2",
         "targetVertexId":"n1"
      },
      {
         "id":"e4",
         "name":"e_Exit",
         "properties":{
            "description":"Exit and shutdown the client process"
         },
         "sourceVertexId":"n2",
         "targetVertexId":"n0"
      },
      {
         "id":"e5",
         "name":"e_ToggleRememberMe",
         "actions":[
            "rememberMe\u003d!rememberMe;"
         ],
         "sourceVertexId":"n1",
         "targetVertexId":"n1"
      },
      {
         "id":"e6",
         "name":"e_Close",
         "sourceVertexId":"n1",
         "targetVertexId":"n0"
      },
      {
         "id":"e7",
         "name":"e_StartClient",
         "guard":"rememberMe\u0026\u0026validLogin",
         "sourceVertexId":"n0",
         "targetVertexId":"n2"
      },
      {
         "id":"e8",
         "name":"e_InvalidCredentials",
         "actions":[
            "validLogin\u003dfalse;"
         ],
         "sourceVertexId":"n1",
         "targetVertexId":"n1"
      }
   ]
}
```


## check

Check and analyze model(s) for issues.

Options

* --model, -m<br>
Model followed by generator with stop condition. The format is GENERATOR(STOP_CONDITION) 