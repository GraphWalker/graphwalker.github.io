---
title: CLI - online
tags: [cli]
keywords: cli, documentation, command line, syntax, online
sidebar: sidebar
permalink: /cli-online/
toc: false
---


## online

Online testing means that a model-based testing tool connects directly to an SUT and tests it dynamically. GraphWalker will start as a WebSocket (default) or a HTTP REST server.

[Read more about the difference between using GraphWalker as a RESTFUL or a WebSocket service](/content/docs/restful_vs_websocket)

Options

* `--json`, `-j`<br>
Returns data formatted as json.<br>
Default is true

* `--model`, `-m`<br>
The model, as a graphml file followed by generator with stop condition.<br>
This options can occur multiple times.<br>
This options is only valid for `-s RESTFUL`, it will not work with `-s WEBSOCKET`.

* `--port`, `-p`<br>
Sets the port of the service
Default is 8887

* `--service`, `-s`<br>
Selects which kind of service to start. Either WEBSOCKET [default],
or RESTFUL<br>
Default is WEBSOCKET. When Websocket is selected, the `-m` option is not taken into account.

* `--start-element`, `-e`<br>
Sets the starting element in the [first] model.
Default is <empty string>

* `--unvisited`, `-u`<br>
Will also print the remaining unvisited elements in the model.
Default is false

* `--verbose`, `-o`<br>
Will print more details
Default is false

* `--blocked`, `-b`<br>
This option enables or disables the [BLOCKED](/yed_model_syntax#keywords) feature. When "-b true" GraphWalker will filter out elements in models with the keyword BLOCKED. When "-b false" GraphWalker will not filter out any elements in models with the keyword BLOCKED. Default: true
