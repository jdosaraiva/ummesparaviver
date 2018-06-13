package net.ibmemorial.ummes.model;

import com.google.gwt.user.client.rpc.IsSerializable;
import java.util.Date;

public class Inscrito implements java.io.Serializable, IsSerializable
{
  private Integer codigo;
  private String nome;
  private Funcao funcao;
  private TipoGrupo grupo;
  private String grupoOutro;
  private String endereco;
  private String complemento;
  private String bairro;
  private String cidade;
  private String cep;
  private String telefoneResidencial;
  private String telefoneComercial;
  private String telefoneCelular;
  private String email;
  private Boolean membro;
  private IEnum diaSemana;
  private Horario horario;
  private Integer quantidadeAdultos;
  private Integer quantidadeCriancas;
  private String observacao;
  private Character status;
  private Date dataCadastro;
  private String autorCadastro;
  
  public Integer getCodigo()
  {
    return this.codigo;
  }
  
  public void setCodigo(Integer codigo) {
    this.codigo = codigo;
  }
  
  public String getNome() {
    return this.nome;
  }
  
  public void setNome(String nome) {
    this.nome = nome;
  }
  
  public Funcao getFuncao() {
    return this.funcao;
  }
  
  public void setFuncao(Funcao funcao) {
    this.funcao = funcao;
  }
  
  public TipoGrupo getGrupo() {
    return this.grupo;
  }
  
  public void setGrupo(TipoGrupo grupo) {
    this.grupo = grupo;
  }
  
  public String getGrupoOutro() {
    return this.grupoOutro;
  }
  
  public void setGrupoOutro(String grupoOutro) {
    this.grupoOutro = grupoOutro;
  }
  
  public String getEndereco() {
    return this.endereco;
  }
  
  public void setEndereco(String endereco) {
    this.endereco = endereco;
  }
  
  public String getComplemento() {
    return this.complemento;
  }
  
  public void setComplemento(String complemento) {
    this.complemento = complemento;
  }
  
  public String getBairro() {
    return this.bairro;
  }
  
  public void setBairro(String bairro) {
    this.bairro = bairro;
  }
  
  public String getCidade() {
    return this.cidade;
  }
  
  public void setCidade(String cidade) {
    this.cidade = cidade;
  }
  
  public String getCep() {
    return this.cep;
  }
  
  public void setCep(String cep) {
    this.cep = cep;
  }
  
  public String getTelefoneResidencial() {
    return this.telefoneResidencial;
  }
  
  public void setTelefoneResidencial(String telefoneResidencial) {
    this.telefoneResidencial = telefoneResidencial;
  }
  
  public String getTelefoneComercial() {
    return this.telefoneComercial;
  }
  
  public void setTelefoneComercial(String telefoneComercial) {
    this.telefoneComercial = telefoneComercial;
  }
  
  public String getTelefoneCelular() {
    return this.telefoneCelular;
  }
  
  public void setTelefoneCelular(String telefoneCelular) {
    this.telefoneCelular = telefoneCelular;
  }
  
  public String getEmail() {
    return this.email;
  }
  
  public void setEmail(String email) {
    this.email = email;
  }
  
  public Boolean getMembro() {
    return this.membro;
  }
  
  public void setMembro(Boolean membro) {
    this.membro = membro;
  }
  
  public IEnum getDiaSemana() {
    return this.diaSemana;
  }
  
  public void setDiaSemana(IEnum diaSemana) {
    this.diaSemana = diaSemana;
  }
  
  public Horario getHorario() {
    return this.horario;
  }
  
  public void setHorario(Horario horario) {
    this.horario = horario;
  }
  
  public Integer getQuantidadeAdultos() {
    return this.quantidadeAdultos;
  }
  
  public void setQuantidadeAdultos(Integer quantidadeAdultos) {
    this.quantidadeAdultos = quantidadeAdultos;
  }
  
  public Integer getQuantidadeCriancas() {
    return this.quantidadeCriancas;
  }
  
  public void setQuantidadeCriancas(Integer quantidadeCriancas) {
    this.quantidadeCriancas = quantidadeCriancas;
  }
  
  public String getObservacao() {
    return this.observacao;
  }
  
  public void setObservacao(String observacao) {
    this.observacao = observacao;
  }
  
  public Character getStatus() {
    return this.status;
  }
  
  public void setStatus(Character status) {
    this.status = status;
  }
  
  public Date getDataCadastro() {
    return this.dataCadastro;
  }
  
  public void setDataCadastro(Date dataCadastro) {
    this.dataCadastro = dataCadastro;
  }
  
  public String getAutorCadastro() {
    return this.autorCadastro;
  }
  
  public void setAutorCadastro(String autorCadastro) {
    this.autorCadastro = autorCadastro;
  }
}
