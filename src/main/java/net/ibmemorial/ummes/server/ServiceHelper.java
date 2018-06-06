package net.ibmemorial.ummes.server;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.mail.internet.MimeMessage;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.orm.hibernate3.HibernateCallback;

import net.ibmemorial.ummes.dao.HibernateDAO;
import net.ibmemorial.ummes.model.ControleEmail;
import net.ibmemorial.ummes.model.DiaSemana;
import net.ibmemorial.ummes.model.Funcao;
import net.ibmemorial.ummes.model.Grupo;
import net.ibmemorial.ummes.model.GrupoDTO;
import net.ibmemorial.ummes.model.Horario;
import net.ibmemorial.ummes.model.IEnum;
import net.ibmemorial.ummes.model.Inscrito;
import net.ibmemorial.ummes.model.InscritoDTO;
import net.ibmemorial.ummes.model.InscritoDiaSemana;
import net.ibmemorial.ummes.model.InscritoDiaSemanaId;
import net.ibmemorial.ummes.model.InscritoGrupo;
import net.ibmemorial.ummes.model.InscritoGrupoId;
import net.ibmemorial.ummes.model.InscritoHorario;
import net.ibmemorial.ummes.model.InscritoHorarioId;
import net.ibmemorial.ummes.model.Participante;
import net.ibmemorial.ummes.model.Role;
import net.ibmemorial.ummes.model.TipoGrupo;
import net.ibmemorial.ummes.model.Usuario;
import net.ibmemorial.ummes.model.UsuarioDTO;
import net.ibmemorial.ummes.shared.Page;

public class ServiceHelper implements IServiceHelper {
	private static Set<Integer> LOCK_GRUPOS = new HashSet();
	private static final String EMAIL_BODY = "<p>Prezados hospedeiro e facilitador,<br><br>Estamos compartilhando com voc�s o grupo que foi formado para trabalharem juntos.<br>Pe�o que confiram os dados para ver se tudo est� correto conforme o desejo de voc�s.<br>Por favor, respondam esse e-mail se tiverem qualquer d�vida ou modifica��o a ser feita.<br><br>Outra coisa importante, nos domingos 21 e 28 de mar�o, voc�s j� poder�o inscrever nesse grupo os seus pr�prios convidados, garantindo assim a vaga deles. Depois disso, no m�s de abril j� abriremos as inscri��es para os membros da igreja.<br><br>Muito obrigado pela sua ajuda nesse projeto.<br>Deus o aben�oe,</p>";
	HibernateDAO dao;
	JavaMailSender mailSender;
	String sendTo;

	public void setDao(HibernateDAO dao) {
		this.dao = dao;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}

	synchronized void lockGrupo(Integer codigo) {
		if (LOCK_GRUPOS.contains(codigo)) {
			try {
				wait();
			} catch (InterruptedException e) {
				throw new IllegalStateException(e.getMessage());
			}
		}
		LOCK_GRUPOS.add(codigo);
	}

	synchronized void unlockGrupo(Integer codigo) {
		LOCK_GRUPOS.remove(codigo);
		notifyAll();
	}

	public UsuarioDTO logar(String login, String senha) {
		List<?> usuarios = this.dao.getHibernateTemplate().findByNamedParam(
				"select u from Usuario u where u.login = :login and u.senha = :senha",
				new String[] { "login", "senha" }, new Object[] { login, senha });
		if (usuarios.isEmpty()) {
			return null;
		}
		Usuario usuario = (Usuario) usuarios.get(0);

		List<?> roles = this.dao.getHibernateTemplate().findByNamedParam(
				"select r from Role r, UsuarioRole ur where r.codigo = ur.id.role and ur.id.login = :login", "login",
				login);

		Role[] r = new Role[roles.size()];
		int i = 0;
		for (Iterator<?> iterator = roles.iterator(); iterator.hasNext(); i++) {
			Role role = (Role) iterator.next();
			r[i] = role;
		}
		return new UsuarioDTO(usuario, r);
	}

