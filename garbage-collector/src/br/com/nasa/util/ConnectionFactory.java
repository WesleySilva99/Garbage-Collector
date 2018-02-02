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
>>>>>>> 87e170f4f5787d0d0947a59f48086e87bf7a7768
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new SQLException(e);
		}
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/" + nomeBanco, usuario, senha);
	}
}
