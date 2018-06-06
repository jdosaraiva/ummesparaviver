package net.ibmemorial.ummes.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.LazyPanel;
import com.google.gwt.user.client.ui.Panel;
import com.google.gwt.user.client.ui.RadioButton;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.SuggestBox;
import com.google.gwt.user.client.ui.TextArea;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;
import java.util.LinkedList;
import java.util.List;
import net.ibmemorial.ummes.model.DiaSemana;
import net.ibmemorial.ummes.model.Funcao;
import net.ibmemorial.ummes.model.Horario;
import net.ibmemorial.ummes.model.Inscrito;
import net.ibmemorial.ummes.model.TipoGrupo;

public class InscricaoHospedeiroFacilitadorPanel extends LazyPanel {
	private final UmMesParaViver entry;
	private final boolean areaRestrita;
	private static final String DEFAULT_STYLE = "InscricaoHospedeiroFacilitadorPanel";

	public InscricaoHospedeiroFacilitadorPanel(UmMesParaViver entry, boolean areaRestrita) {
		this.entry = entry;
		this.areaRestrita = areaRestrita;
	}

	private final InscricaoHospedeiroFacilitadorConstants constants = (InscricaoHospedeiroFacilitadorConstants) GWT
			.create(InscricaoHospedeiroFacilitadorConstants.class);
	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private final HTML tipoCadastroLabel = new HTML(this.constants.tipoCadastroLabel());
	private final RadioButton ambosRadioButton = createFuncaoRadioButton(Funcao.AMBOS);
	private final RadioButton facilitadorRadioButton = createFuncaoRadioButton(Funcao.FACILITADOR);
	private final RadioButton hospedeiroRadioButton = createFuncaoRadioButton(Funcao.HOSPEDEIRO);
	private final HTML nomeLabel = new HTML(this.constants.nomeLabel());
	private final TextBox nomeTextBox = UiUtils.createTextBox((TextBox) create("nomeTextBox", new TextBox()), 50);
	private final HTML enderecoLabel = new HTML(this.constants.enderecoLabel());
	private final TextBox enderecoTextBox = UiUtils.createTextBox((TextBox) create("enderecoTextBox", new TextBox()),
			100);
	private final HTML complementoLabel = new HTML(this.constants.complementoLabel());
	private final TextBox complementoTextBox = UiUtils
			.createTextBox((TextBox) create("complementoTextBox", new TextBox()), 30);
	private final HTML bairroLabel = new HTML(this.constants.bairroLabel());
	private final SuggestBox bairroTextBox = (SuggestBox) create("bairroTextBox", UiUtils.createBairroSuggestionBox());
	private final HTML cidadeLabel = new HTML(this.constants.cidadeLabel());
	private final SuggestBox cidadeTextBox = (SuggestBox) create("cidadeTextBox", UiUtils.createCidadeSuggestionBox());
	private final HTML cepLabel = new HTML(this.constants.cepLabel());
	private final TextBox cepTextBox = UiUtils.createCEPTextBox((TextBox) create("cepTextBox", new TextBox()));
	private final HTML telefoneResidencialLabel = new HTML(this.constants.telefoneResidencialLabel());
	private final TextBox telefoneResidencialTextBox = UiUtils
			.createTelefoneTextBox((TextBox) create("telefoneResidencialTextBox", new TextBox()));
	private final HTML telefoneComercialLabel = new HTML(this.constants.telefoneComercialLabel());
	private final TextBox telefoneComercialTextBox = UiUtils
			.createTelefoneTextBox((TextBox) create("telefoneComercialTextBox", new TextBox()));
	private final HTML telefoneCelularLabel = new HTML(this.constants.telefoneCelularLabel());
	private final TextBox telefoneCelularTextBox = UiUtils
			.createTelefoneTextBox((TextBox) create("telefoneCelularTextBox", new TextBox()));
	private final HTML emailLabel = new HTML(this.constants.emailLabel());
	private final TextBox emailTextBox = UiUtils.createTextBox((TextBox) create("emailTextBox", new TextBox()), 100);
	private final HTML diasLabel = new HTML(this.constants.diasLabel());
	private final CheckBox[] diasCheckBox = UiUtils.createDiasSemanaCheckBoxes();
	private final HTML melhorHorarioLabel = new HTML(this.constants.melhorHorarioLabel());
	private final CheckBox[] horariosCheckBox = UiUtils.createHorariosCheckBoxes();
	private final HTML numeroMaximoPessoasLabel = new HTML(this.constants.numeroMaximoPessoasLabel());
	private final TextBox quantidadeAdultosTextBox = createAdultosTextBox();
	private final HTML adultosLabel = (HTML) create("adultosLabel", new HTML(this.constants.adultosLabel()));
	private final TextBox quantidadeCriancasTextBox = createCriancasTextBox();
	private final HTML criancasLabel = (HTML) create("criancasLabel", new HTML(this.constants.criancasLabel()));
	private final HTML observacaoLabel = new HTML(this.constants.observacaoLabel());
	private final TextArea observacaoTextArea = (TextArea) create("observacaoTextArea", new TextArea());
	private final Button confirmarButton = createConfirmarButton();
	private final HTML membroLabel = new HTML(this.constants.membroLabel());
	private final RadioButton membroSimRadioButton = UiUtils.createRadioButton("membroRadioGroup", "SIM",
			this.constants.simLabel());
	private final RadioButton membroNaoRadioButton = UiUtils.createRadioButton("membroRadioGroup", "NAO",
			this.constants.naoLabel());
	private final HTML tipoGrupoLabel = new HTML(this.constants.tipoGrupoLabel());
	private final CheckBox[] tipoGrupoCheckBoxes = UiUtils.createTipoGrupoCheckBoxes();
	private final TextBox tipoOutroTextBox = createTipoOutro();
	private final Panel facilitadorPanel = new VerticalPanel();
	private final Panel hospedeiroPanel = new VerticalPanel();
	private final HorizontalPanel hospHPanel01 = new HorizontalPanel();
	private final HorizontalPanel hospHPanel02 = new HorizontalPanel();
	private final Panel bairroCidadePanel = new HorizontalPanel();
	private HTML footer;

