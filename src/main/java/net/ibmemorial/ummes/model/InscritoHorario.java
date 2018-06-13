package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;
import java.io.Serializable;

public class InscritoHorario implements Serializable, IsSerializable
{
  private InscritoHorarioId id;
  
  public InscritoHorario() {}
  
  public InscritoHorario(InscritoHorarioId id)
  {
    this.id = id;
  }
  
  public InscritoHorarioId getId() {
    return this.id;
  }
  
  public void setId(InscritoHorarioId id) {
    this.id = id;
  }
}
