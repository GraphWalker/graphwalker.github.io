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

Start GraphWalker Restful service on default port 8887 and debug level set to ALL.

```
java -jar graphwalker-cli-3.4.0.jar --debug all online --service RESTFUL
```

Start GraphWalker Websocket service on port 9999 with no debug level.

```
java -jar graphwalker-cli-3.4.0.jar online --service RESTFUL --port 9999
```

See more about [command line options here](/cli-online/).

