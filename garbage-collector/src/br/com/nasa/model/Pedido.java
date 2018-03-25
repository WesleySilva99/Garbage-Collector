package br.com.nasa.model;

public class Pedido {
	private int id;
	private TipoColeta tipocoleta;
	private String descricao;
	private short quantidade;
	private String endereco;
	private String numero;
	private String cep;
	private int idMotorista;
	private Cliente cliente;
	private Motorista motorista;

	
	public int getIdMotorista() {
		return idMotorista;
	}

	public void setIdMotorista(int idMotorista) {
		this.idMotorista = idMotorista;
	}
	public Motorista getMotorista() {
		return motorista;
	}

	public void setMotorista(Motorista motorista) {
		this.motorista = motorista;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

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

	public TipoColeta getTipocoleta() {
		return tipocoleta;
	}

	public void setTipocoleta(TipoColeta tipocoleta) {
		this.tipocoleta = tipocoleta;
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
