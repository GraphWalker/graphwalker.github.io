---
title: Home Page
layout: default
group: navigation
weight: 1
---


## What is GraphWalker?

It's a Model-Based testing tool built in Java. It reads models in the shape of finite-state diagrams, or directed graphs, and generate tests from the models, either offline or online.

<img src="/images/Login-small.png" alt="Model" align="left">

#### *For the tester:*
It's easy to design for test automation, even if you have no, or little, programming skills. The [modeling syntax](/docs/gw_model_syntax.html) is very simple, and people can get started in less than an hour. The most common use cases for GraphWalker are automated end user acceptance tests, or any tests with workflows in them. Designing a decent set of regression tests using GraphWalker is a breeze.

#### *For the test automation developer:*
GraphWalker is very easy to setup and start using in your test automation code. It's highly modularized, and it's easy to extend if you need to customize it.

#### *For the team:*
Modeling using a finite-state diagram is visual, it's easy to understand. Getting feed-back from team members and stakeholders is so much easier with models.

#### *For whoever pays the bills:*
The models create an abstraction layer between the test design and the implementing automation code. This is important when it comes to maintenance. Remember that the test automation (code and design) will have as long a life time expectancy as the system under test. The return of investment is higher, if the test design and automation code is easy to work with and maintain. That's why it's so important with a good abstraction layer between design and implementation.

## How to get it?
Either download the standalone jar file, or include it directly in you java project.

* [Download the latest release graphwalker command line tool](/archive/graphwalker-cli-3.3.0.jar), read the [Command line syntax doc](/docs/command_line_syntax.html)

## Maven
Version 3.3.0 is the latest release. In your maven project. Add this to your pom.xml file.

{% highlight xml %}
<dependency>
   <groupId>org.graphwalker</groupId>
   <artifactId>graphwalker-core</artifactId>
   <version>3.3.0</version>
</dependency>
{% endhighlight %}

## Quick feedback?

Join <a href="https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!forum/graphwalker-3"> GraphWalker 3 group</a> and ask us any questions regarding GraphWalker 3.

## License

GraphWalker is a <a href="http://opensource.org/licenses/MIT">MIT licensed</a> <a href="http://opensource.org">Open Soure project</a>.

