%%

%class HtmlLexer
%cup
%unicode

%{
  private Symbol sym(int type) {
    return new Symbol(type);
  }

  private Symbol sym(int type, Object value) {
    return new Symbol(type, value);
  }
%}

%%

"<"                     { return sym(sym.LT); }
"</"                    { return sym(sym.LTSLASH); }
">"                     { return sym(sym.GT); }
"/>"                    { return sym(sym.SLASHGT); }
"="                     { return sym(sym.EQ); }
\"[^\"]*\"              { return sym(sym.ATTRVAL, yytext().substring(1, yytext().length() - 1)); }
[a-zA-Z_:][a-zA-Z0-9_-]* { return sym(sym.ID, yytext()); }
[^<>\r\n\t\"=]+         { return sym(sym.TEXT, yytext()); }
[\r\n\t ]+              { /* ignora espaços */ }
.                       { System.err.println("Caractere inválido: " + yytext()); }
