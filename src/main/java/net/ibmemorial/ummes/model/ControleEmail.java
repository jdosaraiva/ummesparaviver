/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class ControleEmail implements Serializable, IsSerializable
/*    */ {
/*    */   private Integer codigo;
/*    */   private Integer codigoInscrito;
/*    */   private Integer tipoEmail;
/*    */   
/*    */   public ControleEmail() {}
/*    */   
/*    */   public ControleEmail(Integer codigoInscrito, Integer tipoEmail)
/*    */   {
/* 16 */     this.codigoInscrito = codigoInscrito;
/* 17 */     this.tipoEmail = tipoEmail;
/*    */   }
/*    */   
/*    */   public Integer getCodigo() {
/* 21 */     return this.codigo;
/*    */   }
/*    */   
/*    */   public void setCodigo(Integer codigo) {
/* 25 */     this.codigo = codigo;
/*    */   }
/*    */   
/*    */   public Integer getCodigoInscrito() {
/* 29 */     return this.codigoInscrito;
/*    */   }
/*    */   
/*    */   public void setCodigoInscrito(Integer codigoInscrito) {
/* 33 */     this.codigoInscrito = codigoInscrito;
/*    */   }
/*    */   
/*    */   public Integer getTipoEmail() {
/* 37 */     return this.tipoEmail;
/*    */   }
/*    */   
/*    */   public void setTipoEmail(Integer tipoEmail) {
/* 41 */     this.tipoEmail = tipoEmail;
/*    */   }
/*    */ }
