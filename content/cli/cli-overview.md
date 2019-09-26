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

Create a file called `/usr/local/bin/gw` with following content:

```
#!/bin/bash
java -jar /home/krikar/dev/graphwalker/graphwalker-cli/target/graphwalker-cli-4.0.0-SNAPSHOT.jar "$@"
```

Set the execution flag

```
sudo chmod +x /usr/local/bin/gw
```

## Global options

The global options affect all commands. Some options, like version, exits the program directly.

* `--debug`, `-d`<br>
Sets the log level: OFF, ERROR, WARN, INFO, DEBUG, TRACE, ALL.
Default: OFF<br>

* `--help`, `-h`<br>
Prints help text

* `--version`, `-v`<br>
Prints the version of GraphWalker
