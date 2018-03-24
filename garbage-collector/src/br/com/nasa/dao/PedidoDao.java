package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Cliente;
import br.com.nasa.model.Motorista;
import br.com.nasa.model.Pedido;
import br.com.nasa.model.Rank;
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
				
				int idCliente= rs.getInt("id_cliente");
				ClienteDao dao1 = new ClienteDao();
				Cliente cp1 = dao1.pegarId(idCliente);
				coleta.setCliente(cp1);
				
				/*int idMotorista= rs.getInt("id_motorista");
				MotoristaDao dao2 = new MotoristaDao();
				Motorista cp2 = dao2.pegarId(idMotorista);
				coleta.setMotorista(cp2);
				*/
				
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
	
	public List<Rank> listarRank() {
		try {
			List<Rank> listaRank = new ArrayList<Rank>();
			PreparedStatement stmt = this.connection.prepareStatement("select c.nome,sum(quantidade) as quantidade from pedido p, cliente c where p.id_cliente = c.id group by c.nome order by sum(quantidade) desc limit 10;" );
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Rank r = new Rank();
				
				r.setQuantidade(rs.getShort("quantidade"));
				
				r.setNome(rs.getString("nome"));

				listaRank.add(r);
			}
			stmt.execute();
			stmt.close();
			rs.close();
			connection.close();

			return listaRank;
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
	public void remover(int id) {

		String sql = "DELETE FROM pedido where id_cliente = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, id);
			
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public void cancelar(Pedido p) {

		String sql = "DELETE FROM pedido WHERE id =?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, p.getId());
			
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
	
	public Pedido pegarId(int id) {

		try {

			Pedido pCompleto = new Pedido();

			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM pedido WHERE id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				pCompleto.setId(rs.getInt("id"));
				
				int idTipoColeta = rs.getInt("id_tp_coleta");
				TipoColetaDao dao = new TipoColetaDao();
				TipoColeta cp = dao.pegarId(idTipoColeta);
				pCompleto.setTipocoleta(cp);
				
				pCompleto.setDescricao(rs.getString("descricao"));
				pCompleto.setQuantidade(rs.getShort("quantidade"));
				pCompleto.setEndereco(rs.getString("endereco"));
				pCompleto.setNumero(rs.getString("numero"));
				pCompleto.setCep(rs.getString("cep"));
				
				
				
			}

			rs.close();
			stmt.close();
			connection.close();

			return pCompleto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
public void alterar(Pedido pedido) throws SQLException {
		
		
		String sql = "UPDATE pedido SET descricao = ?, quantidade = ?, endereco = ?, numero = ?, cep = ?, id_tp_coleta= ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, pedido.getDescricao());
			stmt.setShort(2, pedido.getQuantidade());
			stmt.setString(3, pedido.getEndereco());
			stmt.setString(4, pedido.getNumero());
			stmt.setString(5, pedido.getCep());
			stmt.setInt(6, pedido.getTipocoleta().getId());
			stmt.setInt(7, pedido.getId());
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

public void alterar2(Pedido pedido) throws SQLException {
	
	
	String sql = "UPDATE pedido SET id_motorista=? WHERE id = ?";
	PreparedStatement stmt;
	try {

		stmt = connection.prepareStatement(sql);

	
		stmt.setInt(1, pedido.getMotorista().getId());
		stmt.setInt(2, pedido.getId());
		stmt.execute();


	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}
}
