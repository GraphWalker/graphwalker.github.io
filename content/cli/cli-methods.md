---
title: CLI - methods
tags: [cli]
keywords: cli, documentation, command line, syntax, methods
sidebar: sidebar
permalink: /cli-methods/
toc: false
---


## methods

Generates a list of unique names of vertices and edges in the model.

Options

* `--model`, `-m` <br>
The model(s), as a graphml file.<br>
This options can occur multiple times.

* `--blocked`, `-b`<br>
This option enables or disables the [BLOCKED](/yed_model_syntax#keywords) feature. When "-b true" GraphWalker will filter out elements in models with the keyword BLOCKED. When "-b false" GraphWalker will not filter out any elements in models with the keyword BLOCKED. Default: true
