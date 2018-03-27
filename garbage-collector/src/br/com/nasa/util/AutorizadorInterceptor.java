package br.com.nasa.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {

		String uri = request.getRequestURI();
		if (uri.contains("bootstrap") || uri.contains("assets") || uri.contains("fonts") || uri.contains("sass")
				|| uri.contains("css") || uri.contains("img") || uri.contains("js")
				|| uri.endsWith("garbage-collector/") || uri.endsWith("garbage-collector/login")
				|| uri.endsWith("garbage-collector/exibirIncluirCliente")
				|| uri.endsWith("garbage-collector/cadastrarCliente") || uri.endsWith("garbage-collector/rank")
				|| uri.endsWith("garbage-collector/efetuarLogin")) {
			return true;
		}

		if (request.getSession().getAttribute("clienteLogado") != null && (uri.endsWith("garbage-collector/")
				|| uri.endsWith("garbage-collector/exibirSolicitarColeta")
				|| uri.endsWith("garbage-collector/listarColetaCliente")
				|| uri.endsWith("garbage-collector/rank")
				|| uri.contains("garbage-collector/alterarCliente")
				|| uri.contains("garbage-collector/alterarCliente2")
				|| uri.endsWith("garbage-collector/logout"))) {
			return true;
		}

		if (request.getSession().getAttribute("motoristaLogado") != null && 
				(uri.endsWith("garbage-collector/listarColeta")
				|| uri.endsWith("garbage-collector/rank")
				|| uri.contains("garbage-collector/exibiralterarMotorista")
				|| uri.endsWith("garbage-collector/logout"))) {
			return true;
		}

		if (request.getSession().getAttribute("AdmLogado") != null ) {
			
			return true;
		}

		response.sendRedirect("/garbage-collector");
		return false;
	}

}
