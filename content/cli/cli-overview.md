---
title: CLI - overview and global options
tags: [cli]
keywords: cli, documentation, command line, syntax, overview, global options
sidebar: sidebar
permalink: /cli-overview/
toc: false
---


The GraphWalker command line interface is a tool for working with graphs. It has a subset of commands that are specialized.


### Creating a script facilitating command line handling on a linux machine.

Create a file called `/usr/local/bin/gw` with the following content:

```
#!/bin/bash
java -jar /absoulte/path/to/graphwalker/graphwalker-cli/target/graphwalker-cli-4.0.0-SNAPSHOT.jar "$@"
```

Set the execution flag

```
sudo chmod +x /usr/local/bin/gw
```

## Global options

The global options affects all commands. Some options, like version, exits the program immediately.

* `--debug`, `-d`<br>
Sets the log level: OFF, ERROR, WARN, INFO, DEBUG, TRACE, ALL.<br>
Default: OFF.<br>

* `--help`, `-h`<br>
Prints help text.

* `--version`, `-v`<br>
Prints the version of GraphWalker.
