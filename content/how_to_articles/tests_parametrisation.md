---
title: Test parametrisation
tags: [documentation]
keywords: documentation
sidebar: sidebar
permalink: /tests_parametrisation/
toc: false
---

Test parametrisation, or data-driven testing, is a design pattern which lets you split test step levels from the data used for these steps. 
It is a popular approach in test automation and provides the possibility to reuse/combine/change data for each test separately. 
It could be testing of login with different credentials, or iteration through boundary values and equivalent classes. 

Let us consider a <a download="LoginParametrized.graphml" href="/images/LoginParametrized.graphml">model</a> which has a login test part and a reference to another model with the rest of the functionality.

<a download="LoginParametrized.graphml" href="/images/LoginParametrized.graphml"><img src="/images/LoginParametrized.png" alt="LoginParametrized"></a>

The idea is:

1. Launch the application and set loginTested to false.
2. Iterate through Login-Logout until loginTested is true.  
3. Check that loginTested is true and go test other functionality.  

The model contains [guards](/yed_model_syntax/#guards---only-for-an-edge) [loginTested == true] and [loginTested == false] to keep the loop inside the Login-Logout steps.  
To exit the loop the loginTested variable needs to be set to true from your model implementation code after iteration through your test data.  
In the code below we take test data (3 strings), iterate through it while there are any variables, and set loginTested to true to let GraphWalker know that testing the login functionality has finished:

```java
@GraphWalker(value = "quick_random(edge_coverage(100))", start = "LaunchApplication")
public class LoginParametrizedImpl extends ExecutionContext implements LoginParametrized {

    List<String> logins;
    Iterator<String> loginIterator;

    @Override
    public void LaunchApplication() {
        logins = TestData.loginTestData();
        loginIterator = logins.iterator();
    }

    @Override
    public void Login() {
        System.out.println("Login with " + loginIterator.next());
        if (!loginIterator.hasNext()) {
            setAttribute("loginTested", true);
        }

    }

    @Override
    public void LogOut() {
    }

    @Override
    public void LoggedOut() {
    }

    @Override
    public void TheRestOfAppFunctionality() {

    }

    @Override
    public void ApplicationLaunched() {
    }

    @Override
    public void LoggedIn() {
    }

    @Override
    public void GoToAnotherTests() {
    }
}
```

This is the result:

```sh
o.g.c.m.ExecutionContext - Execute loginTested=false;
o.g.c.m.ExecutionContext - Execute LaunchApplication
o.g.c.m.ExecutionContext - Execute ApplicationLaunched
o.g.c.m.ExecutionContext - Execute Login
Login with Login1
o.g.c.m.ExecutionContext - Execute LoggedIn
o.g.c.m.ExecutionContext - Execute org.graphwalker.core.model.Guard@1f80f80  loginTested == false 
o.g.c.m.ExecutionContext - Execute org.graphwalker.core.model.Guard@1077bf0  loginTested == true 
o.g.c.m.ExecutionContext - Execute LogOut
o.g.c.m.ExecutionContext - Execute LoggedOut
o.g.c.m.ExecutionContext - Execute Login
Login with Login2
o.g.c.m.ExecutionContext - Execute LoggedIn
o.g.c.m.ExecutionContext - Execute org.graphwalker.core.model.Guard@1f80f80  loginTested == false 
o.g.c.m.ExecutionContext - Execute org.graphwalker.core.model.Guard@1077bf0  loginTested == true 
o.g.c.m.ExecutionContext - Execute LogOut
o.g.c.m.ExecutionContext - Execute LoggedOut
o.g.c.m.ExecutionContext - Execute Login
Login with Login3
o.g.c.m.ExecutionContext - Execute LoggedIn
o.g.c.m.ExecutionContext - Execute org.graphwalker.core.model.Guard@1f80f80  loginTested == false 
o.g.c.m.ExecutionContext - Execute org.graphwalker.core.model.Guard@1077bf0  loginTested == true 
o.g.c.m.ExecutionContext - Execute GoToAnotherTests
o.g.c.m.ExecutionContext - Execute TheRestOfAppFunctionality

```


