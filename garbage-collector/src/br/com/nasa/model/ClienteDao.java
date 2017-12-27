package br.com.nasa.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.util.ConnectionFactory;

public class ClienteDao {

	private Connection connection;

	public ClienteDao() {
		try {
			this.connection = (Connection) new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void Inserir(Cliente cliente) {

		String sql = "INSERT INTO cliente"
				+ "(nome, nome_usu, email, endereco, dataNascimento, cpf, cep, senha, telefone, complemento)"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getNomeUsuario());
			stmt.setString(3, cliente.getEmail());
			stmt.setString(4, cliente.getEndereco());
			stmt.setDate(5, new java.sql.Date(cliente.getDataNascimento().getTime()));
			stmt.setString(6, cliente.getCpf());
			stmt.setString(7, cliente.getCep());
			stmt.setString(8, cliente.getSenha());
			stmt.setString(9, cliente.getTelefone());
			stmt.setString(10, cliente.getComplemento());

			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public List<Cliente> listar() {
		try {
			List<Cliente> listaCliente = new ArrayList<Cliente>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM cliente ORDER BY nome");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setNome(rs.getString("nome"));
				cliente.setNomeUsuario(rs.getString("nome_usu"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setDataNascimento(rs.getDate("dataNascimento"));
				cliente.setCep(rs.getString("cep"));
				cliente.setEndereco(rs.getString("endereco"));
				cliente.setTelefone(rs.getString("telefone"));
				cliente.setEmail(rs.getString("email"));
				cliente.setComplemento(rs.getString("complemento"));
				listaCliente.add(cliente);

			}
			stmt.execute();
			stmt.close();
			rs.close();
			connection.close();

			return listaCliente;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
			
}
