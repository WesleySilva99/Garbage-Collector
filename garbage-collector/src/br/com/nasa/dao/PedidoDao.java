package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Pedido;
import br.com.nasa.model.TipoColeta;
import br.com.nasa.util.ConnectionFactory;

public class PedidoDao {
	
	private Connection connection;

	public PedidoDao() {
		try {
			this.connection = (Connection) new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void Inserir(Pedido solicitarcoleta) {

		String sql = "INSERT INTO pedido" + "(descricao, quantidade, endereco, numero, cep, id_tp_coleta, id_cliente)"
				+ "VALUES (?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			
			stmt.setString(1, solicitarcoleta.getDescricao());
			stmt.setShort(2, solicitarcoleta.getQuantidade());
			stmt.setString(3, solicitarcoleta.getEndereco());
			stmt.setString(4, solicitarcoleta.getNumero());
			stmt.setString(5, solicitarcoleta.getCep());
			stmt.setInt(6, solicitarcoleta.getTipocoleta().getId());
			stmt.setInt(7, solicitarcoleta.getCliente().getId());
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public List<Pedido> listar() {
		try {
			List<Pedido> listaColeta = new ArrayList<Pedido>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM pedido");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Pedido coleta = new Pedido();
				coleta.setId(rs.getInt("id"));
				coleta.setDescricao(rs.getString("descricao"));
				coleta.setQuantidade(rs.getShort("quantidade"));
				coleta.setEndereco(rs.getString("endereco"));
				coleta.setNumero(rs.getString("numero"));
				coleta.setCep(rs.getString("cep"));
				
				int idTipoColeta = rs.getInt("id_tp_coleta");
				TipoColetaDao dao = new TipoColetaDao();
				TipoColeta cp = dao.pegarId(idTipoColeta);
				coleta.setTipocoleta(cp);

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
	
	public List<Pedido> listarPorCliente(int id) {
		try {
			List<Pedido> listaColeta = new ArrayList<Pedido>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM pedido WHERE id_cliente = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Pedido coleta = new Pedido();
				coleta.setId(rs.getInt("id"));
				coleta.setDescricao(rs.getString("descricao"));
				coleta.setQuantidade(rs.getShort("quantidade"));
				coleta.setEndereco(rs.getString("endereco"));
				coleta.setNumero(rs.getString("numero"));
				coleta.setCep(rs.getString("cep"));
				
				int idTipoColeta = rs.getInt("id_tp_coleta");
				TipoColetaDao dao = new TipoColetaDao();
				TipoColeta cp = dao.pegarId(idTipoColeta);
				coleta.setTipocoleta(cp);

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
	public void remover(Pedido solicitarcoleta) {

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
