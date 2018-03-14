package br.com.nasa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	public Connection getConnection() throws SQLException {
		String nomeBanco = "gc";
		String usuario = "root";
<<<<<<< HEAD
		String senha = "34815231";
=======
		String senha = "";
>>>>>>> d28250ac0fe8cc1f5e15571d9c334b335c48d011

	
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new SQLException(e);
		}
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/" + nomeBanco, usuario, senha);
	}
}
