/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class InscritoHorarioId implements Serializable, IsSerializable
/*    */ {
/*    */   private Integer codigoInscrito;
/*    */   private Integer codigoHorario;
/*    */   
/*    */   public InscritoHorarioId() {}
/*    */   
/*    */   public InscritoHorarioId(Integer codigoInscrito, Integer codigoHorario)
/*    */   {
/* 15 */     this.codigoInscrito = codigoInscrito;
/* 16 */     this.codigoHorario = codigoHorario;
/*    */   }
/*    */   
/*    */   public Integer getCodigoInscrito() {
/* 20 */     return this.codigoInscrito;
/*    */   }
/*    */   
/*    */   public void setCodigoInscrito(Integer codigoInscrito) {
/* 24 */     this.codigoInscrito = codigoInscrito;
/*    */   }
/*    */   
/*    */   public Integer getCodigoHorario() {
/* 28 */     return this.codigoHorario;
/*    */   }
/*    */   
/*    */   public void setCodigoHorario(Integer codigoHorario) {
/* 32 */     this.codigoHorario = codigoHorario;
/*    */   }
/*    */   
/*    */   public int hashCode()
/*    */   {
/* 37 */     int prime = 31;
/* 38 */     int result = 1;
/* 39 */     result = 31 * result + (this.codigoHorario == null ? 0 : this.codigoHorario.hashCode());
/* 40 */     result = 31 * result + (this.codigoInscrito == null ? 0 : this.codigoInscrito.hashCode());
/* 41 */     return result;
/*    */   }
/*    */   
/*    */   public boolean equals(Object obj)
/*    */   {
/* 46 */     if (this == obj)
/* 47 */       return true;
/* 48 */     if (obj == null)
/* 49 */       return false;
/* 50 */     if (getClass() != obj.getClass())
/* 51 */       return false;
/* 52 */     InscritoHorarioId other = (InscritoHorarioId)obj;
/* 53 */     if (this.codigoHorario == null) {
/* 54 */       if (other.codigoHorario != null)
/* 55 */         return false;
/* 56 */     } else if (!this.codigoHorario.equals(other.codigoHorario))
/* 57 */       return false;
/* 58 */     if (this.codigoInscrito == null) {
/* 59 */       if (other.codigoInscrito != null)
/* 60 */         return false;
/* 61 */     } else if (!this.codigoInscrito.equals(other.codigoInscrito))
/* 62 */       return false;
/* 63 */     return true;
/*    */   }
/*    */ }
