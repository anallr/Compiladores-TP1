package br.edu.unoesc;

import java.io.IOException;
import java.io.StringReader;

public class TesteAnalisadorLexico {
	public static void main (String [] args) throws IOException{
		
		String expr = "huhu5";
		AnalisadorLexico lexico = new AnalisadorLexico (new StringReader(expr));
		lexico.yylex();
	}
}
