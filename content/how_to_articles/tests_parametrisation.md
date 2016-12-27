---
title: Tests parametrisation
tags: [example]
keywords: example
sidebar: sidebar
permalink: /tests_parametrisation/
toc: false
---

Tests parametrisation or data-driven testing is a design pattern which let you split test steps level from the data which you use for this steps. 
That is a quite popular approach in test automation and provide possibility to reuse/combine/change data for each test separately. 
It would be testing of login with different credentials, or iteration through boundary values and equivalent classes. 

Let's consider a <a download="LoginParametrized.graphml" href="/images/LoginParametrized.graphml">model</a> below which has a login test part and a reference on another model with the rest of functionality.

<a download="LoginParametrized.graphml" href="/images/LoginParametrized.graphml"><img src="/images/LoginParametrized.png" alt="LoginParametrized"></a>

The idea is the next:

1. Launch the application and set loginTested into false  
2. Iterate through Login-Logout until loginTested is not true  
3. Realise that loginTested is in true and go to test another functionality  

The model contain [guards](/yed_model_syntax/#guards---only-for-an-edge) \[loginTested == true] and \[loginTested == false] to keep loop inside Login-Logout steps.  
For exit from the loop you need to set loginTested variable into true from your model implementation code after end of iteration through your test data.  
In the code below we take a test data (3 strings), iterate through it while there is any variables and set loginTested into true to let GW know that we have finished with the login functionality:

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

As result you receive the next after execution:

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


