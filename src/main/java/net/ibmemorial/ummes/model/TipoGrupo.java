/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ public enum TipoGrupo implements IEnum
/*    */ {
/*  5 */   ADOLESCENTES(1, "Adolescentes"), 
/*  6 */   CASAIS_SEM_FILHOS(2, "Casais sem Filhos"), 
/*  7 */   CASAIS_COM_FILHOS(3, "Casais com Filhos"), 
/*  8 */   MISTO_COM_CRIANCAS(4, "Misto com Crianças"), 
/*  9 */   MISTO_SEM_CRIANCAS(5, "Misto sem Crianças"), 
/* 10 */   JOVENS(6, "Jovens"), 
/* 11 */   MULHERES(7, "Mulheres"), 
/* 12 */   FAMILIARES(8, "Familiares"), 
/* 13 */   PROFISSIONAL(9, "Profissional"), 
/* 14 */   SOZINHOS(10, "Sozinhos"), 
/* 15 */   HOMENS(11, "Homens"), 
/* 16 */   SURDOS(12, "Surdos"), 
/* 17 */   ESCOLA(13, "Escola"), 
/* 18 */   ESCOTEIROS(14, "Escoteiros"), 
/* 19 */   OUTRO(99, "Outro");
/*    */   
/*    */   private final int id;
/*    */   private final String descricao;
/*    */   
/*    */   private TipoGrupo(int id, String descricao) {
/* 25 */     this.id = id;
/* 26 */     this.descricao = descricao;
/*    */   }
/*    */   
/*    */   public int getId() {
/* 30 */     return this.id;
/*    */   }
/*    */   
/*    */ 
/* 34 */   public String getDescricao() { return this.descricao; }
/*    */   
/*    */   public static TipoGrupo valueOf(int id) {
/*    */     TipoGrupo[] arrayOfTipoGrupo;
/* 38 */     int j = (arrayOfTipoGrupo = values()).length; for (int i = 0; i < j; i++) { TipoGrupo g = arrayOfTipoGrupo[i];
/* 39 */       if (g.id == id) {
/* 40 */         return g;
/*    */       }
/*    */     }
/*    */     
/* 44 */     return null;
/*    */   }
/*    */ }
