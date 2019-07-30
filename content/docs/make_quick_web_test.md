---
title: Make a quick Web test
keywords: example
toc: false
---
[comment]: <> Not used?

This will create a quick WEB test using GraphWalker and the Selenium web driver.


## Designing the model

Let's start with creating a simple model that will depict the expected behavior of our system under test. For this exercise, we are gonna use the Amazon website, and we will test the search feature. The test will be very simple. We are only going to test some very few things.

 * Search for a specific book - Should just return 1 book
 * Do a broad search - Should return a list a books
 * Use a search expression that will yield no hits.

This is how a model might look like:

<img src="/content/images/AmazonSearch.png" alt="Amazon search">


## Implementing the test

The developers tool chain we will be using for this example is:

 * Latest FireFox installed
 * Java JDK 7
 * [Maven](http://lmgtfy.com/?q=how+to+install+maven)
 * Use you favorite Java IDE, perhaps Eclipse or IntelliJ
 * Selenium Web Driver, to interact with our System Under Test, *SUT*.

### Initiate the maven project

~~~
%> mvn archetype:generate -DarchetypeGroupId=org.graphwalker -DarchetypeArtifactId=graphwalker-example-archetype -DarchetypeVersion=3.0.0-SNAPSHOT -DgroupId=org.graphwalker -DartifactId=AmazonTest -Dpackage=org.graphwalker.example -DinteractiveMode=false
%> cd AmazonTest
~~~

The run the test:
~~~
%> mvn org.graphwalker:graphwalker-maven-plugin:3.0.0-RC1:test
~~~

So we made a test run. But nothing really happened... So we need to add Selenium to the soup. Add
~~~
<dependency>
  <groupId>org.seleniumhq.selenium</groupId>
  <artifactId>selenium-java</artifactId>
  <version>LATEST</version>
</dependency>
~~~


