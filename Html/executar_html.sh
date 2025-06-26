#!/bin/bash

# Limpeza
rm -f HtmlLexer.java HtmlParser.java sym.java *.class

# Geração do analisador léxico
java -jar jflex.jar html.flex

# Geração do analisador sintático
java -jar jcup.jar -parser HtmlParser -symbols sym html.cup

# Compilação com classpath correto
javac -cp .:jflex.jar:jcup.jar *.java

# Execução com classpath completo
java -cp .:jflex.jar:jcup.jar HtmlParser < entrada.html