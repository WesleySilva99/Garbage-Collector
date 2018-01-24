package br.com.nasa.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.model.Cliente;
import br.com.nasa.model.ClienteDao;
import br.com.nasa.model.Endereco;
import br.com.nasa.model.EnderecoDao;

@Controller
public class ClienteController {

	@RequestMapping("/exibirIncluirCliente")
	public String exibirIncluirCliente() {
		System.out.println("Exibindo tela de cadastro de clientes.");
		return "cliente/cadastrarCliente";
	}

	@RequestMapping("/cadastrarCliente")
	public String cadastrarCliente(Cliente cliente, Endereco e) {
		ClienteDao dao = new ClienteDao();
		dao.Inserir(cliente);
		EnderecoDao dao2 = new EnderecoDao();
		dao2.inserir(e);
		System.out.println("Cadastrando Clientes");
		return "cliente/cadastroSucesso";
	}
	
	@RequestMapping("/listarClientes")
	public String listarUsuario(Model model) {
		ClienteDao dao = new ClienteDao();
		List<Cliente> listaCliente = dao.listar();
		model.addAttribute("listaCliente", listaCliente);
		return "cliente/listaCliente";
	}

}
