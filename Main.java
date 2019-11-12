import java.io.*;
import java.nio.file.*;
import java.util.Scanner;
import java_cup.runtime.Symbol;


public class Main {

    public static void main(String[] args) {

        String codigo = "success.mlm";
        Symbol parse_tree = null;
        try {
            parser p = new parser(new AnalisadorLexico(new FileReader(codigo)));
            parse_tree = p.debug_parse();
            System.out.println(parse_tree);
            System.out.println("Sucesso");
        } catch (Exception e) {
            e.printStackTrace();
        }

        String codigo2 = "error.mlm";

        try {
            Parser p = new Parser(new AnalisadorLexico(new FileReader(codigo2)));
            parse_tree = p.debug_parse();
            System.out.println(parse_tree);
            System.out.println("Sucesso");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
