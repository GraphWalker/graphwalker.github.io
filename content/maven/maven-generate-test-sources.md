---
title: Maven - generate-test-sources
tags: [maven]
keywords: maven, generate-test-sources
sidebar: sidebar
permalink: /maven-generate-test-sources/
toc: false
---


## graphwalker:generate-test-sources

The plugin generates interfaces from models in placed in the folder `src/test/resources`.
The models are placed in sub directories to mimic package name structure.

An example of a model, that would generate an `interface SmallTest` in the package `com.company`

```
src/test/resources/com/company/SmallTest.graphml
```

The interface will be generated into:

```
target/generated-test-sources/graphwalker/com/company/SmallTest.java
```

## Example

```
user@host:~/graphwalker-project/graphwalker-cli$ mvn graphwalker:watch
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building GraphWalker Command Line Interface 3.4.2
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.2:generate-test-sources (default-cli) @ graphwalker-cli ---
[ERROR] No suitable context factory found
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1.766 s
[INFO] Finished at: 2016-05-05T23:32:33+02:00
[INFO] Final Memory: 40M/341M
[INFO] ------------------------------------------------------------------------
```
