---
title: Maven - test
tags: [maven]
keywords: maven, test
sidebar: sidebar
permalink: /maven-test/
toc: false
---


## graphwalker:test

The plugin will run a GraphWalker test. It will run the `generate-sources` plugin, and the look
for classes with `@GraphWalker` annotation, and run that class as a GraphWalker test.

## Example

```
user@host:~/graphwalker-example/java-petclinic$ mvn graphwalker:watch
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building java-petclinic 3.4.2
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] >>> graphwalker-maven-plugin:3.4.2:test (default-cli) > [graphwalker]test-compile @ java-petclinic >>>
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.2:generate-sources (generate-sources) @ java-petclinic ---
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.2:validate-models (default-cli) @ java-petclinic ---
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.2:generate-sources (default-cli) @ java-petclinic ---
[INFO]
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ java-petclinic ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 10 resources
[INFO]
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ java-petclinic ---
[INFO] Nothing to compile - all classes are up to date
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.2:validate-test-models (default-cli) @ java-petclinic ---
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.2:generate-test-sources (default-cli) @ java-petclinic ---
[INFO]
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ java-petclinic ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /graphwalker-example/java-petclinic/src/test/resources
[INFO]
[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ java-petclinic ---
[INFO] Nothing to compile - all classes are up to date
[INFO]
[INFO] <<< graphwalker-maven-plugin:3.4.2:test (default-cli) < [graphwalker]test-compile @ java-petclinic <<<
[INFO]
[INFO] --- graphwalker-maven-plugin:3.4.2:test (default-cli) @ java-petclinic ---
[INFO] ------------------------------------------------------------------------
[INFO]   _____             _   _ _ _     _ _
[INFO]  |   __|___ ___ ___| |_| | | |___| | |_ ___ ___
[INFO]  |  |  |  _| .'| . |   | | | | .'| | '_| -_|  _|
[INFO]  |_____|_| |__,|  _|_|_|_____|__,|_|_,_|___|_|
[INFO]                |_|         (3.4.2)
[INFO] ------------------------------------------------------------------------
23:33:51,723 |-INFO in ch.qos.logback.classic.LoggerContext[default] - Could NOT find resource [logback.groovy]
:
:
```
