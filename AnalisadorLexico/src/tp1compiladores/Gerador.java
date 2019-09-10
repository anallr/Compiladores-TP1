package tp1compiladores;
import java.io.File;

public class Gerador {
	public static void main (String [] args){
		String path = "/home/ana/workspace/AnalisadorLexico/src/tp1compiladores/";
		String arquivo = path + "MLM.lex";
		
		File file = new File(arquivo);
		jflex.Main.generate(file);
		
	}
}
