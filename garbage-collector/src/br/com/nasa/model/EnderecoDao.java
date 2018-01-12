package br.com.nasa.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.util.ConnectionFactory;

public class EnderecoDao {
	
	private Connection connection;

	public EnderecoDao() {
		try {
			this.connection = (Connection) new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void inserir(Endereco e){
		
		String sql = "insert into endereco(rua, cep, bairro, numero, complemento, ponto_referencia)"+
		"values (?,?,?,?,?,?)";
		

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, e.getRua());
			stmt.setString(2, e.getCep());
			stmt.setString(3, e.getBairro());
			stmt.setString(5, e.getNumero());
			stmt.setString(6, e.getComplemento());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException error) {
			throw new RuntimeException(error);
		}
		
	}

}
