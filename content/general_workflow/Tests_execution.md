---
title: Introduction to test execution
tags: [introduction, work_flow]
keywords: introduction, work flow
sidebar: sidebar
permalink: /Tests_execution/
toc: false
---


### Creating the test code

The test path execution currently can be done in two ways: [step by step test](/create_a_small_test) creation or by [maven goal triggering](/create_a_test_using_maven).    

An example of step by step test creation is presented here.  
Using Maven and the complete model from [model design step](/Model_design), create all the stub code needed.


1\. Create the folder structure:

```sh
%> mkdir -p login/src/main/java/org/myorg/testautomation
%> mkdir -p login/src/main/resources/org/myorg/testautomation
%> mkdir -p login/src/test/java/org/myorg/testautomation
```
2\. Move the saved model:

```sh
%> mv Login.graphml login/src/main/resources/org/myorg/testautomation
```

3\. Copy and paste the following, and save it as pom.xml in *login* folder.

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <modelVersion>4.0.0</modelVersion>

    <groupId>org.myorg</groupId>
    <version>3.2.1</version>
    <artifactId>example</artifactId>
    <name>GraphWalker Test</name>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <!-- Set graphwalker.version below to the version you wish to use. We recommend the latest stable version -->
        <graphwalker.version>3.4.2</graphwalker.version>
    </properties>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.1</version>
                <configuration>
                    <source>1.7</source>
                    <target>1.7</target>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.graphwalker</groupId>
                <artifactId>graphwalker-maven-plugin</artifactId>
                <version>${graphwalker.version}</version>
                <!-- Bind goals to the default lifecycle -->
                <executions>
                    <execution>
                        <id>generate-sources</id>
                        <phase>generate-sources</phase>
                        <goals>
                            <goal>generate-sources</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>

    <dependencies>
        <dependency>
            <groupId>org.graphwalker</groupId>
            <artifactId>graphwalker-core</artifactId>
            <version>${graphwalker.version}</version>
        </dependency>
        <dependency>
            <groupId>org.graphwalker</groupId>
            <artifactId>graphwalker-java</artifactId>
            <version>${graphwalker.version}</version>
        </dependency>
        <dependency>
            <groupId>org.graphwalker</groupId>
            <artifactId>graphwalker-maven-plugin</artifactId>
            <version>${graphwalker.version}</version>
        </dependency>
        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-api</artifactId>
             <version>1.7.7</version>
        </dependency>
        <dependency>
            <groupId>ch.qos.logback</groupId>
            <artifactId>logback-classic</artifactId>
            <version>1.1.2</version>
        </dependency>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.11</version>
        </dependency>
    </dependencies>

</project>
```

4\. cd into the login folder, and run the following:

```sh
%> cd login
%> mvn graphwalker:generate-sources
```

The last command will automatically generate an interface of the model in Login.graphml. The interface is found in the folder **target/generated-sources/graphwalker/**. 

If you check your folder, it will contain the following files and folders:

```sh
%> tree
.
├── pom.xml
├── src
│   ├── main
│   │   ├── java
│   │   │   └── org
│   │   │       └── myorg
│   │   │           └── testautomation
│   │   └── resources
│   │       └── org
│   │           └── myorg
│   │               └── testautomation
│   │                   └── Login.graphml
│   └── test
│       └── java
│           └── org
│               └── myorg
│                   └── testautomation
└── target
    └── generated-sources
        └── graphwalker
            └── org
                └── myorg
                    └── testautomation
                        └── Login.java
```

Your job is now to implement that interface, which means filling in the missing code into the methods in the class that implements the interface. First you have to find the right tool for the job. Depending on you System Under Test (SUT) , it could be:

 * [Selenium Web Driver](http://www.seleniumhq.org/): if your SUT is a web browser
 * [Sikuli](http://www.sikuli.org/): if your SUT is a desktop native GUI client, where you do not have access to source code.

### Implementing a test

The code below is a stub. It does not interact with any real system under test. The lines containing the **System.out.println** indicates where code that interacts with a system under test should go.

Copy and paste the following and save it as **src/test/java/org/myorg/testautomation/SimpleTest.java**:

```java
package org.myorg.testautomation;

