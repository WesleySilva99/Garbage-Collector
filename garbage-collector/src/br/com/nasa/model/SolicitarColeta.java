package br.com.nasa.model;

public class SolicitarColeta {
	private int id;
	private String tipoColeta;
	private String descricao;
	private short quantidade;
	private String endereco;
	
	public String getEndereco() { 
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipoColeta() {
		return tipoColeta;
	}
	public void setTipoColeta(String tipoColeta) {
		this.tipoColeta = tipoColeta;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public short getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(short quantidade) {
		this.quantidade = quantidade;
	}

}
