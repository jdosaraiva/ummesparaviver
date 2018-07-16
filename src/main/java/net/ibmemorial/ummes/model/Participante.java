package net.ibmemorial.ummes.model;

import java.util.Date;

import com.google.gwt.user.client.rpc.IsSerializable;

public class Participante implements java.io.Serializable, IsSerializable {
	private static final long serialVersionUID = 3152071086728533003L;
	private Integer codigo;
	private Integer codigoGrupo;
	private String nome;
	private String email;
	private String telefone;
	private String outroTelefone;
	private Integer quantidadeCriancas;
	private Date dataCadastro;

	public Integer getCodigo() {
		return this.codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public Integer getCodigoGrupo() {
		return this.codigoGrupo;
	}

	public void setCodigoGrupo(Integer codigoGrupo) {
		this.codigoGrupo = codigoGrupo;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getOutroTelefone() {
		return this.outroTelefone;
	}

	public void setOutroTelefone(String outroTelefone) {
		this.outroTelefone = outroTelefone;
	}

	public Date getDataCadastro() {
		return this.dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public Integer getQuantidadeCriancas() {
		return this.quantidadeCriancas;
	}

	public void setQuantidadeCriancas(Integer quantidadeCriancas) {
		this.quantidadeCriancas = quantidadeCriancas;
	}
}
