package net.ibmemorial.ummes.model;

import java.io.Serializable;

import com.google.gwt.user.client.rpc.IsSerializable;

public class InscritoHorario implements Serializable, IsSerializable {
	private static final long serialVersionUID = 7800944604928117565L;
	private InscritoHorarioId id;

	public InscritoHorario() {
	}

	public InscritoHorario(InscritoHorarioId id) {
		this.id = id;
	}

	public InscritoHorarioId getId() {
		return this.id;
	}

	public void setId(InscritoHorarioId id) {
		this.id = id;
	}
}
