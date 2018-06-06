/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class InscritoHorario implements Serializable, IsSerializable
/*    */ {
/*    */   private InscritoHorarioId id;
/*    */   
/*    */   public InscritoHorario() {}
/*    */   
/*    */   public InscritoHorario(InscritoHorarioId id)
/*    */   {
/* 14 */     this.id = id;
/*    */   }
/*    */   
/*    */   public InscritoHorarioId getId() {
/* 18 */     return this.id;
/*    */   }
/*    */   
/*    */   public void setId(InscritoHorarioId id) {
/* 22 */     this.id = id;
/*    */   }
/*    */ }
