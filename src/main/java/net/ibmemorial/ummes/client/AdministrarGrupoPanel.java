package net.ibmemorial.ummes.client;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.LazyPanel;
import com.google.gwt.user.client.ui.Panel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.TextBoxBase;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;

import net.ibmemorial.ummes.model.Funcao;
import net.ibmemorial.ummes.model.GrupoDTO;
import net.ibmemorial.ummes.model.Inscrito;
import net.ibmemorial.ummes.model.Participante;
import net.ibmemorial.ummes.shared.Page;

public class AdministrarGrupoPanel extends LazyPanel {
	private final UmMesParaViver entry;
	private Panel previous;
	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private final DiaSemanaConstants diaSemanaConstants = (DiaSemanaConstants) GWT.create(DiaSemanaConstants.class);
	private final HorarioConstants horarioConstants = (HorarioConstants) GWT.create(HorarioConstants.class);
	private final GrupoConstants tipoGrupoConstants = (GrupoConstants) GWT.create(GrupoConstants.class);
	private HTML grupoLabel = new HTML();
	private HTML grupoInfo = new HTML();
	private HTML vagasInfo = new HTML();
	private HTML facilitadorLabel = new HTML();
	private HTML facilitadorInfo = new HTML();
	private HTML hospedeiroLabel = new HTML();
	private HTML hospedeiroInfo = new HTML();
	private final String[] HEADER = { "Nome", "e-mail", "Telefone", "Quantidade de Crian�as" };
	private final String[] HEADER_ADMIN = { "Nome", "e-mail", "Telefone", "Quantidade de Crian�as", "" };
	private FlexTable table = UiUtils.createFlexTable(this.HEADER);
	private Button alterarQuantidadeMaximaPessoasButton = UiUtils.createButton("Alterar Quantidade M�xima de Pessoas");
	private Button voltarButton = UiUtils.createButton("Voltar");
	private Button imprimirButton = UiUtils.createButton("Imprimir");
	private Button adicionarParticipanteButton = UiUtils.createButton("Adicionar Participante");
	private GrupoDTO grupo;
	private int pageNumber = 0;
	private final Map<String, Serializable> searchParameters = new HashMap<String, Serializable>();
	final TextBox novaQuantidadeBox = new TextBox();
	final TextBox nomeTextBox = new TextBox();
	final TextBox emailTextBox = new TextBox();
	final TextBox telefoneTextBox = UiUtils.createTelefoneTextBox(new TextBox());
	final TextBox criancasTextBox = UiUtils.createNumberTextBox(new TextBox());
	final boolean popup;
	final boolean meuGrupo;

	public AdministrarGrupoPanel(UmMesParaViver entry, Panel previous, GrupoDTO grupo, boolean popup,
			boolean meuGrupo) {
		this.entry = entry;
		this.grupo = grupo;
		this.previous = previous;
		this.popup = popup;

		this.meuGrupo = meuGrupo;

		this.searchParameters.put("codigoGrupo", grupo.getGrupo().getCodigo());
	}

