package FIFA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BDController {
	private Connection conexion;

	public Connection getConexion() {
		return conexion;
	}

	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}

	public BDController() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			this.conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/fifa23", "root", "");
		} catch (Exception e) {
			System.out.println("Error in BDControler constructor: " + e);
		}
	}
	
	// como estan los maquinas lo primero de todo
	public ArrayList<Jugador> noSeQuePoner() {
		ArrayList<Jugador> jugadores = new ArrayList<>();
		String sql = "SELECT * FROM jugadores";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			while (rs.next()) {
				Jugador newJugador = new Jugador(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getInt(5), rs.getString(6));
				jugadores.add(newJugador);
			}
		} catch (Exception e) {
			System.out.println("Error en todosJugadores: " + e);
		}

		return jugadores;
	}
	
	public ArrayList<Jugador> todosJugadores() {
		ArrayList<Jugador> jugadores = new ArrayList<>();
		String sql = "SELECT * FROM jugadores";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			while (rs.next()) {
				Jugador newJugador = new Jugador(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getInt(5), rs.getString(6));
				jugadores.add(newJugador);
			}
		} catch (Exception e) {
			System.out.println("Error en todosJugadores: " + e);
		}

		return jugadores;
	}

	public ArrayList<Equipo> todosEquipos() {
		ArrayList<Equipo> equipos = new ArrayList<>();
		String sql = "SELECT * FROM equipos";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			while (rs.next()) {
				Equipo newJugador = new Equipo(rs.getInt(1), rs.getString(2), rs.getInt(3));
				equipos.add(newJugador);
			}
		} catch (Exception e) {
			System.out.println("Error en todosEquipos: " + e);
		}

		return equipos;
	}

	public ArrayList<Carta> todasCartas() {
		ArrayList<Carta> cartas = new ArrayList<>();
		String sql = "SELECT * FROM cartas";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			while (rs.next()) {
				Carta newCarta = new Carta(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11),
						rs.getInt(12), rs.getInt(13));
				cartas.add(newCarta);
			}
		} catch (Exception e) {
			System.out.println("Error en todasCartas: " + e);
		}

		return cartas;
	}

	public ArrayList<Liga> todasLigas() {
		ArrayList<Liga> ligas = new ArrayList<>();
		String sql = "SELECT * FROM ligas";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			while (rs.next()) {
				Liga newLiga = new Liga(rs.getInt(1), rs.getString(2), rs.getString(3));
				ligas.add(newLiga);
			}
		} catch (Exception e) {
			System.out.println("Error en todasLigas: " + e);
		}

		return ligas;
	}

	public Liga dameLiga(int cod_liga) {
		Liga liga = null;
		String sql = "SELECT * FROM ligas where cod_liga='" + cod_liga + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			rs.next();
			liga = new Liga(rs.getInt(1), rs.getString(2), rs.getString(3));

		} catch (Exception e) {
			System.out.println("Error en dameLiga: " + e);
		}
		return liga;
	}

	public Equipo dameEquipo(int cod_equipo) {
		Equipo equipo = null;
		String sql = "SELECT * FROM equipos where cod_equipo='" + cod_equipo + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			rs.next();
			equipo = new Equipo(rs.getInt(1), rs.getString(2), rs.getInt(3));

		} catch (Exception e) {
			System.out.println("Error en dameEquipo: " + e);
		}
		return equipo;
	}

	public Jugador dameJugador(int cod_jugador) {
		Jugador equipo = null;
		String sql = "SELECT * FROM jugadores where cod_jugador='" + cod_jugador + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			rs.next();
			equipo =  new Jugador(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
				rs.getInt(5), rs.getString(6));
			rs.close();
		} catch (Exception e) {
			System.out.println("Error en dameJugador: " + e);
		}
		return equipo;
	}

	public Carta dameCarta(String nombre, int cod_jugador) {
		Carta carta = null;
		String sql = "SELECT * FROM cartas where cod_jugador='" + cod_jugador + "' and nombre='" + nombre + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			rs.next();
			carta = new Carta(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6),
					rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12),
					rs.getInt(13));
			rs.close();
		} catch (Exception e) {
			System.out.println("Error en dameCarta: " + e);
		}
		return carta;
	}

	public boolean existeCarta(String nombre, int cod_jugador) {
		boolean result = false;
		String sql = "SELECT * FROM cartas where cod_jugador='" + cod_jugador + "' and nombre='" + nombre + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			if (rs.next())
				result = true;
			rs.close();
		} catch (Exception e) {
			System.out.println("Error en existeCarta: " + e);
		}
		return result;
	}
	
	public boolean existeEquipo(int cod_equipo) {
		boolean result = false;
		String sql = "SELECT * FROM equipos where cod_equipo='" + cod_equipo + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			if (rs.next())
				result = true;
			rs.close();
		} catch (Exception e) {
			System.out.println("Error en existeCarta: " + e);
		}
		return result;
	}
	
	public boolean existeLiga(int cod_liga) {
		boolean result = false;
		String sql = "SELECT * FROM ligas where cod_liga='" + cod_liga + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			if (rs.next())
				result = true;
			rs.close();
		} catch (Exception e) {
			System.out.println("Error en existeCarta: " + e);
		}
		return result;
	}
	
	public boolean existeJugador(int cod_jugador) {
		boolean result = false;
		String sql = "SELECT * FROM jugadores where cod_jugador='" + cod_jugador + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			if (rs.next())
				result = true;
			rs.close();
		} catch (Exception e) {
			System.out.println("Error en existeCarta: " + e);
		}
		return result;
	}
	
	public Liga dameLigaFromEquipo(int cod_equipo) {
		Liga liga = null;
		String sql = "SELECT * FROM ligas where cod_liga=(select cod_liga from equipos where cod_equipo ='"+cod_equipo+"')";
		try {
			Statement myStatement = this.conexion.createStatement();
			ResultSet rs = myStatement.executeQuery(sql);
			rs.next();
			liga = new Liga(rs.getInt(1), rs.getString(2), rs.getString(3));
			rs.close();
		} catch (Exception e) {
			System.out.println("Error en dameLigaFromEquipo: " + e);
		}
		return liga;
	}
	
	public String dameColor(int valor){
		String returnValue = "";
		if (valor <= 49)
			returnValue = "background: #F34438; color: white;";
		else if (valor <= 59)
			returnValue = "background: #FA8A00; color: white;";
		else if (valor <= 69)
			returnValue = "background: #E8BA13; color: white;";
		else if (valor <= 89)
			returnValue = "background: #4DAD50; color: white;";
		else if (valor <= 99)
			returnValue = "background: darkgreen; color: white;";
		return returnValue;
	}
	
	public void new_jugador(Jugador j) {
		String sql = "Insert into jugadores values ('"+j.getCod_jugador()+"', '"+j.getNombre()+"', '"+j.getCod_equipo()+"', '"+j.getPierna()+"', '"+j.getAltura()+"', '"+j.getPais()+"')";
		try {
			Statement myStatement = this.conexion.createStatement();
			System.out.println(sql);
			myStatement.executeUpdate(sql);
			return;
		} catch (Exception e) {
			System.out.println("Error en new_jugador: " + e);
		}
	}
	
	public void new_liga(Liga l) {
		String sql = "Insert into ligas values ('"+l.getCod_liga()+"', '"+l.getNombre()+"', '"+l.getPais()+"')";
		try {
			Statement myStatement = this.conexion.createStatement();
			System.out.println(sql);
			myStatement.executeUpdate(sql);
			return;
		} catch (Exception e) {
			System.out.println("Error en new_liga: " + e);
		}
	}
	
	public void new_equipo(Equipo e) {
		String sql = "Insert into equipos values ('"+e.getCod_eqipo()+"', '"+e.getNombre()+"', '"+e.getCod_liga()+"')";
		try {
			Statement myStatement = this.conexion.createStatement();
			System.out.println(sql);
			myStatement.executeUpdate(sql);
			return;
		} catch (Exception a) {
			System.out.println("Error en new_liga: " + a);
		}
	}
	
	public void deleteJugador(int cod_jugador) {
		String sql = "DELETE FROM jugadores WHERE cod_jugador='" + cod_jugador + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			myStatement.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Error en deleteJugador: " + e);
		}
	}
	
	public void deleteEquipo(int cod_equipo) {
		String sql = "DELETE FROM equipos WHERE cod_equipo='" + cod_equipo + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			myStatement.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Error en deleteJugador: " + e);
		}
	}
	
	public void deleteLiga(int cod_liga) {
		String sql = "DELETE FROM ligas WHERE cod_liga='" + cod_liga + "'";
		try {
			Statement myStatement = this.conexion.createStatement();
			myStatement.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Error en deleteJugador: " + e);
		}
	}
	
	public void modJugador(Jugador j) {
		String sql = "update jugadores set nombre='"+j.getNombre()+"', "
				+ "cod_equipo='"+j.getCod_equipo()+"', "
				+ "pierna='"+j.getPierna()+"', "
				+ "altura='"+j.getAltura()+"', "
				+ "pais='"+j.getPais()+"' "
				+ "where cod_jugador='"+j.getCod_jugador()+"'";
		System.out.println(sql);
		try {
			Statement myStatement = this.conexion.createStatement();
			myStatement.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Error en modJugador: " + e);
		}
	}
	
	public void modEquipo(Equipo e) {
		String sql = "update jugadores set nombre='"+e.getNombre()+"', "
				+ "cod_liga='"+e.getCod_liga()+"' "
				+ "where cod_jugador='"+e.getCod_eqipo()+"'";
		System.out.println(sql);
		try {
			Statement myStatement = this.conexion.createStatement();
			myStatement.executeUpdate(sql);
		} catch (Exception j) {
			System.out.println("Error en modEquipo: " + j);
		}
	}
}