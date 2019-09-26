---
title: Introduction into creation of a model for GraphWalker
tags: [introduction, work flow]
keywords: introduction, work flow
sidebar: sidebar
permalink: /Model_design/
toc: false
---

## Pre-install the requirements

 * Install Java JDK 7 or 8
 * Install [Maven](http://maven.apache.org/download.cgi)
 * Download [graphwalker-cli](http://graphwalker.github.io/download/)
 * Install [yEd tool](https://www.yworks.com/downloads#yEd) for models edition

### Test design [modelling] and test idea 
The purpose of the test design in MBT is to describe the **expected behavior of the system under test**. The result of design looks like a model with a number of edges (aka arrow, arc or transition) and vertices (aka node or state) and how do they interact with each other.  
A model would remind you a popular in testing [state transition diagram](https://en.wikipedia.org/wiki/State_diagram) or a [finite state diagram](https://en.wikipedia.org/wiki/Finite-state_machine). An edge express an action with the SUT and a vertex express a state of the SUT which should be tested.

### Test idea
For a short example our test idea is to write a regression test for the Spotify Desktop Client, more specifically, the feature **login**. (<a href="http://en.wikipedia.org/wiki/Spotify">Spotify is a music streaming business</a>)

The feature is suppose to work like this:

* In a freshly installed client, and the client is started, the Login dialog is expected to be displayed.
* The user enters valid credentials and the client is expected to start.
* If the user quits, or logs out, the Login dialog is displayed once again.
* If the user checks the **Remember Me** checkbox, and logs in (using valid credentials), the client starts, and, next time the user starts the client, it will start without asking the client for credentials.

Just designing a test for the 2 first steps, a model would looks something like this:

<img src="/images/Login-first.png" alt="Login model, first iteration" align="left">

1. The **Start** vertex is where the test starts. (Duh!)

2. In **e_Init**, we remove all cache, and kill any previous client processes. Since the test might be restarted, stored credentials on the disk might still lie around, so we need to get rid of it. Also, restarted tests could have stopped in a state, where the client still is running.

3. **v_ClientNotRunning** will assert that there is no Spotify client process running.

4. **e_Start** starts the client.

5. **v_LoginPrompted** asserts that the login dialog is displayed and correctly rendered.

6. **e_ValidCredentials** enters a valid username and password and clicks the Sign In button.

7. **v_Browse** asserts that the Browse view is correctly displayed.

The above is a simple test. In fact, it's just one possible path through the model. It could be called the <a href="http://en.wikipedia.org/wiki/Use_case#Example">Basic flow</a> in a Use case. To make the test a better regression test, we extend the model.

* Logout
* Exit the client
* Testing invalid credentials
* Enabling and disabling stored credentials (Remember Me)
* Closing/canceling the login dialog

The complete model could look something like below:

<a href="/images/Login.graphml" title="Spotify login feature on desktop"><img alt="Complete Login model" src="/images/Login.png"></a>

### Verifying the correctness of the model

Before venturing into the test coding part, we need to verify whether the model is correct according to the GraphWalker syntax rules.  
[See GraphWalker modeling syntax](/yed_model_syntax)

Download the model above by right-clicking on it, then select "Save link as...". Save it as Login.graphml.  
You may open this model by the [yEd tool](https://www.yworks.com/downloads#yEd)

To verify the model, we use the [GraphWalker CLI](/download) to test it:

```sh
%> java -jar graphwalker.jar offline -m Login.graphml "random(edge_coverage(100))"
e_Init
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_InvalidCredentials
v_LoginPrompted
e_ValidPremiumCredentials
v_Browse
e_Logout
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_InvalidCredentials
v_LoginPrompted
e_ValidPremiumCredentials
v_Browse
e_Exit
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_ValidPremiumCredentials
v_Browse
e_Exit
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_ToggleRememberMe
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_Browse
```

A test sequence is generated. This is an offline generated test. No errors or other warning messages are generated, which means that the model is correct. And now we may go to the [tests selection step](/Tests_selection). 
