/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ 
/*    */ public class Grupo implements java.io.Serializable, IsSerializable
/*    */ {
/*    */   private Integer codigo;
/*    */   private Integer codigoFacilitador;
/*    */   private Integer codigoHospedeiro;
/*    */   private TipoGrupo tipoGrupo;
/*    */   private String grupoOutro;
/*    */   private DiaSemana diaSemana;
/*    */   private Horario horario;
/*    */   private Integer quantidadeMaxima;
/*    */   
/*    */   public Integer getCodigo()
/*    */   {
/* 18 */     return this.codigo;
/*    */   }
/*    */   
/*    */   public void setCodigo(Integer codigo) {
/* 22 */     this.codigo = codigo;
/*    */   }
/*    */   
/*    */   public Integer getCodigoFacilitador() {
/* 26 */     return this.codigoFacilitador;
/*    */   }
/*    */   
/*    */   public void setCodigoFacilitador(Integer codigoFacilitador) {
/* 30 */     this.codigoFacilitador = codigoFacilitador;
/*    */   }
/*    */   
/*    */   public Integer getCodigoHospedeiro() {
/* 34 */     return this.codigoHospedeiro;
/*    */   }
/*    */   
/*    */   public void setCodigoHospedeiro(Integer codigoHospedeiro) {
/* 38 */     this.codigoHospedeiro = codigoHospedeiro;
/*    */   }
/*    */   
/*    */   public TipoGrupo getTipoGrupo() {
/* 42 */     return this.tipoGrupo;
/*    */   }
/*    */   
/*    */   public void setTipoGrupo(TipoGrupo tipoGrupo) {
/* 46 */     this.tipoGrupo = tipoGrupo;
/*    */   }
/*    */   
/*    */   public String getGrupoOutro() {
/* 50 */     return this.grupoOutro;
/*    */   }
/*    */   
/*    */   public void setGrupoOutro(String grupoOutro) {
/* 54 */     this.grupoOutro = grupoOutro;
/*    */   }
/*    */   
/*    */   public DiaSemana getDiaSemana() {
/* 58 */     return this.diaSemana;
/*    */   }
/*    */   
/*    */   public void setDiaSemana(DiaSemana diaSemana) {
/* 62 */     this.diaSemana = diaSemana;
/*    */   }
/*    */   
/*    */   public Horario getHorario() {
/* 66 */     return this.horario;
/*    */   }
/*    */   
/*    */   public void setHorario(Horario horario) {
/* 70 */     this.horario = horario;
/*    */   }
/*    */   
/*    */   public Integer getQuantidadeMaxima() {
/* 74 */     return this.quantidadeMaxima;
/*    */   }
/*    */   
/*    */   public void setQuantidadeMaxima(Integer quantidadeMaxima) {
/* 78 */     this.quantidadeMaxima = quantidadeMaxima;
/*    */   }
/*    */ }
