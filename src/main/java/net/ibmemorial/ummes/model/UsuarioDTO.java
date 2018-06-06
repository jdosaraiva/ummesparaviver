/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class UsuarioDTO implements Serializable, IsSerializable
/*    */ {
/*    */   private Usuario usuario;
/*    */   private Role[] roles;
/*    */   
/*    */   public UsuarioDTO() {}
/*    */   
/*    */   public UsuarioDTO(Usuario usuario, Role[] roles)
/*    */   {
/* 15 */     this.usuario = usuario;
/* 16 */     this.roles = roles;
/*    */   }
/*    */   
/*    */   public Usuario getUsuario() {
/* 20 */     return this.usuario;
/*    */   }
/*    */   
/*    */   public void setUsuario(Usuario usuario) {
/* 24 */     this.usuario = usuario;
/*    */   }
/*    */   
/*    */   public Role[] getRoles() {
/* 28 */     return this.roles;
/*    */   }
/*    */   
/*    */   public void setRoles(Role[] roles) {
/* 32 */     this.roles = roles;
/*    */   }
/*    */   
/*    */   public boolean isUserInRole(String role) {
/* 36 */     if (this.roles == null) {
/* 37 */       return false;
/*    */     }
/*    */     Role[] arrayOfRole;
/* 40 */     int j = (arrayOfRole = this.roles).length; for (int i = 0; i < j; i++) { Role r = arrayOfRole[i];
/* 41 */       if (r.getCodigo().equals(role)) {
/* 42 */         return true;
/*    */       }
/*    */     }
/*    */     
/* 46 */     return false;
/*    */   }
/*    */ }