	protected Widget createWidget() {
		VerticalPanel panel = new VerticalPanel();
		panel.setSpacing(3);

		this.grupoLabel.setHTML("<h2>Grupo " + this.grupo.getGrupo().getCodigo() + "</h2>");

		this.grupoInfo.setHTML(gerarInfoGrupo());

		atualizarVagasDisponiveis();

		Inscrito facilitador = this.grupo.getFacilitador();
		Inscrito hospedeiro = this.grupo.getHospedeiro();
		boolean facilitadorHospedeiro = (facilitador != null) && (facilitador.getFuncao() == Funcao.AMBOS);
		if (facilitadorHospedeiro) {
			this.facilitadorLabel.setHTML("<h2>Facilitador e Hospedeiro</h2>");
		} else {
			this.facilitadorLabel.setHTML("<h2>Facilitador</h2>");
		}
		String html = "";
		if (facilitador == null) {
			this.facilitadorInfo.setHTML("Selecione um facilitador");
		} else {
			html = "<i><b>Nome:</b></i> " + facilitador.getNome();
			if (!ValidationUtils.isEmpty(facilitador.getEmail())) {
				html = html + "<br><i><b>e-mail:</b></i> " + facilitador.getEmail();
			}
			if (facilitadorHospedeiro) {
				html = html + "<br><i><b>Endere�o:</b></i> " + facilitador.getEndereco();
				if (!ValidationUtils.isEmpty(facilitador.getComplemento())) {
					html = html + "<br><i><b>Complemento:</b></i> " + facilitador.getComplemento();
				}
				html = html + "<br><i><b>Bairro:</b></i> " + facilitador.getBairro();
				html = html + "<br><i><b>Cidade:</b></i> " + facilitador.getCidade();
			}
			if (!ValidationUtils.isEmpty(facilitador.getTelefoneResidencial())) {
				html = html + "<br><i><b>Telefone Residencial:</b></i> " + facilitador.getTelefoneResidencial();
			}
			if (!ValidationUtils.isEmpty(facilitador.getTelefoneComercial())) {
				html = html + "<br><i><b>Telefone Comercial:</b></i> " + facilitador.getTelefoneComercial();
			}
			if (!ValidationUtils.isEmpty(facilitador.getTelefoneCelular())) {
				html = html + "<br><i><b>Telefone Celular:</b></i> " + facilitador.getTelefoneCelular();
			}
			if (!ValidationUtils.isEmpty(facilitador.getObservacao())) {
				html = html + "<br><i><b>Observa��o:</b></i> " + facilitador.getObservacao();
			}
			this.facilitadorInfo.setHTML(html);
		}
		if (!facilitador.getCodigo().equals(hospedeiro.getCodigo())) {
			this.hospedeiroLabel.setHTML("<h2>Hospedeiro</h2>");
			html = "<i><b>Nome:</b></i> " + hospedeiro.getNome();
			if (!ValidationUtils.isEmpty(hospedeiro.getEmail())) {
				html = html + "<br><i><b>e-mail:</b></i> " + hospedeiro.getEmail();
			}
			html = html + "<br><i><b>Endere�o:</b></i> " + hospedeiro.getEndereco();
			if (!ValidationUtils.isEmpty(hospedeiro.getComplemento())) {
				html = html + "<br><i><b>Complemento:</b></i> " + hospedeiro.getComplemento();
			}
			html = html + "<br><i><b>Bairro:</b></i> " + hospedeiro.getBairro();
			html = html + "<br><i><b>Cidade:</b></i> " + hospedeiro.getCidade();
			if (!ValidationUtils.isEmpty(hospedeiro.getTelefoneResidencial())) {
				html = html + "<br><i><b>Telefone Residencial:</b></i> " + hospedeiro.getTelefoneResidencial();
			}
			if (!ValidationUtils.isEmpty(hospedeiro.getTelefoneComercial())) {
				html = html + "<br><i><b>Telefone Comercial:</b></i> " + hospedeiro.getTelefoneComercial();
			}
			if (!ValidationUtils.isEmpty(hospedeiro.getTelefoneCelular())) {
				html = html + "<br><i><b>Telefone Celular:</b></i> " + hospedeiro.getTelefoneCelular();
			}
			if (!ValidationUtils.isEmpty(hospedeiro.getObservacao())) {
				html = html + "<br><i><b>Observa��o:</b></i> " + hospedeiro.getObservacao();
			}
			this.hospedeiroInfo.setHTML(html);
		}
		panel.add(UiUtils.createVPanel(0, new Widget[] { this.grupoLabel, this.grupoInfo }));
		panel.add(this.vagasInfo);
		if ((this.previous != null) && (this.entry.isUserInRole("ADMIN"))) {
			panel.add(this.alterarQuantidadeMaximaPessoasButton);
		}
		VerticalPanel facInfoPanel = UiUtils.createVPanel(0,
				new Widget[] { this.facilitadorLabel, this.facilitadorInfo });
		VerticalPanel hospInfoPanel = UiUtils.createVPanel(0,
				new Widget[] { this.hospedeiroLabel, this.hospedeiroInfo });

		HorizontalPanel hInfoPanel = UiUtils.createHPanel(new Widget[] { facInfoPanel, hospInfoPanel });
		hInfoPanel.setCellWidth(facInfoPanel, "350px");

		panel.add(hInfoPanel);

		panel.add(UiUtils.createSeparator("720px"));

		this.table.setWidth("720px");
		panel.add(this.table);
		panel.setWidth("720px");
		if (this.previous != null) {
			HTML gap = new HTML();
			gap.setWidth("3px");

			HTML gap2 = new HTML();
			gap.setWidth("3px");
			HorizontalPanel buttonPanel = UiUtils.createHPanel(new Widget[] { this.voltarButton, gap,
					this.imprimirButton, gap2, this.adicionarParticipanteButton });
			panel.add(buttonPanel);
			panel.setCellHorizontalAlignment(buttonPanel, HorizontalPanel.ALIGN_RIGHT);
		} else if (!this.popup) {
			panel.add(this.imprimirButton);
			panel.setCellHorizontalAlignment(this.imprimirButton, HorizontalPanel.ALIGN_RIGHT);
		}
		this.imprimirButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				Window.open("popup.html?codigoGrupo=" + AdministrarGrupoPanel.this.grupo.getGrupo().getCodigo(),
						"dadosgrupo", "status=0,toolbar=0,menubar=0,location=0,width=800,height=600,resizable=1");
			}
		});
		this.voltarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				AdministrarGrupoPanel.this.entry.setContent(AdministrarGrupoPanel.this.previous);
			}
		});
		this.adicionarParticipanteButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				DialogBox db = AdministrarGrupoPanel.this.createDialog();
				db.center();

				db.show();
				AdministrarGrupoPanel.this.nomeTextBox.setFocus(true);
			}
		});
		this.alterarQuantidadeMaximaPessoasButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				DialogBox db = AdministrarGrupoPanel.this.createAlterarQtdePessoasDialog();
				db.center();
				db.showRelativeTo(AdministrarGrupoPanel.this.alterarQuantidadeMaximaPessoasButton);
				AdministrarGrupoPanel.this.novaQuantidadeBox.setFocus(true);
			}
		});
		popularMembros();

		return panel;
	}

	private String gerarInfoGrupo() {
		String html = "<i><b>Tipo do Grupo:</b></i> "
				+ this.tipoGrupoConstants.getString(this.grupo.getGrupo().getTipoGrupo().name().toLowerCase());
		html = html + "<br><i><b>Dia:</b></i> "
				+ this.diaSemanaConstants.getString(this.grupo.getGrupo().getDiaSemana().name().toLowerCase());
		html = html + "<br><i><b>Hor�rio:</b></i> "
				+ this.horarioConstants.getString(this.grupo.getGrupo().getHorario().name().toLowerCase());
		html = html + "<br><i><b>Quantidade M�xima de Pessoas:</b></i> " + this.grupo.getGrupo().getQuantidadeMaxima();
		return html;
	}

	public void popularMembros() {
		this.service.getParticipantes(this.searchParameters, this.pageNumber, new AsyncCallback<Page<Participante>>() {
			public void onSuccess(Page<Participante> result) {
				List<Participante> list = result.getResults();
				boolean admin = (AdministrarGrupoPanel.this.previous != null)
						&& (AdministrarGrupoPanel.this.entry.isUserInRole("ADMIN"));

				AdministrarGrupoPanel.this.table.removeAllRows();
				if (!list.isEmpty()) {
					UiUtils.createFlexTableHeader(AdministrarGrupoPanel.this.table,
							admin ? AdministrarGrupoPanel.this.HEADER_ADMIN : AdministrarGrupoPanel.this.HEADER);
				}
				int i = 1;
				for (Iterator<Participante> iterator = list.iterator(); iterator.hasNext(); i++) {
					final Participante participante = (Participante) iterator.next();
					if (admin) {
						final Button excluirButton = UiUtils.createButton("Excluir");
						excluirButton.addClickHandler(new ClickHandler() {
							public void onClick(ClickEvent event) {
								excluirButton.setEnabled(false);
								if (!Window.confirm("Voc� confirma a exclus�o de " + participante.getNome() + "?")) {
									excluirButton.setEnabled(true);
									return;
								}
								AdministrarGrupoPanel.this.service.excluirParticipante(
										AdministrarGrupoPanel.this.grupo.getGrupo().getCodigo(),
										participante.getCodigo(), new AsyncCallback<Boolean>() {
											public void onFailure(Throwable caught) {
												erroExcluir(participante, excluirButton);
											}

											public void onSuccess(Boolean result) {
												if (result.booleanValue()) {
													AdministrarGrupoPanel.this.popularMembros();
													return;
												}
												erroExcluir(participante, excluirButton);
											}

											private void erroExcluir(Participante participante, Button excluirButton) {
												VerticalPanel panel = new VerticalPanel();
												panel.add(new HTML("N�o foi poss�vel excluir o participante "
														+ participante.getNome()));
												DialogBox db = UiUtils.createDialog("Erro ao excluir", "Fechar", panel,
														null);
												UiUtils.show(AdministrarGrupoPanel.this, db);
												excluirButton.setEnabled(true);
											}
										});
							}
						});
						UiUtils.addRow(AdministrarGrupoPanel.this.table, i,
								new Object[] { participante.getNome(), participante.getEmail(),
										participante.getTelefone(), participante.getQuantidadeCriancas(),
										excluirButton });
					} else {
						UiUtils.addRow(AdministrarGrupoPanel.this.table, i,
								new Object[] { participante.getNome(), participante.getEmail(),
										participante.getTelefone(), participante.getQuantidadeCriancas() });
					}
				}
				AdministrarGrupoPanel.this.table.setVisible(!list.isEmpty());
				AdministrarGrupoPanel.this.grupo.setQuantidadeInscritos(list.size());
				AdministrarGrupoPanel.this.atualizarVagasDisponiveis();
				if (AdministrarGrupoPanel.this.popup) {
					Window.print();
				}
			}

			public void onFailure(Throwable caught) {
				VerticalPanel panel = new VerticalPanel();
				panel.add(new HTML(caught.getMessage()));
				DialogBox db = UiUtils.createDialog("Erro", "Fechar", panel, null);
				UiUtils.show(AdministrarGrupoPanel.this, db);
			}
		});
	}

	private DialogBox createDialog() {
		VerticalPanel dialogPanel = new VerticalPanel();
		dialogPanel.setSize("210px", "100px");

		this.nomeTextBox.setText("");
		this.nomeTextBox.removeStyleName("TextBox-error");
		this.nomeTextBox.setWidth("350px");

		this.emailTextBox.setText("");
		this.emailTextBox.removeStyleName("TextBox-error");
		this.emailTextBox.setWidth("350px");

		this.telefoneTextBox.setText("");
		this.telefoneTextBox.removeStyleName("TextBox-error");
		this.telefoneTextBox.setWidth("350px");

		this.criancasTextBox.setText("");
		this.criancasTextBox.setMaxLength(2);
		this.criancasTextBox.removeStyleName("TextBox-error");
		this.criancasTextBox.setWidth("50");

		final HTML mensagemErro = new HTML("");
		mensagemErro.setVisible(false);
		mensagemErro.getElement().setId("mensagemErro");

		dialogPanel.add(mensagemErro);

		dialogPanel.add(UiUtils.createPanel(new HTML("<b>Nome</b>"), this.nomeTextBox));
		dialogPanel.add(UiUtils.createPanel(new HTML("<b>e-mail</b>"), this.emailTextBox));
		dialogPanel.add(UiUtils.createPanel(new HTML("<b>Telefone</b>"), this.telefoneTextBox));
		dialogPanel.add(UiUtils.createPanel(new HTML("<b>Quantidade de Crian�as</b>"), this.criancasTextBox));

		final DialogBox dialogBox = new DialogBox();
		dialogBox.setText("Dados do Novo Participante");
		dialogBox.setAnimationEnabled(true);

		Button cancelarButton = new Button("Cancelar");
		cancelarButton.getElement().setId("sairButton");

		final Button cadastrarButton = new Button("Cadastrar");
		cadastrarButton.getElement().setId("entrarButton");

		HorizontalPanel buttonPanel = UiUtils.createHPanel(new Widget[] { cancelarButton, cadastrarButton });
		buttonPanel.setCellWidth(cancelarButton, "148px");

		dialogPanel.add(buttonPanel);

		dialogBox.setWidget(dialogPanel);

		this.nomeTextBox.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == 13) {
					cadastrarButton.setEnabled(false);
					if (!AdministrarGrupoPanel.this.cadastrar(dialogBox, mensagemErro)) {
						cadastrarButton.setEnabled(true);
					}
				}
			}
		});
		this.emailTextBox.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == 13) {
					cadastrarButton.setEnabled(false);
					if (!AdministrarGrupoPanel.this.cadastrar(dialogBox, mensagemErro)) {
						cadastrarButton.setEnabled(true);
					}
				}
			}
		});
		this.telefoneTextBox.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == 13) {
					cadastrarButton.setEnabled(false);
					if (!AdministrarGrupoPanel.this.cadastrar(dialogBox, mensagemErro)) {
						cadastrarButton.setEnabled(true);
					}
				}
			}
		});
		this.criancasTextBox.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == 13) {
					cadastrarButton.setEnabled(false);
					if (!AdministrarGrupoPanel.this.cadastrar(dialogBox, mensagemErro)) {
						cadastrarButton.setEnabled(true);
					}
				}
			}
		});
		cancelarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				dialogBox.hide();
			}
		});
		cadastrarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				cadastrarButton.setEnabled(false);
				if (!AdministrarGrupoPanel.this.cadastrar(dialogBox, mensagemErro)) {
					cadastrarButton.setEnabled(true);
				}
			}
		});
		return dialogBox;
	}

	private DialogBox createAlterarQtdePessoasDialog() {
		VerticalPanel dialogPanel = new VerticalPanel();
		dialogPanel.setSize("250px", "50px");

		this.novaQuantidadeBox.setText(this.grupo.getGrupo().getQuantidadeMaxima().toString());
		this.novaQuantidadeBox.setWidth("50px");

		final HTML mensagemErro = new HTML("");
		mensagemErro.setVisible(false);
		mensagemErro.getElement().setId("mensagemErro");

		dialogPanel.add(mensagemErro);

		dialogPanel.add(UiUtils.createPanel(new HTML("<b>Quantidade M�xima de Pessoas</b>"), this.novaQuantidadeBox));

		final DialogBox dialogBox = new DialogBox();
		dialogBox.setText("Grupo " + this.grupo.getGrupo().getCodigo());
		dialogBox.setAnimationEnabled(true);

		Button cancelarButton = new Button("Cancelar");
		cancelarButton.getElement().setId("sairButton");

		final Button alterarButton = new Button("Alterar");
		alterarButton.getElement().setId("entrarButton");

		HorizontalPanel buttonPanel = UiUtils.createHPanel(new Widget[] { cancelarButton, alterarButton });
		buttonPanel.setCellWidth(cancelarButton, "148px");

		dialogPanel.add(buttonPanel);

		dialogBox.setWidget(dialogPanel);

		this.novaQuantidadeBox.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == 13) {
					alterarButton.setEnabled(false);
					if (!AdministrarGrupoPanel.this.alterarQuantidadeMaxima(dialogBox, mensagemErro)) {
						alterarButton.setEnabled(true);
					}
				}
			}
		});
		cancelarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				dialogBox.hide();
			}
		});
		alterarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				alterarButton.setEnabled(false);
				if (!AdministrarGrupoPanel.this.alterarQuantidadeMaxima(dialogBox, mensagemErro)) {
					alterarButton.setEnabled(true);
				}
			}
		});
		return dialogBox;
	}

	public boolean alterarQuantidadeMaxima(final DialogBox dialogBox, final HTML erro) {
		erro.setVisible(false);
		if (!ValidationUtils.isInteger(this.novaQuantidadeBox.getText())) {
			erro.setHTML("<b>Quantidade inv�lida</b>");
			erro.setVisible(true);
			return false;
		}
		final Integer quantidade = new Integer(this.novaQuantidadeBox.getText());
		if ((quantidade.intValue() < 2) || (quantidade.intValue() > 99)) {
			erro.setHTML("<b>Quantidade inv�lida</b>");
			erro.setVisible(true);
			return false;
		}
		if (quantidade == this.grupo.getGrupo().getQuantidadeMaxima()) {
			dialogBox.hide();
			return true;
		}
		this.service.alterarQuantidade(this.grupo.getGrupo().getCodigo(), quantidade, new AsyncCallback<Boolean>() {
			public void onFailure(Throwable caught) {
				erro.setHTML("Ocorreu um erro. Tente novamente. " + caught.getMessage());
				erro.setVisible(true);
			}

			public void onSuccess(Boolean result) {
				if (!result.booleanValue()) {
					erro.setHTML("N�o foi poss�vel alterar a quantidade.");
					erro.setVisible(true);
				} else {
					AdministrarGrupoPanel.this.grupo.getGrupo().setQuantidadeMaxima(quantidade);
					AdministrarGrupoPanel.this.grupoInfo.setHTML(AdministrarGrupoPanel.this.gerarInfoGrupo());
					dialogBox.hide();
				}
				AdministrarGrupoPanel.this.popularMembros();
			}
		});
		return true;
	}

	public boolean cadastrar(final DialogBox dialogBox, final HTML erro) {
		erro.setVisible(false);
		List<String> mensagens = new LinkedList<String>();
		if (((!ValidationUtils.validateRequired(mensagens, "<b>Nome</b>", this.nomeTextBox))
				|| (!ValidationUtils.validateMinLength(mensagens, "<b>Nome</b>", this.nomeTextBox, 3))
				|| (ValidationUtils.validateMaxLength(mensagens, "<b>Nome</b>", this.nomeTextBox, 50))) || (

		((!ValidationUtils.validateEmail(mensagens, "<b>e-mail</b>", this.emailTextBox))
				|| (ValidationUtils.validateMaxLength(mensagens, "<b>e-mail</b>", this.emailTextBox, 100))) ||

				(!ValidationUtils.validateMaxLength(mensagens, "<b>Telefone</b>", this.telefoneTextBox, 15)))) {
		}
		if ((ValidationUtils.validateOneRequired(mensagens, "<b>e-mail</b> ou <b>Telefone</b>",
				new TextBoxBase[] { this.emailTextBox, this.telefoneTextBox, this.criancasTextBox })) ||

				(!mensagens.isEmpty())) {
			String html = null;
			for (String string : mensagens) {
				if (html == null) {
					html = string;
				} else {
					html = html + "<br>" + string;
				}
			}
			erro.setHTML(html);
			erro.setVisible(true);
			return false;
		}
		erro.setVisible(false);

		Participante participante = new Participante();

		participante.setCodigoGrupo(this.grupo.getGrupo().getCodigo());
		participante.setNome(this.nomeTextBox.getText());
		participante.setEmail(this.emailTextBox.getText());
		participante.setTelefone(this.telefoneTextBox.getText());
		if (ValidationUtils.isInteger(this.criancasTextBox.getText())) {
			participante.setQuantidadeCriancas(new Integer(this.criancasTextBox.getText()));
		}
		this.service.cadastrarParticipante(participante, new AsyncCallback<Boolean>() {
			public void onFailure(Throwable caught) {
				erro.setHTML("Ocorreu um erro. Tente novamente. " + caught.getMessage());
				erro.setVisible(true);
			}

			public void onSuccess(Boolean result) {
				if (!result.booleanValue()) {
					erro.setHTML("Grupo n�o possui vagas. Tente outro grupo.");
					erro.setVisible(true);
				} else {
					dialogBox.hide();
				}
				AdministrarGrupoPanel.this.popularMembros();
			}
		});
		return true;
	}

	protected void atualizarVagasDisponiveis() {
		String html = "<br><i><b>Quantidade Vagas Dispon�veis:</b></i> ";
		if (this.grupo.getVagasDisponiveis() <= 0) {
			html = html + " ESGOTADO";
		} else {
			html = html + this.grupo.getVagasDisponiveis();
		}
		this.vagasInfo.setHTML(html);
		this.adicionarParticipanteButton.setEnabled(this.grupo.getVagasDisponiveis() > 0);
	}
}
