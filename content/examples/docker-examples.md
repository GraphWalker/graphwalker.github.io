---
title: Docker Examples
tags: [example]
keywords: example, docker, images
sidebar: sidebar
permalink: /docker-examples/
toc: false
---


This explains how to use the pre-made GraphWalker Docker images.

## Pre-requisites

* You need [Docker](https://www.docker.com/) installed. Goto [Docker - Get Started](https://docs.docker.com/get-started/)

## The Docker Image Library

GraphWalker has couple of ready made Docker images in the Docker Image Library. Have a look a at [GraphWalker Image Repo](https://hub.docker.com/r/graphwalker/). The purpose of the images, is for you to run an example with as low friction as possible. With Docker installed, they should be runnable just out of the box.

## The Amazon Shopping Cart Example

This example is explained more in detail [here](http://graphwalker.github.io/amazonShoppingCart/). But here, we're gonna run it using Docker. This is how you do it:

```
docker pull graphwalker/amazon
docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/home/developer/.Xauthority \
    --net=host --pid=host --ipc=host graphwalker/amazon
```

The output from the latest command should be:

```
  Run following command:
  mvn graphwalker:test
```

So, type `mvn graphwalker:test` followed by **Enter** and watch the test start running.

The *Amazon Shopping Cart* example needs version 47.0.1 of Firefox to match the version 2.53.1 of Selenium in order to run successfully. The Docker image has that version of Firefox pre-installed, so you don't need to change anything on your computer, in order to run the test.

## The Amazon Shopping Cart Docker Image

If you interested in how the image is built, fork and clone [https://github.com/GraphWalker/docker-amazon](https://github.com/GraphWalker/docker-amazon). The [Dockerfile](https://github.com/GraphWalker/docker-amazon/blob/master/Dockerfile) is the build file for the docker image.

If you want to build your own local version, from the root folder of docker-amazon run:

```
docker build -t my-amazon-shopping-cart-example .
```

