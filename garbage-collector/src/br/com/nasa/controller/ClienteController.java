package br.com.nasa.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.ClienteDao;
import br.com.nasa.dao.EnderecoDao;
import br.com.nasa.dao.UsuarioDao;
import br.com.nasa.model.Cliente;
import br.com.nasa.model.TipoUsuario;
import br.com.nasa.model.Usuario;

@Controller
public class ClienteController {

	
	@RequestMapping("/exibirIncluirCliente")
	public String exibirIncluirCliente() {
		System.out.println("Exibindo tela de cadastro de clientes.");
		return "cliente/cadastrarCliente";
	}

	@RequestMapping("/cadastrarCliente")
	public String cadastrarCliente(Cliente cliente, Model model) throws SQLException {
		ClienteDao dao = new ClienteDao();

		if (dao.verificaLoginExistente(cliente.getUsuario().getLogin()) == true
				&& dao.verificaEmailExistente(cliente.getEmail()) == true) {
			dao.Inserir(cliente);

			model.addAttribute("msg", "Você foi cadastrado com sucesso!");
			System.out.println("Cadastrando Clientes");

		} else if (dao.verificaLoginExistente(cliente.getUsuario().getLogin()) == false) {

			model.addAttribute("msg", "O login já existe!");
			model.addAttribute("c", cliente);
			System.out.println("Tente novamente, Login já¡ existente");
			return "cliente/cadastrarCliente";
		}

		else if (dao.verificaEmailExistente(cliente.getEmail()) == false) {
			model.addAttribute("msg", "O email já existe!");
			model.addAttribute("c", cliente);
			System.out.println("Tente novamente, email já existente");
			return "cliente/cadastrarCliente";

		}
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
		UsuarioDao dao2 = new UsuarioDao();
		Usuario uCompleto =dao2.buscarPorId2(cliente.getId(), TipoUsuario.CLIENTE);
		model.addAttribute("p", clienteCompleto);
		model.addAttribute("u", uCompleto);
		
		

		return "cliente/alterarCliente";
	}

	@RequestMapping("alterarCliente2")
	public String alterarProduto2(Cliente cliente,Usuario u, Model model) throws SQLException {
		
		
		ClienteDao dao = new ClienteDao();
		
		dao.alterar(cliente);
		EnderecoDao dao1 = new EnderecoDao();
		dao1.alterar(cliente.getEndereco());
		UsuarioDao dao3 = new UsuarioDao();
		dao3.alterar(u,cliente.getId(), TipoUsuario.CLIENTE);
		
		
		
		model.addAttribute("msg", "cliente alterado.");
		System.out.println("Cliente alterado com sucesso");
		return "forward:listarClientes";
	}

	@RequestMapping("/removerCliente")
	public String removerCliente(Cliente c, Model model) {
		try {
			
		
		ClienteDao dao = new ClienteDao();
		c= dao.pegarId(c.getId());
		dao.remover(c);
		EnderecoDao dao1 = new EnderecoDao();
		dao1.remover(c.getEndereco());
		UsuarioDao dao2= new UsuarioDao();
		 Usuario b = dao2.buscarPorId2(c.getId(), TipoUsuario.CLIENTE);
		 dao2.remover(b.getLogin());
		 System.out.println("Removendo cliente");
		
		
		} catch (RuntimeException run) {
			model.addAttribute("msg", "Cliente não pode ser deletado porque existem pedidos");
		}
		
		model.addAttribute("msg", "Cliente removido com sucesso!");
		return "forward:listarClientes";
	}

}
