/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ public enum Funcao implements IEnum {
/*  4 */   FACILITADOR(1),  HOSPEDEIRO(2),  AMBOS(99);
/*    */   
/*    */   private final int id;
/*    */   
/*    */   private Funcao(int id) {
/*  9 */     this.id = id;
/*    */   }
/*    */   
/*    */ 
/* 13 */   public int getId() { return this.id; }
/*    */   
/*    */   public static Funcao valueOf(int id) {
/*    */     Funcao[] arrayOfFuncao;
/* 17 */     int j = (arrayOfFuncao = values()).length; for (int i = 0; i < j; i++) { Funcao f = arrayOfFuncao[i];
/* 18 */       if (f.id == id) {
/* 19 */         return f;
/*    */       }
/*    */     }
/*    */     
/* 23 */     return null;
/*    */   }
/*    */ }
