---
title: CLI - offline
tags: [cli]
keywords: cli, documentation, command line, syntax, offline
sidebar: sidebar
permalink: /cli-offline/
toc: false
---


## Offline

Offline means generating a test sequence once that can later be run automatically. Or just generating a sequence to prove that the model, with the path generator(s) together with the stop condition(s), works.

The syntax is:

```
gw3 GLOBAL_OPTIONS offline OPTIONS -m <model-file> "GENERATOR(STOP_CONDITION)"
```

Please note that the ***"GENERATOR(STOP_CONDITION)"*** should be enclosed within double-quotes.

Options

* `--json`, `-j`<br>
Returns data formatted as json.<br>
Default is true.

* `--model`, `-m`<br>
The model, as a graphml file, followed by generator with stop condition.<br>
This option can occur multiple times.<br>
[Read more about path generators and stop conditions.](/generators_and_stop_conditions)

* `--unvisited`, `-u`<br>
Will print the remaining unvisited elements in the model.<br>
Default is false.

* `--verbose`, `-o`<br>
Will print more details<br>
Default is false.

* `--blocked`, `-b`<br>
This option enables or disables the [BLOCKED](/yed_model_syntax#keywords) feature. When "-b true" GraphWalker will filter out elements in models with the keyword BLOCKED. When "-b false" GraphWalker will not filter out any elements in models with the keyword BLOCKED. <br>
Default is true.

**Example:**<br>
```
gw3 offline -m model.graphml "random(edge_coverage(100))"
```

The above should be read: Use the model ***model.graphml***, generate a path using the random path generator,
stop when the edge coverage is 100%.

**Example:**<br>

Using an offline sequence in a test, where the model is from the [introduction](/introduction) page.

```
gw3 offline -m Login.graphml "a_star(reached_vertex(v_Browse))"
{"currentElementName":"e_Init"}
{"currentElementName":"v_ClientNotRunning"}
{"currentElementName":"e_StartClient"}
{"currentElementName":"v_LoginPrompted"}
{"currentElementName":"e_ValidPremiumCredentials"}
{"currentElementName":"v_Browse"}
```

To get the element names only, run:<br>
_The jq program is from here: [https://stedolan.github.io/jq/](https://stedolan.github.io/jq/)_ 

```
gw3 offline -m Login.graphml "a_star(reached_vertex(v_Browse)) | jq -r '.currentElementName'"
e_Init
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_ValidPremiumCredentials
v_Browse
```

If your test was written in java, you could put the sequence in a unit test:

```java
@Test
public void Login_Smoke_Test() {
  e_Init();
  v_ClientNotRunning();
  e_StartClient();
  v_LoginPrompted();
  e_ValidPremiumCredentials();
  v_Browse();
}
```
