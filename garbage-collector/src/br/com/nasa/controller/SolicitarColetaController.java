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
public class SolicitarColetaController {

	@RequestMapping("/exibirSolicitarColeta")
	public String exibirSolicitarColeta(Model model) {
		TipoColetaDao dao = new TipoColetaDao();
		List<TipoColeta> tc = dao.listar();
		model.addAttribute("tc", tc);
		System.out.println("Exibindo tela de solicitar coleta");
		return "solicitarColeta/solicitarColeta";
	}

	@RequestMapping("/CadastraSolicitarColeta")
	public String CadastraSolicitarColeta(Pedido solicitarcoleta, Model model) {
		PedidoDao dao = new PedidoDao();
		dao.Inserir(solicitarcoleta);
		model.addAttribute("msg", "Coleta cadastrada com sucesso!");
		System.out.println("Cadastrando a coleta");
		return "forward:exibirSolicitarColeta";
	}

	@RequestMapping("/listarColeta")
	public String listarColeta(Model model) {
		PedidoDao dao = new PedidoDao();
		List<Pedido> listaColeta = dao.listar();
		model.addAttribute("listaColeta", listaColeta);
		return "solicitarColeta/cancelarColeta";
	}

	@RequestMapping("/cancelarColeta")
	public String cancelarColeta(Pedido solicitarcoleta, Model model) {
		PedidoDao dao = new PedidoDao();
		dao.remover(solicitarcoleta);
		model.addAttribute("msg", "Coleta cancelada com sucesso!");
		return "forward:listarColeta";

	}
}
