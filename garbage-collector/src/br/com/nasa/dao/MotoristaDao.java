package br.com.nasa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

import br.com.nasa.model.Endereco;
import br.com.nasa.model.Motorista;
import br.com.nasa.model.Veiculo;
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

	public void Inserir(Motorista motorista) throws SQLException {

		EnderecoDao dao = new EnderecoDao();

		dao.inserir(motorista.getEndereco());

		int idEndereco = 0;

		String sql = "SELECT MAX(id) FROM endereco";

		PreparedStatement stmt1 = this.connection.prepareStatement(sql);
		ResultSet rs = stmt1.executeQuery();

		while (rs.next()) {

			idEndereco = rs.getInt("max(id)");

		}
		rs.close();
		stmt1.close();

		VeiculoDao dao2 = new VeiculoDao();

		dao2.inserir(motorista.getVeiculo());

		int idVeiculo = 0;

		sql = "select max(id) from veiculo";

		PreparedStatement stmt2 = this.connection.prepareStatement(sql);
		ResultSet rs1 = stmt2.executeQuery();

		while (rs1.next()) {

			idVeiculo = rs1.getInt("max(id)");

		}
		rs1.close();
		stmt2.close();

		sql = "INSERT INTO motorista"
				+ "(nome, telefone, cpf, rg, sexo, n_abilitacao, dataVencimento, cat_abilitacao, login, senha, email, id_endereco, id_veiculo)"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, motorista.getNome());
			stmt.setString(2, motorista.getTelefone());
			stmt.setString(3, motorista.getCpf());
			stmt.setString(4, motorista.getRg());
			stmt.setString(5, motorista.getSexo());
			stmt.setInt(6, motorista.getNumHabilitacao());
			stmt.setDate(7, new java.sql.Date(motorista.getValidade().getTime()));
			stmt.setString(8, motorista.getCategoria());
			stmt.setString(9, motorista.getLogin());
			stmt.setString(10, motorista.getSenha());
			stmt.setString(11, motorista.getEmail());
			stmt.setInt(12, idEndereco);
			stmt.setInt(13, idVeiculo);

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

				motorista.setId(rs.getInt("id"));
				motorista.setNome(rs.getString("nome"));
				motorista.setRg(rs.getString("rg"));
				motorista.setCpf(rs.getString("cpf"));
				motorista.setValidade(rs.getDate("dataVencimento"));
				motorista.setTelefone(rs.getString("telefone"));
				motorista.setNumHabilitacao(rs.getInt("n_abilitacao"));
				motorista.setCategoria(rs.getString("cat_abilitacao"));
				motorista.setSexo(rs.getString("sexo"));

				int idEndereco = rs.getInt("id_endereco");
				EnderecoDao dao = new EnderecoDao();
				Endereco cp = dao.pegarId(idEndereco);
				motorista.setEndereco(cp);

				int idVeiculo = rs.getInt("id_veiculo");
				VeiculoDao dao1 = new VeiculoDao();
				Veiculo vCompleto = dao1.pegarId(idVeiculo);
				motorista.setVeiculo(vCompleto);

				motorista.setLogin(rs.getString("login"));
				motorista.setSenha(rs.getString("senha"));
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

	public void remover(Motorista m) {

		String sql = "DELETE FROM motorista where id =?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, m.getId());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	private Motorista montarObjeto(ResultSet rs) throws SQLException {

		Motorista m = new Motorista();
		m.setId(rs.getInt("id"));
		m.setNome(rs.getString("nome"));
		m.setRg(rs.getString("rg"));
		m.setCpf(rs.getString("cpf"));
		m.setValidade(rs.getDate("dataVencimento"));
		m.setTelefone(rs.getString("telefone"));
		m.setNumHabilitacao(rs.getInt("n_abilitacao"));
		m.setCategoria(rs.getString("cat_abilitacao"));
		m.setSexo(rs.getString("sexo"));

		int idEndereco = rs.getInt("id_endereco");
		EnderecoDao dao = new EnderecoDao();
		Endereco cp = dao.pegarId(idEndereco);
		m.setEndereco(cp);

		int idVeiculo = rs.getInt("id_veiculo");
		VeiculoDao dao1 = new VeiculoDao();
		Veiculo vCompleto = dao1.pegarId(idVeiculo);
		m.setVeiculo(vCompleto);

		m.setLogin(rs.getString("login"));
		m.setSenha(rs.getString("senha"));
		return m;
	}

	public Motorista buscarPorId(Motorista motorista) {

		try {

			Motorista motoristaConsultado = null;

			PreparedStatement stmt = this.connection.prepareStatement("select * from motorista where login = ? and senha = ?");
			stmt.setString(1, motorista.getLogin());
			stmt.setString(2, motorista.getSenha());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				motoristaConsultado = montarObjeto(rs);

			}

			rs.close();
			stmt.close();
			connection.close();

			return motoristaConsultado;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public boolean verificaLoginExistente(String login) {
		boolean existe = true;
		String sql = "SELECT login FROM motorista WHERE login = ?";

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
	
	public boolean verificaEmailExistente(String email) {
		boolean existe = true;
		String sql = "SELECT email FROM motorista WHERE email = ?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				if ((rs.getString("email").equals(email))) {
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
