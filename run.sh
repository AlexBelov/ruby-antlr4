#!/bin/bash
source ~/.rvm/scripts/rvm 1>/dev/null
rvm use 2.0.0@pushkin-contest 1>/dev/null
ruby preproc.rb
java -jar /usr/local/lib/antlr-4.2.2-complete.jar Ruby.g4
javac Ruby*.java
java -classpath /usr/local/lib/antlr-4.2.2-complete.jar:. org.antlr.v4.runtime.misc.TestRig Ruby prog -gui $1
