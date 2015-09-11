---
title: Command line syntax
layout: default
---

# Command line syntax

Complete command line syntax manual. To make it easier to read, the command:
~~~
%> java -jar <path to GraphWalker standalone jar>/graphwalker-cli-3.N.N-SNAPSHOT.jar
~~~
is a bash script:
~~~
%> cat $(which gw3)
#!/bin/bash

java -jar /home/krikar/dev/mbt/gw3/graphwalker-cli/target/graphwalker-cli-3.N.N-SNAPSHOT.jar "$@"
~~~

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
~~~
%> gw3 GLOBAL_OPTIONS offline OPTIONS -m <model-file> "GENERATOR(STOP_CONDITION)"
~~~
Please note that the ***"GENERATOR(STOP_CONDITION)"*** should be enclosed with double-quotes.

### Options

* --json, -j<br>
Returns data formatted as json.<br>
Default is true

* --model, -m <br>
The model, as a graphml file followed by generator with stop condition.<br>
This options can occur multiple times.<br>
[Read more about path generators and stop conditions](/docs/path_generators_and_stop_conditions.html)

* --unvisited, -u<br>
Will also print the remaining unvisited elements in the model.<br>
Default is false.

* --verbose, -o<br>
Will print more details<br>
Default is false.

### Examples

~~~
%> gw3 offline -m model.graphml "random(edge_coverage(100))"
~~~
Use the model ***model.graphml***, and generate a path using the random path generator, and stop when the edge coverage is 100%


## online

Online testing means that a model-based testing tool connects directly to an SUT and tests it dynamically. GraphWalker will start as a WebSocket (default) or a HTTP REST server.

[Read more about the difference between using GraphWalker as a RESTFUL or a WebSocket service](/docs/restful_vs_websocket.html)



### Options

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

### Options

* --model, -m <br>
The model(s), as a graphml file.<br>
This options can occur multiple times.

## requirements

Generates a list of unique names of the requirements found in the model.

### Options

* --model, -m <br>
The model(s), as a graphml file.<br>
This options can occur multiple times.

