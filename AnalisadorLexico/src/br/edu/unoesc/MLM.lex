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

/*definicoes regulares*/

delim = [ \t\n]
ws = {delim}+
letra = [A-Za-z]
digito = [0-9]
id = {letra} ({letra} : {digito})*
numero = {digito} + (\. {digito}+)? (E[+\-]? {digito}+)?
relop = ("="|"<"|"<="|">"|">="|"!="|NOT)
mulop = ("*"|"/"|div|mod|and)
addop = ("+"|"-"|or)
unsigned_int = {digito} {digito}*
sign = "+"|"-"|_
scale_factor = "E" {sign} {unsigned_int}
unsigned_real = {unsigned_int} (_|"." {digito}*)(_|{scale_factor})
integer_constant = {unsigned_int}
real_constant = {unsigned_real}
//char_constant = {"'" 

%%

if                         { imprimir("Palavra reservada if", yytext()); }
then                       { imprimir("Palavra reservada then", yytext()); }
{ws}                     {/* nenhuma acao e nenhum valor retornado */}
{relop}                         { imprimir("operador de relacao", yytext()); }
{mulop}                         { imprimir("operador de mult", yytext()); }
{addop}                         { imprimir("operador de adicao", yytext()); }
{unsigned_int}                         { imprimir("inteiro sem sinal", yytext()); }
{id}                         { imprimir("Identificador", yytext()); }

. { throw new RuntimeException("Caractere invalido \""+yytext() + "\" na linha "+yyline+", coluna "+yycolumn); }