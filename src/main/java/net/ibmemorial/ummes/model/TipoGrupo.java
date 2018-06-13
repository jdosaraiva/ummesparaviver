package net.ibmemorial.ummes.model;

public enum TipoGrupo implements IEnum
{
  ADOLESCENTES(1, "Adolescentes"), 
  CASAIS_SEM_FILHOS(2, "Casais sem Filhos"), 
  CASAIS_COM_FILHOS(3, "Casais com Filhos"), 
  MISTO_COM_CRIANCAS(4, "Misto com Crianças"), 
  MISTO_SEM_CRIANCAS(5, "Misto sem Crianças"), 
  JOVENS(6, "Jovens"), 
  MULHERES(7, "Mulheres"), 
  FAMILIARES(8, "Familiares"), 
  PROFISSIONAL(9, "Profissional"), 
  SOZINHOS(10, "Sozinhos"), 
  HOMENS(11, "Homens"), 
  SURDOS(12, "Surdos"), 
  ESCOLA(13, "Escola"), 
  ESCOTEIROS(14, "Escoteiros"), 
  OUTRO(99, "Outro");
  
  private final int id;
  private final String descricao;
  
  private TipoGrupo(int id, String descricao) {
    this.id = id;
    this.descricao = descricao;
  }
  
  public int getId() {
    return this.id;
  }
  

  public String getDescricao() { return this.descricao; }
  
  public static TipoGrupo valueOf(int id) {
    TipoGrupo[] arrayOfTipoGrupo;
    int j = (arrayOfTipoGrupo = values()).length; for (int i = 0; i < j; i++) { TipoGrupo g = arrayOfTipoGrupo[i];
      if (g.id == id) {
        return g;
      }
    }
    
    return null;
  }
}
