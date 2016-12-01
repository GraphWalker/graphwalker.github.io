---
title: How to create a small test from scratch
keywords: example
tags: [example]
sidebar: sidebar
permalink: /create_a_small_test/
toc: false
---


## Download and install the dependencies

 * Install latest Java JDK, 7 or 8
 * Install the [Maven](http://maven.apache.org/download.cgi)

## Create folder structure
From the command line, run:

```
mkdir -p gw_test/src/test/java/
cd gw_test
```

Create following file `src/test/java/ExampleTest.java` and copy and paste following into it:

```java
import org.graphwalker.core.condition.VertexCoverage;
import org.graphwalker.core.generator.RandomPath;
import org.graphwalker.core.machine.*;
import org.graphwalker.core.model.*;
import org.junit.Assert;
import org.junit.Test;

import static org.hamcrest.core.Is.is;

public class ExampleTest extends ExecutionContext {

    public void vertex1() {
        System.out.println("vertex1");
    }

    public void edge1() {
        System.out.println("edge1");
    }

    public void vertex2() {
        System.out.println("vertex2");
    }

    public void vertex3() {
        throw new RuntimeException();
    }

    public boolean isFalse() {
        return false;
    }

    public boolean isTrue() {
        return true;
    }

    public void myAction() {
        System.out.println("Action called");
    }

    @Test
    public void success() {
        Vertex start = new Vertex();
        Model model = new Model().addEdge(new Edge()
                .setName("edge1")
                .setGuard(new Guard("isTrue()"))
                .setSourceVertex(start
                        .setName("vertex1"))
                .setTargetVertex(new Vertex()
                        .setName("vertex2"))
                .addAction(new Action("myAction();")));
        this.setModel(model.build());
        this.setPathGenerator(new RandomPath(new VertexCoverage(100)));
        setNextElement(start);
        Machine machine = new SimpleMachine(this);
        while (machine.hasNextStep()) {
            machine.getNextStep();
        }
    }

    @Test(expected = MachineException.class)
    public void failure() {
        Vertex start = new Vertex();
        Model model = new Model().addEdge(new Edge()
                .setName("edge1")
                .setGuard(new Guard("isFalse()"))
                .setSourceVertex(start
                        .setName("vertex1"))
                .setTargetVertex(new Vertex()
                        .setName("vertex2")));
        this.setModel(model.build());
        this.setPathGenerator(new RandomPath(new VertexCoverage(100)));
        setNextElement(start);
        Machine machine = new SimpleMachine(this);
        while (machine.hasNextStep()) {
            machine.getNextStep();
        }
    }

    @Test
    public void exception() {
        Vertex start = new Vertex();
        Model model = new Model().addEdge(new Edge()
                .setName("edge1")
                .setGuard(new Guard("isTrue()"))
                .setSourceVertex(start
                        .setName("vertex3"))
                .setTargetVertex(new Vertex()
                        .setName("vertex2")));
        this.setModel(model.build());
        this.setPathGenerator(new RandomPath(new VertexCoverage(100)));
        setNextElement(start);
        Machine machine = new SimpleMachine(this);
        Assert.assertThat(getExecutionStatus(), is(ExecutionStatus.NOT_EXECUTED));
        try {
            while (machine.hasNextStep()) {
                machine.getNextStep();
                Assert.assertThat(getExecutionStatus(), is(ExecutionStatus.EXECUTING));
            }
        } catch (Throwable t) {
            Assert.assertTrue(MachineException.class.isAssignableFrom(t.getClass()));
            Assert.assertThat(getExecutionStatus(), is(ExecutionStatus.FAILED));
        }
    }
}
```

Also, create a file `pom.xml`, and copy the below into it:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <modelVersion>4.0.0</modelVersion>

    <groupId>org.myorg</groupId>
    <version>1.0.0-SNAPSHOT</version>
    <artifactId>example</artifactId>
    <name>GraphWalker Test</name>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
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
        </plugins>
    </build>


    <dependencies>
        <dependency>
            <groupId>org.graphwalker</groupId>
            <artifactId>graphwalker-core</artifactId>
	    <version>3.4.2</version>
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
            <scope>test</scope>
        </dependency>
    </dependencies>

</project>
```

Your folder and file structure will now look like this:

```
tree
.
├── pom.xml
└── src
    └── test
        └── java
            └── ExampleTest.java
```

## Running the test

To make GraphWalker generate a path run the following on the command line:

```
mvn test
[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building GraphWalker Test 1.0.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- maven-resources-plugin:2.3:resources (default-resources) @ example ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /home/krikar/gw_test/src/main/resources
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ example ---
[INFO] No sources to compile
[INFO] 
[INFO] --- maven-resources-plugin:2.3:testResources (default-testResources) @ example ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /home/krikar/gw_test/src/test/resources
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ example ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- maven-surefire-plugin:2.10:test (default-test) @ example ---
[INFO] Surefire report directory: /home/krikar/gw_test/target/surefire-reports

-------------------------------------------------------
 T E S T S
-------------------------------------------------------
Running ExampleTest
vertex1
Action called
edge1
vertex2
vertex1
Tests run: 3, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.679 sec

Results :

Tests run: 3, Failures: 0, Errors: 0, Skipped: 0

[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 3.309s
[INFO] Finished at: Thu Sep 25 22:09:03 CEST 2014
[INFO] Final Memory: 7M/19M
[INFO] ------------------------------------------------------------------------
```

## What the test(s) does
First of all, we extend the `class ExecutionContext`, this gives us access to the execution context GraphWalker needs. The context is then passed on to the constructor of `SimpleMachine`.

```
    @Test
    public void success() {
(1)     Vertex start = new Vertex();
(2)      Model model = new Model()
(3)             .addEdge(new Edge()
(4)             .setName("edge1")
(5)             .setGuard(new Guard("isTrue()"))
(6)             .setSourceVertex(start
(7)                     .setName("vertex1"))
(8)             .setTargetVertex(new Vertex()
(9)                     .setName("vertex2"))
(10)             .addAction(new Action("myAction();")));
(11)     this.setModel(model.build());
(12)     this.setPathGenerator(new RandomPath(new VertexCoverage(100)));
(13)     setNextElement(start);
(14)     Machine machine = new SimpleMachine(this);
(15)     while (machine.hasNextStep()) {
(16)         machine.getNextStep();
        }
    }

```
The code explained row by row:

1. Creating a start node
2. Creating the graph, or model.
3. Adding an edge to the model.
4. Name the edge: **edge1**
5. Add a guard to the edge. A guard is a conditional expression, if evaluated to true, the edge is accessible for execution, otherwise not.
6. Set start vertex as the source vertex of the edge.
7. Name the start vertex to: **vertex1**.
8. Create a new vertex, and set that as the target for the edge.
9. Name the vertex: **vertex2**.
10. Add an action the the edge. The action is javascript code that will execute when the edge is executed.
11. Build the model (make it immutable), and give it to the execution context.
12. Create a path generator, and it's stop condition, and give it to the execution context.
13. Set the start vertex as the starting point of the execution of the model.
14. Create the machine that will control the execution.
15. As long as the stop condition of the path generator is not fulfilled, **hasNext** will return **true**.
16. Execute the next step of the model.



