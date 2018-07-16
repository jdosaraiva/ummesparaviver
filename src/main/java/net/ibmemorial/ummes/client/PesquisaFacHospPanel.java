package net.ibmemorial.ummes.client;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HTMLTable;
import com.google.gwt.user.client.ui.HasAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.Panel;
import com.google.gwt.user.client.ui.SuggestBox;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;

import net.ibmemorial.ummes.model.DiaSemana;
import net.ibmemorial.ummes.model.Funcao;
import net.ibmemorial.ummes.model.Horario;
import net.ibmemorial.ummes.model.Inscrito;
import net.ibmemorial.ummes.model.InscritoDTO;
import net.ibmemorial.ummes.model.TipoGrupo;
import net.ibmemorial.ummes.shared.Page;

public class PesquisaFacHospPanel extends VerticalPanel {
	private final boolean facilitador;
	private static final String DEFAULT_STYLE = "PesquisaFacHospPanel";
	private final InscricaoHospedeiroFacilitadorConstants constants = (InscricaoHospedeiroFacilitadorConstants) GWT
			.create(InscricaoHospedeiroFacilitadorConstants.class);
	private final DiaSemanaConstants diaSemanaConstants = (DiaSemanaConstants) GWT.create(DiaSemanaConstants.class);
	private final HorarioConstants horarioConstants = (HorarioConstants) GWT.create(HorarioConstants.class);
	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private final HTML nomeLabel = new HTML(this.constants.nomeLabel());
	private final TextBox nomeTextBox = UiUtils.createTextBox((TextBox) create("nomeTextBox", new TextBox()), 50);
	private final HTML emailLabel = new HTML(this.constants.emailLabel());
	private final TextBox emailTextBox = UiUtils.createTextBox((TextBox) create("emailTextBox", new TextBox()), 100);
	private final HTML bairroLabel = new HTML(this.constants.bairroLabel());
	private final SuggestBox bairroTextBox = UiUtils.createBairroSuggestionBox();
	private final HTML cidadeLabel = new HTML(this.constants.cidadeLabel());
	private final SuggestBox cidadeTextBox = UiUtils.createCidadeSuggestionBox();
	private final HTML diasLabel = new HTML("<b>Dia da Semana</b>");
	private final ListBox diasListBox = UiUtils.createDiasSemanaListBox();
	private final CheckBox diasCheckBox = new CheckBox("Dias da Semana do Facilitador");
	private final HTML melhorHorarioLabel = new HTML("<b>Hor�rio</b>");
	private final ListBox horariosListBox = UiUtils.createHorariosListBox();
	private final CheckBox horariosCheckBox = new CheckBox("Hor�rios do Facilitador");
	private final HTML tipoGrupoLabel = new HTML("<b>Tipo do Grupo</b>");
	private final ListBox tipoGrupoListBox = UiUtils.createTipoGrupoListBox();
	private final CheckBox tipoGrupoCheckBox = new CheckBox("Tipos de Grupo do Facilitador");
	private final Panel facilitadorPanel = new VerticalPanel();
	private final Panel hospedeiroPanel = new VerticalPanel();
	private Button limparButton = UiUtils.createButton("Limpar");
	private Button pesquisarButton = UiUtils.createButton("Pesquisar");
	final String[] HEADER = { "C�digo", "Nome", "e-mail", "Hospedeiro?", "Dias da Semana", "Hor�rios", "Tipos do Grupo",
			"Bairro", "Cidade" };
	final String[] HEADER_HOSPEDEIRO = { "C�digo", "Nome", "e-mail", "Membro?", "Dias da Semana", "Hor�rios",
			"Tipos do Grupo", "Bairro", "Cidade" };
	private final FlexTable tabela = UiUtils.createFlexTable(this.HEADER);
	private final Button paginaAnteriorButton = new Button("<<");
	private final Button proximaPaginaButton = new Button(">>");
	private final HTML pageNumberLabel = new HTML();
	private int pageNumber = 0;
	private final Map<String, Serializable> searchParameters = new HashMap<>();
	private Page<InscritoDTO> resultado;
	private InscritoDTO facilitadorDTO;

