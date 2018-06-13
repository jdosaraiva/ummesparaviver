package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;
import java.io.Serializable;

public class UsuarioRole implements Serializable, IsSerializable
{
  private UsuarioRoleId id;
  
  public UsuarioRole() {}
  
  public UsuarioRole(UsuarioRoleId id)
  {
    this.id = id;
  }
  
  public UsuarioRoleId getId() {
    return this.id;
  }
  
  public void setId(UsuarioRoleId id) {
    this.id = id;
  }
  
  public int hashCode()
  {
    int prime = 31;
    int result = 1;
    result = 31 * result + (this.id == null ? 0 : this.id.hashCode());
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
    UsuarioRole other = (UsuarioRole)obj;
    if (this.id == null) {
      if (other.id != null)
        return false;
    } else if (!this.id.equals(other.id))
      return false;
    return true;
  }
}
