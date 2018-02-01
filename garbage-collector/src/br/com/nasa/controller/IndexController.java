package br.com.nasa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class IndexController {
	@RequestMapping("/Index")
	public String exibirIndex() {
		System.out.println("tela de inicio.");
	return "index";
	}
}
