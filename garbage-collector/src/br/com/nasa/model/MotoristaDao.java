package br.com.nasa.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.util.ConnectionFactory;

public class MotoristaDao {
	

		private Connection connection;

		public MotoristaDao() {
			try {
				this.connection = (Connection) new ConnectionFactory().getConnection();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}

		public void Inserir(Motorista motorista) {

			String sql = "INSERT INTO usuario"
					+ "(nome, nome_usu, email, endereco, dataNascimento, cpf, cep, senha, telefone)"
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			try {
				PreparedStatement stmt = connection.prepareStatement(sql);

				stmt.setString(1, motorista.getNome());
				stmt.setString(2, motorista.getTelefone());
				stmt.setString(3, motorista.getCpf());
				stmt.setString(4, motorista.getRg());
				stmt.setString(5, motorista.getEndereco());
				stmt.setString(6, motorista.getBairro());
				stmt.setString(7, motorista.getEstado());
				stmt.setString(8, motorista.getCidade());
				stmt.setString(9, motorista.getCep());
				stmt.setString(10, motorista.getSexo());
				stmt.setInt(11, motorista.getNumHabilitacao());
				stmt.setDate(12, new java.sql.Date(motorista.getValidade().getTime()));
				stmt.setString(10, motorista.getCategoria());
				stmt.setString(10, motorista.getChasi());
				stmt.setString(10, motorista.getPlacaVeiculo());
				stmt.setString(10, motorista.getMarcaVeiculo());
				stmt.setString(10, motorista.getAnoVeiculo());

				stmt.execute();
				stmt.close();
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}

		}
		
		public List<Motorista> listar() {
			try {
				List<Motorista> listaMotorista = new ArrayList<Motorista>();
				PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM motorista ORDER BY nome");
				ResultSet rs = stmt.executeQuery();

				while (rs.next()) {
					Motorista motorista = new Motorista();
					motorista.setNome(rs.getString("nome"));
					motorista.setRg(rs.getString("rg"));
					motorista.setCpf(rs.getString("cpf"));
					motorista.setValidade(rs.getDate("validade"));
					motorista.setCep(rs.getString("cep"));
					motorista.setEndereco(rs.getString("endereco"));
					motorista.setTelefone(rs.getString("telefone"));
					motorista.setBairro(rs.getString("bairro"));
					motorista.setEstado(rs.getString("estado"));
					motorista.setCidade(rs.getString("cidade"));
					motorista.setSexo(rs.getString("sexo"));
					motorista.setNumHabilitacao(rs.getInt("numHabilitacao"));
					motorista.setCategoria(rs.getString("categoria"));
					motorista.setChasi(rs.getString("chasi"));
					motorista.setPlacaVeiculo(rs.getString("placaVeiculo"));
					motorista.setMarcaVeiculo(rs.getString("marcaVeiculo"));
					motorista.setAnoVeiculo(rs.getString("anoVeiculo"));
					listaMotorista.add(motorista);

				}
				stmt.execute();
				stmt.close();
				rs.close();
				connection.close();

				return listaMotorista;
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
				
}


