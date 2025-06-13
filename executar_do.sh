#!/bin/bash
CP=".:jflex.jar:jcup.jar"
echo "--- COMPILANDO ANALISADOR DO ---"
java -cp "$CP" jflex.Main do.flex
java -cp "$CP" java_cup.Main -parser DoParser -symbols sym do.cup
javac -cp "$CP" *.java
echo "--- EXECUTANDO COM entrada_do.txt ---"
java -cp "$CP" DoParser entrada_do.txt