/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ public enum DiaSemana implements IEnum {
/*  4 */   DOMINGO(1, "Domingo"),  SEGUNDA(2, "Segunda-Feira"),  TERCA(3, "Terça-Feira"),  QUARTA(4, "Quarta-Feira"),  QUINTA(
/*  5 */     5, "Quinta-Feira"),  SEXTA(6, "Sexta-Feira"),  SABADO(7, "Sábado");
/*    */   
/*    */   private final int id;
/*    */   private final String descricao;
/*    */   
/*    */   private DiaSemana(int id, String descricao) {
/* 11 */     this.id = id;
/* 12 */     this.descricao = descricao;
/*    */   }
/*    */   
/*    */   public int getId() {
/* 16 */     return this.id;
/*    */   }
/*    */   
/*    */   public String getDescricao() {
/* 20 */     return this.descricao;
/*    */   }
/*    */   
/*    */   public static DiaSemana valueOf(int id) {
/* 24 */     if ((id < 1) || (id > 7)) {
/* 25 */       return null;
/*    */     }
/*    */     
/* 28 */     return values()[(id - 1)];
/*    */   }
/*    */ }
