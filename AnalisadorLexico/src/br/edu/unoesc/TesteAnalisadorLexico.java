package br.edu.unoesc;

import java.io.IOException;
import java.io.StringReader;

public class TesteAnalisadorLexico {
	public static void main (String [] args) throws IOException{
		
		String expr = "integer a = 3 + 2;";
		AnalisadorLexico lexico = new AnalisadorLexico (new StringReader(expr));
		lexico.yylex();
	}
}
