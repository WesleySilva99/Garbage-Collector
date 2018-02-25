package br.com.nasa.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.ClienteDao;
import br.com.nasa.dao.EnderecoDao;
import br.com.nasa.dao.MotoristaDao;
import br.com.nasa.dao.TipoColetaDao;
import br.com.nasa.dao.VeiculoDao;
import br.com.nasa.model.Cliente;
import br.com.nasa.model.Endereco;
import br.com.nasa.model.Motorista;
import br.com.nasa.model.TipoColeta;
import br.com.nasa.model.Veiculo;

@Controller
public class MotoristaController {

	@RequestMapping("/exibirCadastrarMotorista")
	public String exibirCadastrarMotorista() {
		System.out.println("Exibindo tela de cadastrar motorista!");
		return "motorista/cadastrarMotorista";
	}

	@RequestMapping("/cadastrarMotorista")
	public String cadastrarMotorista(Motorista motorista, Model model) throws SQLException {
		MotoristaDao dao = new MotoristaDao();
		

		if (dao.verificaLoginExistente(motorista.getLogin()) == true) {

			dao.Inserir(motorista);
			
			System.out.println("Cadastrando Motorista");
			model.addAttribute("msg", "Motorista Cadastrado!");
			return "forward:exibirCadastrarMotorista";
		}else {
			model.addAttribute("msg", "O login já existe!");
			model.addAttribute("m", motorista);


			System.out.println("Tente novamente, Login já existente");
			return "motorista/cadastrarMotorista";
		}

	}

	@RequestMapping("/listaMotorista")
	public String exibirListaMotorista(Model model) {
		MotoristaDao dao = new MotoristaDao();
		List<Motorista> listaMotorista = dao.listar();
		model.addAttribute("listaMotorista", listaMotorista);
		System.out.println("Exibindo lista de motorista.");
		return "motorista/listaMotorista";
	}
	
	@RequestMapping("/removerMotorista")
	public String removerMotorista(Motorista m, Model model) {
		MotoristaDao dao = new MotoristaDao();
		dao.remover(m);
		model.addAttribute("msg", "Motorista removido com sucesso!");
		return "forward:listaMotorista";

	}
}
