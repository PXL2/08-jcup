#!/bin/bash

# Define o Classpath para o Java encontrar os JARs
CP=".:jflex.jar:jcup.jar"

echo ">> PASSO 1: LIMPANDO arquivos antigos..."
# Remove todos os arquivos .java e .class para garantir um ambiente limpo
rm -f *.java *.class

echo ">> PASSO 2: GERANDO ExemploLexer.java..."
java -cp "$CP" jflex.Main exemplo.flex

echo ">> PASSO 3: GERANDO parser.java e sym.java..."
# O JCup vai gerar 'parser.java' por padrão
java -cp "$CP" java_cup.Main exemplo.cup

echo ">> PASSO 4: COMPILANDO apenas os 3 arquivos necessários..."
# Compilamos 'parser.java' (o nome padrão)
javac -cp "$CP" parser.java ExemploLexer.java sym.java

echo ">> PASSO 5: EXECUTANDO..."
# Executamos a classe 'parser'
java -cp "$CP" parser entrada.txt