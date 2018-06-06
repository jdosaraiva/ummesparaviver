/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class InscritoGrupo implements Serializable, IsSerializable
/*    */ {
/*    */   private InscritoGrupoId id;
/*    */   
/*    */   public InscritoGrupo() {}
/*    */   
/*    */   public InscritoGrupo(InscritoGrupoId id)
/*    */   {
/* 14 */     this.id = id;
/*    */   }
/*    */   
/*    */   public InscritoGrupoId getId() {
/* 18 */     return this.id;
/*    */   }
/*    */   
/*    */   public void setId(InscritoGrupoId id) {
/* 22 */     this.id = id;
/*    */   }
/*    */ }
