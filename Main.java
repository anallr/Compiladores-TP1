import java.io.FileReader;
import java.nio.file.Paths;

public class Main {

    public static void main(String[] args) {

        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/";

        String codigo = "teste.pascal";


        try {
            Parser p = new Parser(new AnalisadorLexico(new FileReader(codigo)));
            Object result = p.parse().value;

            System.out.println("Sucesso");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
