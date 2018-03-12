package br.com.nasa.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.AdministradorDao;
import br.com.nasa.dao.ClienteDao;
import br.com.nasa.dao.MotoristaDao;
import br.com.nasa.model.Administrador;
import br.com.nasa.model.Cliente;
import br.com.nasa.model.Motorista;

@Controller
public class ClienteController {

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Cliente cliente,Motorista motorista,Administrador adm, HttpSession session, Model model) {
		ClienteDao dao = new ClienteDao();
		Cliente clienteLogado = dao.buscarPorId(cliente);
				
		if (clienteLogado != null) {
			session.setAttribute("clienteLogado", clienteLogado);
			System.out.println("Cliente logado");
			return "index";
		}
		MotoristaDao dao1 = new MotoristaDao();
		Motorista motoristaLogado = dao1.buscarPorId(motorista);
		
		
		if (motoristaLogado != null) {
			session.setAttribute("motoristaLogado", motoristaLogado);
			System.out.println("Motorista logado");
			return "index";
		}
		
		AdministradorDao dao2 = new AdministradorDao();
		Administrador AdmLogado= dao2.buscarPorId(adm);
		if (AdmLogado != null) {
			session.setAttribute("AdmLogado", AdmLogado);
			System.out.println("Administrador logado");
			return "index";
		}
		
		model.addAttribute("msg", "N�o foi encontrado um usu�rio com o login e senha informados.");
		return "login";
	}

	@RequestMapping("/exibirIncluirCliente")
	public String exibirIncluirCliente() {
		System.out.println("Exibindo tela de cadastro de clientes.");
		return "cliente/cadastrarCliente";
	}

	@RequestMapping("/cadastrarCliente")
	public String cadastrarCliente(Cliente cliente, Model model) throws SQLException {
		ClienteDao dao = new ClienteDao();

		if (dao.verificaLoginExistente(cliente.getLogin()) == true && dao.verificaEmailExistente(cliente.getEmail()) == true) {
			dao.Inserir(cliente);

			model.addAttribute("msg", "Voc� foi cadastrado com sucesso!");
			System.out.println("Cadastrando Clientes");

		} else if(dao.verificaLoginExistente(cliente.getLogin()) == false) {

			model.addAttribute("msg", "O login j� existe!");
			model.addAttribute("c", cliente);
			System.out.println("Tente novamente, Login já existente");
			return "cliente/cadastrarCliente";
		}
		
		else if (dao.verificaEmailExistente(cliente.getEmail()) == false) {
			model.addAttribute("msg", "O email j� existe!");
			model.addAttribute("c", cliente);
			System.out.println("Tente novamente, email j� existente");
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
	public String alterarCliente(Cliente cliente, Model model) {

		ClienteDao dao = new ClienteDao();
		Cliente clienteCompleto = dao.pegarId(cliente.getId());
		model.addAttribute("p", clienteCompleto);

		return "cliente/alterarCliente";
	}

	@RequestMapping("alterarCliente2")
	public String alterarCliente2(Cliente cliente, Model model) throws SQLException {

		ClienteDao dao = new ClienteDao();
		dao.alterar(cliente);
		model.addAttribute("msg", "cliente alterado.");
		System.out.println("cliente alterado com sucesso");
		return "forward:listarClientes";
	}

}
