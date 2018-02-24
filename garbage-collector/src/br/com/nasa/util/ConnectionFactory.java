package br.com.nasa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	public Connection getConnection() throws SQLException {
		String nomeBanco = "gc";
		String usuario = "root";
<<<<<<< HEAD
		String senha = "";
=======
		String senha = "@luno1fpe";
>>>>>>> 8d2070d46e22ff5e1606cee235d064208f2042a6
	
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new SQLException(e);
		}
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/" + nomeBanco, usuario, senha);
	}
}
