package net.ibmemorial.ummes.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.LazyPanel;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.TabPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;
import java.util.LinkedList;
import java.util.List;
import net.ibmemorial.ummes.model.DiaSemana;
import net.ibmemorial.ummes.model.Funcao;
import net.ibmemorial.ummes.model.Grupo;
import net.ibmemorial.ummes.model.Horario;
import net.ibmemorial.ummes.model.Inscrito;
import net.ibmemorial.ummes.model.InscritoDTO;
import net.ibmemorial.ummes.model.TipoGrupo;

public class FormacaoGruposPanel extends LazyPanel {
	private final UmMesParaViver entry;

	public FormacaoGruposPanel(UmMesParaViver entry) {
		this.entry = entry;
	}

	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private final DiaSemanaConstants diaSemanaConstants = (DiaSemanaConstants) GWT.create(DiaSemanaConstants.class);
	private final HorarioConstants horarioConstants = (HorarioConstants) GWT.create(HorarioConstants.class);
	private HTML facilitadorLabel = new HTML("<h2>Facilitador Escolhido</h2>");
	private HTML facilitadorInfo = new HTML("Escolha um facilitador");
	private HTML hospedeiroLabel = new HTML("<h2>Hospedeiro Escolhido</h2>");
	private HTML hospedeiroInfo = new HTML("Escolha um hospedeiro");
	private HTML diaSemanaLabel = new HTML("<b>Dia da Semana</b>");
	private ListBox diasSemanaListBox = UiUtils.createDiasSemanaListBox(":: Selecione ::");
	private HTML horarioLabel = new HTML("<b>Hor�rio</b>");
	private ListBox horariosListBox = UiUtils.createHorariosListBox(":: Selecione ::");
	private HTML tipoGrupoLabel = new HTML("<b>Tipo do Grupo</b>");
	private ListBox tipoGrupoListBox = UiUtils.createTipoGrupoListBox(":: Selecione ::");
	private TextBox tipoGrupoOutroTextBox = new TextBox();
	private final HTML numeroMaximoPessoasLabel = new HTML("<b>Quantidade de Adultos</b>");
	private final TextBox quantidadeAdultosTextBox = createAdultosTextBox();
	private Button limparButton = UiUtils.createButton("Limpar");
	private Button criarGrupoButton = UiUtils.createButton("Criar Grupo");
	private PesquisaFacHospPanel pesquisaHospedeiroPanel;
	private InscritoDTO facilitador;
	private InscritoDTO hospedeiro;

