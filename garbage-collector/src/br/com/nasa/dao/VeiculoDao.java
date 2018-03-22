package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Cliente;
import br.com.nasa.model.Endereco;
import br.com.nasa.model.TipoColeta;
import br.com.nasa.model.Veiculo;
import br.com.nasa.util.ConnectionFactory;

public class VeiculoDao {

	private Connection connection;

	public VeiculoDao() {
		try {
			this.connection = (Connection) new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void inserir(Veiculo v) {

		String sql = "insert into veiculo(CHASI, marca, placa, ano_veiculo)" + "values (?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, v.getChasi());
			stmt.setString(2, v.getMarca());
			stmt.setString(3, v.getPlaca());
			stmt.setString(4, v.getAnoVeiculo());

			stmt.execute();
			stmt.close();

		} catch (SQLException error) {
			throw new RuntimeException(error);
		}

	}
	
	public void alterar(Veiculo v) {

		String sql = "UPDATE endereco SET CHASI = ?, marca = ?, placa = ?, anoVeiculo = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			
			stmt.setString(1, v.getChasi());
			stmt.setString(2, v.getMarca());
			stmt.setString(3, v.getPlaca());
			stmt.setString(4, v.getAnoVeiculo());
			stmt.setInt(5, v.getId());
			stmt.execute();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Veiculo pegarId(int id) {

		try {

			Veiculo vCompleto = new Veiculo();

			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM veiculo WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				vCompleto.setId(rs.getInt("id"));
				vCompleto.setChasi(rs.getString("CHASI"));
				vCompleto.setPlaca(rs.getString("placa"));
				vCompleto.setMarca(rs.getString("marca"));
				vCompleto.setAnoVeiculo(rs.getString("ano_veiculo"));

			}

			rs.close();
			stmt.close();
			connection.close();

			return vCompleto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Veiculo v) {

		String sql = "DELETE FROM veiculo where id =?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, v.getId());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}
}