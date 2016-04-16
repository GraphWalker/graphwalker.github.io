---
title: Amazon Shopping Cart
tags: [example]
keywords: example
sidebar: sidebar
permalink: /amazonShoppingCart/
toc: false
---


This is an Model-Based test testing the shopping cart at the Amazon website. The source code of the test is [Amazon Shopping Cart test](https://github.com/GraphWalker/graphwalker-example/tree/master/java-amazon). 

## Pre-requisites

* Java JDK version 8 installed
* Maven installed (version equal or greater than 3.2.3)
* git installed
* Latest Firefox installed

## Get the source code of the example

```
git clone https://github.com/GraphWalker/graphwalker-example.git
cd graphwalker-example/java-amazon
```

<a download="ShoppingCart.graphml" href="/content/resources/ShoppingCart.graphml"><img src="/images/amazonShoppingCart_small.png" alt="Model" align="right"/></a>

## Run the test

```
mvn graphwalker:test
```

## The graph

The tests is designed using [yEd](http://www.yworks.com/en/products/yfiles/yed/). If you click on the graph to the right and save the file as ShoppingCart.graphml, you can open it in yEd and have a closer look at it.

## The test design

<a download="UC01.pdf" href="/content/resources/UC01.pdf"><img src="/images/UC01_small.png" alt="PDFl" align="left"/></a>

The design of the test, is based on an imaginary [Use Case document](/content/resources/UC01.pdf). In the model, there are some special tags in the vertices. They look like:<br>
`REQTAG=UC01 2.2.1`<br>
The meaning of that keyword, is to help you track what requirement is verified at that specific vertex. So if you open the Use case document, you can verify for yourself that the test covers the requirements Use Case.

Other than the Use Case, the design is made in way, so that there's no [Cul-de-Sac](https://en.wikipedia.org/wiki/Cul-de-sac) in the model. Meaning that that, given that the start point is the `Start` node, GraphWalker will never end up in a state from which it can't go any further.


## The implementation

The test uses Firefox as a browser and [Selenium](http://www.seleniumhq.org/) to interact with that browser.

Have a look at the source code file [ShoppingCartTest.java](https://github.com/GraphWalker/graphwalker-example/blob/fb5cebc5b3a5851a6763e113f463e66c17e93eaf/java-amazon/src/main/java/org/graphwalker/ShoppingCartTest.java). The first thing to notice, is the annotation code at [line 34](https://github.com/GraphWalker/graphwalker-example/blob/fb5cebc5b3a5851a6763e113f463e66c17e93eaf/java-amazon/src/main/java/org/graphwalker/ShoppingCartTest.java#L34).

```java
@GraphWalker(value = "random(edge_coverage(100))", start = "e_StartBrowser")
public class ShoppingCartTest extends ExecutionContext implements ShoppingCart {
```

The annotation does following 3 things:

1. First of all, it tells GraphWalker to pick up this class as part of a test.
2. The attribute `value` sets the path generator and stop condition for this model.<br>{: style=""}

   The path generator is set to `random`, using a stop condition which requires 100% coverage of all edges in the model. Read more about generators and stop conditions at [Generators and stop conditions](/generators_and_stop_conditions/)
   {: style="color:gray; font-size: 90%"}
   
3. Sets the starting point of the path generation using the attribute `start` set to `e_StartBrowser`.<br>{: style=""}

   The model has a node called `Start`, but you don't need it. The attribute `start` overrides that. In our case with the Shopping Cart test we wanted the test to start with an edge, which is hard to do with yEd. It requires a source node for any edge.
   {: style="color:gray; font-size: 90%"}

## Always dry run your models!

You should alway verify your graphs before running your tests. You need to check that they don't misbehave, and doing that is very easy. 

* [Download the standalone jar file](/download/)
* From your command line, run:

```
java -jar graphwalker-cli-3.4.0.jar offline --start-element e_StartBrowser --model ShoppingCart.graphml "random(edge_coverage(100))"
{"currentElementName":"e_StartBrowser"}
{"currentElementName":"v_BrowserStarted"}
{"currentElementName":"e_EnterBaseURL"}
{"currentElementName":"v_BaseURL"}
{"currentElementName":"e_SearchBook"}
{"currentElementName":"v_SearchResult"}
{"currentElementName":"e_ShoppingCart"}
{"currentElementName":"v_ShoppingCart"}
{"currentElementName":"e_SearchBook"}
{"currentElementName":"v_SearchResult"}
{"currentElementName":"e_ClickBook"}
{"currentElementName":"v_BookInformation"}
{"currentElementName":"e_ShoppingCart"}
:
```
You can ask GraphWalker to be more verbose, and expose more data.

```
java -jar graphwalker-cli-3.4.0.jar offline --verbose --start-element e_StartBrowser --model ShoppingCart.graphml "random(edge_coverage(100))"
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"e0","currentElementName":"e_StartBrowser","properties":[{"description":"\n        \n          \n          \n          \n          e_StartBrowser\n          \n          \n        \n      "}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"n1","currentElementName":"v_BrowserStarted","properties":[{"x":118.94031187996033},{"description":"Verify that the web browser is upp running. "},{"y":77.962890625}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"e1","currentElementName":"e_EnterBaseURL","properties":[{"description":"\n        \n          \n          \n          \n          e_EnterBaseURL\n          \n          \n        \n      "}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"n2","currentElementName":"v_BaseURL","properties":[{"x":129.40442320808532},{"description":"Verify that Amazon's home page is properly displayed."},{"y":155.92578125}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"e2","currentElementName":"e_SearchBook","properties":[{"description":"\n        \n          \n          \n          \n          e_SearchBook\n          \n          \n        \n      "}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"n3","currentElementName":"v_SearchResult","properties":[{"x":147.87029622395832},{"description":"Verify that in the search result list, the book 'Practical Model-Based Testing: A Tools Approach by Mark Utting and Bruno Legeard' exists."},{"y":278.1416015625}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"e3","currentElementName":"e_ClickBook","properties":[{"description":"\n        \n          \n          \n          \n          e_ClickBook\n          \n          \n        \n      "}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"n4","currentElementName":"v_BookInformation","properties":[{"x":184.80164543030753},{"description":"Verify that the page displaing detailed information regarding '\nPractical Model-Based Testing: A Tools Approach' is correct."},{"y":385.357421875}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"0"}],"currentElementID":"e4","currentElementName":"e_AddBookToCart","properties":[{"description":"\n        \n          \n            \n            \n          \n          \n          \n          e_AddBookToCart [num_of_books<=3] / num_of_books++;\n          \n          \n        \n      "}]}
{"modelName":"ShoppingCart","data":[{"num_of_books":"1"}],"currentElementID":"n5","currentElementName":"v_OtherBoughtBooks","properties":[{"x":328.72195483010915},{"description":"Verify that the page 'Shopping Cart' now displays information 'Customers Who Bought Practical Model-Based Testing: A Tools Approach Also Bought'"},{"y":528.2200675843254}]}
:
```

If you only want to see the element name, and the value of the `num_of_books`, you can try:

```
java -jar graphwalker-cli-3.4.0.jar offline --verbose --start-element e_StartBrowser --model ShoppingCart.graphml "random(edge_coverage(100)) | jq -r '.currentElementName + ", " + (.data[] | .num_of_books) | tostring'"
e_StartBrowser, 0
v_BrowserStarted, 0
e_EnterBaseURL, 0
v_BaseURL, 0
e_SearchBook, 0
v_SearchResult, 0
e_ClickBook, 0
v_BookInformation, 0
e_SearchBook, 0
v_SearchResult, 0
e_ClickBook, 0
v_BookInformation, 0
e_AddBookToCart, 0
v_OtherBoughtBooks, 1
e_SearchBook, 1
v_SearchResult, 1
e_ClickBook, 1
v_BookInformation, 1
e_AddBookToCart, 1
v_OtherBoughtBooks, 2
:
```


When you try this on your models, and the command never stops, you have some logical problems with your test design, and you need to re-think the design. 