#!/bin/bash
CP=".:jflex.jar:jcup.jar"
echo "--- COMPILANDO ANALISADOR HTML ---"
java -cp "$CP" jflex.Main html.flex
java -cp "$CP" java_cup.Main -parser HtmlParser -symbols sym html.cup
javac -cp "$CP" *.java
echo "--- EXECUTANDO COM entrada_html.txt ---"
java -cp "$CP" HtmlParser entrada_html.txt