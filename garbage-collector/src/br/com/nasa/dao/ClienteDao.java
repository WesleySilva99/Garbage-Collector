package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Cliente;
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

		String sql = "INSERT INTO cliente" + "(nome, login, email, dt_nasc, cpf,  senha, telefone)"
				+ "VALUES (?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getNomeUsuario());
			stmt.setString(3, cliente.getEmail());
			stmt.setDate(4, new java.sql.Date(cliente.getDataNascimento().getTime()));
			stmt.setString(5, cliente.getCpf());
			stmt.setString(6, cliente.getSenha());
			stmt.setString(7, cliente.getTelefone());

			stmt.execute();
			stmt.close();

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
				cliente.setId(rs.getInt("id"));
				cliente.setNome(rs.getString("nome"));
				cliente.setNomeUsuario(rs.getString("login"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setDataNascimento(rs.getDate("dt_nasc"));
				cliente.setTelefone(rs.getString("telefone"));
				cliente.setEmail(rs.getString("email"));

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

	public void alterar(Cliente cliente) {

		String sql = "UPDATE cliente SET nome = ?, cpf = ?, dt_nasc = ?, login = ?, senha = ?, telefone = ?, email=? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getCpf());
			stmt.setDate(3, new java.sql.Date(cliente.getDataNascimento().getTime()));
			stmt.setString(4, cliente.getNomeUsuario());
			stmt.setString(5, cliente.getSenha());
			stmt.setString(6, cliente.getTelefone());
			stmt.setString(7, cliente.getEmail());
			stmt.setInt(8, cliente.getId());
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Cliente pegarId(int id) {

		try {

			Cliente clienteCompleto = new Cliente();

			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM cliente WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				clienteCompleto.setId(rs.getInt("id"));
				clienteCompleto.setNome(rs.getString("nome"));
				clienteCompleto.setCpf(rs.getString("cpf"));
				clienteCompleto.setDataNascimento(rs.getDate("dt_nasc"));
				clienteCompleto.setNomeUsuario(rs.getString("login"));
				clienteCompleto.setSenha(rs.getString("senha"));
				clienteCompleto.setTelefone(rs.getString("telefone"));
				clienteCompleto.setEmail(rs.getString("email"));
			}

			rs.close();
			stmt.close();
			connection.close();

			return clienteCompleto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public boolean verificaLoginExistente(String login){
		boolean existe = true;
		String sql = "SELECT login FROM cliente WHERE login like ?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, "%" + login + "%");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				if ((rs.getString("login") == null)) {
					existe = false;
				} else {
					existe = true;
				}
			}
			rs.close();
			stmt.close();
			connection.close();
			return existe;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
