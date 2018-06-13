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

public interface ServiceAsync
{
  public void inscrever(Inscrito paramInscrito, List<TipoGrupo> paramList, List<DiaSemana> paramList1, List<Horario> paramList2, AsyncCallback<Void> paramAsyncCallback);
  
  public void logar(String paramString1, String paramString2, AsyncCallback<UsuarioDTO> paramAsyncCallback);
  
  public void getUsuarioDTO(AsyncCallback<UsuarioDTO> paramAsyncCallback);
  
  public void logout(AsyncCallback<Void> paramAsyncCallback);
  
  public void getInscritos(int paramInt, AsyncCallback<Page<Inscrito>> paramAsyncCallback);
  
  public void getInscritos(Map<String, Serializable> paramMap, int paramInt, boolean paramBoolean, AsyncCallback<Page<InscritoDTO>> paramAsyncCallback);
  
  public void formarGrupo(Grupo paramGrupo, AsyncCallback<Integer> paramAsyncCallback);
  
  public void getGrupos(Map<String, Serializable> paramMap, int paramInt, AsyncCallback<Page<GrupoDTO>> paramAsyncCallback);
  
  public void getParticipantes(Map<String, Serializable> paramMap, int paramInt, AsyncCallback<Page<Participante>> paramAsyncCallback);
  
  public void cadastrarParticipante(Participante paramParticipante, AsyncCallback<Boolean> paramAsyncCallback);
  
  public void getGrupoByUsuario(Integer paramInteger, AsyncCallback<GrupoDTO> paramAsyncCallback);
  
  public void alterarQuantidade(Integer paramInteger1, Integer paramInteger2, AsyncCallback<Boolean> paramAsyncCallback);
  
  public void excluirParticipante(Integer paramInteger1, Integer paramInteger2, AsyncCallback<Boolean> paramAsyncCallback);
  
  public void enviarEmail(int paramInt1, int paramInt2, AsyncCallback<String> paramAsyncCallback);
}
