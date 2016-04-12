---
title: What is a FSM and a EFSM?
keywords: fsm, efsm, finit state machine
toc: false
---



GraphWalker uses 2 different state machines. The **finite** and the **extended finte state machine**.
The difference is that the EFSM has the capabilities to add "if-statements" for the edges.

## FSM - Finite State Machine
If you can design your test using FSM only, we strongly  encourage you to do so. The models will be much simpler to understand, thus easier to maintain.

## EFSM - Extended Finite State Machine
An EFSM adds data to the models. The purpose of the data in the model, are to be used by "if-statements" for the edges. The "if-statement", is a conditional expression evaluated, and connected top a specific edge.
This mechanism will open or close edges pending on how data is evaluated in the "if-statement". If the conditional expression is evaluated to false, the edge can not be traversed.