	protected Widget createWidget() {
		VerticalPanel panel = new VerticalPanel();
		panel.setStyleName("InscricaoHospedeiroFacilitadorPanel");
		panel.setSpacing(5);

		HorizontalPanel facHospPanel = UiUtils.createHPanel(0,
				new Widget[] { this.ambosRadioButton, this.facilitadorRadioButton, this.hospedeiroRadioButton });
		facHospPanel.setCellWidth(this.ambosRadioButton, "200px");
		facHospPanel.setCellWidth(this.facilitadorRadioButton, "150px");
		panel.add(UiUtils.createPanel(this.tipoCadastroLabel, facHospPanel));
		panel.add(this.facilitadorPanel);
		panel.add(this.hospedeiroPanel);

		this.facilitadorPanel.add(UiUtils.createPanel(this.nomeLabel, this.nomeTextBox));
		this.hospedeiroPanel.add(UiUtils.createPanel(this.enderecoLabel, this.enderecoTextBox));
		this.hospedeiroPanel.add(this.hospHPanel01);
		this.hospedeiroPanel.add(this.hospHPanel02);

		this.facilitadorPanel.add(this.hospedeiroPanel);
		this.facilitadorPanel.add(this.bairroCidadePanel);
		this.facilitadorPanel
				.add(UiUtils.createHPanel(new Widget[] { UiUtils.createPanel(this.emailLabel, this.emailTextBox),
						UiUtils.createPanel(this.telefoneResidencialLabel, this.telefoneResidencialTextBox),
						UiUtils.createPanel(this.telefoneComercialLabel, this.telefoneComercialTextBox),
						UiUtils.createPanel(this.telefoneCelularLabel, this.telefoneCelularTextBox) }));

		Widget[] tiposGrupos1 = new Widget[(this.tipoGrupoCheckBoxes.length + 3) / 2];
		int offset = 0;
		for (int i = 0; i < tiposGrupos1.length; i++) {
			tiposGrupos1[i] = this.tipoGrupoCheckBoxes[i];
			offset = i;
		}
		Widget[] tiposGrupos2 = new Widget[this.tipoGrupoCheckBoxes.length - tiposGrupos1.length + 1];
		for (int i = 0; i < tiposGrupos2.length; i++) {
			if (offset + i + 1 < this.tipoGrupoCheckBoxes.length) {
				tiposGrupos2[i] = this.tipoGrupoCheckBoxes[(offset + i)];
			} else {
				HorizontalPanel hPanel = new HorizontalPanel();
				hPanel.add(this.tipoGrupoCheckBoxes[(offset + i)]);
				hPanel.add(this.tipoOutroTextBox);
				hPanel.setCellWidth(this.tipoGrupoCheckBoxes[(offset + i)], "60px");
				tiposGrupos2[i] = hPanel;
			}
		}
		Panel membroPanel = UiUtils.createPanel(this.membroLabel,
				UiUtils.createHPanel(new Widget[] { this.membroNaoRadioButton, this.membroSimRadioButton }));

		HorizontalPanel hPanel = UiUtils.createHPanel(new Widget[] { membroPanel,
				UiUtils.createHPanel(5,
						new Widget[] { UiUtils.createPanel(this.numeroMaximoPessoasLabel,
								UiUtils.createHPanel(0, new Widget[] { this.quantidadeAdultosTextBox, this.adultosLabel,
										this.quantidadeCriancasTextBox, this.criancasLabel })) }) });
		hPanel.setCellWidth(membroPanel, "265px");

		this.facilitadorPanel.add(hPanel);

		Panel vPanel1 = UiUtils.createVPanel(0,
				new Widget[] { UiUtils.createPanel(this.diasLabel, UiUtils.createVPanel(0, this.diasCheckBox)) });
		Panel vPanel2 = UiUtils.createVPanel(0, new Widget[] {
				UiUtils.createPanel(this.melhorHorarioLabel, UiUtils.createVPanel(0, this.horariosCheckBox)) });

		VerticalPanel gruposVPanel1 = UiUtils.createVPanel(0, tiposGrupos1);
		VerticalPanel gruposVPanel2 = UiUtils.createVPanel(0, tiposGrupos2);
		HorizontalPanel gruposHPanel = UiUtils.createHPanel(new Widget[] { gruposVPanel1, gruposVPanel2 });
		gruposHPanel.setCellWidth(gruposVPanel1, "160px");

		Panel vPanel3 = UiUtils.createPanel(this.tipoGrupoLabel, gruposHPanel);
		HorizontalPanel checkBoxHPanel = UiUtils.createHPanel(new Widget[] { vPanel1, vPanel2, vPanel3 });

		checkBoxHPanel.setCellWidth(vPanel1, "160px");
		checkBoxHPanel.setCellWidth(vPanel2, "160px");

		this.facilitadorPanel.add(checkBoxHPanel);
		this.facilitadorPanel.add(UiUtils.createPanel(this.observacaoLabel, this.observacaoTextArea));
		this.facilitadorPanel.add(this.confirmarButton);

		this.footer = new HTML("Igreja Batista Memorial de S�o Paulo");
		if (RootPanel.get("footer") != null) {
			RootPanel.get("footer").add(this.footer);
		}
		alterarModo(false, false);

		return panel;
	}

