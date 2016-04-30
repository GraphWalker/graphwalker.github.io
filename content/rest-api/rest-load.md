---
title: GraphWalker Restful API - load
tags: [api]
keywords: api, restful, rest, load
sidebar: sidebar
permalink: /rest-load/
toc: false
---



## load
The Rest call `load` uploads model(s) in JASON format and resets GraphWalker with the new test.
 
**POST Request**

http://service-host:8887/graphwalker/load + json graph file

**Response**

If the request was successful **"result"** will be **"ok"**.

```json
{
  "result":"ok"
}
```

## Example

Loading the Amazon shopping cart test to the REST service. All command are done from a Linux terminal.

In a terminal, start the service:

```
java -jar graphwalker-cli-3.4.0.jar --debug all online --service RESTFUL
```

In some other terminal, assuming we have a file ShoppingCart.json containing:

```
cat Shoppingcart.json
{
  "name":"This is the example project of Amazon Shopping Cart test",
  "models":[
    {
      "name": "UC01_GW2",
      "id": "5ddf6a4d-fcca-4d22-a4ce-556fe63038d7",
      "generator":"random(edge_coverage(100))",
      "startElementId": "e0",
      "vertices": [
        {
          "id": "n1",
          "name": "v_BrowserStarted"
        },
        {
          "id": "n2",
          "name": "v_BaseURL"
        },
        {
          "id": "n3",
          "name": "v_SearchResult"
        },
        {
          "id": "n4",
          "name": "v_BrowserStopped"
        },
        {
          "id": "n5",
          "name": "v_BookInformation"
        },
        {
          "id": "n6",
          "name": "v_OtherBoughtBooks"
        },
        {
          "id": "n7",
          "name": "v_ShoppingCart"
        }
      ],
      "edges": [
        {
          "id": "e0",
          "name": "e_init",
          "actions": [
            " num_of_books \u003d 0;",
            " MAX_BOOKS \u003d 5;"
          ],
          "targetVertexId": "n4"
        },
        {
          "id": "e1",
          "name": "e_EnterBaseURL",
          "sourceVertexId": "n1",
          "targetVertexId": "n2"
        },
        {
          "id": "e2",
          "name": "e_SearchBook",
          "sourceVertexId": "n2",
          "targetVertexId": "n3"
        },
        {
          "id": "e3",
          "name": "e_StartBrowser",
          "sourceVertexId": "n4",
          "targetVertexId": "n1"
        },
        {
          "id": "e4",
          "name": "e_ClickBook",
          "sourceVertexId": "n3",
          "targetVertexId": "n5"
        },
        {
          "id": "e5",
          "name": "e_AddBookToCart",
          "guard": "num_of_books\u003c\u003dMAX_BOOKS",
          "actions": [
            " num_of_books++;"
          ],
          "sourceVertexId": "n5",
          "targetVertexId": "n6"
        },
        {
          "id": "e6",
          "name": "e_ShoppingCart",
          "sourceVertexId": "n6",
          "targetVertexId": "n7"
        },
        {
          "id": "e7",
          "name": "e_ShoppingCart",
          "sourceVertexId": "n3",
          "targetVertexId": "n7"
        },
        {
          "id": "e8",
          "name": "e_ShoppingCart",
          "sourceVertexId": "n5",
          "targetVertexId": "n7"
        },
        {
          "id": "e9",
          "name": "e_SearchBook",
          "sourceVertexId": "n7",
          "targetVertexId": "n3"
        },
        {
          "id": "e10",
          "name": "e_SearchBook",
          "sourceVertexId": "n6",
          "targetVertexId": "n3"
        },
        {
          "id": "e11",
          "name": "e_SearchBook",
          "sourceVertexId": "n5",
          "targetVertexId": "n3"
        }
      ]
    }
  ]
}
```

Upload the model to the service using curl:

```
curl -vH "Content-Type: text/plain" --data @ShoppingCart.json http://localhost:8887/graphwalker/load
{"result":"ok"}
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 8887 (#0)
> POST /graphwalker/load HTTP/1.1
> Host: localhost:8887
> User-Agent: curl/7.47.0
> Accept: */*
> Content-Type: text/plain
> Content-Length: 2675
> Expect: 100-continue
>
< HTTP/1.1 100 Continue
* We are completely uploaded and fine
< HTTP/1.1 200 OK
< Content-Type: text/plain;charset=UTF-8
< Date: Sat, 30 Apr 2016 07:09:14 GMT
< Transfer-Encoding: chunked
<
* Connection #0 to host localhost left intact
```
