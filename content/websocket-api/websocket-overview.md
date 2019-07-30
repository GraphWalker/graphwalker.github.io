---
title: GraphWalker WebSocket API - Overview
tags: [API]
keywords: api, websocket, overview
sidebar: sidebar
permalink: /websocket-overview/
toc: false
---


GraphWalker can be run as a WebSocket service. This page is an overview of the API that can be used to
interact with the service.

The service will handle multiple connections. Every connection will be a unique session.
The models have to be uploaded using the [Websocket start API call](/websocket-start/). It does not load any models on the command line.

## Command line example

Start GraphWalker Websocket service on default port 8887 and debug level set to ALL.

```
java -jar graphwalker-cli-3.4.2.jar --debug all online
```

Start GraphWalker Websocket service on port 9999 with no debug level.

```
java -jar graphwalker-cli-3.4.2.jar online --port 9999 --service WEBSOCKET
```

See more about [command line options here](/cli-online/).