	public PesquisaFacHospPanel(UmMesParaViver entry, final boolean facilitador,
			final FormacaoGruposPanel formacaoPanel) {
		this.facilitador = facilitador;

		UiUtils.createFlexTable(this.tabela, facilitador ? this.HEADER : this.HEADER_HOSPEDEIRO);
		setStyleName("PesquisaFacHospPanel");
		setSpacing(0);

		add(UiUtils.createHPanel(new Widget[] { UiUtils.createPanel(this.nomeLabel, this.nomeTextBox),
				UiUtils.createPanel(this.emailLabel, this.emailTextBox) }));
		add(UiUtils.createHPanel(new Widget[] { UiUtils.createPanel(this.bairroLabel, this.bairroTextBox),
				UiUtils.createPanel(this.cidadeLabel, this.cidadeTextBox) }));

		this.nomeTextBox.setWidth("400px");
		this.emailTextBox.setWidth("270px");
		this.bairroTextBox.setWidth("400px");
		this.cidadeTextBox.setWidth("270px");

		this.diasListBox.setWidth("120px");
		this.horariosListBox.setWidth("120px");
		this.tipoGrupoListBox.setWidth("150px");

		HorizontalPanel buttonPanel = UiUtils.createHPanel(0,
				new Widget[] { this.limparButton, new HTML(), this.pesquisarButton });
		if (facilitador) {
			HTML gap = new HTML(" ");
			gap.setWidth("100px");
			this.facilitadorPanel
					.add(UiUtils.createHPanel(new Widget[] { UiUtils.createPanel(this.diasLabel, this.diasListBox),
							UiUtils.createPanel(this.melhorHorarioLabel, this.horariosListBox),
							UiUtils.createPanel(this.tipoGrupoLabel, this.tipoGrupoListBox), gap, buttonPanel }));
		} else {
			HTML gap = new HTML(" ");
			gap.setWidth("10px");
			HTML gap2 = new HTML(" ");
			gap2.setWidth("10px");
			this.hospedeiroPanel.add(UiUtils.createHPanel(new Widget[] { this.diasCheckBox, gap, this.horariosCheckBox,
					gap2, this.tipoGrupoCheckBox, buttonPanel }));
		}
		add(this.facilitadorPanel);
		add(this.hospedeiroPanel);

		this.tabela.setWidth("700px");
		this.tabela.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				HTMLTable.Cell cell = PesquisaFacHospPanel.this.tabela.getCellForEvent(event);
				int index = cell.getRowIndex() - 1;

				InscritoDTO selecionado = null;
				if ((index >= 0) && (index < PesquisaFacHospPanel.this.resultado.getResults().size())) {
					selecionado = (InscritoDTO) PesquisaFacHospPanel.this.resultado.getResults().get(index);
				}
				if (facilitador) {
					formacaoPanel.setFacilitador(selecionado);
				} else {
					formacaoPanel.setHospedeiro(selecionado);
				}
			}
		});
		add(UiUtils.createSeparator("700px"));
		add(this.pageNumberLabel);
		add(this.tabela);

		this.paginaAnteriorButton.getElement().setId("paginaAnteriorButton");
		this.proximaPaginaButton.getElement().setId("proximaPaginaButton");

		HorizontalPanel paginasPanel = new HorizontalPanel();
		paginasPanel.add(this.paginaAnteriorButton);
		paginasPanel.setCellWidth(this.paginaAnteriorButton, "682px");
		paginasPanel.setCellHeight(this.paginaAnteriorButton, "10px");
		paginasPanel.add(this.proximaPaginaButton);
		paginasPanel.setCellHeight(this.proximaPaginaButton, "10px");
		paginasPanel.setCellHorizontalAlignment(this.paginaAnteriorButton, HasAlignment.ALIGN_LEFT);
		paginasPanel.setCellHorizontalAlignment(this.proximaPaginaButton, HasAlignment.ALIGN_RIGHT);

		this.paginaAnteriorButton.setVisible(false);
		this.proximaPaginaButton.setVisible(false);

		add(paginasPanel);

		this.proximaPaginaButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				PesquisaFacHospPanel.this.proximaPaginaButton.setEnabled(false);
				PesquisaFacHospPanel.this.setPageNumber(PesquisaFacHospPanel.this.pageNumber + 1);
				PesquisaFacHospPanel.this.doSearch();
				PesquisaFacHospPanel.this.proximaPaginaButton.setEnabled(true);
			}
		});
		this.paginaAnteriorButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				PesquisaFacHospPanel.this.paginaAnteriorButton.setEnabled(false);
				PesquisaFacHospPanel.this.setPageNumber(Math.max(0, PesquisaFacHospPanel.this.pageNumber - 1));
				PesquisaFacHospPanel.this.doSearch();
				PesquisaFacHospPanel.this.paginaAnteriorButton.setEnabled(true);
			}
		});
		this.limparButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				PesquisaFacHospPanel.this.limpar();
			}
		});
		this.pesquisarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				PesquisaFacHospPanel.this.pesquisar();
			}
		});
		limpar();

		this.facilitadorPanel.setVisible(true);
		this.hospedeiroPanel.setVisible(true);
		setVisible(true);
	}

	private void limpar() {
		this.tipoGrupoListBox.setSelectedIndex(0);
		this.horariosListBox.setSelectedIndex(0);
		this.diasListBox.setSelectedIndex(0);
		this.nomeTextBox.setText("");
		this.emailTextBox.setText("");
		this.bairroTextBox.setText("");
		this.cidadeTextBox.setText("");
		this.tipoGrupoCheckBox.setValue(Boolean.TRUE);
		this.horariosCheckBox.setValue(Boolean.TRUE);
		this.diasCheckBox.setValue(Boolean.TRUE);
		this.proximaPaginaButton.setVisible(false);
		this.paginaAnteriorButton.setVisible(false);

		this.tabela.removeAllRows();
		this.tabela.setVisible(false);
	}

	private void setPageNumber(int number) {
		this.pageNumber = number;
		if (number < 0) {
			this.pageNumberLabel.setHTML("");
		} else {
			this.pageNumberLabel.setHTML("<i>P�gina </i> " + (number + 1));
		}
	}

	private <T extends Widget> T create(String style, T widget) {
		widget.addStyleName("PesquisaFacHospPanel-" + style);
		return widget;
	}

	public void facilitadorChanged(InscritoDTO dto) {
		if (this.facilitador) {
			return;
		}
		this.facilitadorDTO = dto;
	}

	private void pesquisar() {
		this.pesquisarButton.setEnabled(false);

		this.searchParameters.clear();
		setPageNumber(-1);
		if (!ValidationUtils.isEmpty(this.nomeTextBox.getText())) {
			this.searchParameters.put("nome", "%" + this.nomeTextBox.getText() + "%");
		}
		if (!ValidationUtils.isEmpty(this.emailTextBox.getText())) {
			this.searchParameters.put("email", "%" + this.emailTextBox.getText() + "%");
		}
		if (!ValidationUtils.isEmpty(this.bairroTextBox.getText())) {
			this.searchParameters.put("bairro", "%" + this.bairroTextBox.getText() + "%");
		}
		if (!ValidationUtils.isEmpty(this.cidadeTextBox.getText())) {
			this.searchParameters.put("cidade", "%" + this.cidadeTextBox.getText() + "%");
		}
		if (this.facilitadorDTO != null) {
			if (this.diasCheckBox.getValue().booleanValue()) {
				this.searchParameters.put("dias", this.facilitadorDTO.getDiasSemana());
			}
			if (this.horariosCheckBox.getValue().booleanValue()) {
				this.searchParameters.put("horarios", this.facilitadorDTO.getHorarios());
			}
			if (this.tipoGrupoCheckBox.getValue().booleanValue()) {
				this.searchParameters.put("tiposGrupo", this.facilitadorDTO.getTiposGrupo());
			}
		} else if (this.facilitador) {
			if (this.diasListBox.getSelectedIndex() > 0) {
				this.searchParameters.put("dias",
						new DiaSemana[] { DiaSemana.values()[(this.diasListBox.getSelectedIndex() - 1)] });
			}
			if (this.horariosListBox.getSelectedIndex() > 0) {
				this.searchParameters.put("horarios",
						new Horario[] { Horario.values()[(this.horariosListBox.getSelectedIndex() - 1)] });
			}
			if (this.tipoGrupoListBox.getSelectedIndex() > 0) {
				this.searchParameters.put("tiposGrupo",
						new TipoGrupo[] { TipoGrupo.values()[(this.tipoGrupoListBox.getSelectedIndex() - 1)] });
			}
		}
		doSearch();
	}

	private void doSearch() {
		this.service.getInscritos(this.searchParameters, this.pageNumber, this.facilitador, new AsyncCallback<Page<InscritoDTO>>() {
			public void onSuccess(Page<InscritoDTO> result) {
				List<InscritoDTO> list = result.getResults();

				PesquisaFacHospPanel.this.tabela.removeAllRows();
				UiUtils.createFlexTableHeader(PesquisaFacHospPanel.this.tabela,
						PesquisaFacHospPanel.this.facilitador ? PesquisaFacHospPanel.this.HEADER
								: PesquisaFacHospPanel.this.HEADER_HOSPEDEIRO);

				int i = 1;
				for (Iterator<InscritoDTO> iterator = list.iterator(); iterator.hasNext(); i++) {
					InscritoDTO dto = (InscritoDTO) iterator.next();
					Inscrito inscrito = dto.getInscrito();

					String tiposGrupo = UiUtils.getEnumsAsString(dto);
					if (PesquisaFacHospPanel.this.facilitador) {
						UiUtils.addRow(PesquisaFacHospPanel.this.tabela, i, new Object[] { inscrito.getCodigo(),
								inscrito.getNome(), inscrito.getEmail(),
								inscrito.getFuncao() == Funcao.AMBOS ? "Sim" : "N�o",
								UiUtils.getEnumsAsString(dto.getDiasSemana(),
										PesquisaFacHospPanel.this.diaSemanaConstants),
								UiUtils.getEnumsAsString(dto.getHorarios(), PesquisaFacHospPanel.this.horarioConstants),
								tiposGrupo, inscrito.getBairro(), inscrito.getCidade() });
					} else {
						UiUtils.addRow(PesquisaFacHospPanel.this.tabela, i, new Object[] { inscrito.getCodigo(),
								inscrito.getNome(), inscrito.getEmail(),
								inscrito.getMembro().booleanValue() ? "Sim" : "N�o",
								UiUtils.getEnumsAsString(dto.getDiasSemana(),
										PesquisaFacHospPanel.this.diaSemanaConstants),
								UiUtils.getEnumsAsString(dto.getHorarios(), PesquisaFacHospPanel.this.horarioConstants),
								tiposGrupo, inscrito.getBairro(), inscrito.getCidade() });
					}
				}
				PesquisaFacHospPanel.this.tabela.setVisible(!list.isEmpty());

				PesquisaFacHospPanel.this.paginaAnteriorButton.setVisible(!result.isFirst());
				PesquisaFacHospPanel.this.proximaPaginaButton.setVisible(!result.isLast());

				PesquisaFacHospPanel.this.resultado = result;
				PesquisaFacHospPanel.this.setPageNumber(result.getPageNumber());

				PesquisaFacHospPanel.this.pesquisarButton.setEnabled(true);
			}

			public void onFailure(Throwable caught) {
				PesquisaFacHospPanel.this.pesquisarButton.setEnabled(true);

				VerticalPanel panel = new VerticalPanel();
				panel.add(new HTML(caught.getMessage()));
				DialogBox db = UiUtils.createDialog("Erro", "Fechar", panel, null);
				UiUtils.show(PesquisaFacHospPanel.this, db);
			}
		});
	}
}
