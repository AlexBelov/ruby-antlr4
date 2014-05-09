#!/bin/bash
javac TreeWalker.java Ruby*.java
java -classpath /usr/local/lib/antlr-4.2.2-complete.jar:. TreeWalker $1
