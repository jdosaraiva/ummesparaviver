package net.ibmemorial.ummes.model;

import java.io.Serializable;

public class ControleEmail implements Serializable
{
  private Integer codigo;
  private Integer codigoInscrito;
  private Integer tipoEmail;
  
  public ControleEmail() {}
  
  public ControleEmail(Integer codigoInscrito, Integer tipoEmail)
  {
    this.codigoInscrito = codigoInscrito;
    this.tipoEmail = tipoEmail;
  }
  
  public Integer getCodigo() {
    return this.codigo;
  }
  
  public void setCodigo(Integer codigo) {
    this.codigo = codigo;
  }
  
  public Integer getCodigoInscrito() {
    return this.codigoInscrito;
  }
  
  public void setCodigoInscrito(Integer codigoInscrito) {
    this.codigoInscrito = codigoInscrito;
  }
  
  public Integer getTipoEmail() {
    return this.tipoEmail;
  }
  
  public void setTipoEmail(Integer tipoEmail) {
    this.tipoEmail = tipoEmail;
  }
}
