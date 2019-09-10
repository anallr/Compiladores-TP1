package br.edu.unoesc;
import java.io.File;

public class Gerador {
	public static void main (String [] args){
		String path = "/home/ana/workspace/AnalisadorLexico/src/br/edu/unoesc/";
		String arquivo = path + "MLM.lex";
		
		File file = new File(arquivo);
		jflex.Main.generate(file);
		
	}
}
