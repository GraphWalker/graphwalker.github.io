---
title: Fixtures
tags: [documentation]
keywords: documentation
sidebar: sidebar
permalink: /fixtures/
toc: false
---

In some cases test execution requires preparation of the environment, data or special settings.

## Annotations

Frameworks like JUnit and TestNG provide special annotations which can be triggered before a suit, a class, a method or a test.  
GraphWalker has the same functionality with the following annotations:  

@BeforeExecution - annotated method will be triggered before the GraphWalker execution.  
Could be used for launching a web browser, a phone emulator or start a server for tests.  
  
@AfterExecution - annotated method will be triggered after the GraphWalker execution.  
Could be used for collecting results after test execution, like logs, reports etc.  

@BeforeElement - annotated method will be triggered before any element invocation (edge or vertex) in the GraphWalker execution.

@AfterElement - annotated method will be triggered after any element invocation (edge or vertex) in the GraphWalker execution.

[Examples of usage can be found in the Pet Clinic example](https://github.com/GraphWalker/graphwalker-example/blob/master/java-petclinic/src/main/java/com/company/modelimplementations/PetClinic.java#L62-L86).  
