package br.com.nasa.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.AdministradorDao;
import br.com.nasa.dao.ClienteDao;
import br.com.nasa.dao.MotoristaDao;
import br.com.nasa.dao.UsuarioDao;
import br.com.nasa.model.Administrador;
import br.com.nasa.model.Cliente;
import br.com.nasa.model.Motorista;
import br.com.nasa.model.TipoUsuario;
import br.com.nasa.model.Usuario;

@Controller
public class UsuarioController {
	
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
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) throws SQLException {
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioLogado = dao.buscarLogin(usuario);

		if (usuarioLogado != null) {

			

			if (usuarioLogado.getTpUsuario().equals(TipoUsuario.CLIENTE)) {
				ClienteDao daoC = new ClienteDao();
				Cliente clienteLogado = daoC.buscarPorId(usuarioLogado.getIdUsuario());
				clienteLogado.setUsuario(usuarioLogado);

				session.setAttribute("clienteLogado", clienteLogado);
				
				return "index";

			} else if (usuarioLogado.getTpUsuario().equals(TipoUsuario.MOTORISTA)) {

				MotoristaDao dao1 = new MotoristaDao();
				Motorista motoristaLogado = dao1.buscarPorId(usuarioLogado.getIdUsuario());
				motoristaLogado.setUsuario(usuarioLogado);

				if (motoristaLogado != null) {
					session.setAttribute("motoristaLogado", motoristaLogado);
					System.out.println("Motorista logado");
					return "index";
				}

			} else if (usuarioLogado.getTpUsuario().equals(TipoUsuario.ADMINISTRADOR)) {

				AdministradorDao dao2 = new AdministradorDao();
				Administrador AdmLogado = dao2.buscarPorId(usuarioLogado.getIdUsuario());
				AdmLogado.setUsuario(usuarioLogado);

				if (AdmLogado != null) {
					session.setAttribute("AdmLogado", AdmLogado);
					System.out.println("Administrador logado");
					return "index";
				}

				
			}
			
		}else {
			
			model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
			
			return "login";
			
		}
		
		model.addAttribute("msg", "Login ou senha incorretos!");
		
		return "login";
		
		

		
	}
	


}
