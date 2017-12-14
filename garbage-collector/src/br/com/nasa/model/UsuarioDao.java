package br.com.nasa.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.nasa.util.ConnectionFactory;

public class UsuarioDao {
	
	private Connection connection;
	
	public UsuarioDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void Inserir(Usuario usuario) {
	
	String sql = "INSERT INTO usuario" + 
	"(nome, nome_usu, email, endereco, dataNascimento, cpf, cep, senha, telefone)" + 
	"VALUES (?,?,?,?,?,?,?,?,?)";
		
	try {
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		stmt.setString(1, usuario.getNome());
		stmt.setString(2, usuario.getNomeUsuario());
		stmt.setString(3, usuario.getEmail());
		stmt.setString(4, usuario.getEndereco());
		stmt.setDate(5, new java.sql.Date(usuario.getDataNascimento().getTime()));
		stmt.setString(6, usuario.getCpf());
		stmt.setString(7, usuario.getCep());
		stmt.setString(8, usuario.getSenha());
		stmt.setString(9, usuario.getTelefone());
		
		stmt.execute();
		stmt.close();
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
	

}
}
