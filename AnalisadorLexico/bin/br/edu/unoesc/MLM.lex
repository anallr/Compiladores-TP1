package br.edu.unoesc;
import java_cup.runtime.*;

%%

%{

private void imprimir(String descricao, String lexema) {
	System.out.println(lexema + " -" + descricao);}
%}

%public
%class AnalisadorLexico
%type void

RELOP = ("="|"<"|"<="|">"|">="|"!="|"NOT")
MULOP = ("*"|"/"|"div"|"mod"|"and")
ADDOP = ("+"|"-"|"or")
LETTER = [_|a-z|A-Z][a-z|A-Z_]*
ID = [a-z|A-Z][a-z|A-Z|0|[2-9]]*
DIGIT = 0|[2-9]|0|[2-9]*
UNSIGNED_INTEGER = 0|[2-9]|0|[2-9]*
SIGN = "+"|"-"|_
INTEGER_CONSTANT = 0|[2-9]|0|[2-9]*

%%

"if"                         { imprimir("Palavra reservada if", yytext()); }
"then"                       { imprimir("Palavra reservada then", yytext()); }
{LETTER}                     { imprimir("Letra", yytext()); }
{ID}                         { imprimir("Identificador", yytext()); }
{DIGIT}                      { imprimir("Digito", yytext()); }
{RELOP}                     { imprimir("Operador de relacao", yytext()); }
{ADDOP}                     { imprimir("Operador de adicao", yytext()); }
{MULOP}                     { imprimir("Operador de multiplicacao ou divisao", yytext()); }

. { throw new RuntimeException("Caractere invalido \""+yytext() + "\" na linha "+yyline+", coluna "+yycolumn); }