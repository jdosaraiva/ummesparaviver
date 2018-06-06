/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ 
/*    */ public class Usuario implements java.io.Serializable, IsSerializable
/*    */ {
/*    */   private String login;
/*    */   private String nome;
/*    */   private String senha;
/*    */   private Integer codigoInscrito;
/*    */   
/*    */   public String getLogin()
/*    */   {
/* 14 */     return this.login;
/*    */   }
/*    */   
/*    */   public void setLogin(String login) {
/* 18 */     this.login = login;
/*    */   }
/*    */   
/*    */   public String getNome() {
/* 22 */     return this.nome;
/*    */   }
/*    */   
/*    */   public void setNome(String nome) {
/* 26 */     this.nome = nome;
/*    */   }
/*    */   
/*    */   public String getSenha() {
/* 30 */     return this.senha;
/*    */   }
/*    */   
/*    */   public void setSenha(String senha) {
/* 34 */     this.senha = senha;
/*    */   }
/*    */   
/*    */   public Integer getCodigoInscrito() {
/* 38 */     return this.codigoInscrito;
/*    */   }
/*    */   
/*    */   public void setCodigoInscrito(Integer codigoInscrito) {
/* 42 */     this.codigoInscrito = codigoInscrito;
/*    */   }
/*    */ }
