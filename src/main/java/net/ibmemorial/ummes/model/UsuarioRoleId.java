package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;
import java.io.Serializable;

public class UsuarioRoleId implements Serializable, IsSerializable
{
  private String login;
  private String role;
  
  public UsuarioRoleId() {}
  
  public UsuarioRoleId(String login, String role)
  {
    this.login = login;
    this.role = role;
  }
  
  public String getLogin() {
    return this.login;
  }
  
  public void setLogin(String login) {
    this.login = login;
  }
  
  public String getRole() {
    return this.role;
  }
  
  public void setRole(String role) {
    this.role = role;
  }
}