	private <T extends Widget> T create(String style, T widget) {
		widget.addStyleName("InscricaoHospedeiroFacilitadorPanel-" + style);
		return widget;
	}

	private void alterarModo(boolean facilitador, boolean hospedeiro) {
		this.facilitadorPanel.setVisible((facilitador) || (hospedeiro));
		this.hospedeiroPanel.setVisible(hospedeiro);

		this.hospHPanel01.clear();
		this.hospHPanel02.clear();
		this.bairroCidadePanel.clear();
		if (hospedeiro) {
			this.hospHPanel01.add(UiUtils.createPanel(this.complementoLabel, this.complementoTextBox));
			this.hospHPanel01.add(UiUtils.createPanel(this.bairroLabel, this.bairroTextBox));

			this.hospHPanel02.add(UiUtils.createPanel(this.cidadeLabel, this.cidadeTextBox));
			this.hospHPanel02.add(UiUtils.createPanel(this.cepLabel, this.cepTextBox));

			this.footer.setStyleName("footerHospedeiro");
		} else if (facilitador) {
			this.bairroCidadePanel.add(UiUtils.createPanel(this.bairroLabel, this.bairroTextBox));
			this.bairroCidadePanel.add(UiUtils.createPanel(this.cidadeLabel, this.cidadeTextBox));

			this.footer.setStyleName("footerFacilitador");
		} else {
			this.footer.setStyleName("footer");
		}
	}

