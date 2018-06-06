/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class InscritoDiaSemana implements Serializable, IsSerializable
/*    */ {
/*    */   private InscritoDiaSemanaId id;
/*    */   
/*    */   public InscritoDiaSemana() {}
/*    */   
/*    */   public InscritoDiaSemana(InscritoDiaSemanaId id)
/*    */   {
/* 14 */     this.id = id;
/*    */   }
/*    */   
/*    */   public InscritoDiaSemanaId getId() {
/* 18 */     return this.id;
/*    */   }
/*    */   
/*    */   public void setId(InscritoDiaSemanaId id) {
/* 22 */     this.id = id;
/*    */   }
/*    */ }
