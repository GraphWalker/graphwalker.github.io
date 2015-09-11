---
title: GraphWalker WebSopcket API
layout: default
---

# How to run GraphWalker using WebSockets

The GraphWalker WebSocket Server enables a user to launch and interact with GraphWalker and inplement your tests in a very dynamic way. Any programming language that has an implementation of WebSocket will be able to use this feature.


## Establishing a connection to the GraphWalker WebSocket Server
Start GraphWalker from the command line using the standalone jar, using the **online** command.
~~~
java -jar graphwalker-<LATEST>.jar -d ALL online -p 8887
~~~
Starts the WebSocker server, with full debug logging, on localhost, listing on port 8887<br>
See [Download](/download) how to get the latest version of GraphWalker.

A client may connect to ws://localhost:8887. Try [Echo Test](http://www.websocket.org/echo.html).

 * Input `ws://localhost:8887` into **Location:**
 * Click the **Connect** button
 * Copy and paste the Example from http://graphwalker.org/docs/json_graph into **Message:**
 * Click the **Send** button
 * Copy and paste the `{"type": "start"}` and click the **Send** button
 * Copy and paste the `{"type": "hasNext"}` and click the **Send**  button
 * Copy and paste the `{"type": "getNext" }` and click the **Send**button

When connected, a GraphWalker machine will be created on the server, which will serve this client only.
When disconnected, the server will destroy the machine.

## Spefification by Example and MBT test for the WebSocket Server

The graph below is an actual test where GraphWalker is testing itself. The graph also serves as a [Specifaction by Example](http://en.wikipedia.org/wiki/Specification_by_example). The specification dictates what API calls can be made given the current status. The test verifies that the implementation follows the design.

The test is run as one of the Unit tests in the CLI module. See [WebSocketServerTest.java](https://github.com/GraphWalker/graphwalker-project/blob/master/graphwalker-cli/src/test/java/org/graphwalker/cli/WebSocketServerTest.java)

<img src="/content/images/websocket_api.png" alt="WebSocket API">
