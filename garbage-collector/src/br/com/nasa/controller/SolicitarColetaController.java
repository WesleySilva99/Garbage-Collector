package br.com.nasa.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.ClienteDao;
import br.com.nasa.dao.SolicitarColetaDao;
import br.com.nasa.model.Cliente;
import br.com.nasa.model.SolicitarColeta;

@Controller
public class SolicitarColetaController {

	
		@RequestMapping("/exibirSolicitarColeta")
		public String exibirSolicitarColeta() {
			System.out.println("Exibindo tela de solicitar coleta");
			return "solicitarColeta/solicitarColeta";
		}
		
		@RequestMapping("/CadastraSolicitarColeta")
		public String CadastraSolicitarColeta(SolicitarColeta solicitarcoleta, Model model) {
			SolicitarColetaDao dao = new SolicitarColetaDao();
			dao.Inserir(solicitarcoleta);
			model.addAttribute("msg", "Coleta cadastrada vamos mandar alguém passar aí para coletar os materiais");
			System.out.println("Cadastrando a coleta");
			return "forward:exibirSolicitarColeta";
		}
		
		@RequestMapping("/listarColeta")
		public String listarColeta(Model model) {
			SolicitarColetaDao dao = new SolicitarColetaDao();
			List<SolicitarColeta> listaColeta = dao.listar();
			model.addAttribute("listaColeta", listaColeta);
			return "solicitarColeta/cancelarColeta";
		}
		
		@RequestMapping("/cancelarColeta")
		public String cancelarColeta(SolicitarColeta solicitarcoleta, Model model) {
			SolicitarColetaDao dao = new SolicitarColetaDao();
			dao.remover(solicitarcoleta);
			model.addAttribute("msg", "Coleta cancelada com sucesso!");
			return "forward:listarColeta";
			
		}
}
