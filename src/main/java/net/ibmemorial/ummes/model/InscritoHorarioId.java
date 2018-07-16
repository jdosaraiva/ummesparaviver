package net.ibmemorial.ummes.model;

import java.io.Serializable;

import com.google.gwt.user.client.rpc.IsSerializable;

public class InscritoHorarioId implements Serializable, IsSerializable {
	private static final long serialVersionUID = 2265869735348118258L;
	private Integer codigoInscrito;
	private Integer codigoHorario;

	public InscritoHorarioId() {
	}

	public InscritoHorarioId(Integer codigoInscrito, Integer codigoHorario) {
		this.codigoInscrito = codigoInscrito;
		this.codigoHorario = codigoHorario;
	}

	public Integer getCodigoInscrito() {
		return this.codigoInscrito;
	}

	public void setCodigoInscrito(Integer codigoInscrito) {
		this.codigoInscrito = codigoInscrito;
	}

	public Integer getCodigoHorario() {
		return this.codigoHorario;
	}

	public void setCodigoHorario(Integer codigoHorario) {
		this.codigoHorario = codigoHorario;
	}

	public int hashCode() {
		int prime = 31;
		int result = 1;
		result = 31 * result + (this.codigoHorario == null ? 0 : this.codigoHorario.hashCode());
		result = 31 * result + (this.codigoInscrito == null ? 0 : this.codigoInscrito.hashCode());
		return result;
	}

	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		InscritoHorarioId other = (InscritoHorarioId) obj;
		if (this.codigoHorario == null) {
			if (other.codigoHorario != null)
				return false;
		} else if (!this.codigoHorario.equals(other.codigoHorario))
			return false;
		if (this.codigoInscrito == null) {
			if (other.codigoInscrito != null)
				return false;
		} else if (!this.codigoInscrito.equals(other.codigoInscrito))
			return false;
		return true;
	}
}
