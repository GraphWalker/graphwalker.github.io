---
title: Maven - generate-sources
tags: [maven]
keywords: maven, generate-sources
sidebar: sidebar
permalink: /maven-generate-sources/
toc: false
---


## graphwalker:generate-sources

The plugin generates interfaces from models in placed in the folder `src/main/resources`.
The models are placed in sub directories to mimic package name structure.

An example of a model, that would generate an `interface SmallTest` in the package `com.company`

```
src/main/resources/com/company/SmallTest.graphml
```

The interface will be generated into:

```
target/generated-sources/graphwalker/com/company/SmallTest.java
```

## Example

```
user@host:~/graphwalker-project/graphwalker-cli$ mvn graphwalker:generate-sources
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building GraphWalker Command Line Interface 3.4.1
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.1:generate-sources (default-cli) @ graphwalker-cli ---
[ERROR] No suitable context factory found
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1.593 s
[INFO] Finished at: 2016-05-05T23:32:00+02:00
[INFO] Final Memory: 20M/342M
[INFO] ------------------------------------------------------------------------
```
