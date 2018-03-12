package br.com.nasa.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.ClienteDao;
import br.com.nasa.dao.PedidoDao;
import br.com.nasa.dao.TipoColetaDao;
import br.com.nasa.model.Cliente;
import br.com.nasa.model.Pedido;
import br.com.nasa.model.TipoColeta;

@Controller
public class TipoColetaController {

	@RequestMapping("/exibirTipoColeta")
	public String exebirTipoColeta() {
		
		return "tipocoleta/cadastrarTipoColeta";
	}
	
	@RequestMapping("/cadastrarTipoColeta")
	public String cadastrarTipoColeta(TipoColeta tc, Model model) {
		TipoColetaDao dao = new TipoColetaDao();
		

		if (dao.verificaDescricaoExistente(tc.getDescricao()) == true) {
			
		dao.Inserir(tc);
		model.addAttribute("msg", "Tipo da Coleta cadastrado com sucesso!");
		
		}else {
			model.addAttribute("msg", "O tipo da coleta já existe!");
			model.addAttribute("c", tc);
			System.out.println("Tente novamente, Login já existente");
			return "tipocoleta/cadastrarTipoColeta";
		}
		return "forward:exibirTipoColeta";
	}
	
	@RequestMapping("/listarTipocoleta")
	public String listarTipocoleta(Model model) {
		TipoColetaDao dao = new TipoColetaDao();
		List<TipoColeta> tc = dao.listar();
		model.addAttribute("tc", tc);
		
		return "tipocoleta/listarTipoColeta";
		
	}
	
	@RequestMapping("/removerTipoColeta")
	public String removerTipoColeta(TipoColeta tc, Model model) {
		TipoColetaDao dao = new TipoColetaDao();
		dao.remover(tc);
		model.addAttribute("msg", "Tipo de Coleta removida com sucesso!");
		return "forward:listarTipocoleta";

	}
	
	@RequestMapping("pegarTipoColeta")
	public String pegarTipoColeta(TipoColeta tc, Model model) {

		TipoColetaDao dao = new TipoColetaDao();
		TipoColeta tcCompleto = dao.pegarId(tc.getId());
		model.addAttribute("p", tcCompleto);

		return "tipocoleta/alterarTipoColeta";
	}
	
	@RequestMapping("alterarTipoColeta")
	public String alterarTipoColeta(TipoColeta tc, Model model) {

		TipoColetaDao dao = new TipoColetaDao();
		dao.alterar(tc);
		model.addAttribute("msg", "Tipo da coleta alterado com sucesso!");

		return "forward:listarTipocoleta";
	}
}
