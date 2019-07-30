---
title: GraphWalker JSON file format - Action
tags: [JSON]
keywords: api, file format, json, action
sidebar: sidebar
permalink: /json-action/
toc: false
---


A single GraphWalker action representation in JSON.

## Action

```json
  "<JAVA SCRIPT;>"
```

The action is a piece of java script code that you want the model to execute.

It has to end with a semicolon.

## Example

This is an example of an action from the [PetClinic](/petclinic/) test.

```json
  "numOfPets=0;"
```