// Analisador Léxico para a linguagem DO
import java_cup.runtime.Symbol;
%%
%cup
%class ExemploLexer
%line %column
%%
"do"            { return new Symbol(sym.DO); }
"out"           { return new Symbol(sym.OUT); }
"["             { return new Symbol(sym.COLCH_ESQ); }
"]"             { return new Symbol(sym.COLCH_DIR); }
";"             { return new Symbol(sym.PTVIRG); }
"="             { return new Symbol(sym.IGUAL); }
"<"             { return new Symbol(sym.MENOR); }
"++"            { return new Symbol(sym.MAIS_MAIS); }
"("             { return new Symbol(sym.PARENT_ESQ); }
")"             { return new Symbol(sym.PARENT_DIR); }
[a-zA-Z_][a-zA-Z0-9_]* { return new Symbol(sym.ID, yytext()); }
[0-9]+                { return new Symbol(sym.INTEIRO, Integer.valueOf(yytext())); }
[ \t\r\n]+            { /* Ignora */ }
.                     { System.err.println("Caractere inválido: " + yytext()); }