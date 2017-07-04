---
title: CLI - check
tags: [cli]
keywords: cli, documentation, command line, syntax, check
sidebar: sidebar
permalink: /cli-check/
toc: false
---


## check

Check and analyze model(s) for issues.

Options

* `--model`, `-m`<br>
Model followed by generator with stop condition. The format is GENERATOR(STOP_CONDITION)

* `--blocked`, `-b`<br>
This option enables or disables the [BLOCKED](/yed_model_syntax#keywords) feature. When "-b true" GraphWalker will filter out elements in models with the keyword BLOCKED. When "-b false" GraphWalker will not filter out any elements in models with the keyword BLOCKED. Default: true
