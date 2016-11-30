---
title: Introduction to using GraphWalker
summary: "GraphWalker is a open source Model-based testing tool for test automation. This is an introduction to GraphWalker. It explains the work flow and process designing a test."
tags: [introduction, work flow]
keywords: introduction, work flow
sidebar: sidebar
permalink: /introduction/
toc: false
---


## Pre-install the requirements

 * Install Java JDK 7 or 8
 * Install [Maven](http://maven.apache.org/download.cgi)
 * Download [graphwalker-cli](http://graphwalker.github.io/download/)

## Test idea and design
The purpose of the test design is to describe the **expected behavior of the system under test**. The way it works, is that you in a finite state diagram [model], express an action as a directed edge. An edge is also known as an arrow, arc or transition. The edge points to a vertex. Also known as a node or state, where the results or the consequence of the previous action is verified/asserted.

### Test idea
Our test idea, is to write a regression test for the Spotify Desktop Client, more specifically, the feature **login**. (<a href="http://en.wikipedia.org/wiki/Spotify">Spotify is a music streaming business</a>)

The feature is suppose to work  like this:

* In a freshly installed client, and the client is started, the Login dialog is expected to be displayed.
* The user enters valid credentials and the client is expected to start.
* If the user quits, or logs out, the Login dialog is displayed once again.
* If the user checks the **Remember Me** checkbox, and logs in (using valid credentials), the client starts, and, next time the user starts the client, it will start without asking the client for credentials.

Just designing a test for the 2 first steps, a model would look something like this:

<img src="/images/Login-first.png" alt="Login model, first iteration" align="left">

1. The **Start** vertex is where the tests starts. (Duh!)

2. In **e_Init**, we remove all cache, and kill any previous client processes. Since the test might be restarted, stored credentials on the disk might still lie around, so we need to get rid of it. Also, restarted tests could have stopped in a state, where the client still is running.

3. **v_ClientNotRunning** will assert that there is no Spotify client process running.

4. **e_Start** starts the client.

5. **v_LoginPrompted** asserts that the login dialog is displayed and correctly rendered.

6. **e_ValidCredentials** enters a valid username and password and clicks the Sign In button.

7. **v_Browse** asserts that the Browse view is correctly displayed.

The above is a simple test. In fact, it's just one possible path through the model. It could be called the <a href="http://en.wikipedia.org/wiki/Use_case#Example">Basic flow</a> in a Use case. To make the test a better regression test, we extend the model.

* Logout
* Exit the client
* Testing invalid credentials
* Enabling and disabling stored credentials (Remember Me)
* Closing/canceling the login dialog

The complete model could look something like below:

<a href="/images/Login.graphml" title="Spotify login feature on desktop"><img alt="Complete Login model" src="/images/Login.png"></a>

### Verifying the correctness of the model

Before venturing into the test coding part, we need to verify whether the model is correct according to GraphWalker syntax rules. [See GraphWalker modeling syntax](/yed_model_syntax)

Download the model above by right-clicking on it, then select "Save link as...". Save it as Login.graphml.

To verify the model, we use the GraphWalker CLI to test it:

```sh
%> java -jar graphwalker.jar offline -m Login.graphml "random(edge_coverage(100))"
e_Init
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_InvalidCredentials
v_LoginPrompted
e_ValidPremiumCredentials
v_Browse
e_Logout
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_InvalidCredentials
v_LoginPrompted
e_ValidPremiumCredentials
v_Browse
e_Exit
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_ValidPremiumCredentials
v_Browse
e_Exit
v_ClientNotRunning
e_StartClient
v_LoginPrompted
e_ToggleRememberMe
v_LoginPrompted
e_Close
v_ClientNotRunning
e_StartClient
v_Browse
```

A test sequence is generated. This is an offline generated test. No errors or other warning messages are generated, which means that the model is correct.

## Creating the test code
Using Maven and the complete model above create all the stub code needed.


1. Create the folder structure:

```sh
%> mkdir -p login/src/main/java/org/myorg/testautomation
%> mkdir -p login/src/main/resources/org/myorg/testautomation
%> mkdir -p login/src/test/java/org/myorg/testautomation
```
2. Move the saved model:

```sh
%> mv Login.graphml login/src/main/resources/org/myorg/testautomation
```

3. Copy and paste following and save it as pom.xml in **login** folder.

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

4. CD into the login folder, and run following:

```sh
%> cd login
%> mvn graphwalker:generate-sources
```

The last command will automatically generate an interface of the model in Login.graphml.The interface is found in the folder **target/generated-sources/graphwalker/**. 

If you check your folder, it will contain following files and folders:

```
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

Your job is now to implement that interface, which means filling in the missing code into the methods in the class that implements the interface. First you have to find the right tool for the job. Depending on you System Under Test(SUT) , it could typically be::
 * [Selenium Web Driver](http://www.seleniumhq.org/): if your SUT is a web browser
 * [Sikuli](http://www.sikuli.org/): if your SUT is a desktop native GUI client, where you don't have access to it's source code.

### Implementing a test

The code below is a stub. It does not interact with any real system under test. The lines containing the **System.out.println** indicates where code that interacts with a system under test should end up.

Copy and paste following and save it as **src/test/java/org/myorg/testautomation/SimpleTest.java**:

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

All tests uses the same model, and the same code that implements the test. We have only changed the parameters passed on to GraphWalker. The parameters affects the traversing strategies and stop conditions for the tests.

### Smoke test example
Verifies the basic flow of the model. Using the A* algorithm, we create a straight path from the starting point, **e_Init**, in the graph, to the vertex **v_Browse**.

```java
@Test
public void runSmokeTest() {
    :
    .setPathGenerator(new AStarPath(new ReachedVertex("v_Browse")))
    :
}
```

### Functional test example
This is a test where GraphWalker covers the complete graph. It will start from **e_Init**, and end as soon as the stop condition is fulfilled. Which is is 100% coverage of all edges.

```java
@Test
public void runFunctionalTest() {
    :
    .setPathGenerator(new RandomPath(new EdgeCoverage(100)))
    :
}
```

### Stability test example
We ask GraphWalker to randomly walk the model, until the stop condition is fulfilled. That will happen when 30 seconds has passed. of course, in a real test, that might be 30 minutes, or why not hours.

```java
@Test
public void runStabilityTest() {
    :
    .setPathGenerator(new RandomPath(new TimeDuration(30, TimeUnit.SECONDS)))
    :
}
```
