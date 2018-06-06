/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ public enum Horario implements IEnum {
/*  4 */   MANHA(0, "Manhã"),  TARDE(1, "Tarde"),  NOITE(2, "Noite");
/*    */   
/*    */   private final int id;
/*    */   private final String descricao;
/*    */   
/*    */   private Horario(int id, String descricao) {
/* 10 */     this.id = id;
/* 11 */     this.descricao = descricao;
/*    */   }
/*    */   
/*    */   public int getId() {
/* 15 */     return this.id;
/*    */   }
/*    */   
/*    */   public String getDescricao() {
/* 19 */     return this.descricao;
/*    */   }
/*    */   
/*    */   public static Horario valueOf(int id) {
/* 23 */     if ((id < 0) || (id > 2)) {
/* 24 */       return null;
/*    */     }
/*    */     
/* 27 */     return values()[id];
/*    */   }
/*    */ }
