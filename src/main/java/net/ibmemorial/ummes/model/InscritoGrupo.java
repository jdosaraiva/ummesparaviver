package net.ibmemorial.ummes.model;

import java.io.Serializable;

import com.google.gwt.user.client.rpc.IsSerializable;

public class InscritoGrupo implements Serializable, IsSerializable {
	private static final long serialVersionUID = 1893228528883651380L;
	private InscritoGrupoId id;

	public InscritoGrupo() {
	}

	public InscritoGrupo(InscritoGrupoId id) {
		this.id = id;
	}

	public InscritoGrupoId getId() {
		return this.id;
	}

	public void setId(InscritoGrupoId id) {
		this.id = id;
	}
}
