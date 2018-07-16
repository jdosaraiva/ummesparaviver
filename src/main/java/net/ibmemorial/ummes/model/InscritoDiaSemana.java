package net.ibmemorial.ummes.model;

import java.io.Serializable;

import com.google.gwt.user.client.rpc.IsSerializable;

public class InscritoDiaSemana implements Serializable, IsSerializable {
	private static final long serialVersionUID = -8148736683885150149L;
	private InscritoDiaSemanaId id;

	public InscritoDiaSemana() {
	}

	public InscritoDiaSemana(InscritoDiaSemanaId id) {
		this.id = id;
	}

	public InscritoDiaSemanaId getId() {
		return this.id;
	}

	public void setId(InscritoDiaSemanaId id) {
		this.id = id;
	}
}
