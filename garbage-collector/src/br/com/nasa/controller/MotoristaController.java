package br.com.nasa.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.nasa.dao.ClienteDao;
import br.com.nasa.dao.EnderecoDao;
import br.com.nasa.dao.MotoristaDao;
import br.com.nasa.dao.TipoColetaDao;
import br.com.nasa.dao.VeiculoDao;
import br.com.nasa.model.Cliente;
import br.com.nasa.model.Endereco;
import br.com.nasa.model.Motorista;
import br.com.nasa.model.TipoColeta;
import br.com.nasa.model.Veiculo;

@Controller
public class MotoristaController {

	@RequestMapping("/exibirCadastrarMotorista")
	public String exibirCadastrarMotorista() {
		System.out.println("Exibindo tela de cadastrar motorista!");
		return "motorista/cadastrarMotorista";
	}

	@RequestMapping("/cadastrarMotorista")
	public String cadastrarMotorista(Motorista motorista, Model model) throws SQLException {
		MotoristaDao dao = new MotoristaDao();
		

		if (dao.verificaLoginExistente(motorista.getLogin()) == true  && dao.verificaEmailExistente(motorista.getEmail()) == true) {

			dao.Inserir(motorista);
			
			System.out.println("Cadastrando Motorista");
			model.addAttribute("msg", "Motorista Cadastrado!");
			return "forward:exibirCadastrarMotorista";
		
	} else if(dao.verificaLoginExistente(motorista.getLogin()) == false) {

		model.addAttribute("msg", "O login já existe!");
		model.addAttribute("m", motorista);
		System.out.println("Tente novamente, Login já existente");
		return "motorista/cadastrarMotorista";

	}else if (dao.verificaEmailExistente(motorista.getEmail()) == false) {
		model.addAttribute("msg", "O email já existe!");
		model.addAttribute("m", motorista);
		System.out.println("Tente novamente, email já existente");
		return "motorista/cadastrarMotorista";

	}
			return "forward:exibirCadastrarMotorista";
}



	@RequestMapping("/listaMotorista")
	public String exibirListaMotorista(Model model) {
		MotoristaDao dao = new MotoristaDao();
		List<Motorista> listaMotorista = dao.listar();
		model.addAttribute("listaMotorista", listaMotorista);
		System.out.println("Exibindo lista de motorista.");
		return "motorista/listaMotorista";
	}
	
	@RequestMapping("/removerMotorista")
	public String removerMotorista(Motorista m, Model model) {
		MotoristaDao dao = new MotoristaDao();
		dao.remover(m);
		model.addAttribute("msg", "Motorista removido com sucesso!");
		return "forward:listaMotorista";

	}
	@RequestMapping("exibiralterarMotorista")
	public String exibiralterarMotorista(Motorista m, Model model) {

		MotoristaDao dao = new MotoristaDao();
		Motorista mCompleto = dao.pegarId(m.getId());
		model.addAttribute("p", mCompleto);

		return "motorista/alterarMotorista";
	}

	@RequestMapping("alterarMotorista")
	public String alterarMotorista(Motorista m, Model model) {

		MotoristaDao dao = new MotoristaDao();
		dao.alterar(m);
		model.addAttribute("msg", "Motorista alterado.");
		System.out.println("motorista alterado com sucesso");
		return "forward:listaMotorista";
	}
}
