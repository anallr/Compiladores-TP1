package tipos;

import java.util.HashMap;

public class Tipo {

	public static final int CHAR = 1;
	public static final int INTEGER = 2;
	public static final int REAL = 3;
	public static final int BOOLEAN = 4;

	static HashMap<String, Tipo> tipos = new HashMap<String, Tipo>();

	int tag;
	int width = 0;
	String val;

	public Tipo(int tag, int width, String val) {
		this.tag = tag;
		this.width = width;
		this.val = val;
	}

	public int getWidth() {
		return width;
	}

	public int getTag() {
		return tag;
	}

	public String getVal() {
		return val;
	}

	public static void criaTipos() {
		tipos.put(INTEGER+"", new Tipo(INTEGER, 2, "integer"));
		tipos.put(REAL+"", new Tipo(REAL, 6, "real"));
		tipos.put(CHAR+"", new Tipo(CHAR, 1, "char"));
		tipos.put(BOOLEAN+"", new Tipo(BOOLEAN, 1, "boolean"));
		tipos.put(ERRO+"", new Tipo(ERRO, 0, "error"));
	}

	public static Tipo getTipo(int tag) {
		return tipos.get(""+tag);
	}

	public static Tipo getTipo(String val) {
		for(Tipo tipo : tipos.values()) {
			if(tipo.getVal().equals(val))
				return tipo;
		}
		return null;
	}
