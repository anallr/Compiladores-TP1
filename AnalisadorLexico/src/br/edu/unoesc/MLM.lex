/*codigo do usuario*/
package br.edu.unoesc;
import java_cup.runtime.*;

%%
/*diretivas JLex*/
%{

private void imprimir(String descricao, String lexema) {
	System.out.println(lexema + " -" + descricao);}
%}

%public
%class AnalisadorLexico
%type void

/*expressoes regulares*/

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
boolean_constant = false | true
constant = {integer_constant} | {real_constant} | {char_constant} | {boolean_constant}
factor = {id} | {constant} | ("(" {expr} ")") | (NOT {factor})
factor_a = "-" {factor} | {factor}
term = {factor_a} | ({term} {mulop} {factor_a})
simple_expr = {term} | ({simple_expr} {addop} {term})
expr = {simple_expr} | ({simple_expr} {relop} {simple_expr})
expr_list = {expr} | ({expr_list} " ," {expr})
write_stmt = write "(" {expr_list} ")"
read_stmt = read "(" {ident_list} ")"
stmt_suffix = until {cond} | end
stmt_prefix = while {cond} | _
loop_stmt = {stmt_prefix} do {stmt_list} {stmt_suffix}
cond = {expr}
if_stmt = (if {cond} then {stmt}) | else {stmt}
assign_stmt = {id} ":=" {expr}
stmt = {assign_stmt} | {if_stmt} | {loop_stmt} | {read_stmt} | {write_stmt} | {compound_stmt}
stmt_list = ({stmt_list} ";" {stmt}) | {stmt}
compound_stmt = begin {stmt_list} end
type = integer | real | boolean | char
ident_list = {ident_list} " ," {id}
decl = {ident_list} ":" {type}
decl_list = ({decl_list} " ;" {decl}) | {decl}
program = program {id} ";" {decl_list} {compound_stmt}

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