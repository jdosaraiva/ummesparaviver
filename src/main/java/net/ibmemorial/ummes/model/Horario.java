package net.ibmemorial.ummes.model;

public enum Horario implements IEnum {
  MANHA(0, "Manhã"),  TARDE(1, "Tarde"),  NOITE(2, "Noite");
  
  private final int id;
  private final String descricao;
  
  private Horario(int id, String descricao) {
    this.id = id;
    this.descricao = descricao;
  }
  
  public int getId() {
    return this.id;
  }
  
  public String getDescricao() {
    return this.descricao;
  }
  
  public static Horario valueOf(int id) {
    if ((id < 0) || (id > 2)) {
      return null;
    }
    
    return values()[id];
  }
}
