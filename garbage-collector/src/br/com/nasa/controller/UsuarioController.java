package br.com.nasa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.model.Usuario;
import br.com.nasa.model.UsuarioDao;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirIncluirUsuario")
	public String exibirIncluirUsuario() {
		System.out.println("Exibindo tela de cadastro de usuarios.");
		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("/cadastrarUsuario")
	public String cadastrarUsuario(Usuario usuario) {
		UsuarioDao dao = new UsuarioDao();
		dao.Inserir(usuario);
		System.out.println("Cadastrando Usuario");
		return "usuario/cadastroSucesso";
	}
	
	@RequestMapping("/exibirListaUsuarios")
	public String listarUsuarios() {
		System.out.println("Exibindo lista de usuarios.");
		return "usuario/listaUsuario";
	}
}
