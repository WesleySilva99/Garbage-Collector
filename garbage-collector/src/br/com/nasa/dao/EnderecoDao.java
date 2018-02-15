package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Cliente;
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
			
		} catch (SQLException error) {
			throw new RuntimeException(error);
		}
		
	}
	
	public List<Endereco> listar() {
		try {
			List<Endereco> listaEndereco = new ArrayList<Endereco>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM endereco");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Endereco endereco = new Endereco();
				endereco.setId(rs.getInt("id"));
				endereco.setRua(rs.getString("rua"));
				endereco.setBairro(rs.getString("bairro"));
				endereco.setCep(rs.getString("cep"));
				endereco.setComplemento(rs.getString("complemento"));
				endereco.setNumero(rs.getString("numero"));

				listaEndereco.add(endereco);
			}
			stmt.execute();
			stmt.close();
			rs.close();
			connection.close();

			return listaEndereco;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
