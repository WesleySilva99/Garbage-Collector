package br.com.nasa.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String CadastraSolicitarColeta(Pedido solicitarcoleta, HttpSession session, Model model) {
		PedidoDao dao = new PedidoDao();
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
		solicitarcoleta.setCliente(cliente);
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
	
	@RequestMapping("/listarColetaCliente")
	public String listarColetaCliente(HttpSession session,Model model) {
		PedidoDao dao = new PedidoDao();
		Cliente cliente = (Cliente) session.getAttribute("clienteLogado");
		int id = cliente.getId();
		List<Pedido> listaColeta = dao.listarPorCliente(id);
		model.addAttribute("listaColeta", listaColeta);
		System.out.println("Mostrando listar");
		return "solicitarColeta/listaColetas";
	}

	@RequestMapping("/cancelarColeta")
	public String cancelarColeta(Pedido solicitarcoleta, Model model) {
		PedidoDao dao = new PedidoDao();
		dao.cancelar(solicitarcoleta);
		model.addAttribute("msg", "Coleta cancelada com sucesso!");
		return "forward:listarColeta";

	}
	
	@RequestMapping("/exibiralterarPedido")
	public String exibiralterarPedido(Pedido p, Model model) {

		PedidoDao dao = new PedidoDao();
		Pedido pCompleto = dao.pegarId(p.getId());
		model.addAttribute("p", pCompleto);
		
		TipoColetaDao dao1 = new TipoColetaDao();
		List<TipoColeta> tc = dao1.listar();
		model.addAttribute("tc", tc);
		return "solicitarColeta/alterarColeta";
	}

	@RequestMapping("/alterarPedido")
	public String alterarPedido(Pedido p, Model model) throws SQLException {
		
		
		PedidoDao dao = new PedidoDao();
		dao.alterar(p);
		model.addAttribute("msg", "Coleta alterada com sucesso.");
		System.out.println("Coleta alterada com sucesso");
		return "forward:listarColetaCliente";
	}
}
