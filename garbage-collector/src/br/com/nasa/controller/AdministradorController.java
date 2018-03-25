package br.com.nasa.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.AdministradorDao;
import br.com.nasa.dao.UsuarioDao;
import br.com.nasa.model.Administrador;
import br.com.nasa.model.Usuario;


@Controller
public class AdministradorController {

	@RequestMapping("/exibirIncluirAdm")
	public String exibirIncluirAdm() {
		System.out.println("Exibindo tela de cadastro de Adm.");
		return "administrador/cadastrarAdm";
	}

	@RequestMapping("/cadastrarAdm")
	public String cadastrarAdm(Administrador adm, Model model) throws SQLException {
		AdministradorDao dao = new AdministradorDao();

		if (dao.verificaLoginExistente(adm.getUsuario().getLogin()) == true && dao.verificaEmailExistente(adm.getEmail()) == true) {
			dao.Inserir(adm);

			model.addAttribute("msg", "Voc� foi cadastrado com sucesso!");
			System.out.println("Cadastrando Adms");

		} else if(dao.verificaLoginExistente(adm.getUsuario().getLogin()) == false) {

			model.addAttribute("msg", "O login j� existe!");
			model.addAttribute("c", adm);
			System.out.println("Tente novamente, Login j� existente");
			return "administrador/cadastrarAdm";
		}
		
		else if (dao.verificaEmailExistente(adm.getEmail()) == false) {
			model.addAttribute("msg", "O email j� existe!");
			model.addAttribute("c", adm);
			System.out.println("Tente novamente, email j� existente");
			return "administrador/cadastrarAdm";

		}
		return "forward:exibirIncluirAdm";

	}

	@RequestMapping("/listarAdms")
	public String listarAdms(Model model) {
		AdministradorDao dao = new AdministradorDao();
		List<Administrador> listaAdm = dao.listar();
		model.addAttribute("listaAdm", listaAdm);

		return "administrador/listarAdm";
	}

	@RequestMapping("ExibitalterarAdm")
	public String ExibitalterarAdm(Administrador adm, Model model) {

		AdministradorDao dao = new AdministradorDao();
		Administrador admCompleto = dao.pegarId(adm.getId());
		model.addAttribute("p", admCompleto);

		return "administrador/alterarAdm";
	}

	@RequestMapping("alterarAdm")
	public String alterarAdm(Administrador adm, Model model) throws SQLException {

		AdministradorDao dao = new AdministradorDao();
		dao.alterar(adm);
		model.addAttribute("msg", "Administrador alterado.");
		System.out.println("Administrador alterado com sucesso");
		return "forward:listarAdms";
	}
	
	 @RequestMapping("removerAdm")
	    public String removerCategoriaProduto(Administrador adm, Model model) {

		 AdministradorDao dao = new AdministradorDao();
		dao.remover(adm);
		model.addAttribute("msg", "Administrador Removido com Sucesso !");

		return "forward:listarAdms";
	    }

}
