package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Administrador;
import br.com.nasa.model.TipoUsuario;
import br.com.nasa.model.Usuario;
import br.com.nasa.util.ConnectionFactory;

public class UsuarioDao {

	private Connection connection;

	public UsuarioDao() {
		try {
			this.connection = (Connection) new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public boolean verificaLoginExistente(String login) {
		boolean existe = true;
		String sql = "SELECT login FROM usuario WHERE login = ?";

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
	
	public void inseriUsuario(Usuario usuario, int idUser, TipoUsuario tpUser) {
		
		String sqlUser = "INSERT INTO usuario (id_usuario, login, senha, tipo_usuario) VALUES (?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sqlUser);

			stmt.setInt(1, idUser);
			stmt.setString(2, usuario.getLogin());
			stmt.setString(3, usuario.getSenha());
			stmt.setString(4, tpUser.toString());
			
			
			stmt.execute();
			stmt.close();

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}

	public Usuario buscarPorId(Usuario usuario) {

		try {

			Usuario usuarioConsultado = null;
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from usuario where id_usuario = ? and tipo_usuario = ?");
			stmt.setInt(1, usuario.getIdUsuario());

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				usuarioConsultado = montarObjeto(rs);
			}

			rs.close();
			stmt.close();

			return usuarioConsultado;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	private Usuario montarObjeto(ResultSet rs) throws SQLException {

		Usuario usuario = new Usuario();
		usuario.setIdUsuario(rs.getInt("id_usuario"));
		usuario.setLogin(rs.getString("login"));
		usuario.setSenha(rs.getString("senha"));
		usuario.setTpUsuario(TipoUsuario.valueOf(rs.getString("tipo_usuario")));

		return usuario;
	}

	public Usuario buscarLogin(Usuario usuario) throws SQLException {

		UsuarioDao dao = new UsuarioDao();
		String sql = "SELECT * FROM usuario WHERE login = ? AND senha = ?";
		PreparedStatement stmt = this.connection.prepareStatement(sql);
		stmt.setString(1, usuario.getLogin());
		stmt.setString(2, usuario.getSenha());
		ResultSet rs = stmt.executeQuery();
		Usuario usuarioEncontrado = null;
		while (rs.next()) {

			usuarioEncontrado = dao.montarObjeto(rs);

		}
		
		return usuarioEncontrado;
	}
	
	public void remover(String login) {

		String sql = "DELETE FROM usuario where login = ? ";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, login);
			
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	
	public List<Usuario> listar() {
		try {
			List<Usuario> listaU = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM usuario");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Usuario tc = new Usuario();
				tc.setIdUsuario(rs.getInt("id_usuario"));
				tc.setLogin(rs.getString("login"));

				listaU.add(tc);
			}
			stmt.execute();
			stmt.close();
			rs.close();
			connection.close();

			return listaU;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public Usuario buscarPorId2(int idUsuario, TipoUsuario tpUsuario) {

		try {

			Usuario usuarioConsultado = null;
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from usuario where id_usuario = ? and tipo_usuario = ?");
			stmt.setInt(1, idUsuario);
			stmt.setString(2, tpUsuario.toString());

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				usuarioConsultado = montarObjeto(rs);
			}

			rs.close();
			stmt.close();

			return usuarioConsultado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	public void alterar(Usuario usu,int idUsuario, TipoUsuario tpUsuario) throws SQLException {

		String sql = "UPDATE usuario SET login = ? where id_usuario = ? and tipo_usuario = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, usu.getLogin());
			stmt.setInt(2, idUsuario);
			stmt.setString(3, tpUsuario.toString());
			stmt.execute();
			

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	

}
