package FIFA;

public class Liga {
	private int cod_liga;
	private String nombre;
	private String pais;

	public Liga(int cod_liga, String nombre, String pais) {
		super();
		this.cod_liga = cod_liga;
		this.nombre = nombre;
		this.pais = pais;
	}

	public Liga() {
		super();
	}

	public int getCod_liga() {
		return cod_liga;
	}

	public void setCod_liga(int cod_liga) {
		this.cod_liga = cod_liga;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

}
