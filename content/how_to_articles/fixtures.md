---
title: Fixtures
tags: [example]
keywords: example
sidebar: sidebar
permalink: /fixtures/
toc: false
---

In some cases test execution requires preparation of environment, data or special settings.  
Such frameworks like JUnit and TestNG provide for that special annotations which can be triggered before suit or class or method or test.  
GraphWalker has the same functionality in the next list of annotations:  

@BeforeExecution - annotated method will be triggered before the GraphWalker execution  
Would be helpful to launch a web browser or phone emulator or start a server for tests.  
  
@AfterExecution - annotated method will be triggered after the GraphWalker execution  
Would help when you need to collect some results of tests executions like logs, reports etc.  

@BeforeElement - annotated method will be triggered before any element invocation (edge or vertex) in the GraphWalker execution  

@AfterElement - annotated method will be triggered after any element invocation (edge or vertex) in the GraphWalker execution  

[Examples of usage would be found in the Pet Clinic example](https://github.com/GraphWalker/graphwalker-example/blob/master/java-petclinic/src/main/java/com/company/modelimplementations/PetClinic.java#L55-L77)  

```java
    @BeforeExecution
    public void setup() {
        System.out.println("PetClinic: Any setup steps happens here. " +
                "The annotation @BeforeExecution makes sure that before any elements in the " +
                "model is called, this method is called first");
    }

    @AfterExecution
    public void cleanup() {
        System.out.println("PetClinic: Any cleanup  steps happens here. " +
                "The annotation @AfterExecution makes sure that after the test is done, " +
                "this method is called last.");
    }

    @BeforeElement
    public void printBeforeElement(){
        System.out.println("Before element " + getCurrentElement().getName());
    }

    @AfterElement
    public void printAfterElement(){
        System.out.println("After element " + getCurrentElement().getName());
    }
```