package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public void alterar(SolicitarColeta solicitarcoleta) {

		String sql = "UPDATE pedido SET tipoColeta = ?, descricao = ?, quantidade = ?, endereco = ?, numero = ?, cep = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setInt(1, solicitarcoleta.getId());
			stmt.setString(2, solicitarcoleta.getTipoColeta());
			stmt.setString(3, solicitarcoleta.getDescricao());
			stmt.setShort(4, solicitarcoleta.getQuantidade());
			stmt.setString(5, solicitarcoleta.getEndereco());
			stmt.setString(6, solicitarcoleta.getNumero());
			stmt.setString(7, solicitarcoleta.getCep());
			
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public SolicitarColeta pegarId(int id) {

		try {

			SolicitarColeta coletaCompleta = new SolicitarColeta();

			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM pedido WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				coletaCompleta.setId(rs.getInt("id"));
				coletaCompleta.setTipoColeta(rs.getString("tipoColeta"));
				coletaCompleta.setDescricao(rs.getString("descricao"));
				coletaCompleta.setQuantidade(rs.getShort("quantidade"));
				coletaCompleta.setEndereco(rs.getString("endereco"));
				coletaCompleta.setNumero(rs.getString("numero"));
				coletaCompleta.setCep(rs.getString("cep"));
				
			}

			rs.close();
			stmt.close();
			connection.close();

			return coletaCompleta;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


}
