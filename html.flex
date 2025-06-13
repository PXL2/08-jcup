// NOME DO ARQUIVO: html.flex
import java_cup.runtime.Symbol;
%%
%cup
%class HtmlLexer
%line %column
%%
// Símbolos e Componentes do HTML
"<"             { return new Symbol(sym.ABRE); }
">"             { return new Symbol(sym.FECHA); }
"</"            { return new Symbol(sym.FECHA_ABRE); }
"/>"            { return new Symbol(sym.AUTO_FECHA); }
"="             { return new Symbol(sym.IGUAL); }
[a-zA-Z0-9]+    { return new Symbol(sym.ID, yytext()); }
\"[^\"]*\"      { return new Symbol(sym.STRING, yytext().substring(1, yytext().length() - 1)); }
[^<>]+          { return new Symbol(sym.TEXTO, yytext().trim()); }
[ \t\r\n]+      { /* Ignora */ }
.               { System.err.println("Caractere inválido no HTML: " + yytext()); }