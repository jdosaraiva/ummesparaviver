package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;

public class Grupo implements java.io.Serializable, IsSerializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7600914330765773000L;
	private Integer codigo;
	private Integer codigoFacilitador;
	private Integer codigoHospedeiro;
	private TipoGrupo tipoGrupo;
	private String grupoOutro;
	private DiaSemana diaSemana;
	private Horario horario;
	private Integer quantidadeMaxima;

	public Integer getCodigo() {
		return this.codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public Integer getCodigoFacilitador() {
		return this.codigoFacilitador;
	}

	public void setCodigoFacilitador(Integer codigoFacilitador) {
		this.codigoFacilitador = codigoFacilitador;
	}

	public Integer getCodigoHospedeiro() {
		return this.codigoHospedeiro;
	}

	public void setCodigoHospedeiro(Integer codigoHospedeiro) {
		this.codigoHospedeiro = codigoHospedeiro;
	}

	public TipoGrupo getTipoGrupo() {
		return this.tipoGrupo;
	}

	public void setTipoGrupo(TipoGrupo tipoGrupo) {
		this.tipoGrupo = tipoGrupo;
	}

	public String getGrupoOutro() {
		return this.grupoOutro;
	}

	public void setGrupoOutro(String grupoOutro) {
		this.grupoOutro = grupoOutro;
	}

	public DiaSemana getDiaSemana() {
		return this.diaSemana;
	}

	public void setDiaSemana(DiaSemana diaSemana) {
		this.diaSemana = diaSemana;
	}

	public Horario getHorario() {
		return this.horario;
	}

	public void setHorario(Horario horario) {
		this.horario = horario;
	}

	public Integer getQuantidadeMaxima() {
		return this.quantidadeMaxima;
	}

	public void setQuantidadeMaxima(Integer quantidadeMaxima) {
		this.quantidadeMaxima = quantidadeMaxima;
	}
}
