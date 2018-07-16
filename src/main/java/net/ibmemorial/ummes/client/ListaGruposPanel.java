package net.ibmemorial.ummes.client;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.FocusWidget;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HTMLTable;
import com.google.gwt.user.client.ui.HasAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.LazyPanel;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.SuggestBox;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;

import net.ibmemorial.ummes.model.DiaSemana;
import net.ibmemorial.ummes.model.GrupoDTO;
import net.ibmemorial.ummes.model.Horario;
import net.ibmemorial.ummes.model.TipoGrupo;
import net.ibmemorial.ummes.shared.Page;

public class ListaGruposPanel extends LazyPanel {
	private final UmMesParaViver entry;
	private static final String DEFAULT_STYLE = "ListaGruposPanel";
	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private final DiaSemanaConstants diaSemanaConstants = (DiaSemanaConstants) GWT.create(DiaSemanaConstants.class);
	private final HorarioConstants horarioConstants = (HorarioConstants) GWT.create(HorarioConstants.class);
	private final GrupoConstants tipoGrupoConstants = (GrupoConstants) GWT.create(GrupoConstants.class);
	private final HTML codigoLabel = new HTML("<b>N�mero</b>");
	private final TextBox codigoTextBox = UiUtils.onlyNumbers(new TextBox());
	private final HTML nomeFacilitadorLabel = new HTML("<b>Facilitador</b>");
	private final TextBox nomeFacilitadorTextBox = new TextBox();
	private final HTML nomeHospedeiroLabel = new HTML("<b>Hospedeiro</b>");
	private final TextBox nomeHospedeiroTextBox = new TextBox();
	private final HTML bairroLabel = new HTML("<b>Bairro</b>");
	private final SuggestBox bairroTextBox = UiUtils.createBairroSuggestionBox();
	private final HTML cidadeLabel = new HTML("<b>Cidade</b>");
	private final SuggestBox cidadeTextBox = UiUtils.createCidadeSuggestionBox();
	private final HTML tipoGrupoLabel = new HTML("<b>Tipo de Grupo</b>");
	private final ListBox tiposGrupoListBox = UiUtils.createTipoGrupoListBox();
	private final HTML diasLabel = new HTML("<b>Dia</b>");
	private final ListBox diasListBox = UiUtils.createDiasSemanaListBox();
	private final HTML horariosLabel = new HTML("<b>Hor�rio</b>");
	private final ListBox horariosListBox = UiUtils.createHorariosListBox();
	private Button limparButton = UiUtils.createButton("Limpar");
	private Button pesquisarButton = UiUtils.createButton("Pesquisar");
	final String[] HEADER = { "N�mero", "Nome", "Endere�o", "Tipo do Grupo", "Dia", "Hor�rio", "N�mero Pessoas",
			"Vagas Dispon�veis" };
	final FlexTable table = UiUtils.createFlexTable(this.HEADER);
	private final Button paginaAnteriorButton = new Button("<<");
	private final Button proximaPaginaButton = new Button(">>");
	private final HTML pageNumberLabel = new HTML();
	private int pageNumber = 0;
	private final Map<String, Serializable> searchParameters = new HashMap<>();
	private Page<GrupoDTO> resultado;
	private GrupoDTO selecionado;
	private final boolean visualizacao;

	public ListaGruposPanel(UmMesParaViver entry, boolean visualizacao) {
		this.entry = entry;
		this.visualizacao = visualizacao;
	}

