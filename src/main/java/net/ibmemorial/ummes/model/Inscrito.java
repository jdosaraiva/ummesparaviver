/*     */ package net.ibmemorial.ummes.model;
/*     */ 
/*     */ import com.google.gwt.user.client.rpc.IsSerializable;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class Inscrito implements java.io.Serializable, IsSerializable
/*     */ {
/*     */   private Integer codigo;
/*     */   private String nome;
/*     */   private Funcao funcao;
/*     */   private TipoGrupo grupo;
/*     */   private String grupoOutro;
/*     */   private String endereco;
/*     */   private String complemento;
/*     */   private String bairro;
/*     */   private String cidade;
/*     */   private String cep;
/*     */   private String telefoneResidencial;
/*     */   private String telefoneComercial;
/*     */   private String telefoneCelular;
/*     */   private String email;
/*     */   private Boolean membro;
/*     */   private IEnum diaSemana;
/*     */   private Horario horario;
/*     */   private Integer quantidadeAdultos;
/*     */   private Integer quantidadeCriancas;
/*     */   private String observacao;
/*     */   private Character status;
/*     */   private Date dataCadastro;
/*     */   private String autorCadastro;
/*     */   
/*     */   public Integer getCodigo()
/*     */   {
/*  34 */     return this.codigo;
/*     */   }
/*     */   
/*     */   public void setCodigo(Integer codigo) {
/*  38 */     this.codigo = codigo;
/*     */   }
/*     */   
/*     */   public String getNome() {
/*  42 */     return this.nome;
/*     */   }
/*     */   
/*     */   public void setNome(String nome) {
/*  46 */     this.nome = nome;
/*     */   }
/*     */   
/*     */   public Funcao getFuncao() {
/*  50 */     return this.funcao;
/*     */   }
/*     */   
/*     */   public void setFuncao(Funcao funcao) {
/*  54 */     this.funcao = funcao;
/*     */   }
/*     */   
/*     */   public TipoGrupo getGrupo() {
/*  58 */     return this.grupo;
/*     */   }
/*     */   
/*     */   public void setGrupo(TipoGrupo grupo) {
/*  62 */     this.grupo = grupo;
/*     */   }
/*     */   
/*     */   public String getGrupoOutro() {
/*  66 */     return this.grupoOutro;
/*     */   }
/*     */   
/*     */   public void setGrupoOutro(String grupoOutro) {
/*  70 */     this.grupoOutro = grupoOutro;
/*     */   }
/*     */   
/*     */   public String getEndereco() {
/*  74 */     return this.endereco;
/*     */   }
/*     */   
/*     */   public void setEndereco(String endereco) {
/*  78 */     this.endereco = endereco;
/*     */   }
/*     */   
/*     */   public String getComplemento() {
/*  82 */     return this.complemento;
/*     */   }
/*     */   
/*     */   public void setComplemento(String complemento) {
/*  86 */     this.complemento = complemento;
/*     */   }
/*     */   
/*     */   public String getBairro() {
/*  90 */     return this.bairro;
/*     */   }
/*     */   
/*     */   public void setBairro(String bairro) {
/*  94 */     this.bairro = bairro;
/*     */   }
/*     */   
/*     */   public String getCidade() {
/*  98 */     return this.cidade;
/*     */   }
/*     */   
/*     */   public void setCidade(String cidade) {
/* 102 */     this.cidade = cidade;
/*     */   }
/*     */   
/*     */   public String getCep() {
/* 106 */     return this.cep;
/*     */   }
/*     */   
/*     */   public void setCep(String cep) {
/* 110 */     this.cep = cep;
/*     */   }
/*     */   
/*     */   public String getTelefoneResidencial() {
/* 114 */     return this.telefoneResidencial;
/*     */   }
/*     */   
/*     */   public void setTelefoneResidencial(String telefoneResidencial) {
/* 118 */     this.telefoneResidencial = telefoneResidencial;
/*     */   }
/*     */   
/*     */   public String getTelefoneComercial() {
/* 122 */     return this.telefoneComercial;
/*     */   }
/*     */   
/*     */   public void setTelefoneComercial(String telefoneComercial) {
/* 126 */     this.telefoneComercial = telefoneComercial;
/*     */   }
/*     */   
/*     */   public String getTelefoneCelular() {
/* 130 */     return this.telefoneCelular;
/*     */   }
/*     */   
/*     */   public void setTelefoneCelular(String telefoneCelular) {
/* 134 */     this.telefoneCelular = telefoneCelular;
/*     */   }
/*     */   
/*     */   public String getEmail() {
/* 138 */     return this.email;
/*     */   }
/*     */   
/*     */   public void setEmail(String email) {
/* 142 */     this.email = email;
/*     */   }
/*     */   
/*     */   public Boolean getMembro() {
/* 146 */     return this.membro;
/*     */   }
/*     */   
/*     */   public void setMembro(Boolean membro) {
/* 150 */     this.membro = membro;
/*     */   }
/*     */   
/*     */   public IEnum getDiaSemana() {
/* 154 */     return this.diaSemana;
/*     */   }
/*     */   
/*     */   public void setDiaSemana(IEnum diaSemana) {
/* 158 */     this.diaSemana = diaSemana;
/*     */   }
/*     */   
/*     */   public Horario getHorario() {
/* 162 */     return this.horario;
/*     */   }
/*     */   
/*     */   public void setHorario(Horario horario) {
/* 166 */     this.horario = horario;
/*     */   }
/*     */   
/*     */   public Integer getQuantidadeAdultos() {
/* 170 */     return this.quantidadeAdultos;
/*     */   }
/*     */   
/*     */   public void setQuantidadeAdultos(Integer quantidadeAdultos) {
/* 174 */     this.quantidadeAdultos = quantidadeAdultos;
/*     */   }
/*     */   
/*     */   public Integer getQuantidadeCriancas() {
/* 178 */     return this.quantidadeCriancas;
/*     */   }
/*     */   
/*     */   public void setQuantidadeCriancas(Integer quantidadeCriancas) {
/* 182 */     this.quantidadeCriancas = quantidadeCriancas;
/*     */   }
/*     */   
/*     */   public String getObservacao() {
/* 186 */     return this.observacao;
/*     */   }
/*     */   
/*     */   public void setObservacao(String observacao) {
/* 190 */     this.observacao = observacao;
/*     */   }
/*     */   
/*     */   public Character getStatus() {
/* 194 */     return this.status;
/*     */   }
/*     */   
/*     */   public void setStatus(Character status) {
/* 198 */     this.status = status;
/*     */   }
/*     */   
/*     */   public Date getDataCadastro() {
/* 202 */     return this.dataCadastro;
/*     */   }
/*     */   
/*     */   public void setDataCadastro(Date dataCadastro) {
/* 206 */     this.dataCadastro = dataCadastro;
/*     */   }
/*     */   
/*     */   public String getAutorCadastro() {
/* 210 */     return this.autorCadastro;
/*     */   }
/*     */   
/*     */   public void setAutorCadastro(String autorCadastro) {
/* 214 */     this.autorCadastro = autorCadastro;
/*     */   }
/*     */ }
