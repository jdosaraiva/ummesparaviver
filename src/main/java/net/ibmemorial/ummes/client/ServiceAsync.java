package net.ibmemorial.ummes.client;

import com.google.gwt.user.client.rpc.AsyncCallback;
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

public abstract interface ServiceAsync
{
  public abstract void inscrever(Inscrito paramInscrito, List<TipoGrupo> paramList, List<DiaSemana> paramList1, List<Horario> paramList2, AsyncCallback<Void> paramAsyncCallback);
  
  public abstract void logar(String paramString1, String paramString2, AsyncCallback<UsuarioDTO> paramAsyncCallback);
  
  public abstract void getUsuarioDTO(AsyncCallback<UsuarioDTO> paramAsyncCallback);
  
  public abstract void logout(AsyncCallback<Void> paramAsyncCallback);
  
  public abstract void getInscritos(int paramInt, AsyncCallback<Page<Inscrito>> paramAsyncCallback);
  
  public abstract void getInscritos(Map<String, Serializable> paramMap, int paramInt, boolean paramBoolean, AsyncCallback<Page<InscritoDTO>> paramAsyncCallback);
  
  public abstract void formarGrupo(Grupo paramGrupo, AsyncCallback<Integer> paramAsyncCallback);
  
  public abstract void getGrupos(Map<String, Serializable> paramMap, int paramInt, AsyncCallback<Page<GrupoDTO>> paramAsyncCallback);
  
  public abstract void getParticipantes(Map<String, Serializable> paramMap, int paramInt, AsyncCallback<Page<Participante>> paramAsyncCallback);
  
  public abstract void cadastrarParticipante(Participante paramParticipante, AsyncCallback<Boolean> paramAsyncCallback);
  
  public abstract void getGrupoByUsuario(Integer paramInteger, AsyncCallback<GrupoDTO> paramAsyncCallback);
  
  public abstract void alterarQuantidade(Integer paramInteger1, Integer paramInteger2, AsyncCallback<Boolean> paramAsyncCallback);
  
  public abstract void excluirParticipante(Integer paramInteger1, Integer paramInteger2, AsyncCallback<Boolean> paramAsyncCallback);
  
  public abstract void enviarEmail(int paramInt1, int paramInt2, AsyncCallback<String> paramAsyncCallback);
}