	public void inscrever(Inscrito inscrito, List<TipoGrupo> grupos, List<DiaSemana> dias, List<Horario> horarios,
			UsuarioDTO dto) {
		inscrito.setDataCadastro(new Date());
		if (dto != null) {
			inscrito.setAutorCadastro(dto.getUsuario().getLogin());
		}
		this.dao.save(inscrito);
		for (TipoGrupo grupo : grupos) {
			this.dao.save(new InscritoGrupo(new InscritoGrupoId(inscrito.getCodigo(), Integer.valueOf(grupo.getId()))));
		}
		for (IEnum diaSemana : dias) {
			this.dao.save(new InscritoDiaSemana(
					new InscritoDiaSemanaId(inscrito.getCodigo(), Integer.valueOf(diaSemana.getId()))));
		}
		for (Horario horario : horarios) {
			this.dao.save(
					new InscritoHorario(new InscritoHorarioId(inscrito.getCodigo(), Integer.valueOf(horario.getId()))));
		}
	}

	public Page<Inscrito> getInscritos(final int pageNumber) {
		return (Page<Inscrito>) this.dao.getHibernateTemplate().execute(new HibernateCallback() {
			public Page<Inscrito> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery("select i from Inscrito i");

				return new QueryPager(query).getPage(pageNumber, 10);
			}
		});
	}

	private DiaSemana[] getDiasSemana(Inscrito inscrito) {
		List<InscritoDiaSemana> results = this.dao.getHibernateTemplate()
				.find("select id from InscritoDiaSemana id where id.id.codigoInscrito = ?", inscrito.getCodigo());
		DiaSemana[] array = new DiaSemana[results.size()];

		int i = 0;
		for (InscritoDiaSemana object : results) {
			array[(i++)] = DiaSemana.valueOf(object.getId().getCodigoDiaSemana().intValue());
		}
		return array;
	}

	private Horario[] getHorarios(Inscrito inscrito) {
		List<InscritoHorario> results = this.dao.getHibernateTemplate()
				.find("select ih from InscritoHorario ih where ih.id.codigoInscrito = ?", inscrito.getCodigo());
		Horario[] array = new Horario[results.size()];

		int i = 0;
		for (InscritoHorario object : results) {
			array[(i++)] = Horario.valueOf(object.getId().getCodigoHorario().intValue());
		}
		return array;
	}

	private TipoGrupo[] getTiposGrupo(Inscrito inscrito) {
		List<InscritoGrupo> results = this.dao.getHibernateTemplate()
				.find("select ig from InscritoGrupo ig where ig.id.codigoInscrito = ?", inscrito.getCodigo());
		TipoGrupo[] array = new TipoGrupo[results.size()];

		int i = 0;
		for (InscritoGrupo object : results) {
			array[(i++)] = TipoGrupo.valueOf(object.getId().getCodigoGrupo().intValue());
		}
		return array;
	}

	public Page<InscritoDTO> getInscritos(final Map<String, Serializable> searchParameters, final int pageNumber,
			final boolean facilitador) {
		return (Page) this.dao.getHibernateTemplate().execute(new HibernateCallback() {
			public Page<InscritoDTO> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select i from Inscrito i where  id.codigo not in (select g.codigoFacilitador from Grupo g) and  id.codigo not in (select g.codigoHospedeiro from Grupo g)";

				String nome = (String) searchParameters.get("nome");
				String email = (String) searchParameters.get("email");
				String bairro = (String) searchParameters.get("bairro");
				String cidade = (String) searchParameters.get("cidade");
				IEnum[] dia = (IEnum[]) searchParameters.get("dias");
				IEnum[] horario = (IEnum[]) searchParameters.get("horarios");
				IEnum[] tipo = (IEnum[]) searchParameters.get("tiposGrupo");
				if (facilitador) {
					sql = sql + " and (i.funcao = 1 or i.funcao = 99)";
				} else {
					sql = sql + " and i.funcao = 2";
				}
				if (nome != null) {
					sql = sql + " and id.nome like :nome";
				}
				if (email != null) {
					sql = sql + " and id.email like :email";
				}
				if (bairro != null) {
					sql = sql + " and id.bairro like :bairro";
				}
				if (cidade != null) {
					sql = sql + " and id.cidade like :cidade";
				}
				if (dia != null) {
					sql = sql
							+ " and id.codigo in (select id.id.codigoInscrito from InscritoDiaSemana id where id.id.codigoInscrito = i.codigo and id.id.codigoDiaSemana in (:dias))";
				}
				if (horario != null) {
					sql = sql
							+ " and id.codigo in (select ih.id.codigoInscrito from InscritoHorario ih where ih.id.codigoInscrito = i.codigo and ih.id.codigoHorario in (:horarios))";
				}
				if (tipo != null) {
					sql = sql
							+ " and id.codigo in (select ig.id.codigoInscrito from InscritoGrupo ig where ig.id.codigoInscrito = i.codigo and ig.id.codigoGrupo in (:tiposGrupo))";
				}
				Query query = session.createQuery(sql);
				Integer[] args;
				for (Map.Entry<String, Serializable> entry : searchParameters.entrySet()) {
					if ((entry.getValue() instanceof IEnum[])) {
						IEnum[] array = (IEnum[]) entry.getValue();
						args = new Integer[array.length];
						for (int i = 0; i < args.length; i++) {
							args[i] = Integer.valueOf(array[i].getId());
						}
						query.setParameterList((String) entry.getKey(), args);
					} else {
						query.setParameter((String) entry.getKey(), entry.getValue());
					}
				}
				Page<Inscrito> page = new QueryPager(query).getPage(pageNumber, 5);
				Object results = new ArrayList(page.getResults().size());
				for (Inscrito i : page.getResults()) {
					((List) results).add(new InscritoDTO(i, ServiceHelper.this.getDiasSemana(i),
							ServiceHelper.this.getHorarios(i), ServiceHelper.this.getTiposGrupo(i)));
				}
				return new Page((List) results, page.getPageNumber(), page.getResultsPerPage(), page.isLast());
			}
		});
	}

	public Integer formarGrupo(Grupo grupo) {
		Integer codigoGrupo = (Integer) this.dao.save(grupo);

		Inscrito facilitador = (Inscrito) this.dao.getHibernateTemplate().load(Inscrito.class,
				grupo.getCodigoFacilitador());
		criarSalvarUsuario(facilitador);
		if (!grupo.getCodigoFacilitador().equals(grupo.getCodigoHospedeiro())) {
			Inscrito hospedeiro = (Inscrito) this.dao.getHibernateTemplate().load(Inscrito.class,
					grupo.getCodigoHospedeiro());
			criarSalvarUsuario(hospedeiro);
		}
		return codigoGrupo;
	}

	private void criarSalvarUsuario(Inscrito inscrito) {
		Usuario usuario = criarUsuario(inscrito);

		this.dao.save(usuario);
	}

	private Usuario criarUsuario(Inscrito inscrito) {
		Usuario usuario = new Usuario();
		usuario.setLogin(criarLogin(inscrito));
		usuario.setCodigoInscrito(inscrito.getCodigo());

		updateUsuario(inscrito, usuario);
		return usuario;
	}

	private void updateUsuario(Inscrito inscrito, Usuario usuario) {
		usuario.setNome(inscrito.getNome());
		usuario.setSenha(criarSenha(inscrito));
	}

	private String criarLogin(Inscrito inscrito) {
		String prefixo = new StringTokenizer(inscrito.getNome().toLowerCase()).nextToken();
		String sufixo = inscrito.getCodigo().toString();

		return generate(prefixo, sufixo);
	}

	private String criarSenha(Inscrito inscrito) {
		String prefixo = new StringTokenizer(inscrito.getEmail().toLowerCase(), "@").nextToken();
		String sufixo = inscrito.getCodigo().toString();

		return generate(prefixo, sufixo);
	}

	private String generate(String prefixo, String sufixo) {
		prefixo = prefixo.replaceAll("[^a-z^A-Z]", "");
		if (prefixo.length() > 15 - sufixo.length()) {
			prefixo = prefixo.substring(0, 15 - sufixo.length());
		}
		return prefixo + sufixo;
	}

	public Page<GrupoDTO> getGrupos(final Map<String, Serializable> searchParameters, final int pageNumber) {
		return (Page) this.dao.getHibernateTemplate().execute(new HibernateCallback() {
			public Page<GrupoDTO> doInHibernate(Session session) throws HibernateException, SQLException {
				String sql = "select new net.ibmemorial.ummes.model.GrupoDTO(g, f, h, (select count(*) from Participante p where p.codigoGrupo = g.codigo)) from Grupo g, Inscrito f, Inscrito h where g.codigoFacilitador = f.codigo and g.codigoHospedeiro = h.codigo";

				Integer codigo = (Integer) searchParameters.get("codigo");
				String nomeFacilitador = (String) searchParameters.get("nomeFacilitador");
				String nomeHospedeiro = (String) searchParameters.get("nomeHospedeiro");
				String bairro = (String) searchParameters.get("bairro");
				String cidade = (String) searchParameters.get("cidade");
				IEnum diaSemana = (IEnum) searchParameters.get("diaSemana");
				IEnum horario = (IEnum) searchParameters.get("horario");
				IEnum tipoGrupo = (IEnum) searchParameters.get("tipoGrupo");
				if (codigo != null) {
					sql = sql + " and g.codigo = :codigo";
				}
				if (nomeFacilitador != null) {
					sql = sql + " and f.nome like :nomeFacilitador";
				}
				if (nomeHospedeiro != null) {
					sql = sql + " and h.nome like :nomeHospedeiro";
				}
				if (bairro != null) {
					sql = sql + " and h.bairro like :bairro";
				}
				if (cidade != null) {
					sql = sql + " and h.cidade like :cidade";
				}
				if (diaSemana != null) {
					sql = sql + " and g.diaSemana = :diaSemana";
				}
				if (horario != null) {
					sql = sql + " and g.horario = :horario";
				}
				if (tipoGrupo != null) {
					sql = sql + " and g.tipoGrupo = :tipoGrupo";
				}
				Query query = session.createQuery(sql);
				for (Map.Entry<String, Serializable> entry : searchParameters.entrySet()) {
					if ((entry.getValue() instanceof IEnum)) {
						query.setParameter((String) entry.getKey(), entry.getValue(), Hibernate.custom(
								GenericEnumUserType.class, new String[] { "enumClassName", "identifierMethod" },
								new String[] { ((Serializable) entry.getValue()).getClass().getName(), "getId" }));
					} else {
						query.setParameter((String) entry.getKey(), entry.getValue());
					}
				}
				return new QueryPager(query).getPage(pageNumber, 10);
			}
		});
	}

	public Page<Participante> getParticipantes(final Map<String, Serializable> searchParameters, final int pageNumber) {
		return (Page) this.dao.getHibernateTemplate().execute(new HibernateCallback() {
			public Page<Participante> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery("select p from Participante p where p.codigoGrupo = :codigoGrupo");
				for (Map.Entry<String, Serializable> entry : searchParameters.entrySet()) {
					query.setParameter((String) entry.getKey(), entry.getValue());
				}
				return new QueryPager(query).getPage(pageNumber, 1000);
			}
		});
	}

	public GrupoDTO getGrupoByUsuario(Integer codigoInscrito) {
		List<GrupoDTO> result = this.dao.getHibernateTemplate().find(
				"select new net.ibmemorial.ummes.model.GrupoDTO(g, f, h, (select count(*) from Participante p where p.codigoGrupo = g.codigo)) from Grupo g, Inscrito f, Inscrito h, Inscrito i where g.codigoFacilitador = f.codigo and g.codigoHospedeiro = h.codigo and (g.codigoFacilitador = i.codigo or g.codigoHospedeiro = i.codigo) and i.codigo = ?",
				codigoInscrito);
		if (result.isEmpty()) {
			return null;
		}
		return (GrupoDTO) result.get(0);
	}

	public boolean cadastrarParticipante(Participante participante) {
		lockGrupo(participante.getCodigoGrupo());
		try {
			Grupo grupo = (Grupo) this.dao.getHibernateTemplate().load(Grupo.class, participante.getCodigoGrupo(),
					LockMode.UPGRADE);

			List<?> result = this.dao.getHibernateTemplate()
					.find("select count(*) from Participante p where p.codigoGrupo = ?", grupo.getCodigo());
			int count = ((Number) result.get(0)).intValue() + 1;
			if (!grupo.getCodigoFacilitador().equals(grupo.getCodigoHospedeiro())) {
				count++;
			}
			if (count >= grupo.getQuantidadeMaxima().intValue()) {
				return false;
			}
			participante.setDataCadastro(new Date());
			this.dao.getHibernateTemplate().save(participante);
			return true;
		} finally {
			unlockGrupo(participante.getCodigoGrupo());
		}
	}

	public boolean alterarQuantidade(Integer codigoGrupo, Integer quantidade) {
		lockGrupo(codigoGrupo);
		try {
			Grupo grupo = (Grupo) this.dao.getHibernateTemplate().load(Grupo.class, codigoGrupo, LockMode.UPGRADE);

			List<?> result = this.dao.getHibernateTemplate()
					.find("select count(*) from Participante p where p.codigoGrupo = ?", grupo.getCodigo());
			int count = ((Number) result.get(0)).intValue() + 1;
			if (!grupo.getCodigoFacilitador().equals(grupo.getCodigoHospedeiro())) {
				count++;
			}
			if (count > quantidade.intValue()) {
				return false;
			}
			grupo.setQuantidadeMaxima(quantidade);

			this.dao.getHibernateTemplate().update(grupo);
			return true;
		} finally {
			unlockGrupo(codigoGrupo);
		}
	}

	public boolean excluirParticipante(Integer codigoGrupo, Integer codigoParticipante) {
		lockGrupo(codigoGrupo);
		try {
			this.dao.getHibernateTemplate().load(Grupo.class, codigoGrupo, LockMode.UPGRADE);
			Participante p = (Participante) this.dao.getHibernateTemplate().load(Participante.class, codigoParticipante,
					LockMode.UPGRADE);

			this.dao.getHibernateTemplate().delete(p);
			return true;
		} finally {
			unlockGrupo(codigoGrupo);
		}
	}

	private int count(List<?> result) {
		return ((Number) result.get(0)).intValue();
	}

	public String enviarEmail(final int quantidade, final int tipo) {
		List<?> result = (List) this.dao.getHibernateTemplate().execute(new HibernateCallback() {
			public List<?> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(
						"select g from Grupo g where g.codigoFacilitador not in (select ce.codigoInscrito from ControleEmail ce where ce.tipoEmail = :tipoEmail) or g.codigoHospedeiro not in (select ce.codigoInscrito from ControleEmail ce where ce.tipoEmail = :tipoEmail)");
				query.setParameter("tipoEmail", Integer.valueOf(tipo));
				query.setMaxResults(quantidade);

				return query.list();
			}
		});
		if (result.isEmpty()) {
			return null;
		}
		if (tipo == 1) {
			return enviarEmailsIniciais(result);
		}
		return enviarEmailsSenhas(result);
	}

	private String enviarEmailsIniciais(List<?> result) {
		int tipo = 1;
		StringBuilder builder = new StringBuilder();
		for (Iterator<?> iterator = result.iterator(); iterator.hasNext();) {
			Grupo grupo = (Grupo) iterator.next();

			Inscrito facilitador = (Inscrito) this.dao.getHibernateTemplate().load(Inscrito.class,
					grupo.getCodigoFacilitador());
			Inscrito hospedeiro = (Inscrito) this.dao.getHibernateTemplate().load(Inscrito.class,
					grupo.getCodigoHospedeiro());

			String html = gerarHtml(grupo, facilitador, hospedeiro);

			int countFacilitador = count(this.dao.getHibernateTemplate().find(
					"select count(*) from ControleEmail ce where ce.codigoInscrito = ?", grupo.getCodigoFacilitador()));
			int countHospedeiro = count(this.dao.getHibernateTemplate().find(
					"select count(*) from ControleEmail ce where ce.codigoInscrito = ?", grupo.getCodigoHospedeiro()));
			if (!enviarEmailInicial(grupo, facilitador, hospedeiro, countFacilitador, countHospedeiro, html, 1,
					builder)) {
				return null;
			}
		}
		return builder.toString();
	}

	private String enviarEmailsSenhas(List<?> result) {
		StringBuilder builder = new StringBuilder();
		for (Iterator<?> iterator = result.iterator(); iterator.hasNext();) {
			Grupo grupo = (Grupo) iterator.next();

			Inscrito facilitador = (Inscrito) this.dao.getHibernateTemplate().load(Inscrito.class,
					grupo.getCodigoFacilitador());
			Inscrito hospedeiro = (Inscrito) this.dao.getHibernateTemplate().load(Inscrito.class,
					grupo.getCodigoHospedeiro());
			if (!enviarEmailSenha(grupo, facilitador, builder)) {
				return builder.toString();
			}
			if ((!facilitador.getCodigo().equals(hospedeiro.getCodigo()))
					&& (!enviarEmailSenha(grupo, hospedeiro, builder))) {
				return builder.toString();
			}
		}
		return builder.toString();
	}

	private boolean enviarEmailSenha(Grupo grupo, Inscrito inscrito, StringBuilder builder) {
		List<?> usuarios = this.dao.getHibernateTemplate().find("select u from Usuario u where u.codigoInscrito = ?",
				inscrito.getCodigo());
		Usuario usuario = usuarios.isEmpty() ? criarUsuario(inscrito) : (Usuario) usuarios.get(0);

		updateUsuario(inscrito, usuario);

		this.dao.getHibernateTemplate().saveOrUpdate(usuario);

		return doEnviarEmailSenha(grupo, inscrito, usuario, builder);
	}

	private boolean isEmpty(String value) {
		return (value == null) || (value.trim().length() == 0);
	}

	private boolean enviarEmailInicial(Grupo grupo, Inscrito facilitador, Inscrito hospedeiro, int countFacilitador,
			int countHospedeiro, String html, int tipo, StringBuilder builder) {
		boolean ambos = grupo.getCodigoFacilitador().equals(grupo.getCodigoHospedeiro());
		String label = ambos ? "<i><b>Facilitador e Hospedeiro</b></i>" : "<i><b>Facilitador</b></i>";

		boolean enviadoFac = false;
		boolean enviadoHosp = false;
		try {
			MimeMessage message = this.mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);
			if (countFacilitador == 0) {
				if (!isEmpty(facilitador.getEmail())) {
					if (this.sendTo != null) {
						helper.addTo(this.sendTo);
					} else {
						helper.addTo(facilitador.getEmail());
					}
					enviadoFac = true;
				} else {
					builder.append("<br><i><b>Grupo</b></i> " + grupo.getCodigo() + ", " + label + " "
							+ facilitador.getNome() + " sem e-mail.");
					if (this.sendTo == null) {
						this.dao.getHibernateTemplate()
								.save(new ControleEmail(facilitador.getCodigo(), Integer.valueOf(tipo)));
					}
				}
			}
			if ((countHospedeiro == 0) && (!ambos)) {
				if (!isEmpty(hospedeiro.getEmail())) {
					if (this.sendTo == null) {
						helper.addTo(hospedeiro.getEmail());
					}
					enviadoHosp = true;
				} else {
					builder.append("<br><i><b>Grupo</b></i> " + grupo.getCodigo() + ", <i><b>Hospedeiro</b></i> "
							+ hospedeiro.getNome() + " sem e-mail.");
					if (this.sendTo == null) {
						this.dao.getHibernateTemplate()
								.save(new ControleEmail(hospedeiro.getCodigo(), Integer.valueOf(tipo)));
					}
				}
			}
			if ((!enviadoFac) && (!enviadoHosp)) {
				return true;
			}
			helper.setFrom("danielreis@ibmemorial.org.br", "Daniel Reis");
			helper.setReplyTo("danielreis@ibmemorial.org.br", "Daniel Reis");
			helper.setSubject("Um M�s para Viver, seu grupo foi formado");
			helper.setText(
					"<html><body><p>Prezados hospedeiro e facilitador,<br><br>Estamos compartilhando com voc�s o grupo que foi formado para trabalharem juntos.<br>Pe�o que confiram os dados para ver se tudo est� correto conforme o desejo de voc�s.<br>Por favor, respondam esse e-mail se tiverem qualquer d�vida ou modifica��o a ser feita.<br><br>Outra coisa importante, nos domingos 21 e 28 de mar�o, voc�s j� poder�o inscrever nesse grupo os seus pr�prios convidados, garantindo assim a vaga deles. Depois disso, no m�s de abril j� abriremos as inscri��es para os membros da igreja.<br><br>Muito obrigado pela sua ajuda nesse projeto.<br>Deus o aben�oe,</p><br>"
							+ html + "</html></body>",
					true);

			this.mailSender.send(message);
			if (enviadoFac) {
				builder.append("<br><i><b>Grupo</b></i> " + grupo.getCodigo() + ", " + label + " "
						+ facilitador.getNome() + " enviado com sucesso.");
				if (this.sendTo == null) {
					this.dao.getHibernateTemplate()
							.save(new ControleEmail(facilitador.getCodigo(), Integer.valueOf(tipo)));
				}
			}
			if (enviadoHosp) {
				builder.append("<br><i><b>Grupo</b></i> " + grupo.getCodigo() + ", <i><b>Hospedeiro</b></i> "
						+ hospedeiro.getNome() + " enviado com sucesso.");
				if (this.sendTo == null) {
					this.dao.getHibernateTemplate()
							.save(new ControleEmail(hospedeiro.getCodigo(), Integer.valueOf(tipo)));
				}
			}
			return true;
		} catch (MailException e) {
			e.printStackTrace();

			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	private boolean doEnviarEmailSenha(Grupo grupo, Inscrito inscrito, Usuario usuario, StringBuilder builder) {
		try {
			MimeMessage message = this.mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			boolean enviado = false;
			if (!isEmpty(inscrito.getEmail())) {
				if (this.sendTo != null) {
					helper.addTo(this.sendTo);
				} else {
					helper.addTo(inscrito.getEmail());
				}
			} else {
				builder.append(
						"<br><i><b>Grupo</b></i> " + grupo.getCodigo() + ", " + inscrito.getNome() + " sem e-mail.");
				if (this.sendTo == null) {
					this.dao.getHibernateTemplate().save(new ControleEmail(inscrito.getCodigo(), Integer.valueOf(2)));
				}
				enviado = true;
			}
			if (enviado) {
				return true;
			}
			String html = "Acesse o site <a href=\"http://30dias.net/UmMesParaViver/\">Um M�s para Viver</a> ";
			html = html + "para acompanhar a forma��o de seu grupo e obter o Material de Apoio para as reuni�es.<br>";
			html = html + "Utilize o usu�rio e senha abaixo:<br><br><b>Usu�rio</b>: <i>" + usuario.getLogin() + "</i>";
			html = html + "<br><b>Senha</b>: <i>" + usuario.getSenha() + "</i>";

			helper.setFrom("danielreis@ibmemorial.org.br", "Daniel Reis");
			helper.setReplyTo("danielreis@ibmemorial.org.br", "Daniel Reis");
			helper.setSubject("Um M�s para Viver, acompanhe seu grupo e obtenha o Material de Apoio");
			helper.setText("<html><body>" + html + "</html></body>", true);

			this.mailSender.send(message);

			builder.append("<br><i><b>Grupo</b></i> " + grupo.getCodigo() + ", " + inscrito.getNome()
					+ " enviado com sucesso.");
			if (this.sendTo == null) {
				this.dao.getHibernateTemplate().save(new ControleEmail(inscrito.getCodigo(), Integer.valueOf(2)));
			}
			return true;
		} catch (MailException e) {
			e.printStackTrace();

			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	private String gerarHtml(Grupo grupo, Inscrito facilitador, Inscrito hospedeiro) {
		String html = "<h2>Grupo " + grupo.getCodigo() + "</h2>";

		html = html + "<i><b>Tipo do Grupo:</b></i> " + (grupo.getTipoGrupo() == TipoGrupo.OUTRO ? grupo.getGrupoOutro()
				: grupo.getTipoGrupo().getDescricao());
		html = html + "<br><i><b>Dia:</b></i> " + grupo.getDiaSemana().getDescricao();
		html = html + "<br><i><b>Hor�rio:</b></i> " + grupo.getHorario().getDescricao();
		html = html + "<br><i><b>Quantidade M�xima de Pessoas:</b></i> " + grupo.getQuantidadeMaxima();

		boolean facilitadorHospedeiro = (facilitador != null) && (facilitador.getFuncao() == Funcao.AMBOS);
		if (facilitadorHospedeiro) {
			html = html + "<br><h2>Facilitador e Hospedeiro</h2>";
		} else {
			html = html + "<br><h2>Facilitador</h2>";
		}
		html = html + "<i><b>Nome:</b></i> " + facilitador.getNome();
		if (!isEmpty(facilitador.getEmail())) {
			html = html + "<br><i><b>e-mail:</b></i> " + facilitador.getEmail();
		}
		if (facilitadorHospedeiro) {
			html = html + "<br><i><b>Endere�o:</b></i> " + facilitador.getEndereco();
			if (!isEmpty(facilitador.getComplemento())) {
				html = html + "<br><i><b>Complemento:</b></i> " + facilitador.getComplemento();
			}
			html = html + "<br><i><b>Bairro:</b></i> " + facilitador.getBairro();
			html = html + "<br><i><b>Cidade:</b></i> " + facilitador.getCidade();
		}
		if (!isEmpty(facilitador.getTelefoneResidencial())) {
			html = html + "<br><i><b>Telefone Residencial:</b></i> " + facilitador.getTelefoneResidencial();
		}
		if (!isEmpty(facilitador.getTelefoneComercial())) {
			html = html + "<br><i><b>Telefone Comercial:</b></i> " + facilitador.getTelefoneComercial();
		}
		if (!isEmpty(facilitador.getTelefoneCelular())) {
			html = html + "<br><i><b>Telefone Celular:</b></i> " + facilitador.getTelefoneCelular();
		}
		if (!facilitador.getCodigo().equals(hospedeiro.getCodigo())) {
			html = html + "<br><h2>Hospedeiro</h2>";
			html = html + "<i><b>Nome:</b></i> " + hospedeiro.getNome();
			if (!isEmpty(hospedeiro.getEmail())) {
				html = html + "<br><i><b>e-mail:</b></i> " + hospedeiro.getEmail();
			}
			html = html + "<br><i><b>Endere�o:</b></i> " + hospedeiro.getEndereco();
			if (!isEmpty(hospedeiro.getComplemento())) {
				html = html + "<br><i><b>Complemento:</b></i> " + hospedeiro.getComplemento();
			}
			html = html + "<br><i><b>Bairro:</b></i> " + hospedeiro.getBairro();
			html = html + "<br><i><b>Cidade:</b></i> " + hospedeiro.getCidade();
			if (!isEmpty(hospedeiro.getTelefoneResidencial())) {
				html = html + "<br><i><b>Telefone Residencial:</b></i> " + hospedeiro.getTelefoneResidencial();
			}
			if (!isEmpty(hospedeiro.getTelefoneComercial())) {
				html = html + "<br><i><b>Telefone Comercial:</b></i> " + hospedeiro.getTelefoneComercial();
			}
			if (!isEmpty(hospedeiro.getTelefoneCelular())) {
				html = html + "<br><i><b>Telefone Celular:</b></i> " + hospedeiro.getTelefoneCelular();
			}
		}
		return html;
	}
}