import org.graphwalker.core.condition.EdgeCoverage;
import org.graphwalker.core.condition.ReachedVertex;
import org.graphwalker.core.condition.TimeDuration;
import org.graphwalker.core.generator.AStarPath;
import org.graphwalker.core.generator.RandomPath;
import org.graphwalker.core.machine.ExecutionContext;
import org.graphwalker.java.test.TestBuilder;
import org.junit.Test;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.TimeUnit;

public class SimpleTest extends ExecutionContext implements Login {
    public final static Path MODEL_PATH = Paths.get("org/myorg/testautomation/Login.graphml");
    @Override
    public void e_InvalidCredentials() {
        System.out.println("e_InvalidCredentials: Insert test code here!");
    }

    @Override
    public void v_LoginPrompted() {
        System.out.println("v_LoginPrompted: Insert test code here!");
    }

    @Override
    public void e_ToggleRememberMe() {
        System.out.println("e_ToggleRememberMe: Insert test code here!");
    }

    @Override
    public void e_Exit() {
        System.out.println("e_Exit: Insert test code here!");
    }

    @Override
    public void e_ValidPremiumCredentials() {
        System.out.println("e_ValidPremiumCredentials: Insert test code here!");
    }

    @Override
    public void e_Close() {
        System.out.println("e_Close: Insert test code here!");
    }

    @Override
    public void e_Logout() {
        System.out.println("e_Logout: Insert test code here!");
    }

    @Override
    public void e_Init() {
        System.out.println("e_Init: Insert test code here!");
    }

    @Override
    public void v_Browse() {
        System.out.println("v_Browse: Insert test code here!");
    }

    @Override
    public void e_StartClient() {
        System.out.println("e_StartClient: Insert test code here!");
    }

    @Override
    public void v_ClientNotRunning() {
        System.out.println("v_ClientNotRunning: Insert test code here!");
    }

    @Test
    public void runSmokeTest() {
        new TestBuilder()
            .setModel(MODEL_PATH)
            .setContext(new SimpleTest())
            .setPathGenerator(new AStarPath(new ReachedVertex("v_Browse")))
            .setStart("e_Init")
            .execute();
    }

    @Test
    public void runFunctionalTest() {
        new TestBuilder()
            .setModel(MODEL_PATH)
            .setContext(new SimpleTest())
            .setPathGenerator(new RandomPath(new EdgeCoverage(100)))
            .setStart("e_Init")
            .execute();
    }

    @Test
    public void runStabilityTest() {
        new TestBuilder()
            .setModel(MODEL_PATH)
            .setContext(new SimpleTest())
            .setPathGenerator(new RandomPath(new TimeDuration(30, TimeUnit.SECONDS)))
            .setStart("e_Init")
            .execute();
    }
}
```

## Running the test

The test above is implemented using the JUnit framework, so you invoke it running:

```sh
%> mvn test
```

All tests use the same model and the same code that implements the test. We only change the parameters passed on to GraphWalker. The parameters affects the traversing strategies and stop conditions for the tests.

### Smoke test example
This verifies the basic flow of the model. Using the [A* algorithm](generators_and_stop_conditions/#a_star-a-stop-condition-that-names-a-vertex-or-an-edge-), we create a straight path from the starting point, **e_Init** in the graph, to the vertex **v_Browse**.

```java
@Test
public void runSmokeTest() {
    :
    .setPathGenerator(new AStarPath(new ReachedVertex("v_Browse")))
    :
}
```

### Functional test example
This is a test where GraphWalker covers the complete graph. It will start from **e_Init**, and ends as soon as the stop condition is fulfilled, i.e. 100% coverage of all edges.

```java
@Test
public void runFunctionalTest() {
    :
    .setPathGenerator(new RandomPath(new EdgeCoverage(100)))
    :
}
```

### Stability test example
We ask GraphWalker to randomly walk the model until the stop condition is fulfilled. That will happen when 30 seconds has passed. Of course, in a real test, that might be 30 minutes, or why not hours.

```java
@Test
public void runStabilityTest() {
    :
    .setPathGenerator(new RandomPath(new TimeDuration(30, TimeUnit.SECONDS)))
    :
}
```
