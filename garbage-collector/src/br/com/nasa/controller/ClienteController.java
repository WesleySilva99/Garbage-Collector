package br.com.nasa.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.ClienteDao;
import br.com.nasa.dao.EnderecoDao;
import br.com.nasa.model.Cliente;
import br.com.nasa.model.Endereco;

@Controller
public class ClienteController {

	@RequestMapping("/exibirIncluirCliente")
	public String exibirIncluirCliente() {
		System.out.println("Exibindo tela de cadastro de clientes.");
		return "cliente/cadastrarCliente";
	}

	@RequestMapping("/cadastrarCliente")
	public String cadastrarCliente(Cliente cliente, Endereco e, Model model) {
		ClienteDao dao = new ClienteDao();
		dao.Inserir(cliente);
		EnderecoDao dao2 = new EnderecoDao();
		dao2.inserir(e);
		model.addAttribute("msg", "Voc� foi cadastrado com sucesso!");
		System.out.println("Cadastrando Clientes");
		return "forward:exibirIncluirCliente";
	}
	
	@RequestMapping("/listarClientes")
	public String listarUsuario(Model model) {
		ClienteDao dao = new ClienteDao();
		List<Cliente> listaCliente = dao.listar();
		model.addAttribute("listaCliente", listaCliente);
		return "cliente/listaCliente";
	}
	
	@RequestMapping("alterarCliente")
    public String alterarProduto(Cliente cliente, Model model) {
    	
    	ClienteDao dao = new ClienteDao();
    	Cliente clienteCompleto = dao.pegarId(cliente.getId());
    	model.addAttribute("p", clienteCompleto);
    	
    	return "cliente/alterarCliente";
    }
	
	 @RequestMapping("alterarCliente2")
	    public String alterarProduto2(Cliente cliente, Model model) {
	    	
	    	ClienteDao dao = new ClienteDao();
	    	dao.alterar(cliente);
	    	model.addAttribute("msg", "cliente alterado.");
	    	
	    	return "forward:listarClientes";
	    }


}
