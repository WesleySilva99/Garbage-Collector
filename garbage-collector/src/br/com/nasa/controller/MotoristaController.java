package br.com.nasa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.model.Motorista;
import br.com.nasa.model.MotoristaDao;

@Controller
public class MotoristaController {
	
	@RequestMapping("/exibirCadastrarMotorista")
	public String exibirCadastrarMotorista() {
	System.out.println("Exibindo tela de cadastrar motorista!");
	return "motorista/cadastrarMotorista";
	}
	
	@RequestMapping("/cadastrarMotorista")
	public String cadastrarMotorista(Motorista motorista) {
		MotoristaDao dao = new MotoristaDao();
		dao.Inserir(motorista);
		System.out.println("Cadastrando Motorista");
		return "motorista/cadastroSucesso";
	}
	
	@RequestMapping("/exibirListaMotorista")
	public String exibirListaMotorista() {
		System.out.println("Exibindo lista de motorista.");
		return "motorista/listaMotorista";
	}
}