	private TextBox createAdultosTextBox() {
		final TextBox tb = (TextBox) create("quantidadeAdultosTextBox", new TextBox());

		tb.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				tb.setText(tb.getText().replaceAll("[^0-9]", ""));
			}
		});
		return tb;
	}

	private TextBox createCriancasTextBox() {
		final TextBox tb = (TextBox) create("quantidadeCriancasTextBox", new TextBox());

		tb.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				tb.setText(tb.getText().replaceAll("[^0-9]", ""));
			}
		});
		return tb;
	}

	private void showErrors(List<String> erros) {
		this.ambosRadioButton.setFocus(true);
		DialogBox dialogBox = UiUtils.createErrorsDialog(this.constants.errorsDialogTitle(),
				this.constants.fecharButton(), erros);

		UiUtils.show(this, dialogBox);
	}

	private Button createConfirmarButton() {
		final Button btn = (Button) create("confirmarButton", new Button("Confirmar"));
		btn.getElement().setId("confirmarButton");
		btn.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				btn.setEnabled(false);
				List<String> erros = InscricaoHospedeiroFacilitadorPanel.this.validate();
				if (!erros.isEmpty()) {
					InscricaoHospedeiroFacilitadorPanel.this.showErrors(erros);
					btn.setEnabled(true);
					return;
				}
				InscricaoHospedeiroFacilitadorPanel.this.confirmar();
			}
		});
		return btn;
	}

	private RadioButton createFuncaoRadioButton(Funcao funcao) {
		RadioButton rb = UiUtils.createRadioButton(funcao);

		rb.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				InscricaoHospedeiroFacilitadorPanel.this.alterarModo(
						(InscricaoHospedeiroFacilitadorPanel.this.facilitadorRadioButton.getValue().booleanValue())
								|| (InscricaoHospedeiroFacilitadorPanel.this.ambosRadioButton.getValue()
										.booleanValue()),
						(InscricaoHospedeiroFacilitadorPanel.this.hospedeiroRadioButton.getValue().booleanValue())
								|| (InscricaoHospedeiroFacilitadorPanel.this.ambosRadioButton.getValue()
										.booleanValue()));
			}
		});
		return rb;
	}

	private TextBox createTipoOutro() {
		final TextBox tb = (TextBox) create("tipoOutroTextBox", new TextBox());
		tb.addChangeHandler(new ChangeHandler() {
			public void onChange(ChangeEvent event) {
				if (InscricaoHospedeiroFacilitadorPanel.this.tipoGrupoCheckBoxes.length == 0) {
					return;
				}
				InscricaoHospedeiroFacilitadorPanel.this.tipoGrupoCheckBoxes[(InscricaoHospedeiroFacilitadorPanel.this.tipoGrupoCheckBoxes.length
						- 1)].setValue(Boolean.valueOf(!ValidationUtils.isEmpty(tb.getText())));
			}
		});
		return tb;
	}

	private List<String> validate() {
		List<String> mensagens = new LinkedList();
		if ((ValidationUtils.validateRequired(mensagens, this.constants.tipoCadastroLabel(),
				new CheckBox[] { this.ambosRadioButton, this.facilitadorRadioButton, this.hospedeiroRadioButton })) || (

		((this.ambosRadioButton.getValue().booleanValue()) || (this.facilitadorRadioButton.getValue().booleanValue()))
				&& (this.membroNaoRadioButton.getValue().booleanValue()))) {
			mensagens.add(this.constants.necessarioSerMembroPraSerFacilitador());
		}
		if (((!ValidationUtils.validateRequired(mensagens, this.constants.nomeLabel(), this.nomeTextBox))
				|| (!ValidationUtils.validateMinLength(mensagens, this.constants.nomeLabel(), this.nomeTextBox, 3))
				|| (ValidationUtils.validateMaxLength(mensagens, this.constants.nomeLabel(), this.nomeTextBox, 50)))
				|| (

				((!this.ambosRadioButton.getValue().booleanValue())
						&& (!this.hospedeiroRadioButton.getValue().booleanValue()))
						|| (((!ValidationUtils.validateRequired(mensagens, this.constants.enderecoLabel(),
								this.enderecoTextBox))
								|| (!ValidationUtils.validateMinLength(mensagens, this.constants.enderecoLabel(),
										this.enderecoTextBox, 5))
								|| (ValidationUtils.validateMaxLength(mensagens, this.constants.enderecoLabel(),
										this.enderecoTextBox, 100)))
								|| (

								((!ValidationUtils.validateMinLength(mensagens, this.constants.complementoLabel(),
										this.complementoTextBox, 3))
										|| (ValidationUtils.validateMaxLength(mensagens,
												this.constants.complementoLabel(), this.complementoTextBox, 30)))
										|| (

										(this.ambosRadioButton.getValue().booleanValue())
												|| (this.hospedeiroRadioButton.getValue().booleanValue())))))
														? ((!ValidationUtils.validateRequired(mensagens,
																this.constants.bairroLabel(),
																this.bairroTextBox.getTextBox()))
																|| (!ValidationUtils.validateMinLength(mensagens,
																		this.constants.bairroLabel(),
																		this.bairroTextBox.getTextBox(), 3))
																|| (ValidationUtils.validateMaxLength(mensagens,
																		this.constants.bairroLabel(),
																		this.bairroTextBox.getTextBox(), 30)))
																|| (

																(ValidationUtils.validateRequired(mensagens,
																		this.constants.cidadeLabel(),
																		this.cidadeTextBox.getTextBox()))
																		&& (ValidationUtils.validateMinLength(mensagens,
																				this.constants.cidadeLabel(),
																				this.cidadeTextBox.getTextBox(), 3))
																		&& (!ValidationUtils.validateMaxLength(
																				mensagens, this.constants.cidadeLabel(),
																				this.cidadeTextBox.getTextBox(), 30)))
														:

														((!ValidationUtils.validateMinLength(mensagens,
																this.constants.bairroLabel(),
																this.bairroTextBox.getTextBox(), 3))
																|| (ValidationUtils.validateMaxLength(mensagens,
																		this.constants.bairroLabel(),
																		this.bairroTextBox.getTextBox(), 30)))
																|| (

																(ValidationUtils.validateMinLength(mensagens,
																		this.constants.cidadeLabel(),
																		this.cidadeTextBox.getTextBox(), 3))
																		&& (!ValidationUtils.validateMaxLength(
																				mensagens, this.constants.cidadeLabel(),
																				this.cidadeTextBox.getTextBox(),
																				30)))) {
		}
		if (((!this.ambosRadioButton.getValue().booleanValue())
				&& (!this.hospedeiroRadioButton.getValue().booleanValue()))
				|| (ValidationUtils.validateCEP(mensagens, this.constants.cepLabel(), this.cepTextBox)) || (

				(ValidationUtils.validateEmail(mensagens, this.constants.emailLabel(), this.emailTextBox))
						&& (!ValidationUtils.validateMaxLength(mensagens, this.constants.emailLabel(),
								this.emailTextBox, 100)))) {
		}
		if ((ValidationUtils.validateRequired(mensagens, this.constants.membroLabel(),
				new CheckBox[] { this.membroNaoRadioButton, this.membroSimRadioButton })) || (

		((!this.ambosRadioButton.getValue().booleanValue()) && (!this.hospedeiroRadioButton.getValue().booleanValue()))
				|| (((!ValidationUtils.validateRequired(mensagens, this.constants.numeroMaximoAdultosLabel(),
						this.quantidadeAdultosTextBox))
						|| (ValidationUtils.validateInteger(mensagens, this.constants.numeroMaximoAdultosLabel(),
								this.quantidadeAdultosTextBox)))
						|| (

						((!ValidationUtils.validateRequired(mensagens, this.constants.numeroMaximoCriancasLabel(),
								this.quantidadeCriancasTextBox))
								|| (ValidationUtils.validateInteger(mensagens,
										this.constants.numeroMaximoCriancasLabel(), this.quantidadeCriancasTextBox)))
								|| (

								(ValidationUtils.validateRequired(mensagens, this.constants.diasLabel(),
										this.diasCheckBox)) || (

								(ValidationUtils.validateRequired(mensagens, this.constants.melhorHorarioLabel(),
										this.horariosCheckBox)) || (

								(ValidationUtils.validateRequired(mensagens, this.constants.tipoGrupoLabel(),
										this.tipoGrupoCheckBoxes)) || (

								(ValidationUtils.validateMinLength(mensagens, this.constants.observacaoLabel(),
										this.observacaoTextArea, 3))
										&& (!ValidationUtils.validateMaxLength(mensagens,
												this.constants.observacaoLabel(), this.observacaoTextArea,
												200)))))))))) {
		}
		return mensagens;
	}

	protected Funcao getFuncao() {
		if (this.hospedeiroRadioButton.getValue().booleanValue()) {
			return Funcao.HOSPEDEIRO;
		}
		if (this.facilitadorRadioButton.getValue().booleanValue()) {
			return Funcao.FACILITADOR;
		}
		return Funcao.AMBOS;
	}

	private List<TipoGrupo> getGrupos() {
		List<TipoGrupo> grupos = new LinkedList();
		CheckBox[] arrayOfCheckBox;
		int j = (arrayOfCheckBox = this.tipoGrupoCheckBoxes).length;
		for (int i = 0; i < j; i++) {
			CheckBox cb = arrayOfCheckBox[i];
			if (cb.getValue().booleanValue()) {
				grupos.add(TipoGrupo.valueOf(Integer.parseInt(cb.getFormValue())));
			}
		}
		return grupos;
	}

	private List<DiaSemana> getDiasSemana() {
		List<DiaSemana> dias = new LinkedList();
		CheckBox[] arrayOfCheckBox;
		int j = (arrayOfCheckBox = this.diasCheckBox).length;
		for (int i = 0; i < j; i++) {
			CheckBox cb = arrayOfCheckBox[i];
			if (cb.getValue().booleanValue()) {
				dias.add(DiaSemana.valueOf(Integer.parseInt(cb.getFormValue())));
			}
		}
		return dias;
	}

	private List<Horario> getHorarios() {
		List<Horario> horarios = new LinkedList();
		CheckBox[] arrayOfCheckBox;
		int j = (arrayOfCheckBox = this.horariosCheckBox).length;
		for (int i = 0; i < j; i++) {
			CheckBox cb = arrayOfCheckBox[i];
			if (cb.getValue().booleanValue()) {
				horarios.add(Horario.valueOf(Integer.parseInt(cb.getFormValue())));
			}
		}
		return horarios;
	}

	private void confirmar() {
		Inscrito inscrito = new Inscrito();

		inscrito.setFuncao(getFuncao());
		inscrito.setNome(this.nomeTextBox.getText());
		if ((this.ambosRadioButton.getValue().booleanValue())
				|| (this.hospedeiroRadioButton.getValue().booleanValue())) {
			inscrito.setEndereco(this.enderecoTextBox.getText());
			inscrito.setComplemento(this.complementoTextBox.getText());
			inscrito.setCep(this.cepTextBox.getText());
		}
		inscrito.setBairro(this.bairroTextBox.getText());
		inscrito.setCidade(this.cidadeTextBox.getText());
		inscrito.setEmail(this.emailTextBox.getText());
		inscrito.setMembro(this.membroSimRadioButton.getValue());
		inscrito.setTelefoneResidencial(this.telefoneResidencialTextBox.getText());
		inscrito.setTelefoneComercial(this.telefoneComercialTextBox.getText());
		inscrito.setTelefoneCelular(this.telefoneCelularTextBox.getText());
		if (this.quantidadeAdultosTextBox.getText().trim().length() > 0) {
			inscrito.setQuantidadeAdultos(new Integer(this.quantidadeAdultosTextBox.getText()));
		}
		if (this.quantidadeCriancasTextBox.getText().trim().length() > 0) {
			inscrito.setQuantidadeCriancas(new Integer(this.quantidadeCriancasTextBox.getText()));
		}
		inscrito.setObservacao(this.observacaoTextArea.getText());
		inscrito.setGrupoOutro(this.tipoOutroTextBox.getText());
		inscrito.setStatus(Character.valueOf('P'));

		List<TipoGrupo> grupos = getGrupos();
		List<DiaSemana> dias = getDiasSemana();
		List<Horario> horarios = getHorarios();

		this.service.inscrever(inscrito, grupos, dias, horarios, new AsyncCallback() {
			public void onFailure(Throwable caught) {
				VerticalPanel panel = new VerticalPanel();
				panel.add(new HTML(caught.getMessage()));
				DialogBox db = UiUtils.createDialog(InscricaoHospedeiroFacilitadorPanel.this.constants.erroTitulo(),
						InscricaoHospedeiroFacilitadorPanel.this.constants.fecharButton(), panel, null);
				UiUtils.show(InscricaoHospedeiroFacilitadorPanel.this, db);
				InscricaoHospedeiroFacilitadorPanel.this.confirmarButton.setEnabled(true);
			}

			public void onSuccess(Object result) {
				VerticalPanel panel = new VerticalPanel();
				panel.add(new HTML(InscricaoHospedeiroFacilitadorPanel.this.constants.inscricaoSucesso()));
				DialogBox db = UiUtils.createDialog(InscricaoHospedeiroFacilitadorPanel.this.constants.sucessoTitulo(),
						InscricaoHospedeiroFacilitadorPanel.this.constants.fecharButton(), panel, new ClickHandler() {
							public void onClick(ClickEvent event) {
								if (InscricaoHospedeiroFacilitadorPanel.this.areaRestrita) {
									InscricaoHospedeiroFacilitadorPanel.this.entry
											.setContent(new InscricaoHospedeiroFacilitadorPanel(
													InscricaoHospedeiroFacilitadorPanel.this.entry,
													InscricaoHospedeiroFacilitadorPanel.this.areaRestrita));
								} else {
									UiUtils.redirect(GWT.getModuleBaseURL() + "../home.html");
								}
							}
						});
				db.center();
				db.show();

				InscricaoHospedeiroFacilitadorPanel.this.confirmarButton.setEnabled(true);
			}
		});
	}
}
