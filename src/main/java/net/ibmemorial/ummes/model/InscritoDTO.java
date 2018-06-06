/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class InscritoDTO
/*    */   implements Serializable, IsSerializable
/*    */ {
/*    */   private Inscrito inscrito;
/*    */   private DiaSemana[] diasSemana;
/*    */   private Horario[] horarios;
/*    */   private TipoGrupo[] tiposGrupo;
/*    */   
/*    */   public InscritoDTO() {}
/*    */   
/*    */   public InscritoDTO(Inscrito inscrito, DiaSemana[] diasSemana, Horario[] horarios, TipoGrupo[] tiposGrupo)
/*    */   {
/* 18 */     this.inscrito = inscrito;
/* 19 */     this.diasSemana = diasSemana;
/* 20 */     this.horarios = horarios;
/* 21 */     this.tiposGrupo = tiposGrupo;
/*    */   }
/*    */   
/*    */   public Inscrito getInscrito() {
/* 25 */     return this.inscrito;
/*    */   }
/*    */   
/*    */   public void setInscrito(Inscrito inscrito) {
/* 29 */     this.inscrito = inscrito;
/*    */   }
/*    */   
/*    */   public DiaSemana[] getDiasSemana() {
/* 33 */     return this.diasSemana;
/*    */   }
/*    */   
/*    */   public void setDiasSemana(DiaSemana[] diasSemana) {
/* 37 */     this.diasSemana = diasSemana;
/*    */   }
/*    */   
/*    */   public Horario[] getHorarios() {
/* 41 */     return this.horarios;
/*    */   }
/*    */   
/*    */   public void setHorarios(Horario[] horarios) {
/* 45 */     this.horarios = horarios;
/*    */   }
/*    */   
/*    */   public TipoGrupo[] getTiposGrupo() {
/* 49 */     return this.tiposGrupo;
/*    */   }
/*    */   
/*    */   public void setTiposGrupo(TipoGrupo[] tiposGrupo) {
/* 53 */     this.tiposGrupo = tiposGrupo;
/*    */   }
/*    */ }
