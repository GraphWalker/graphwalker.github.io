---
title: GraphWalker Restful API - Overview
tags: [API]
keywords: api, restful, rest, overview
sidebar: sidebar
permalink: /rest-overview/
toc: false
---


GraphWalker can be run as a Restful service. This page is an overview of the API that can be used to
interact with the service.

The service only handles one session at the time. Models can either be uploaded using the [REST load API call](/rest-load/),
or loaded on command line.

## Command line example

Start GraphWalker REST service on default port 8887 and debug level set to ALL.

```
java -jar graphwalker-cli-3.4.2.jar --debug all online --service RESTFUL
```

Start GraphWalker REST service on port 9999 with no debug level.

```
java -jar graphwalker-cli-3.4.2.jar online --service RESTFUL --port 9999
```

Start GraphWalker REST, using default port, full debug, and a graphml model

```
java -jar graphwalker-cli-3.4.2.jar -d all online -s RESTFUL -m ShoppingCart.graphml "random(edge_coverage(100))"
```

See more about [command line options here](/cli-online/).


## Example code

There is an example at [C Sharp REST Small Model example](https://github.com/GraphWalker/graphwalker-example/tree/master/c-sharp-rest/SmallModel)

