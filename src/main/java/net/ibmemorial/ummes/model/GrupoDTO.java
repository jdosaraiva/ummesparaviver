/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.io.Serializable;
/*    */ 
/*    */ public class GrupoDTO implements Serializable, IsSerializable
/*    */ {
/*    */   private Grupo grupo;
/*    */   private Inscrito facilitador;
/*    */   private Inscrito hospedeiro;
/*    */   private int vagasDisponiveis;
/*    */   
/*    */   public GrupoDTO() {}
/*    */   
/*    */   public GrupoDTO(Grupo grupo, Inscrito facilitador, Inscrito hospedeiro, Number qtdeInscritos)
/*    */   {
/* 17 */     this.grupo = grupo;
/* 18 */     this.facilitador = facilitador;
/* 19 */     this.hospedeiro = hospedeiro;
/* 20 */     setQuantidadeInscritos(qtdeInscritos.intValue());
/*    */   }
/*    */   
/*    */   public Grupo getGrupo() {
/* 24 */     return this.grupo;
/*    */   }
/*    */   
/*    */   public void setGrupo(Grupo grupo) {
/* 28 */     this.grupo = grupo;
/*    */   }
/*    */   
/*    */   public Inscrito getFacilitador() {
/* 32 */     return this.facilitador;
/*    */   }
/*    */   
/*    */   public void setFacilitador(Inscrito facilitador) {
/* 36 */     this.facilitador = facilitador;
/*    */   }
/*    */   
/*    */   public Inscrito getHospedeiro() {
/* 40 */     return this.hospedeiro;
/*    */   }
/*    */   
/*    */   public void setHospedeiro(Inscrito hospedeiro) {
/* 44 */     this.hospedeiro = hospedeiro;
/*    */   }
/*    */   
/*    */   public int getVagasDisponiveis() {
/* 48 */     return this.vagasDisponiveis;
/*    */   }
/*    */   
/*    */   public void setVagasDisponiveis(int vagasDisponiveis) {
/* 52 */     this.vagasDisponiveis = vagasDisponiveis;
/*    */   }
/*    */   
/*    */   public void setQuantidadeInscritos(int qtdeInscritos) {
/* 56 */     setVagasDisponiveis(this.facilitador.getCodigo().equals(
/* 57 */       this.hospedeiro.getCodigo()) ? this.grupo.getQuantidadeMaxima().intValue() - 
/* 58 */       qtdeInscritos - 1 : this.grupo.getQuantidadeMaxima().intValue() - 
/* 59 */       qtdeInscritos - 2);
/*    */   }
/*    */ }
