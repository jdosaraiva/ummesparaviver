/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ 
/*    */ public class Role implements java.io.Serializable, IsSerializable
/*    */ {
/*    */   private String codigo;
/*    */   private String descricao;
/*    */   
/*    */   public String getCodigo()
/*    */   {
/* 12 */     return this.codigo;
/*    */   }
/*    */   
/*    */   public void setCodigo(String codigo) {
/* 16 */     this.codigo = codigo;
/*    */   }
/*    */   
/*    */   public String getDescricao() {
/* 20 */     return this.descricao;
/*    */   }
/*    */   
/*    */   public void setDescricao(String descricao) {
/* 24 */     this.descricao = descricao;
/*    */   }
/*    */ }
