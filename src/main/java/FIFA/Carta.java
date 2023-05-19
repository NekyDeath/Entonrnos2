package FIFA;

public class Carta {
	private String nombre;
	private int cod_jugador;
	private int rat;
	private String pos;
	private int precio;
	private int pac;
	private int sho;
	private int pas;
	private int dri;
	private int def;
	private int phy;
	private int pierna_mala;
	private int figranas;

	public Carta() {
		super();
	}

	public Carta(String nombre, int cod_jugador, int rat, String pos, int precio, int pac, int sho, int pas, int dri,
			int def, int phy, int pierna_mala, int figranas) {
		super();
		this.nombre = nombre;
		this.cod_jugador = cod_jugador;
		this.rat = rat;
		this.pos = pos;
		this.precio = precio;
		if (pac > 0 && pac < 99)
			this.pac = pac;
		if (sho > 0 && sho < 99)
			this.sho = sho;
		if (pas > 0 && pas < 99)
			this.pas = pas;
		if (dri > 0 && dri < 99)
			this.dri = dri;
		if (def > 0 && def < 99)
			this.def = def;
		if (phy > 0 && phy < 99)
			this.phy = phy;
		this.pierna_mala = pierna_mala;
		this.figranas = figranas;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getCod_jugador() {
		return cod_jugador;
	}

	public void setCod_jugador(int cod_jugador) {
		this.cod_jugador = cod_jugador;
	}

	public int getRat() {
		return rat;
	}

	public void setRat(int rat) {
		this.rat = rat;
	}

	public String getPos() {
		return pos;
	}

	public void setPos(String pos) {
		this.pos = pos;
	}

	public int getPrecio() {
		return precio;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}

	public int getPac() {
		return pac;
	}

	public void setPac(int pac) {
		if (pac > 0 && pac < 99)
			this.pac = pac;
	}

	public int getSho() {
		return sho;
	}

	public void setSho(int sho) {
		if (sho > 0 && sho < 99)
			this.sho = sho;
	}

	public int getPas() {
		return pas;
	}

	public void setPas(int pas) {
		if (pas > 0 && pas < 99)
			this.pas = pas;
	}

	public int getDri() {
		return dri;
	}

	public void setDri(int dri) {
		if (dri > 0 && dri < 99)
			this.dri = dri;
	}

	public int getDef() {
		return def;
	}

	public void setDef(int def) {
		if (def > 0 && def < 99)
			this.def = def;
	}

	public int getPhy() {
		return phy;
	}

	public void setPhy(int phy) {
		if (phy > 0 && phy < 99)
			this.phy = phy;
	}

	public int getPierna_mala() {
		return pierna_mala;
	}

	public void setPierna_mala(int pierna_mala) {
		this.pierna_mala = pierna_mala;
	}

	public int getFigranas() {
		return figranas;
	}

	public void setFigranas(int figranas) {
		this.figranas = figranas;
	}

}
