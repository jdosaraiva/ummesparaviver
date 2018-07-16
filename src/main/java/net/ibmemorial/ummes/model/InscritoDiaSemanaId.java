package net.ibmemorial.ummes.model;

import java.io.Serializable;

import com.google.gwt.user.client.rpc.IsSerializable;

public class InscritoDiaSemanaId implements Serializable, IsSerializable {
	private static final long serialVersionUID = 3409955124172394324L;
	private Integer codigoInscrito;
	private Integer codigoDiaSemana;

	public InscritoDiaSemanaId() {
	}

	public InscritoDiaSemanaId(Integer codigoInscrito, Integer codigoDiaSemana) {
		this.codigoInscrito = codigoInscrito;
		this.codigoDiaSemana = codigoDiaSemana;
	}

	public Integer getCodigoInscrito() {
		return this.codigoInscrito;
	}

	public void setCodigoInscrito(Integer codigoInscrito) {
		this.codigoInscrito = codigoInscrito;
	}

	public Integer getCodigoDiaSemana() {
		return this.codigoDiaSemana;
	}

	public void setCodigoDiaSemana(Integer codigoDiaSemana) {
		this.codigoDiaSemana = codigoDiaSemana;
	}

	public int hashCode() {
		int prime = 31;
		int result = 1;
		result = 31 * result + (this.codigoDiaSemana == null ? 0 : this.codigoDiaSemana.hashCode());
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
		InscritoDiaSemanaId other = (InscritoDiaSemanaId) obj;
		if (this.codigoDiaSemana == null) {
			if (other.codigoDiaSemana != null)
				return false;
		} else if (!this.codigoDiaSemana.equals(other.codigoDiaSemana))
			return false;
		if (this.codigoInscrito == null) {
			if (other.codigoInscrito != null)
				return false;
		} else if (!this.codigoInscrito.equals(other.codigoInscrito))
			return false;
		return true;
	}
}
