package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;

public class Role implements java.io.Serializable, IsSerializable
{
  private String codigo;
  private String descricao;
  
  public String getCodigo()
  {
    return this.codigo;
  }
  
  public void setCodigo(String codigo) {
    this.codigo = codigo;
  }
  
  public String getDescricao() {
    return this.descricao;
  }
  
  public void setDescricao(String descricao) {
    this.descricao = descricao;
  }
}
