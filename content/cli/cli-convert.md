---
title: CLI - convert
tags: [cli]
keywords: cli, documentation, command line, syntax, convert
sidebar: sidebar
permalink: /cli-convert/
toc: false
---


## convert

Convert a graph in file format, to some other format.

Options

* `--input`, `-i`<br>
This command requires an input file, and an output file.

* `--blocked`, `-b`<br>
This option enables or disables the [BLOCKED](/yed_model_syntax#keywords) feature. When "-b true" GraphWalker will filter out elements in models with the keyword BLOCKED. When "-b false" GraphWalker will not filter out any elements in models with the keyword BLOCKED. Default: true

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

## Version 4 

In version 4 new functionality changed from writing to file, into printing to stdout.

Options

* `--input`, `-i`<br>
This command requires an input file.

* `--format`, `-f`<br>
Which format to convert into. Valid key words are: JSON [default],
GRAPHML, DOT or JAVA<br>
Default: JSON

**Example:**

```
gw4 convert -i Login.graphml -f json
```

The above will result in a json string printed to the terminal:

```json
{"models":[{"name":"Login","id":"6a4aab5f-df1e-451b-a35e-f331234845c0","startElementId":"e0","vertices":[{"id":"n1","name":"v_ClientNotRunning","properties":{"x":1123.2486275337837,"description":"Start the client process","y":257.184751203258}},{"id":"n2","name":"v_LoginPrompted","properties":{"x":1083.8359375,"description":"Thus shla be prompted for user credentilas","y":376.184751203258}},{"id":"n3","name":"v_Browse","properties":{"x":1102.4111328125,"description":"A successful login is expected.\nThe user is presented with the initial view of the client.","y":514.184751203258}}],"edges":[{"id":"e0","name":"e_Init","actions":["rememberMe\u003dfalse;","validLogin\u003dtrue;"],"properties":{"description":"Remove all cache and user settings from file system."},"dependency":0,"targetVertexId":"n1"},{"id":"e1","name":"e_StartClient","guard":"!rememberMe||!validLogin","dependency":0,"sourceVertexId":"n1","targetVertexId":"n2"},{"id":"e2","name":"e_ValidPremiumCredentials","actions":["validLogin\u003dtrue;"],"properties":{"description":"Log in a s Premium user, using valid credentials"},"dependency":0,"sourceVertexId":"n2","targetVertexId":"n3"},{"id":"e3","name":"e_Logout","properties":{"description":"Logout current user from Spotify"},"dependency":0,"sourceVertexId":"n3","targetVertexId":"n2"},{"id":"e4","name":"e_Exit","properties":{"description":"Exit and shutdown the client process"},"dependency":0,"sourceVertexId":"n3","targetVertexId":"n1"},{"id":"e5","name":"e_ToggleRememberMe","actions":["rememberMe\u003d!rememberMe;"],"dependency":0,"sourceVertexId":"n2","targetVertexId":"n2"},{"id":"e6","name":"e_Close","dependency":0,"sourceVertexId":"n2","targetVertexId":"n1"},{"id":"e7","name":"e_StartClient","guard":"rememberMe\u0026\u0026validLogin","dependency":0,"sourceVertexId":"n1","targetVertexId":"n3"},{"id":"e8","name":"e_InvalidCredentials","actions":["valdiLogin\u003dfalse;"],"dependency":0,"sourceVertexId":"n2","targetVertexId":"n2"}]}]}
```
