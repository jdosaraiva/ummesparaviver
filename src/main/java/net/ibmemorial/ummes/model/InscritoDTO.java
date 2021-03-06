package net.ibmemorial.ummes.model;

import java.io.Serializable;

import com.google.gwt.user.client.rpc.IsSerializable;

public class InscritoDTO implements Serializable, IsSerializable {
	private static final long serialVersionUID = -3529959540645099512L;
	private Inscrito inscrito;
	private DiaSemana[] diasSemana;
	private Horario[] horarios;
	private TipoGrupo[] tiposGrupo;

	public InscritoDTO() {
	}

	public InscritoDTO(Inscrito inscrito, DiaSemana[] diasSemana, Horario[] horarios, TipoGrupo[] tiposGrupo) {
		this.inscrito = inscrito;
		this.diasSemana = diasSemana;
		this.horarios = horarios;
		this.tiposGrupo = tiposGrupo;
	}

	public Inscrito getInscrito() {
		return this.inscrito;
	}

	public void setInscrito(Inscrito inscrito) {
		this.inscrito = inscrito;
	}

	public DiaSemana[] getDiasSemana() {
		return this.diasSemana;
	}

	public void setDiasSemana(DiaSemana[] diasSemana) {
		this.diasSemana = diasSemana;
	}

	public Horario[] getHorarios() {
		return this.horarios;
	}

	public void setHorarios(Horario[] horarios) {
		this.horarios = horarios;
	}

	public TipoGrupo[] getTiposGrupo() {
		return this.tiposGrupo;
	}

	public void setTiposGrupo(TipoGrupo[] tiposGrupo) {
		this.tiposGrupo = tiposGrupo;
	}
}
