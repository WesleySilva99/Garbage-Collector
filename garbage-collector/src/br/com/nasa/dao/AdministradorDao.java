package br.com.nasa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import br.com.nasa.model.Administrador;

import br.com.nasa.util.ConnectionFactory;

public class AdministradorDao {

	private Connection connection;

	public AdministradorDao() {
		try {
			this.connection = (Connection) new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void Inserir(Administrador adm)  {


		String sql = "INSERT INTO administrador" + "(nome, login, email, telefone, senha)"
				+ "VALUES (?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, adm.getNome());
			stmt.setString(2, adm.getLogin());
			stmt.setString(3, adm.getEmail());
			stmt.setString(4, adm.getTelefone());
			stmt.setString(5, adm.getSenha());
			
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public List<Administrador> listar() {
		try {
			List<Administrador> listaAdm = new ArrayList<Administrador>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM administrador ORDER BY nome");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Administrador adm = new Administrador();
				adm.setId(rs.getInt("id"));
				adm.setNome(rs.getString("nome"));
				adm.setLogin(rs.getString("login"));
				adm.setTelefone(rs.getString("telefone"));
				adm.setEmail(rs.getString("email"));
				adm.setSenha(rs.getString("senha"));

				

				listaAdm.add(adm);
			}
			stmt.execute();
			stmt.close();
			rs.close();
			connection.close();

			return listaAdm;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	 private Administrador montarObjeto(ResultSet rs) throws SQLException {

		 Administrador adm = new Administrador();
		 	adm.setId(rs.getInt("id"));
		 	adm.setNome(rs.getString("nome"));
		 	adm.setLogin(rs.getString("login"));
			adm.setTelefone(rs.getString("telefone"));
			adm.setEmail(rs.getString("email"));
			adm.setSenha(rs.getString("senha"));
			
			return adm;
		    }

	public void alterar(Administrador adm) throws SQLException {
		
		
		String sql = "UPDATE administrador SET nome = ?, login = ?, telefone = ?, email=? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, adm.getNome());
			stmt.setString(2, adm.getLogin());
			stmt.setString(3, adm.getTelefone());
			stmt.setString(4, adm.getEmail());
			stmt.setInt(5, adm.getId());
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Administrador pegarId(int id) {

		try {

			Administrador admCompleto = new Administrador();

			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM administrador WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				admCompleto.setId(rs.getInt("id"));
				admCompleto.setNome(rs.getString("nome"));
				admCompleto.setLogin(rs.getString("login"));
				admCompleto.setTelefone(rs.getString("telefone"));
				admCompleto.setEmail(rs.getString("email"));
			
			}

			rs.close();
			stmt.close();
			connection.close();

			return admCompleto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	 public void remover(Administrador adm) {

			try {
			    PreparedStatement stmt = connection.prepareStatement("DELETE FROM administrador WHERE id = ?");
			    stmt.setLong(1, adm.getId());
			    stmt.execute();
			    stmt.close();
			    connection.close();
			} catch (SQLException e) {
			    throw new RuntimeException(e);
			}
		    }

	public boolean verificaLoginExistente(String login) {
		boolean existe = true;
		String sql = "SELECT login FROM administrador WHERE login = ?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, login);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				if ((rs.getString("login").equals(login))) {
					existe = false;
					break;
				} else {
					existe = true;
					break;
				}
			}
			rs.close();
			stmt.close();

			return existe;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean verificaEmailExistente(String email) {
		boolean existe = true;
		String sql = "SELECT email FROM administrador WHERE email = ?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				if ((rs.getString("email").equals(email))) {
					existe = false;
					break;
				} else {
					existe = true;
					break;
				}
			}
			rs.close();
			stmt.close();

			return existe;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public Administrador buscarPorId(Administrador adm) {

		try {

			Administrador admConsultado = null;
			PreparedStatement stmt = this.connection.prepareStatement("select * from administrador where login = ? and senha = ?");
			stmt.setString(1, adm.getLogin());
			stmt.setString(2, adm.getSenha());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				admConsultado = montarObjeto(rs);
			}

			rs.close();
			stmt.close();
			

			return admConsultado;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
}
