---
title: "docs"
bg: 'grey'
color: white
fa-icon: book
---

<div class="container">
    <div class="row">
        <div class="column halfx">
            <h3 class="text-gtnavy"><i class="fa fa-book text-grey"></i> Documentation</h3>
            <p>
                All documentation on how to use GraphWalker is on <a href="https://github.com/GraphWalker/graphwalker-project/wiki">GraphWalker's wiki pages</a>
            </p>
        </div>
        <div class="column halfx">
            <h3 class="text-gtnavy"><i class="fa fa-question-circle text-grey"></i> Get help from the forum</h3>
            <p>
                If you have questions to ask, we have a place for you <a href="https://groups.google.com/forum/#!forum/graphwalker">GraphWalker forum</a>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="column halfx">
            <h3 class="text-gtnavy"><i class="fa fa-plus-circle text-grey"></i> Create a model in Studio</h3>
            <p>
                <ul>
                    <li>Start the model editor<br>
                    <strong>java -jar graphwalker-studio-4.3.2.jar</strong><br>
                    then open <a href="http://localhost:9090/studio.html">http://localhost:9090/studio.html</a> in a web browser.</li>
                    <li>Create an empty model<br>
                    Click once on the <strong>+-button</strong>, and a model <strong>editor view</strong> will be opened.</li>
                    <li>Create a vertex<br>
                    On the <strong>editor view</strong> area, while pressing the keyboard key <strong>v</strong>, click the <strong>left mouse button</strong>.</li>
                    <li>Create an edge<br>
                    On the <strong>editor view</strong> area, while pressing the keyboard key <strong>e</strong>
                        <ul>
                            <li>Click and hold the <strong>left mouse button</strong> on the first vertex.</li>
                            <li>Drag the mouse cursor to the second vertex and release the left mouse button over that vertex.</li>
                        </ul>
                    </li>
                    <li>Set the start element<br> 
                        <ul>
                            <li>Open the side bar</li>
                            <li>Click on any element (vertex or edge), and on the side bar, tick the check box <strong>Start element</strong>.</li>
                        </ul>
                    </li>
                    <li>Save the model<br>
                    Click the <strong>Save button</strong> on the left side side.</li>
                </ul>
            </p>
        </div>
        <div class="column halfx">
            <h3 class="text-gtnavy"><i class="fa fa-plus-circle text-grey"></i> Create GraphWalker maven project</h3>
            <p>
{% highlight text%}
mvn archetype:generate -B \
-DarchetypeGroupId=org.graphwalker \
-DarchetypeArtifactId=graphwalker-maven-archetype \
-DgroupId=com.company -DartifactId=myProject \
-DarchetypeVersion=LATEST
{% endhighlight %}

{% highlight text%}
cd myProject
{% endhighlight %}

{% highlight text%}
mvn compile exec:java -Dexec.mainClass="com.company.Runner"
{% endhighlight %}
            </p>
        </div>
        <div class="column halfx">
            <h3 class="text-gtnavy"><i class="fa fa-plus-circle text-grey"></i> Add GraphWalker to your maven project</h3>
            <p>
                Add following dependency to your project.
{% highlight text%}
<dependency>
   <groupId>org.graphwalker</groupId>
   <artifactId>graphwalker-core</artifactId>
   <version>4.3.2</version>
</dependency>
{% endhighlight %}
            </p>
        </div>
    </div>
</div>

