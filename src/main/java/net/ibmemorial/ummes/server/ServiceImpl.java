package net.ibmemorial.ummes.server;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

import net.ibmemorial.ummes.client.Service;
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

public class ServiceImpl extends RemoteServiceServlet implements Service {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -8015088688300660505L;
	
	@Autowired
	public IServiceHelper helper;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		WebApplicationContext ctx = WebApplicationContextUtils
				.getRequiredWebApplicationContext(config.getServletContext());
		AutowireCapableBeanFactory beanFactory = ctx.getAutowireCapableBeanFactory();
		beanFactory.autowireBean(this);
	}

	public UsuarioDTO getUsuarioDTO() {
		return (UsuarioDTO) getThreadLocalRequest().getSession().getAttribute("user");
	}

	public void logout() {
		getThreadLocalRequest().getSession().removeAttribute("user");
	}

	public void inscrever(Inscrito inscrito, List<TipoGrupo> grupos, List<DiaSemana> dias, List<Horario> horarios) {
		this.helper.inscrever(inscrito, grupos, dias, horarios, getUsuarioDTO());
	}

	public UsuarioDTO logar(String usuario, String senha) {
		UsuarioDTO dto = this.helper.logar(usuario, senha);
		
		System.out.printf("ServiceImpl#logar\n");

		if (dto == null) {
			getThreadLocalRequest().getSession().removeAttribute("user");
		} else {

			System.out.printf("ServiceImpl#logar - Usuario:[%s]\n", dto.getUsuario().getNome());
			
			getThreadLocalRequest().getSession().setAttribute("user", dto);
		}

		return dto;
	}

	public Page<Inscrito> getInscritos(int pageNumber) {
		return this.helper.getInscritos(pageNumber);
	}

	public Page<InscritoDTO> getInscritos(Map<String, Serializable> searchParameters, int pageNumber,
			boolean facilitador) {
		return this.helper.getInscritos(searchParameters, pageNumber, facilitador);
	}

	public Integer formarGrupo(Grupo grupo) {
		return this.helper.formarGrupo(grupo);
	}

	public Page<GrupoDTO> getGrupos(Map<String, Serializable> searchParameters, int pageNumber) {
		return this.helper.getGrupos(searchParameters, pageNumber);
	}

	public Page<Participante> getParticipantes(Map<String, Serializable> searchParameters, int pageNumber) {
		return this.helper.getParticipantes(searchParameters, pageNumber);
	}

	public boolean cadastrarParticipante(Participante participante) {
		return this.helper.cadastrarParticipante(participante);
	}

	public GrupoDTO getGrupoByUsuario(Integer codigoInscrito) {
		return this.helper.getGrupoByUsuario(codigoInscrito);
	}

	public boolean alterarQuantidade(Integer codigoGrupo, Integer quantidade) {
		return this.helper.alterarQuantidade(codigoGrupo, quantidade);
	}

	public boolean excluirParticipante(Integer codigoGrupo, Integer codigoParticipante) {
		return this.helper.excluirParticipante(codigoGrupo, codigoParticipante);
	}

	public String enviarEmail(int quantidade, int tipo) {
		return this.helper.enviarEmail(quantidade, tipo);
	}
}
