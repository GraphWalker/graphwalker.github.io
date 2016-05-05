---
title: Maven - validate-test-models
tags: [maven]
keywords: maven, validate-test-models
sidebar: sidebar
permalink: /maven-validate-test-models/
toc: false
---


## graphwalker:validate-test-models

The plugin will validate models placed in the folder `src/test/resources`.


## Example

```
user@host:~/graphwalker-project/graphwalker-cli$ mvn graphwalker:validate-test-models
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building GraphWalker Command Line Interface 3.4.0
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.0:validate-test-models (default-cli) @ graphwalker-cli ---
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 0.668 s
[INFO] Finished at: 2016-05-05T23:31:00+02:00
[INFO] Final Memory: 9M/205M
[INFO] ------------------------------------------------------------------------
```