	protected Widget createWidget() {
		VerticalPanel panel = new VerticalPanel();
		panel.setSpacing(0);

		TabPanel tabPanel = new TabPanel();

		tabPanel.add(new PesquisaFacHospPanel(this.entry, true, this), "Facilitadores");
		tabPanel.add(this.pesquisaHospedeiroPanel = new PesquisaFacHospPanel(this.entry, false, this), "Hospedeiros");
		tabPanel.selectTab(0);

		VerticalPanel facInfoPanel = UiUtils.createVPanel(0,
				new Widget[] { this.facilitadorLabel, this.facilitadorInfo });
		VerticalPanel hospInfoPanel = UiUtils.createVPanel(0,
				new Widget[] { this.hospedeiroLabel, this.hospedeiroInfo });

		HorizontalPanel hInfoPanel = UiUtils.createHPanel(new Widget[] { facInfoPanel, hospInfoPanel });
		hInfoPanel.setCellWidth(facInfoPanel, "350px");

		panel.add(hInfoPanel);

		panel.add(UiUtils.createSeparator("720px"));

		HTML gap = new HTML(" ");
		gap.setWidth("10px");
		panel.add(UiUtils.createHPanel(new Widget[] { UiUtils.createPanel(this.diaSemanaLabel, this.diasSemanaListBox),
				UiUtils.createPanel(this.horarioLabel, this.horariosListBox),
				UiUtils.createPanel(this.tipoGrupoLabel,
						UiUtils.createHPanel(new Widget[] { this.tipoGrupoListBox, gap, this.tipoGrupoOutroTextBox })),
				UiUtils.createPanel(this.numeroMaximoPessoasLabel, this.quantidadeAdultosTextBox) }));

		this.tipoGrupoListBox.addChangeHandler(new ChangeHandler() {
			public void onChange(ChangeEvent event) {
				FormacaoGruposPanel.this.tipoGrupoChanged();
			}
		});
		HTML gap01 = new HTML();

		HorizontalPanel buttonPanel = UiUtils
				.createHPanel(new Widget[] { this.limparButton, gap01, this.criarGrupoButton });
		panel.add(buttonPanel);
		panel.setCellHorizontalAlignment(buttonPanel, VerticalPanel.ALIGN_RIGHT);

		panel.add(tabPanel);

		this.criarGrupoButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				FormacaoGruposPanel.this.criarGrupo();
			}
		});
		this.limparButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				FormacaoGruposPanel.this.setFacilitador(null);
				FormacaoGruposPanel.this.diasSemanaListBox.setSelectedIndex(0);
				FormacaoGruposPanel.this.tipoGrupoListBox.setSelectedIndex(0);
				FormacaoGruposPanel.this.horariosListBox.setSelectedIndex(0);
				FormacaoGruposPanel.this.tipoGrupoOutroTextBox.setText("");
				FormacaoGruposPanel.this.quantidadeAdultosTextBox.setText("");
			}
		});
		panel.setWidth("720px");

		checarFacilitadorHospedeiro();

		return panel;
	}

	public void setFacilitador(InscritoDTO facilitador) {
		this.facilitador = facilitador;
		if ((facilitador != null) && (facilitador.getInscrito().getFuncao() == Funcao.AMBOS)) {
			this.hospedeiro = null;
		}
		checarFacilitadorHospedeiro();
	}

	public void setHospedeiro(InscritoDTO hospedeiro) {
		this.hospedeiro = ((this.facilitador != null) && (this.facilitador.getInscrito().getFuncao() == Funcao.AMBOS)
				? null
				: hospedeiro);

		checarFacilitadorHospedeiro();
	}

	private void checarFacilitadorHospedeiro() {
		boolean selecionarHospedeiro = (this.facilitador != null)
				&& (this.facilitador.getInscrito().getFuncao() != Funcao.AMBOS);

		boolean facilitadorHospedeiro = (this.facilitador != null)
				&& (this.facilitador.getInscrito().getFuncao() == Funcao.AMBOS);
		if (facilitadorHospedeiro) {
			this.facilitadorLabel.setHTML("<h2>Facilitador e Hospedeiro Escolhido</h2>");
		} else {
			this.facilitadorLabel.setHTML("<h2>Facilitador Escolhido</h2>");
		}
		if (this.facilitador == null) {
			this.facilitadorInfo.setHTML("Selecione um facilitador");
		} else {
			String html = "<i><b>Nome:</b></i> " + this.facilitador.getInscrito().getNome();
			if (!ValidationUtils.isEmpty(this.facilitador.getInscrito().getEmail())) {
				html = html + "<br><i><b>e-mail:</b></i> " + this.facilitador.getInscrito().getEmail();
			}
			if (facilitadorHospedeiro) {
				html = html + "<br><i><b>Endere�o:</b></i> " + this.facilitador.getInscrito().getEndereco();
				if (!ValidationUtils.isEmpty(this.facilitador.getInscrito().getComplemento())) {
					html = html + "<br><i><b>Complemento:</b></i> " + this.facilitador.getInscrito().getComplemento();
				}
			}
			if (!ValidationUtils.isEmpty(this.facilitador.getInscrito().getBairro())) {
				html = html + "<br><i><b>Bairro:</b></i> " + this.facilitador.getInscrito().getBairro();
			}
			if (!ValidationUtils.isEmpty(this.facilitador.getInscrito().getCidade())) {
				html = html + "<br><i><b>Cidade:</b></i> " + this.facilitador.getInscrito().getCidade();
			}
			if (facilitadorHospedeiro) {
				html =

						html + "<br><i><b>Quantidade:</b></i> "
								+ this.facilitador.getInscrito().getQuantidadeAdultos().intValue() + " adultos e "
								+ this.facilitador.getInscrito().getQuantidadeCriancas() + " crian�as";
			}
			html = html + "<br><i><b>Tipo do Grupo:</b></i> " + UiUtils.getEnumsAsString(this.facilitador);
			html = html + "<br><i><b>Dia:</b></i> "
					+ UiUtils.getEnumsAsString(this.facilitador.getDiasSemana(), this.diaSemanaConstants);
			html = html + "<br><i><b>Hor�rios:</b></i> "
					+ UiUtils.getEnumsAsString(this.facilitador.getHorarios(), this.horarioConstants);
			if (!ValidationUtils.isEmpty(this.facilitador.getInscrito().getObservacao())) {
				html = html + "<br><i><b>Observa��o:</b></i> " + this.facilitador.getInscrito().getObservacao();
			}
			this.facilitadorInfo.setHTML(html);
		}
		this.criarGrupoButton.setEnabled(((this.facilitador != null) && (this.hospedeiro != null))
				|| ((this.facilitador != null) && (this.facilitador.getInscrito().getFuncao() == Funcao.AMBOS)));

		this.hospedeiroLabel.setVisible(selecionarHospedeiro);
		this.hospedeiroInfo.setVisible(selecionarHospedeiro);
		if (this.hospedeiro == null) {
			this.hospedeiroInfo.setHTML("Selecione um hospedeiro");
		} else {
			String html = "<i><b>Nome:</b></i> " + this.hospedeiro.getInscrito().getNome();
			if (!ValidationUtils.isEmpty(this.hospedeiro.getInscrito().getEmail())) {
				html = html + "<br><i><b>e-mail:</b></i> " + this.hospedeiro.getInscrito().getEmail();
			}
			html = html + "<br><i><b>Endere�o:</b></i> " + this.hospedeiro.getInscrito().getEndereco();
			if (!ValidationUtils.isEmpty(this.hospedeiro.getInscrito().getComplemento())) {
				html = html + "<br><i><b>Complemento:</b></i> " + this.hospedeiro.getInscrito().getComplemento();
			}
			html = html + "<br><i><b>Bairro:</b></i> " + this.hospedeiro.getInscrito().getBairro();
			html = html + "<br><i><b>Cidade:</b></i> " + this.hospedeiro.getInscrito().getCidade();
			html = html + "<br><i><b>Quantidade:</b></i> "
					+ this.hospedeiro.getInscrito().getQuantidadeAdultos().intValue() + " adultos e "
					+ this.hospedeiro.getInscrito().getQuantidadeCriancas() + " crian�as";

			html = html + "<br><i><b>Tipo do Grupo:</b></i> " + UiUtils.getEnumsAsString(this.hospedeiro);
			html = html + "<br><i><b>Dia:</b></i> "
					+ UiUtils.getEnumsAsString(this.hospedeiro.getDiasSemana(), this.diaSemanaConstants);
			html = html + "<br><i><b>Hor�rios:</b></i> "
					+ UiUtils.getEnumsAsString(this.hospedeiro.getHorarios(), this.horarioConstants);
			if (!ValidationUtils.isEmpty(this.hospedeiro.getInscrito().getObservacao())) {
				html = html + "<br><i><b>Observa��o:</b></i> " + this.hospedeiro.getInscrito().getObservacao();
			}
			this.hospedeiroInfo.setHTML(html);
		}
		this.diasSemanaListBox.setSelectedIndex(getDiaSemanaIndex());
		this.tipoGrupoListBox.setSelectedIndex(getTipoGrupoIndex());
		this.horariosListBox.setSelectedIndex(getHorarioIndex());
		this.quantidadeAdultosTextBox.setText(getQuantidadeAdultos());
		this.tipoGrupoOutroTextBox.setText(getTipoOutro());

		tipoGrupoChanged();

		this.pesquisaHospedeiroPanel.facilitadorChanged(this.facilitador);
	}

	private void tipoGrupoChanged() {
		this.tipoGrupoOutroTextBox.setText("");
		if (this.tipoGrupoListBox.getSelectedIndex() - 1 == TipoGrupo.OUTRO.ordinal()) {
			this.tipoGrupoOutroTextBox.setVisible(true);
		} else {
			this.tipoGrupoOutroTextBox.setVisible(false);
		}
	}

	private String getQuantidadeAdultos() {
		if ((this.facilitador == null)
				|| ((this.facilitador.getInscrito().getFuncao() != Funcao.AMBOS) && (this.hospedeiro == null))) {
			return "";
		}
		if (this.hospedeiro == null) {
			return this.facilitador.getInscrito().getQuantidadeAdultos().toString();
		}
		return this.hospedeiro.getInscrito().getQuantidadeAdultos().toString();
	}

	private String getTipoOutro() {
		if ((this.facilitador == null)
				|| ((this.facilitador.getInscrito().getFuncao() != Funcao.AMBOS) && (this.hospedeiro == null))) {
			return "";
		}
		if (this.hospedeiro == null) {
			return this.facilitador.getInscrito().getGrupoOutro();
		}
		return this.hospedeiro.getInscrito().getGrupoOutro();
	}

	private int getDiaSemanaIndex() {
		if ((this.facilitador == null)
				|| ((this.facilitador.getInscrito().getFuncao() != Funcao.AMBOS) && (this.hospedeiro == null))) {
			return 0;
		}
		if (this.hospedeiro == null) {
			return this.facilitador.getDiasSemana()[0].ordinal() + 1;
		}
		for (int i = 0; i < this.facilitador.getDiasSemana().length; i++) {
			for (int j = 0; j < this.hospedeiro.getDiasSemana().length; j++) {
				if (this.facilitador.getDiasSemana()[i] == this.hospedeiro.getDiasSemana()[j]) {
					return this.facilitador.getDiasSemana()[i].ordinal() + 1;
				}
			}
		}
		return 0;
	}

	private int getTipoGrupoIndex() {
		if ((this.facilitador == null)
				|| ((this.facilitador.getInscrito().getFuncao() != Funcao.AMBOS) && (this.hospedeiro == null))) {
			return 0;
		}
		if (this.hospedeiro == null) {
			return this.facilitador.getTiposGrupo()[0].ordinal() + 1;
		}
		for (int i = 0; i < this.facilitador.getTiposGrupo().length; i++) {
			for (int j = 0; j < this.hospedeiro.getTiposGrupo().length; j++) {
				if (this.facilitador.getTiposGrupo()[i] == this.hospedeiro.getTiposGrupo()[j]) {
					return this.facilitador.getTiposGrupo()[i].ordinal() + 1;
				}
			}
		}
		return 0;
	}

	private int getHorarioIndex() {
		if ((this.facilitador == null)
				|| ((this.facilitador.getInscrito().getFuncao() != Funcao.AMBOS) && (this.hospedeiro == null))) {
			return 0;
		}
		if (this.hospedeiro == null) {
			return this.facilitador.getHorarios()[0].ordinal() + 1;
		}
		for (int i = 0; i < this.facilitador.getHorarios().length; i++) {
			for (int j = 0; j < this.hospedeiro.getHorarios().length; j++) {
				if (this.facilitador.getHorarios()[i] == this.hospedeiro.getHorarios()[j]) {
					return this.facilitador.getHorarios()[i].ordinal() + 1;
				}
			}
		}
		return 0;
	}

	private void criarGrupo() {
		this.criarGrupoButton.setEnabled(false);

		List<String> erros = new LinkedList();
		if (this.facilitador == null) {
			erros.add("Selecione um <b>Facilitador</b>");
		} else if ((this.facilitador.getInscrito().getFuncao() == Funcao.FACILITADOR) && (this.hospedeiro == null)) {
			erros.add("Selecione um <b>Hospedeiro</b>");
		}
		if (this.diasSemanaListBox.getSelectedIndex() < 1) {
			erros.add("Selecione um <b>Dia da Semana</b>");
		}
		if (this.horariosListBox.getSelectedIndex() < 1) {
			erros.add("Selecione um <b>Hor�rio</b>");
		}
		if (this.tipoGrupoListBox.getSelectedIndex() < 1) {
			erros.add("Selecione um <b>Tipo de Grupo</b>");
		} else if ((this.tipoGrupoListBox.getSelectedIndex() - 1 == TipoGrupo.OUTRO.ordinal())
				&& (ValidationUtils.isEmpty(this.tipoGrupoOutroTextBox.getText()))) {
			erros.add("Defina o <b>Tipo de Grupo</b>");
		}
		if ((ValidationUtils.validateInteger(erros, "<b>Quantidade de Adultos</b>", this.quantidadeAdultosTextBox)) ||

				(!erros.isEmpty())) {
			showErrors(erros);

			this.criarGrupoButton.setEnabled(((this.facilitador != null) && (this.hospedeiro != null))
					|| ((this.facilitador != null) && (this.facilitador.getInscrito().getFuncao() == Funcao.AMBOS)));
			return;
		}
		Grupo grupo = new Grupo();
		grupo.setCodigoFacilitador(this.facilitador.getInscrito().getCodigo());
		grupo.setCodigoHospedeiro(this.hospedeiro == null ? this.facilitador.getInscrito().getCodigo()
				: this.hospedeiro.getInscrito().getCodigo());
		grupo.setDiaSemana(DiaSemana.values()[(this.diasSemanaListBox.getSelectedIndex() - 1)]);
		grupo.setHorario(Horario.values()[(this.horariosListBox.getSelectedIndex() - 1)]);
		grupo.setTipoGrupo(TipoGrupo.values()[(this.tipoGrupoListBox.getSelectedIndex() - 1)]);
		grupo.setGrupoOutro(this.tipoGrupoOutroTextBox.getText());
		grupo.setQuantidadeMaxima(new Integer(this.quantidadeAdultosTextBox.getText()));

		this.service.formarGrupo(grupo, new AsyncCallback() {
			public void onSuccess(Object result) {
				VerticalPanel panel = new VerticalPanel();
				panel.add(new HTML("Grupo <b>" + result + "</b> criado com sucesso."));
				DialogBox db = UiUtils.createDialog("Sucesso", "Fechar", panel, new ClickHandler() {
					public void onClick(ClickEvent event) {
						FormacaoGruposPanel.this.entry
								.setContent(new FormacaoGruposPanel(FormacaoGruposPanel.this.entry));
					}
				});
				db.center();
				db.show();

				FormacaoGruposPanel.this.criarGrupoButton.setEnabled(true);
			}

			public void onFailure(Throwable caught) {
				VerticalPanel panel = new VerticalPanel();
				panel.add(new HTML(caught.getMessage()));
				DialogBox db = UiUtils.createDialog("Erro", "Fechar", panel, null);
				UiUtils.show(FormacaoGruposPanel.this, db);
				FormacaoGruposPanel.this.criarGrupoButton.setEnabled(((FormacaoGruposPanel.this.facilitador != null)
						&& (FormacaoGruposPanel.this.hospedeiro != null))
						|| ((FormacaoGruposPanel.this.facilitador != null)
								&& (FormacaoGruposPanel.this.facilitador.getInscrito().getFuncao() == Funcao.AMBOS)));
			}
		});
	}

	private TextBox createAdultosTextBox() {
		final TextBox tb = new TextBox();

		tb.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				tb.setText(tb.getText().replaceAll("[^0-9]", ""));
			}
		});
		return tb;
	}

	private void showErrors(List<String> erros) {
		DialogBox dialogBox = UiUtils.createErrorsDialog("Erro", "Fechar", erros);

		UiUtils.show(this, dialogBox);
	}
}
