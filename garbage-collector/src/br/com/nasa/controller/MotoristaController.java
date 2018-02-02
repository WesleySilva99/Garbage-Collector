package br.com.nasa.controller;

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
	public String cadastrarMotorista(Motorista motorista, Endereco endereco, Model model) {
		MotoristaDao dao = new MotoristaDao();
		EnderecoDao dao2 = new EnderecoDao();
		dao.Inserir(motorista);
		dao2.inserir(endereco);
		System.out.println("Cadastrando Motorista");
		model.addAttribute("msg", "Motorista Cadastrado!");
		return "forward:exibirCadastrarMotorista";
	}
	
	@RequestMapping("/exibirListaMotorista")
	public String exibirListaMotorista() {
		System.out.println("Exibindo lista de motorista.");
		return "motorista/listaMotorista";
	}
}