	protected Widget createWidget() {
		VerticalPanel panel = new VerticalPanel();
		panel.setStyleName("ListaGruposPanel");
		panel.setSpacing(1);
		if (this.visualizacao) {
			panel.add(new HTML(
					"<h3><b>Preencha os campos abaixo com os dados do grupo que voc� procura e clique em <i>Pesquisar</i>.</b></h3>"));
		}
		this.codigoTextBox.setWidth("40px");
		this.nomeFacilitadorTextBox.setWidth("320px");
		this.nomeHospedeiroTextBox.setWidth("320px");
		this.bairroTextBox.setWidth("340px");
		this.cidadeTextBox.setWidth("350px");
		this.diasListBox.setWidth("120px");
		this.horariosListBox.setWidth("120px");

		addEnterListener(this.codigoTextBox);
		addEnterListener(this.nomeFacilitadorTextBox);
		addEnterListener(this.nomeHospedeiroTextBox);
		addEnterListener(this.bairroTextBox.getTextBox());
		addEnterListener(this.cidadeTextBox.getTextBox());
		addEnterListener(this.diasListBox);
		addEnterListener(this.horariosListBox);
		addEnterListener(this.tiposGrupoListBox);

		panel.setWidth("710px");
		panel.add(UiUtils.createHPanel(new Widget[] { UiUtils.createPanel(this.codigoLabel, this.codigoTextBox),
				UiUtils.createPanel(this.nomeFacilitadorLabel, this.nomeFacilitadorTextBox),
				UiUtils.createPanel(this.nomeHospedeiroLabel, this.nomeHospedeiroTextBox) }));
		panel.add(UiUtils.createHPanel(new Widget[] { UiUtils.createPanel(this.bairroLabel, this.bairroTextBox),
				UiUtils.createPanel(this.cidadeLabel, this.cidadeTextBox) }));

		HTML gap = new HTML();
		gap.setWidth("150px");

		HorizontalPanel buttonPanel = UiUtils.createHPanel(new Widget[] { this.pesquisarButton, this.limparButton });

		HorizontalPanel hPanel = UiUtils
				.createHPanel(new Widget[] { UiUtils.createPanel(this.tipoGrupoLabel, this.tiposGrupoListBox),
						UiUtils.createPanel(this.diasLabel, this.diasListBox),
						UiUtils.createPanel(this.horariosLabel, this.horariosListBox), gap, buttonPanel });
		hPanel.setWidth("310px");
		hPanel.setCellHorizontalAlignment(buttonPanel, VerticalPanel.ALIGN_RIGHT);

		panel.add(hPanel);

		panel.add(UiUtils.createSeparator("710px"));

		this.table.removeAllRows();
		this.table.setWidth("710px");
		panel.add(this.pageNumberLabel);
		panel.add(this.table);

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

		this.proximaPaginaButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				ListaGruposPanel.this.proximaPaginaButton.setEnabled(false);
				ListaGruposPanel.this.setPageNumber(ListaGruposPanel.this.pageNumber + 1);
				ListaGruposPanel.this.doSearch();
			}
		});
		this.paginaAnteriorButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				ListaGruposPanel.this.paginaAnteriorButton.setEnabled(false);
				ListaGruposPanel.this.setPageNumber(Math.max(0, ListaGruposPanel.this.pageNumber - 1));
				ListaGruposPanel.this.doSearch();
			}
		});
		panel.add(paginasPanel);

		this.pesquisarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				ListaGruposPanel.this.pesquisar();
			}
		});
		this.limparButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				ListaGruposPanel.this.limpar();
			}
		});
		if (!this.visualizacao) {
			this.table.addClickHandler(new ClickHandler() {
				public void onClick(ClickEvent event) {
					HTMLTable.Cell cell = ListaGruposPanel.this.table.getCellForEvent(event);
					int index = cell.getRowIndex() - 1;
					if ((index >= 0) && (index < ListaGruposPanel.this.resultado.getResults().size())) {
						ListaGruposPanel.this.selecionado = ((GrupoDTO) ListaGruposPanel.this.resultado.getResults()
								.get(index));

						ListaGruposPanel.this.entry.setContent(new AdministrarGrupoPanel(ListaGruposPanel.this.entry,
								ListaGruposPanel.this, ListaGruposPanel.this.selecionado, false, false));
					}
				}
			});
		}
		limpar();

		return panel;
	}

	private void addEnterListener(FocusWidget widget) {
		widget.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == 13) {
					ListaGruposPanel.this.pesquisar();
				}
			}
		});
	}

	private void limpar() {
		this.codigoTextBox.setText("");
		this.nomeFacilitadorTextBox.setText("");
		this.nomeHospedeiroTextBox.setText("");
		this.bairroTextBox.setText("");
		this.cidadeTextBox.setText("");
		this.tiposGrupoListBox.setSelectedIndex(0);
		this.diasListBox.setSelectedIndex(0);
		this.horariosListBox.setSelectedIndex(0);
		this.proximaPaginaButton.setVisible(false);
		this.paginaAnteriorButton.setVisible(false);
		this.table.removeAllRows();
		this.table.setVisible(false);
		setPageNumber(-1);
	}

	private void setPageNumber(int number) {
		this.pageNumber = number;
		if (number < 0) {
			this.pageNumberLabel.setHTML("");
			this.resultado = null;
		} else {
			this.pageNumberLabel.setHTML("<i>P�gina </i> " + (number + 1));
		}
	}

	private void pesquisar() {
		this.pesquisarButton.setEnabled(false);

		this.searchParameters.clear();
		setPageNumber(-1);
		if (ValidationUtils.isInteger(this.codigoTextBox.getText())) {
			this.searchParameters.put("codigo", new Integer(this.codigoTextBox.getText()));
		}
		if (!ValidationUtils.isEmpty(this.nomeFacilitadorTextBox.getText())) {
			this.searchParameters.put("nomeFacilitador", "%" + this.nomeFacilitadorTextBox.getText() + "%");
		}
		if (!ValidationUtils.isEmpty(this.nomeHospedeiroTextBox.getText())) {
			this.searchParameters.put("nomeHospedeiro", "%" + this.nomeHospedeiroTextBox.getText() + "%");
		}
		if (!ValidationUtils.isEmpty(this.bairroTextBox.getText())) {
			this.searchParameters.put("bairro", "%" + this.bairroTextBox.getText() + "%");
		}
		if (!ValidationUtils.isEmpty(this.cidadeTextBox.getText())) {
			this.searchParameters.put("cidade", "%" + this.cidadeTextBox.getText() + "%");
		}
		if (this.diasListBox.getSelectedIndex() > 0) {
			this.searchParameters.put("diaSemana", DiaSemana.values()[(this.diasListBox.getSelectedIndex() - 1)]);
		}
		if (this.horariosListBox.getSelectedIndex() > 0) {
			this.searchParameters.put("horario", Horario.values()[(this.horariosListBox.getSelectedIndex() - 1)]);
		}
		if (this.tiposGrupoListBox.getSelectedIndex() > 0) {
			this.searchParameters.put("tipoGrupo", TipoGrupo.values()[(this.tiposGrupoListBox.getSelectedIndex() - 1)]);
		}
		doSearch();
	}

	private void doSearch() {
		this.service.getGrupos(this.searchParameters, this.pageNumber, new AsyncCallback<Page<GrupoDTO>>() {
			public void onSuccess(Page<GrupoDTO> result) {
				ListaGruposPanel.this.resultado = result;
				List<GrupoDTO> list = result.getResults();

				ListaGruposPanel.this.table.removeAllRows();
				UiUtils.createFlexTableHeader(ListaGruposPanel.this.table, ListaGruposPanel.this.HEADER);

				int i = 1;
				for (Iterator<GrupoDTO> iterator = list.iterator(); iterator.hasNext(); i++) {
					GrupoDTO grupo = (GrupoDTO) iterator.next();

					UiUtils.addRow(ListaGruposPanel.this.table, i, new Object[] { grupo.getGrupo().getCodigo(),
							ListaGruposPanel.this.getNomes(grupo), ListaGruposPanel.this.getEndereco(grupo),
							ListaGruposPanel.this.tipoGrupoConstants
									.getString(grupo.getGrupo().getTipoGrupo().name().toLowerCase()),
							ListaGruposPanel.this.diaSemanaConstants
									.getString(grupo.getGrupo().getDiaSemana().name().toLowerCase()),
							ListaGruposPanel.this.horarioConstants
									.getString(grupo.getGrupo().getHorario().name().toLowerCase()),
							grupo.getGrupo().getQuantidadeMaxima(), Integer.valueOf(grupo.getVagasDisponiveis()) });
				}
				ListaGruposPanel.this.paginaAnteriorButton.setVisible(!result.isFirst());
				ListaGruposPanel.this.proximaPaginaButton.setVisible(!result.isLast());
				ListaGruposPanel.this.paginaAnteriorButton.setEnabled(true);
				ListaGruposPanel.this.proximaPaginaButton.setEnabled(true);

				ListaGruposPanel.this.setPageNumber(result.getPageNumber());
				ListaGruposPanel.this.table.setVisible(!list.isEmpty());
				ListaGruposPanel.this.pesquisarButton.setEnabled(true);
			}

			public void onFailure(Throwable caught) {
				ListaGruposPanel.this.setPageNumber(-1);
				VerticalPanel panel = new VerticalPanel();
				panel.add(new HTML(caught.getMessage()));
				DialogBox db = UiUtils.createDialog("Erro", "Fechar", panel, null);
				UiUtils.show(ListaGruposPanel.this, db);
				ListaGruposPanel.this.pesquisarButton.setEnabled(true);
				ListaGruposPanel.this.paginaAnteriorButton.setEnabled(true);
				ListaGruposPanel.this.proximaPaginaButton.setEnabled(true);
			}
		});
	}

	private String getNomes(GrupoDTO dto) {
		if (dto.getGrupo().getCodigoFacilitador().equals(dto.getGrupo().getCodigoHospedeiro())) {
			return dto.getFacilitador().getNome();
		}
		return dto.getFacilitador().getNome() + "<br>" + dto.getHospedeiro().getNome();
	}

	private String getEndereco(GrupoDTO dto) {
		return dto.getHospedeiro().getBairro() + " - " + dto.getHospedeiro().getCidade();
	}
}
