#!/bin/bash
java -jar /usr/local/lib/antlr-4.2.2-complete.jar Expr.g4
javac Expr*.java
java -classpath /usr/local/lib/antlr-4.2.2-complete.jar:. org.antlr.v4.runtime.misc.TestRig Expr s -gui $1
