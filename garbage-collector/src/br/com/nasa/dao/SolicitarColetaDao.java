package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Cliente;
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
}
