package net.ibmemorial.ummes.client;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import net.ibmemorial.ummes.model.DiaSemana;
import net.ibmemorial.ummes.model.Grupo;
import net.ibmemorial.ummes.model.GrupoDTO;
import net.ibmemorial.ummes.model.Horario;
import net.ibmemorial.ummes.model.Inscrito;
import net.ibmemorial.ummes.model.InscritoDTO;
import net.ibmemorial.ummes.model.Participante;
import net.ibmemorial.ummes.model.TipoGrupo;
import net.ibmemorial.ummes.model.UsuarioDTO;
import net.ibmemorial.ummes.shared.Page;

@RemoteServiceRelativePath("umMes")
public abstract interface Service
  extends RemoteService
{
  public abstract void logout();
  
  public abstract UsuarioDTO getUsuarioDTO();
  
  public abstract void inscrever(Inscrito paramInscrito, List<TipoGrupo> paramList, List<DiaSemana> paramList1, List<Horario> paramList2);
  
  public abstract UsuarioDTO logar(String paramString1, String paramString2);
  
  public abstract Page<Inscrito> getInscritos(int paramInt);
  
  public abstract Page<InscritoDTO> getInscritos(Map<String, Serializable> paramMap, int paramInt, boolean paramBoolean);
  
  public abstract Integer formarGrupo(Grupo paramGrupo);
  
  public abstract Page<GrupoDTO> getGrupos(Map<String, Serializable> paramMap, int paramInt);
  
  public abstract Page<Participante> getParticipantes(Map<String, Serializable> paramMap, int paramInt);
  
  public abstract boolean cadastrarParticipante(Participante paramParticipante);
  
  public abstract GrupoDTO getGrupoByUsuario(Integer paramInteger);
  
  public abstract boolean alterarQuantidade(Integer paramInteger1, Integer paramInteger2);
  
  public abstract boolean excluirParticipante(Integer paramInteger1, Integer paramInteger2);
  
  public abstract String enviarEmail(int paramInt1, int paramInt2);
}
