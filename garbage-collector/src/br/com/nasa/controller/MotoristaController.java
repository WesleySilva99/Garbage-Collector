package br.com.nasa.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.EnderecoDao;
import br.com.nasa.dao.MotoristaDao;
import br.com.nasa.model.Endereco;
import br.com.nasa.model.Motorista;

@Controller
public class MotoristaController {

	@RequestMapping("/exibirCadastrarMotorista")
	public String exibirCadastrarMotorista() {
		System.out.println("Exibindo tela de cadastrar motorista!");
		return "motorista/cadastrarMotorista";
	}

	@RequestMapping("/cadastrarMotorista")
	public String cadastrarMotorista(Motorista motorista, Endereco e, Model model) throws SQLException {
		MotoristaDao dao = new MotoristaDao();
		EnderecoDao dao2 = new EnderecoDao();

		if (dao.verificaLoginExistente(motorista.getLogin()) == true) {

			dao.Inserir(motorista);
			dao2.inserir(e);
			System.out.println("Cadastrando Motorista");
			model.addAttribute("msg", "Motorista Cadastrado!");
			return "forward:exibirCadastrarMotorista";
		}else {
			model.addAttribute("msg", "O login já existe!");
			model.addAttribute("m", motorista);
			model.addAttribute("e", e);
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
