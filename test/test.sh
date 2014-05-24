#!/bin/bash
javac TestEvaluator.java Expr*.java
java -classpath /usr/local/lib/antlr-4.2.2-complete.jar:. TestEvaluator $1
