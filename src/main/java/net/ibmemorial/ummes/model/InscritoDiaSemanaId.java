/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class InscritoDiaSemanaId implements Serializable, IsSerializable
/*    */ {
/*    */   private Integer codigoInscrito;
/*    */   private Integer codigoDiaSemana;
/*    */   
/*    */   public InscritoDiaSemanaId() {}
/*    */   
/*    */   public InscritoDiaSemanaId(Integer codigoInscrito, Integer codigoDiaSemana)
/*    */   {
/* 15 */     this.codigoInscrito = codigoInscrito;
/* 16 */     this.codigoDiaSemana = codigoDiaSemana;
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
/*    */   public Integer getCodigoDiaSemana() {
/* 28 */     return this.codigoDiaSemana;
/*    */   }
/*    */   
/*    */   public void setCodigoDiaSemana(Integer codigoDiaSemana) {
/* 32 */     this.codigoDiaSemana = codigoDiaSemana;
/*    */   }
/*    */   
/*    */   public int hashCode()
/*    */   {
/* 37 */     int prime = 31;
/* 38 */     int result = 1;
/* 39 */     result = 31 * result + (this.codigoDiaSemana == null ? 0 : this.codigoDiaSemana.hashCode());
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
/* 52 */     InscritoDiaSemanaId other = (InscritoDiaSemanaId)obj;
/* 53 */     if (this.codigoDiaSemana == null) {
/* 54 */       if (other.codigoDiaSemana != null)
/* 55 */         return false;
/* 56 */     } else if (!this.codigoDiaSemana.equals(other.codigoDiaSemana))
/* 57 */       return false;
/* 58 */     if (this.codigoInscrito == null) {
/* 59 */       if (other.codigoInscrito != null)
/* 60 */         return false;
/* 61 */     } else if (!this.codigoInscrito.equals(other.codigoInscrito))
/* 62 */       return false;
/* 63 */     return true;
/*    */   }
/*    */ }
