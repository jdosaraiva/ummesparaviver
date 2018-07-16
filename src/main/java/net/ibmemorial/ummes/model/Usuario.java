package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;

public class Usuario implements java.io.Serializable, IsSerializable {
	
	private static final long serialVersionUID = 4451313469146184864L;
	private String login;
	private String nome;
	private String senha;
	private Integer codigoInscrito;

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Integer getCodigoInscrito() {
		return this.codigoInscrito;
	}

	public void setCodigoInscrito(Integer codigoInscrito) {
		this.codigoInscrito = codigoInscrito;
	}
}
