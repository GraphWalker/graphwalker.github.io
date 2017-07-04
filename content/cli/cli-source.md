---
title: CLI - source
tags: [cli]
keywords: cli, documentation, command line, syntax, source
sidebar: sidebar
permalink: /cli-source/
toc: false
---


## source

Will generate source code using the provided model and a template.

Options

* `--input`, `-i`<br>
This command requires an input model file, and an input template.

* `--blocked`, `-b`<br>
This option enables or disables the [BLOCKED](/yed_model_syntax#keywords) feature. When "-b true" GraphWalker will filter out elements in models with the keyword BLOCKED. When "-b false" GraphWalker will not filter out any elements in models with the keyword BLOCKED. Default: true

## Examples

Generate python source code for the Login.graphml model,

```
java -jar graphwalker-3.4.2-jar source -i Login.graphml python.template
```

* [Login.graphml](https://raw.githubusercontent.com/GraphWalker/graphwalker-project/b604d282087db9776ebf9c4887a1224dcb642567/graphwalker-cli/src/test/resources/graphml/shared_state/Login.graphml)
* [python.template](https://raw.githubusercontent.com/GraphWalker/graphwalker-project/5190b5af119cf9e29fb6a6a610b451bc7ea77d03/graphwalker-cli/src/test/resources/template/python.template)


## Template file

The template file can use following parameters, they will be substituted during the
source generation.

* The **HEADER** section. It will only be replaced once.<br>

```
HEADER<{{"{{"}}
Any code  or comments you would like to be first onyour source here.
{{"}}}}>HEADER
```

* All code between the **HEADER** and the **FOOTER** sections are repeated with the same number
  of unique methods in the model.  The parameter used here is the **LABEL**.
  The **LABEL** will be replace with the method name.<br>

```
{LABEL}
```

* The **FOOTER** section. It will only be replaced once.<br>

```
FOOTER<{{"{{"}}
Any code  or comments you need in the end of your source code.
{{"}}}}>FOOTER
```

## Example of templates

A python template

```python
HEADER<{{"{{"}}
import requests,json
##
## 1) Generate python stub source code:
##    java -jar graphwalker-3.4.2-jar source -i model.graphml python.template > model.py
##
## 2) Start graphwalker:
##    java -jar graphwalker-3.4.2.jar online --service RESTFUL -m model.graphml "random(edge_coverage(100))"
##
## 3) Run the per program:
##    python model.py
##
{{"}}}}>HEADER

def {LABEL}() :
    print( "{LABEL}" )
    return

FOOTER<{{"{{"}}
gw_url = 'http://localhost:8887/graphwalker'

while requests.get(gw_url+'/hasNext').json()['hasNext'] == 'true' :
    # Get next step from GraphWalker
    step = requests.get(gw_url+'/getNext').json()['currentElementName']
    if step != '' :
        eval( step + "()" )
{{"}}}}>FOOTER
```


A perl template

```perl
HEADER<{{"{{"}}
use strict;
use warnings;

##
## 1) Generate perl stub source code:
##    java -jar graphwalker-3.4.2.jar source -i model.graphml perl.template > model.perl
##
## 2) Start graphwalker:
##    java -jar graphwalker-3.4.2.jar online -s RESTFUL -m model.graphml "random(edge_coverage(100))"
##
## 3) Run the per program:
##    perl login.perl http://localhost:8887/graphwalker
##

use LWP::Simple;

my $host = $ARGV[0];

while ( get $host."/hasNext" eq "true"){
  # Get next step from GraphWalker
  my $step = get $host."/getNext";
  if ($step ne '') {
    # Run the step
    eval( $step ) or die;
  }
}
{{"}}}}>HEADER
#
# This sub routine implements: '{LABEL}'
#
sub {LABEL}()
{
  print "{LABEL}\n";
}
FOOTER<{{"{{"}}
#End of generated source code
{{"}}}}>FOOTER
```
