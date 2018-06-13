package net.ibmemorial.ummes.model;

public enum DiaSemana implements IEnum {
  DOMINGO(1, "Domingo"),  SEGUNDA(2, "Segunda-Feira"),  TERCA(3, "Terça-Feira"),  QUARTA(4, "Quarta-Feira"),  QUINTA(
    5, "Quinta-Feira"),  SEXTA(6, "Sexta-Feira"),  SABADO(7, "Sábado");
  
  private final int id;
  private final String descricao;
  
  private DiaSemana(int id, String descricao) {
    this.id = id;
    this.descricao = descricao;
  }
  
  public int getId() {
    return this.id;
  }
  
  public String getDescricao() {
    return this.descricao;
  }
  
  public static DiaSemana valueOf(int id) {
    if ((id < 1) || (id > 7)) {
      return null;
    }
    
    return values()[(id - 1)];
  }
}
