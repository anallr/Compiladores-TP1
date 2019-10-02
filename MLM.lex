/*codigo do usuario*/
import java_cup.runtime.Symbol;

%%
/*diretivas JLex*/

%cup
%public
%class AnalisadorLexico
%line
%column


/*expressoes regulares*/

letra = [A-Za-z]
digito = 0 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
identifier = {letra} ({letra} : {digito})*
numero = {digito} + (\. {digito}+)? (E[+\-]? {digito}+)?
relop = ("="|"<"|"<="|">"|">="|"!="|NOT)
mulop = ("*"|"/"|div|mod|and)
addop = ("+"|"-"|or)
sign = "+"|"-"|_
unsigned_int = {digito} {digito}*
scale_factor = E {sign} {unsigned_int}
unsigned_real = {unsigned_int} (_|"." {digito}*)(_|{scale_factor})
integer_constant = {unsigned_int}
real_constant = {unsigned_real}
char_constant = "'" [\x00-\x7F] "'"

%%


<YYINITIAL> {
	"program" 						{return new Symbol(Sym.PROGRAM); }
	"if"            			{return new Symbol(Sym.IF); }
	"else"          			{return new Symbol(Sym.ELSE); }
	"then"          			{return new Symbol(Sym.THEN); }

	"read"								{return new Symbol(Sym.READ);}
	"write"								{return new Symbol(Sym.WRITE);}

	{addop}         			{ return new Symbol(Sym.THEN); }
	{relop}         			{ return new Symbol(Sym.RELOP); }
	{mulop}         			{ return new Symbol(Sym.MULOP); }

	";"										{return new Symbol(Sym.SEMI); }
	":"             			{return new Symbol(Sym.COLON); }
	","										{return new Symbol(Sym.COMMA); }
	"("             			{return new Symbol(Sym.LEFT); }
	")"             			{return new Symbol(Sym.RIGHT); }
	"-"										{return new Symbol(Sym.MINUS); }
	"="										{return new Symbol(Sym.ASSIGN); }

	"while"								{return new Symbol(Sym.WHILE); }
	"do"									{return new Symbol(Sym.DO); }
	"until"								{return new Symbol(Sym.UNTIL); }

	"true"								{return new Symbol(Sym.TRUE); }
	"false"								{return new Symbol(Sym.FALSE); }

	"begin"								{return new Symbol(Sym.BEGIN); }
	"end"									{return new Symbol(Sym.END); }

	{letra}         			{return new Symbol(Sym.CHAR); }
	"boolean"							{return new Symbol(Sym.BOOLEAN); }
	"inteiro"							{return new Symbol(Sym.INTEGER); }
	"real"								{return new Symbol(Sym.REAL); }

	{integer_constant}		{return new Symbol(Sym.INTEGER_CONSTANT); }
	{real_constant}				{return new Symbol(Sym.REAL_CONSTANT); }
	{char_constant}				{return new Symbol(Sym.CHAR_CONSTANT); }
	{identifier}					{return new Symbol(Sym.IDENTIFIER); }


}
<<EOF>>					{return new Symbol(Sym.EOF); }

. { throw new RuntimeException("Caractere invalido \""+yytext() + "\" na linha "+yyline+", coluna "+yycolumn); }
