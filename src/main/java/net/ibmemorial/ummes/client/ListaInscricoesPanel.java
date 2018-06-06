package net.ibmemorial.ummes.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HasAlignment;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.LazyPanel;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;
import java.util.Iterator;
import java.util.List;
import net.ibmemorial.ummes.model.Funcao;
import net.ibmemorial.ummes.model.Inscrito;
import net.ibmemorial.ummes.shared.Page;

public class ListaInscricoesPanel extends LazyPanel {
	private static final String DEFAULT_STYLE = "ListaInscricoesPanel";
	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private final FuncaoConstants funcaoConstants = (FuncaoConstants) GWT.create(FuncaoConstants.class);
	final String[] HEADER = { "C�digo", "Nome", "e-mail", "Fun��o", "� membro?", "Autor do Cadastro",
			"Data do Cadastro" };
	final FlexTable inscritosTable = UiUtils.createFlexTable(this.HEADER);
	private final Button paginaAnteriorButton = new Button("<<");
	private final Button proximaPaginaButton = new Button(">>");
	private int paginaAtual;

	public ListaInscricoesPanel(UmMesParaViver entry) {
	}

	protected Widget createWidget() {
		VerticalPanel panel = new VerticalPanel();
		panel.setStyleName("ListaInscricoesPanel");
		panel.setSpacing(5);

		this.inscritosTable.setWidth("710px");
		panel.add(this.inscritosTable);

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
				ListaInscricoesPanel.this.paginaAtual += 1;
				ListaInscricoesPanel.this.pesquisar();
			}
		});
		this.paginaAnteriorButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				ListaInscricoesPanel.this.paginaAtual = Math.max(0, ListaInscricoesPanel.this.paginaAtual - 1);
				ListaInscricoesPanel.this.pesquisar();
			}
		});
		panel.add(paginasPanel);

		Button pesquisarButton = new Button("Pesquisar");
		pesquisarButton.setStyleName("button");
		pesquisarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				ListaInscricoesPanel.this.paginaAtual = 0;
				ListaInscricoesPanel.this.pesquisar();
			}
		});
		panel.add(pesquisarButton);
		panel.setCellHorizontalAlignment(pesquisarButton, HasAlignment.ALIGN_RIGHT);

		return panel;
	}

	private void pesquisar() {
		this.service.getInscritos(this.paginaAtual, new AsyncCallback() {
			public void onSuccess(Object objeto) {
				Page<Inscrito> result = (Page<Inscrito>) objeto;
				List<Inscrito> list = result.getResults();

				ListaInscricoesPanel.this.inscritosTable.removeAllRows();
				UiUtils.createFlexTableHeader(ListaInscricoesPanel.this.inscritosTable,
						ListaInscricoesPanel.this.HEADER);

				DateTimeFormat fmt = DateTimeFormat.getFormat("dd/MM/yyyy HH:mm:ss");

				int i = 1;
				for (Iterator<Inscrito> iterator = list.iterator(); iterator.hasNext(); i++) {
					Inscrito inscrito = (Inscrito) iterator.next();

					UiUtils.addRow(ListaInscricoesPanel.this.inscritosTable, i,
							new Object[] { inscrito.getCodigo(), inscrito.getNome(), inscrito.getEmail(),
									ListaInscricoesPanel.this.funcaoConstants
											.getString(inscrito.getFuncao().name().toLowerCase()),
									inscrito.getMembro().booleanValue() ? "Sim" : "N�o",
									inscrito.getAutorCadastro() == null ? "" : inscrito.getAutorCadastro(),
									inscrito.getDataCadastro() == null ? "" : fmt.format(inscrito.getDataCadastro()) });
				}
				ListaInscricoesPanel.this.paginaAnteriorButton.setVisible(!result.isFirst());
				ListaInscricoesPanel.this.proximaPaginaButton.setVisible(!result.isLast());

				ListaInscricoesPanel.this.paginaAtual = result.getPageNumber();
			}

			public void onFailure(Throwable caught) {
				VerticalPanel panel = new VerticalPanel();
				panel.add(new HTML(caught.getMessage()));
				DialogBox db = UiUtils.createDialog("Erro", "Fechar", panel, null);
				UiUtils.show(ListaInscricoesPanel.this, db);
			}
		});
	}
}
