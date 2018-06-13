package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;
import java.io.Serializable;

public class GrupoDTO implements Serializable, IsSerializable
{
  private Grupo grupo;
  private Inscrito facilitador;
  private Inscrito hospedeiro;
  private int vagasDisponiveis;
  
  public GrupoDTO() {}
  
  public GrupoDTO(Grupo grupo, Inscrito facilitador, Inscrito hospedeiro, Number qtdeInscritos)
  {
    this.grupo = grupo;
    this.facilitador = facilitador;
    this.hospedeiro = hospedeiro;
    setQuantidadeInscritos(qtdeInscritos.intValue());
  }
  
  public Grupo getGrupo() {
    return this.grupo;
  }
  
  public void setGrupo(Grupo grupo) {
    this.grupo = grupo;
  }
  
  public Inscrito getFacilitador() {
    return this.facilitador;
  }
  
  public void setFacilitador(Inscrito facilitador) {
    this.facilitador = facilitador;
  }
  
  public Inscrito getHospedeiro() {
    return this.hospedeiro;
  }
  
  public void setHospedeiro(Inscrito hospedeiro) {
    this.hospedeiro = hospedeiro;
  }
  
  public int getVagasDisponiveis() {
    return this.vagasDisponiveis;
  }
  
  public void setVagasDisponiveis(int vagasDisponiveis) {
    this.vagasDisponiveis = vagasDisponiveis;
  }
  
  public void setQuantidadeInscritos(int qtdeInscritos) {
    setVagasDisponiveis(this.facilitador.getCodigo().equals(
      this.hospedeiro.getCodigo()) ? this.grupo.getQuantidadeMaxima().intValue() - 
      qtdeInscritos - 1 : this.grupo.getQuantidadeMaxima().intValue() - 
      qtdeInscritos - 2);
  }
}
