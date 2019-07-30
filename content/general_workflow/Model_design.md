---
title: Introduction to creating of a model for GraphWalker
tags: [introduction, work_flow]
keywords: introduction, work flow
sidebar: sidebar
permalink: /Model_design/
toc: false
---

## Pre-install the requirements

 * Install Java JDK 7 or 8
 * Install [Maven](http://maven.apache.org/download.cgi)
 * Download [graphwalker-cli](http://graphwalker.github.io/download/)
 * Install [yEd tool](https://www.yworks.com/downloads#yEd) for editing models

### Test design [modelling] and test idea 
The purpose of the test design in MBT is to describe the **expected behavior of the system under test**. The result of the design looks like a model with a number of edges (aka arrows, arcs or transitions) and vertices (aka nodes or states) and how they interact with each other.  
A model is reminiscent of the popular concept in testing of a [state transition diagram](https://en.wikipedia.org/wiki/State_diagram), or a [finite state diagram](https://en.wikipedia.org/wiki/Finite-state_machine). An edge expresses an action with the SUT (system under test) and a vertex expresses a state of the SUT that should be tested.

### Test idea
For a short example, our test idea is to write a regression test for the Spotify Desktop Client, more specifically the **login** feature. ([Spotify is a music streaming business](http://en.wikipedia.org/wiki/Spotify))

The feature is supposed to work like this:

* In a freshly installed client when the client is running, the Login dialog is expected to be displayed.
* The user can enter valid credentials and is logged in.
* If the user quits or logs out, the Login dialog is displayed once again.
* If the user checks the **Remember Me** checkbox and logs in (using valid credentials), the client runs, and the next time the user runs the client, it will not ask the user for credentials.

Designing a test for the first 2 steps, a model could look something like this:

<img src="/images/Login-first.png" alt="Login model, first iteration" align="left">

1. The **Start** vertex is where the test starts.

2. In **e_Init**, we remove all cache, and kill any previous client processes. Since the test might be restarted, stored credentials on disk might still exist, so we need to get rid of it. Also, restarted tests could have stopped in a state where the client is still running.

3. **v_ClientNotRunning** will assert that there is no Spotify client process running.

4. **e_Start** starts the client.

5. **v_LoginPrompted** asserts that the login dialog is displayed and correctly rendered.

6. **e_ValidCredentials** enters a valid username and password and clicks the **Sign In** button.

7. **v_Browse** asserts that the Browse view is correctly displayed.

The above is a simple test. In fact, it is just one possible path through the model. It could be called the [basic flow](http://en.wikipedia.org/wiki/Use_case#Example) in a use case. To make the test a better regression test, we extend the model.

* Logout
* Exit the client
* Testing invalid credentials
* Enabling and disabling stored credentials (Remember Me)
* Closing/cancelling the login dialog

The complete model could look something like this:

<a href="/images/Login.graphml" title="Spotify login feature on desktop"><img alt="Complete Login model" src="/images/Login.png"></a>

### Verifying the correctness of the model

Before venturing into the coding part, we need to verify whether the model is correct, according to the GraphWalker syntax rules.  
[See GraphWalker modeling syntax](/yed_model_syntax)

Download the model above by right-clicking on it and select "Save link as...". Save it as Login.graphml.  
You can open this model in the [yEd tool](https://www.yworks.com/downloads#yEd)

To verify the model, we use the [GraphWalker CLI](/download):

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

A test sequence is generated. This is an offline generated test. No errors or other warning messages were generated, which means that the model is correct. And now we can go to the [test selection step](/Tests_selection). 
