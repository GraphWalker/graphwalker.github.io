---
title: How to create a minimal working example when needing assistance
tags: [documentation]
keywords: documentation, example
sidebar: sidebar
permalink: /minimal_working_example/
toc: false
---


This is a re-write for GraphWalker, taken from [How to create a Minimal, Complete, and Verifiable example](https://stackoverflow.com/help/mcve)

## Asking for help

When asking questions about a problem caused by your code or models, you will get a much better answer if you provide code or models that can be used to reproduce the problem. That code should be:

* **Minimal**<br>Use as little code, and as small models, as possible that still produce the same problem.
* **Complete**<br>Provide all the parts needed to reproduce the problem.
* **Verifiable**<br>Test the code and models you are about to provide, to make sure it does reproduce the problem.
* **Upload**<br>Share the example using github.

## Minimal

The more code there is to go through, the less likely it is that people can help you with your problem. Streamline your example in one of two ways:

- Restart from scratch. Create a new program, adding only what is needed to produce the problem. This can be faster for vast systems, where you think you already know the source of the problem. It is also useful if you cannot post the original code publicly, for legal or ethical reasons.
- Divide and conquer. When you have a small amount of code and/or models, but the source of the problem is entirely unclear, start removing code a bit at a time until the problem disappears – then add the last part back.


## Minimal and readable

Minimal does not mean terse – do not sacrifice communication for brevity. Use consistent naming and indentation, and include comments if needed to explain portions of the code. Most code editors have a shortcut for formatting code – find it, and use it.

## Complete

Make sure all information necessary to reproduce the problem is included:

Some people might be prepared to load the parts up, and actually try them to test the answer they are about to post.
The problem might not be in the part you suspect, but another part entirely.

## Verifiable

To help you solve your problem, others will need to verify that it exists:

Describe the problem. "It does not work" is not a problem statement. State what the expected behavior should be. Include the exact wording of the error message, and which line of code is producing it. Put a brief summary of the problem in the title of your question.

Eliminate any issues that are not relevant to the problem. If your question is not about a compiler error, ensure that there are no compile-time errors.

Ensure that the example actually reproduces the problem! If you inadvertently fixed the problem while composing the example, but did not test it again, you would want to know that before asking someone else for help.

## Upload the example

Upload your example to github.com. Or package your example project in a zip archive, but github is the preferred way. In your question, refer to your project in the github repo where you uploaded the example.
