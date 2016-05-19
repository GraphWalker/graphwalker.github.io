---
title: C# example testing PetClinic using REST
tags: [example]
keywords: example, petclinic, rest, restful, c   sharp
sidebar: sidebar
permalink: /example-c-sharp-pet-clinic/
toc: false
---


This is an example on how to implement a test using the [PetClinic Sample Application](https://github.com/spring-projects/spring-petclinic/). 

## Pre-requisites

* Download [latest GraphWalker standalone jar](http://graphwalker.github.io/content/archive/graphwalker-cli-3.4.2.jar)
* Java JRE version 8 installed
* Maven installed (version equal or greater than 3.2.3)
* C# installed
* git installed
* Latest Firefox installed

## Get and start the PetClinic Sample Application

```
git clone https://github.com/SpringSource/spring-petclinic.git
cd spring-petclinic
git reset --hard 482eeb1c217789b5d772f5c15c3ab7aa89caf279
mvn tomcat7:run
```

To verify that the Sample Application is running, open it: [http://localhost:9966/petclinic/](http://localhost:9966/petclinic/). It should display this:
![alt text](/images/spring-pet-clinic.png "The Pet Clinic Sample Application")


## Get and run the GraphWalker test example

```
git clone https://github.com/GraphWalker/graphwalker-example.git
cd graphwalker-example/c-sharp-rest/PetClinic/
```

In a terminal, start GraphWalker as a REST service

```
java -jar graphwalker-cli-3.4.2.jar -debug all online --verbose --service RESTFUL
May 10, 2016 1:59:23 PM com.sun.jersey.server.impl.application.WebApplicationImpl _initiate
INFO: Initiating Jersey application, version 'Jersey: 1.18.3 12/01/2014 08:23 AM'
May 10, 2016 1:59:24 PM org.glassfish.grizzly.http.server.NetworkListener start
INFO: Started listener bound to [0.0.0.0:8887]
May 10, 2016 1:59:24 PM org.glassfish.grizzly.http.server.HttpServer start
INFO: [HttpServer] Started.
Try http://localhost:8887/graphwalker/hasNext or http://localhost:8887/graphwalker/getNext
Press Control+C to end...
```

Build and start the test

```
xbuild
mono PetClinic/bin/Debug/PetClinic.exe PetClinic.gw3
```



