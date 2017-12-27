package br.com.nasa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.model.Cliente;
import br.com.nasa.model.ClienteDao;

@Controller
public class ClienteController {

	@RequestMapping("/exibirIncluirCliente")
	public String exibirIncluirUsuario() {
		System.out.println("Exibindo tela de cadastro de clientes.");
		return "cliente/cadastrarCliente";
	}

	@RequestMapping("/cadastrarCliente")
	public String cadastrarCliente(Cliente cliente) {
		ClienteDao dao = new ClienteDao();
		dao.Inserir(cliente);
		System.out.println("Cadastrando Clientes");
		return "cliente/cadastroSucesso";
	}
	
	@RequestMapping("/exibirListaClientes")
	public String listarUsuarios() {
		System.out.println("Exibindo lista de clientes.");
		return "cliente/listaCliente";
	}
}
