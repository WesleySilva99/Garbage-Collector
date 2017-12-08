package br.com.nasa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.model.Usuario;
import br.com.nasa.model.UsuarioDao;
@Controller
public class UsuarioController {

	@RequestMapping("/exibirIncluirUsuario")
		public String exibirIncluirUsuario() {
			return "usuario/cadastrarUsuario";
		}
	
	@RequestMapping("/cadastrarUsuario")
	public String cadastrarUsuario(Usuario usuario) {
		UsuarioDao dao = new UsuarioDao();
		dao.Inserir(usuario);
		return "usuario/cadastroSucesso";
		}
	}
