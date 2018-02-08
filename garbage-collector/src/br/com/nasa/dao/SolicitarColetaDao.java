package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.SolicitarColeta;
import br.com.nasa.util.ConnectionFactory;

public class SolicitarColetaDao {
	
	private Connection connection;

	public SolicitarColetaDao() {
		try {
			this.connection = (Connection) new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void Inserir(SolicitarColeta solicitarcoleta) {

		String sql = "INSERT INTO pedido" + "(tipoColeta, descricao, quantidade, endereco, numero, cep)"
				+ "VALUES (?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, solicitarcoleta.getTipoColeta());
			stmt.setString(2, solicitarcoleta.getDescricao());
			stmt.setShort(3, solicitarcoleta.getQuantidade());
			stmt.setString(4, solicitarcoleta.getEndereco());
			stmt.setString(5, solicitarcoleta.getNumero());
			stmt.setString(6, solicitarcoleta.getCep());
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public List<SolicitarColeta> listar() {
		try {
			List<SolicitarColeta> listaColeta = new ArrayList<SolicitarColeta>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM pedido");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				SolicitarColeta coleta = new SolicitarColeta();
				coleta.setId(rs.getInt("id"));
				coleta.setTipoColeta(rs.getString("tipoColeta"));
				coleta.setDescricao(rs.getString("descricao"));
				coleta.setQuantidade(rs.getShort("quantidade"));
				coleta.setEndereco(rs.getString("endereco"));
				coleta.setNumero(rs.getString("numero"));
				coleta.setCep(rs.getString("cep"));

				listaColeta.add(coleta);
			}
			stmt.execute();
			stmt.close();
			rs.close();
			connection.close();

			return listaColeta;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void remover(SolicitarColeta solicitarcoleta) {

		String sql = "DELETE FROM pedido where id =?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, solicitarcoleta.getId());
			
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
}
