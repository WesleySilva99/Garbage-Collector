package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

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
	
public void inserir(Veiculo v){
		
		String sql = "insert into veiculo(CHASI, marca, placa, ano_veiculo)"+
		"values (?,?,?,?)";
		

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

}
