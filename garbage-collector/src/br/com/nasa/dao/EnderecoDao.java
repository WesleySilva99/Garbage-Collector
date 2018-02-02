package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Endereco;
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
		
		String sql = "insert into endereco(rua, cep, bairro, numero, complemento)"+
		"values (?,?,?,?,?)";
		

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, e.getRua());
			stmt.setString(2, e.getCep());
			stmt.setString(3, e.getBairro());
			stmt.setString(4, e.getNumero());
			stmt.setString(5, e.getComplemento());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException error) {
			throw new RuntimeException(error);
		}
		
	}

}
