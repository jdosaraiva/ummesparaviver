package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;
import java.io.Serializable;

public class InscritoGrupoId implements Serializable, IsSerializable
{
  private Integer codigoInscrito;
  private Integer codigoGrupo;
  
  public InscritoGrupoId() {}
  
  public InscritoGrupoId(Integer codigoInscrito, Integer codigoGrupo)
  {
    this.codigoInscrito = codigoInscrito;
    this.codigoGrupo = codigoGrupo;
  }
  
  public Integer getCodigoInscrito() {
    return this.codigoInscrito;
  }
  
  public void setCodigoInscrito(Integer codigoInscrito) {
    this.codigoInscrito = codigoInscrito;
  }
  
  public Integer getCodigoGrupo() {
    return this.codigoGrupo;
  }
  
  public void setCodigoGrupo(Integer codigoGrupo) {
    this.codigoGrupo = codigoGrupo;
  }
  
  public int hashCode()
  {
    int prime = 31;
    int result = 1;
    result = 31 * result + (this.codigoGrupo == null ? 0 : this.codigoGrupo.hashCode());
    result = 31 * result + (this.codigoInscrito == null ? 0 : this.codigoInscrito.hashCode());
    return result;
  }
  
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    InscritoGrupoId other = (InscritoGrupoId)obj;
    if (this.codigoGrupo == null) {
      if (other.codigoGrupo != null)
        return false;
    } else if (!this.codigoGrupo.equals(other.codigoGrupo))
      return false;
    if (this.codigoInscrito == null) {
      if (other.codigoInscrito != null)
        return false;
    } else if (!this.codigoInscrito.equals(other.codigoInscrito))
      return false;
    return true;
  }
}
