package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.TipoColeta;
import br.com.nasa.util.ConnectionFactory;

public class TipoColetaDao {
	
	private Connection connection;

	public TipoColetaDao() {
		try {
			this.connection = (Connection) new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void Inserir(TipoColeta tc) {

		String sql = "INSERT INTO tipo_coleta" + "(descricao)"
				+ "VALUES (?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			
			stmt.setString(1, tc.getDescricao());
			
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public List<TipoColeta> listar() {
		try {
			List<TipoColeta> listatc = new ArrayList<TipoColeta>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tipo_coleta");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				TipoColeta tc = new TipoColeta();
				tc.setId(rs.getInt("id"));
				tc.setDescricao(rs.getString("descricao"));

				listatc.add(tc);
			}
			stmt.execute();
			stmt.close();
			rs.close();
			connection.close();

			return listatc;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void remover(TipoColeta tc) {

		String sql = "DELETE FROM tipo_coleta where id =?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, tc.getId());
			
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public void alterar(TipoColeta tc) {

		String sql = "UPDATE tipo_coleta SET descricao = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			
			stmt.setString(1, tc.getDescricao());
			stmt.setInt(2, tc.getId());
			
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	
	public TipoColeta pegarId(int id) {

		try {

			TipoColeta tcCompleto = new TipoColeta();

			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tipo_coleta WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				tcCompleto.setId(rs.getInt("id"));
				tcCompleto.setDescricao(rs.getString("descricao"));
				
				
			}

			rs.close();
			stmt.close();
			connection.close();

			return tcCompleto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean verificaDescricaoExistente(String descricao) {
		boolean existe = true;
		String sql = "SELECT descricao FROM tipo_coleta WHERE descricao = ?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, descricao);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				if ((rs.getString("descricao").equals(descricao))) {
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

}
