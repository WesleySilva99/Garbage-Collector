package br.com.nasa.model;

public class Usuario {

	private int idUsuario;
	private String login;
	private String Senha;
	private TipoUsuario tpUsuario;

	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return Senha;
	}

	public void setSenha(String senha) {
		Senha = senha;
	}

	public TipoUsuario getTpUsuario() {
		return tpUsuario;
	}

	public void setTpUsuario(TipoUsuario tpUsuario) {
		this.tpUsuario = tpUsuario;
	}

}
