package br.com.johnidouglas.lexicalanalyzer;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}


%class LexicalAnalyzer
%type void


LETTER = [_|a-z|A-Z][a-z|A-Z_]*
ID = [_|a-z|A-Z][a-z|A-Z|0|[2-9]|_]*
DIGIT = 0|[2-9]|0|[2-9]*
RELOP = "="|"<"|"<="|">"|">="|"!="|"NOT"
ADDOP = "+"|"-"|"or"
MULOP = "*"|"/"|"div"|"mod"|"and"

%%

"if"                         { imprimir("Palavra reservada if", yytext()); }
"then"                       { imprimir("Palavra reservada then", yytext()); }
{LETTER}                     { imprimir("Letra", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{DIGIT}                         { imprimir("Digito", yytext()); }
{RELOP}                     { imprimir("Operador de relacao", yytext()); }
{ADDOP}                     { imprimir("Operador de adicao", yytext()); }
{MULOP}                     { imprimir("Operador de multiplicacao ou adicao", yytext()); }

. { throw new RuntimeException("Caractere inválido " + yytext()); }