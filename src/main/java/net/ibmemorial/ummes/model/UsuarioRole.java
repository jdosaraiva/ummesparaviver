/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class UsuarioRole implements Serializable, IsSerializable
/*    */ {
/*    */   private UsuarioRoleId id;
/*    */   
/*    */   public UsuarioRole() {}
/*    */   
/*    */   public UsuarioRole(UsuarioRoleId id)
/*    */   {
/* 14 */     this.id = id;
/*    */   }
/*    */   
/*    */   public UsuarioRoleId getId() {
/* 18 */     return this.id;
/*    */   }
/*    */   
/*    */   public void setId(UsuarioRoleId id) {
/* 22 */     this.id = id;
/*    */   }
/*    */   
/*    */   public int hashCode()
/*    */   {
/* 27 */     int prime = 31;
/* 28 */     int result = 1;
/* 29 */     result = 31 * result + (this.id == null ? 0 : this.id.hashCode());
/* 30 */     return result;
/*    */   }
/*    */   
/*    */   public boolean equals(Object obj)
/*    */   {
/* 35 */     if (this == obj)
/* 36 */       return true;
/* 37 */     if (obj == null)
/* 38 */       return false;
/* 39 */     if (getClass() != obj.getClass())
/* 40 */       return false;
/* 41 */     UsuarioRole other = (UsuarioRole)obj;
/* 42 */     if (this.id == null) {
/* 43 */       if (other.id != null)
/* 44 */         return false;
/* 45 */     } else if (!this.id.equals(other.id))
/* 46 */       return false;
/* 47 */     return true;
/*    */   }
/*    */ }
