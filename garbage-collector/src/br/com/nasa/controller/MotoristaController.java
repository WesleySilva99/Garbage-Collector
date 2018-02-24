package br.com.nasa.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.EnderecoDao;
import br.com.nasa.dao.MotoristaDao;
import br.com.nasa.dao.VeiculoDao;
import br.com.nasa.model.Endereco;
import br.com.nasa.model.Motorista;
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

	@RequestMapping("/exibirListaMotorista")
	public String exibirListaMotorista() {
		System.out.println("Exibindo lista de motorista.");
		return "motorista/listaMotorista";
	}
}
