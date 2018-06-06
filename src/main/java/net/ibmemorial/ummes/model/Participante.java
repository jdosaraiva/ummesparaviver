/*    */ package net.ibmemorial.ummes.model;
/*    */ 
/*    */ import com.google.gwt.user.client.rpc.IsSerializable;
/*    */ import java.util.Date;
/*    */ 
/*    */ public class Participante implements java.io.Serializable, IsSerializable
/*    */ {
/*    */   private Integer codigo;
/*    */   private Integer codigoGrupo;
/*    */   private String nome;
/*    */   private String email;
/*    */   private String telefone;
/*    */   private String outroTelefone;
/*    */   private Integer quantidadeCriancas;
/*    */   private Date dataCadastro;
/*    */   
/*    */   public Integer getCodigo()
/*    */   {
/* 19 */     return this.codigo;
/*    */   }
/*    */   
/*    */   public void setCodigo(Integer codigo) {
/* 23 */     this.codigo = codigo;
/*    */   }
/*    */   
/*    */   public Integer getCodigoGrupo() {
/* 27 */     return this.codigoGrupo;
/*    */   }
/*    */   
/*    */   public void setCodigoGrupo(Integer codigoGrupo) {
/* 31 */     this.codigoGrupo = codigoGrupo;
/*    */   }
/*    */   
/*    */   public String getNome() {
/* 35 */     return this.nome;
/*    */   }
/*    */   
/*    */   public void setNome(String nome) {
/* 39 */     this.nome = nome;
/*    */   }
/*    */   
/*    */   public String getEmail() {
/* 43 */     return this.email;
/*    */   }
/*    */   
/*    */   public void setEmail(String email) {
/* 47 */     this.email = email;
/*    */   }
/*    */   
/*    */   public String getTelefone() {
/* 51 */     return this.telefone;
/*    */   }
/*    */   
/*    */   public void setTelefone(String telefone) {
/* 55 */     this.telefone = telefone;
/*    */   }
/*    */   
/*    */   public String getOutroTelefone() {
/* 59 */     return this.outroTelefone;
/*    */   }
/*    */   
/*    */   public void setOutroTelefone(String outroTelefone) {
/* 63 */     this.outroTelefone = outroTelefone;
/*    */   }
/*    */   
/*    */   public Date getDataCadastro() {
/* 67 */     return this.dataCadastro;
/*    */   }
/*    */   
/*    */   public void setDataCadastro(Date dataCadastro) {
/* 71 */     this.dataCadastro = dataCadastro;
/*    */   }
/*    */   
/*    */   public Integer getQuantidadeCriancas() {
/* 75 */     return this.quantidadeCriancas;
/*    */   }
/*    */   
/*    */   public void setQuantidadeCriancas(Integer quantidadeCriancas) {
/* 79 */     this.quantidadeCriancas = quantidadeCriancas;
/*    */   }
/*    */ }
