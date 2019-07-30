---
title: Maven - watch
tags: [maven]
keywords: maven, watch
sidebar: sidebar
permalink: /maven-watch/
toc: false
---


## graphwalker:watch

The plugin will watch models that are placed in the folder `src/main/resources`. If a model
is changed, it will automatically run the plugin [graphwalker:generate-sources](/maven-generate-sources/)

## Example

```
user@host:~/graphwalker-project/graphwalker-cli$ mvn graphwalker:watch
[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building GraphWalker Command Line Interface 3.4.2
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- graphwalker-maven-plugin:3.4.2:watch (default-cli) @ graphwalker-cli ---
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources/json
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources/graphml
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources/graphml/IncorrectModels
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources/graphml/CorrectModels
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources/graphml/shared_state
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources/graphml/online
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources/dot
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/test/resources/template
[INFO] Watching: /graphwalker-project/graphwalker-cli/src/main/resources
```
