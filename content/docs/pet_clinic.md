---
title: Pet Clinic Example
tags: [example]
keywords: example
sidebar: sidebar
permalink: /petclinic/
toc: false
---


This is an example on how to implement a test using the [PetClinic Sample Application](https://github.com/spring-projects/spring-petclinic/). 

## Pre-requisites

* Java JDK version 8 installed
* Maven installed (version equal or greater than 3.2.3)
* git installed
* Latest Firefox installed

## Get and start the PetClinic Sample Application

```
git clone https://github.com/SpringSource/spring-petclinic.git
cd spring-petclinic
mvn tomcat7:run
```

To verify that the Sample Application is running, open it: [http://localhost:9966/petclinic/](http://localhost:9966/petclinic/). It should display this:
![alt text](/images/spring-pet-clinic.png "The Pet Clinic Sample Application")


## Get and run the GraphWalker test example

```
git clone https://github.com/GraphWalker/graphwalker-example.git
cd graphwalker-example/java-petclinic
mvn graphwalker:test
```

## The test
The tests is designed using [yEd](http://www.yworks.com/en/products/yfiles/yed/). The test design is divided between 5 models. 

What you would expect when running the test, is that Firefox will open, and the test will start navigating around the Pet Clinic web site.

The video below runs the PetClinic test using maven from the command line:

```
mvn graphwalker:test
```

<iframe width="420" height="315" src="https://www.youtube.com/embed/idSgWX6rGdk" frameborder="0" allowfullscreen></iframe>

Another video that uses [Graphstream](http://graphstream-project.org/) to visualize the test as it runs. Graphstream is hooking into the [GraphWalker Observer](https://github.com/GraphWalker/graphwalker-example/blob/master/java-petclinic/src/main/java/com/company/observers/GraphStreamObserver.java). The test is launched from IntelliJ.

<iframe width="420" height="315" src="https://www.youtube.com/embed/Ufe4XbaBe1o" frameborder="0" allowfullscreen></iframe>


## The Models - The Test Design
The models can be found in folder:

```
src/main/resources/com/company/
```

When opened in yEd, the models will look like this:

### The main model: PetClinic

<img src="https://raw.githubusercontent.com/GraphWalker/graphwalker-example/master/java-petclinic/src/main/resources/com/company/PetClinicSharedState.png" alt="PetClinic">

### The Find Owners model

<img src="https://raw.githubusercontent.com/GraphWalker/graphwalker-example/master/java-petclinic/src/main/resources/com/company/FindOwnersSharedState.png" alt="FindOwners">

### The Veterinariens model

<img src="https://raw.githubusercontent.com/GraphWalker/graphwalker-example/master/java-petclinic/src/main/resources/com/company/VeterinariensSharedState.png" alt="Veterinariens">

### The Owner Information model

<img src="https://raw.githubusercontent.com/GraphWalker/graphwalker-example/master/java-petclinic/src/main/resources/com/company/OwnerInformationSharedState.png" alt="OwnerInformation">

### The New Owner model

<img src="https://raw.githubusercontent.com/GraphWalker/graphwalker-example/master/java-petclinic/src/main/resources/com/company/NewOwnerSharedState.png" alt="NewOwner">


