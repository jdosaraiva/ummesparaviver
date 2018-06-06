/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class UsuarioRoleId implements Serializable, IsSerializable
/*    */ {
/*    */   private String login;
/*    */   private String role;
/*    */   
/*    */   public UsuarioRoleId() {}
/*    */   
/*    */   public UsuarioRoleId(String login, String role)
/*    */   {
/* 15 */     this.login = login;
/* 16 */     this.role = role;
/*    */   }
/*    */   
/*    */   public String getLogin() {
/* 20 */     return this.login;
/*    */   }
/*    */   
/*    */   public void setLogin(String login) {
/* 24 */     this.login = login;
/*    */   }
/*    */   
/*    */   public String getRole() {
/* 28 */     return this.role;
/*    */   }
/*    */   
/*    */   public void setRole(String role) {
/* 32 */     this.role = role;
/*    */   }
/*    */ }
