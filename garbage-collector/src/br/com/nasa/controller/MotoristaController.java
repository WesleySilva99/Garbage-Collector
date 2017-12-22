package br.com.nasa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MotoristaController {
	
	@RequestMapping("/exibirCadastrarMotorista")
	public String exibirCadastrarMotorista() {
	System.out.println("Exibindo tela de cadastrar motorista!");
	return "motorista/cadastrarMotorista";
	}
}
