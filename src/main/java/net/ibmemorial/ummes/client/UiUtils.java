package net.ibmemorial.ummes.client;

import java.util.List;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.i18n.client.ConstantsWithLookup;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HTMLTable;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.MultiWordSuggestOracle;
import com.google.gwt.user.client.ui.Panel;
import com.google.gwt.user.client.ui.PopupPanel;
import com.google.gwt.user.client.ui.RadioButton;
import com.google.gwt.user.client.ui.SuggestBox;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.UIObject;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;

import net.ibmemorial.ummes.model.DiaSemana;
import net.ibmemorial.ummes.model.Funcao;
import net.ibmemorial.ummes.model.Horario;
import net.ibmemorial.ummes.model.InscritoDTO;
import net.ibmemorial.ummes.model.TipoGrupo;

public abstract class UiUtils {
	private static final UmMesParaViverConstants constants = (UmMesParaViverConstants) GWT
			.create(UmMesParaViverConstants.class);
	private static final DiaSemanaConstants diaSemanaConstants = (DiaSemanaConstants) GWT
			.create(DiaSemanaConstants.class);
	private static final HorarioConstants horarioConstants = (HorarioConstants) GWT.create(HorarioConstants.class);
	private static final FuncaoConstants funcaoConstants = (FuncaoConstants) GWT.create(FuncaoConstants.class);
	private static final GrupoConstants grupoConstants = (GrupoConstants) GWT.create(GrupoConstants.class);

	public static Panel createPanel(HTML label, Widget widget) {
		VerticalPanel vPanel = new VerticalPanel();
		vPanel.setSpacing(5);

		vPanel.add(label);
		vPanel.add(widget);

		return vPanel;
	}

	public static HorizontalPanel createHPanel(Widget... widgets) {
		return createHPanel(0, widgets);
	}

	public static HorizontalPanel createHPanel(int spacing, Widget... widgets) {
		HorizontalPanel panel = new HorizontalPanel();
		panel.setSpacing(spacing);

		return (HorizontalPanel) createPanel(panel, widgets);
	}

	public static VerticalPanel createVPanel(int spacing, Widget... widgets) {
		VerticalPanel panel = new VerticalPanel();
		panel.setSpacing(spacing);

		return (VerticalPanel) createPanel(panel, widgets);
	}

	public static <T extends Panel> T createPanel(T panel, Widget... widgets) {
		Widget[] arrayOfWidget;
		int j = (arrayOfWidget = widgets).length;
		for (int i = 0; i < j; i++) {
			Widget widget = arrayOfWidget[i];
			panel.add(widget);
		}
		return panel;
	}

	public static TextBox createTextBox(TextBox tb, int maxLength) {
		tb.setMaxLength(maxLength);

		return tb;
	}

	public static TextBox createCEPTextBox(final TextBox tb) {
		tb.setMaxLength(9);
		tb.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (tb.getText().length() < 5) {
					tb.setText(tb.getText().replaceAll("[^0-9]", ""));
					return;
				}
				if (tb.getText().length() > 5) {
					boolean digito = Character.isDigit(tb.getText().charAt(5));
					tb.setText(tb.getText().substring(0, 5).replaceAll("[^0-9]", "") + '-'
							+ tb.getText().substring(digito ? 5 : 6).replaceAll("[^0-9]", ""));
				}
				if (tb.getText().length() > 9) {
					tb.setText(tb.getText().substring(0, 9));
				}
			}
		});
		return tb;
	}

	public static TextBox createNumberTextBox(final TextBox tb) {
		tb.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				tb.setText(tb.getText().replaceAll("[^0-9]", ""));
			}
		});
		return tb;
	}

	public static TextBox createTelefoneTextBox(final TextBox tb) {
		tb.setMaxLength(15);
		tb.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				tb.setText(tb.getText().replaceAll("[^0-9^\\(^\\)^\\ ^\\-]", ""));
			}
		});
		return tb;
	}

	public static CheckBox createCheckBox(DiaSemana diaSemana) {
		return createCheckBox(String.valueOf(diaSemana.getId()),
				diaSemanaConstants.getString(diaSemana.name().toLowerCase()));
	}

	public static CheckBox createCheckBox(Horario horario) {
		return createCheckBox(String.valueOf(horario.getId()),
				horarioConstants.getString(horario.name().toLowerCase()));
	}

	public static CheckBox createCheckBox(Funcao funcao) {
		return createCheckBox(String.valueOf(funcao.getId()), funcaoConstants.getString(funcao.name().toLowerCase()));
	}

	private static CheckBox createCheckBox(TipoGrupo grupo) {
		return createCheckBox(String.valueOf(grupo.getId()), grupoConstants.getString(grupo.name().toLowerCase()));
	}

	public static CheckBox[] createHorariosCheckBoxes() {
		CheckBox[] cbs = new CheckBox[Horario.values().length];

		int i = 0;
		Horario[] arrayOfHorario;
		int j = (arrayOfHorario = Horario.values()).length;
		for (int k = 0; k < j; k++) {
			Horario horario = arrayOfHorario[k];
			cbs[(k++)] = createCheckBox(horario);
		}
		return cbs;
	}

	public static CheckBox[] createDiasSemanaCheckBoxes() {
		CheckBox[] cbs = new CheckBox[DiaSemana.values().length];

		int i = 0;
		DiaSemana[] arrayOfDiaSemana = DiaSemana.values();
		for (int j = 0; j < arrayOfDiaSemana.length; j++) {
			DiaSemana dia = arrayOfDiaSemana[j];
			cbs[(i++)] = createCheckBox(dia);
		}
		return cbs;
	}

	public static ListBox createDiasSemanaListBox() {
		return createDiasSemanaListBox("Todos");
	}

	public static ListBox createDiasSemanaListBox(String firstLabel) {
		ListBox lb = new ListBox(false);

		lb.addItem(firstLabel);
		DiaSemana[] arrayOfDiaSemana;
		int j = (arrayOfDiaSemana = DiaSemana.values()).length;
		for (int i = 0; i < j; i++) {
			DiaSemana dia = arrayOfDiaSemana[i];
			lb.addItem(diaSemanaConstants.getString(dia.name().toLowerCase()), String.valueOf(dia.getId()));
		}
		lb.setSelectedIndex(0);
		return lb;
	}

	public static HTML createSeparator(String width) {
		HTML html = new HTML("<hr>");

		html.setWidth(width);

		return html;
	}

	public static ListBox createTipoGrupoListBox() {
		return createTipoGrupoListBox("Todos");
	}

	public static ListBox createTipoGrupoListBox(String firstLabel) {
		ListBox lb = new ListBox(false);

		lb.addItem(firstLabel);
		TipoGrupo[] arrayOfTipoGrupo;
		int j = (arrayOfTipoGrupo = TipoGrupo.values()).length;
		for (int i = 0; i < j; i++) {
			TipoGrupo grupo = arrayOfTipoGrupo[i];
			lb.addItem(grupoConstants.getString(grupo.name().toLowerCase()), String.valueOf(grupo.getId()));
		}
		lb.setSelectedIndex(0);
		return lb;
	}

	public static ListBox createHorariosListBox() {
		return createHorariosListBox("Todos");
	}

	public static ListBox createHorariosListBox(String firstLabel) {
		ListBox lb = new ListBox(false);

		lb.addItem(firstLabel);
		Horario[] arrayOfHorario;
		int j = (arrayOfHorario = Horario.values()).length;
		for (int i = 0; i < j; i++) {
			Horario horario = arrayOfHorario[i];
			lb.addItem(horarioConstants.getString(horario.name().toLowerCase()), String.valueOf(horario.getId()));
		}
		lb.setSelectedIndex(0);
		return lb;
	}

	public static CheckBox[] createTipoGrupoCheckBoxes() {
		CheckBox[] cbs = new CheckBox[TipoGrupo.values().length];

		int i = 0;
		TipoGrupo[] arrayOfTipoGrupo = TipoGrupo.values();
		for (int j = 0; i < arrayOfTipoGrupo.length; j++) {
			TipoGrupo grupo = arrayOfTipoGrupo[j];
			cbs[(i++)] = createCheckBox(grupo);
		}
		return cbs;
	}

	public static CheckBox createCheckBox(String valor, String descricao) {
		CheckBox cb = new CheckBox();
		cb.setFormValue(valor);
		cb.setText(descricao);

		return cb;
	}

	public static RadioButton createRadioButton(Funcao funcao) {
		return createRadioButton(funcao.getClass().getName(), String.valueOf(funcao.getId()),
				funcaoConstants.getString(funcao.name().toLowerCase()));
	}

	public static RadioButton createRadioButton(String grupo, String valor, String descricao) {
		RadioButton rb = new RadioButton(grupo, descricao);
		rb.setFormValue(valor);

		return rb;
	}

	public static DialogBox createDialog(String titulo, String buttonLabel, final Panel dialogPanel,
			final ClickHandler clickHandler) {
		final DialogBox dialogBox = new DialogBox();
		dialogBox.setText(titulo);
		dialogBox.setAnimationEnabled(true);

		Button button = new Button(buttonLabel);
		button.getElement().setId("dialogButton");

		dialogPanel.add(button);
		dialogBox.setWidget(dialogPanel);

		button.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				dialogBox.hide();
				if (clickHandler != null) {
					clickHandler.onClick(event);
				}
			}
		});
		return dialogBox;
	}

	public static native void redirect(String paramString);

	public static DialogBox createErrorsDialog(String titulo, String fecharButton, List<String> erros) {
		VerticalPanel dialogVPanel = new VerticalPanel();
		dialogVPanel.addStyleName("dialogVPanel");
		for (String erro : erros) {
			dialogVPanel.add(new HTML(erro));
		}
		dialogVPanel.setHorizontalAlignment(VerticalPanel.ALIGN_RIGHT);

		return createDialog(titulo, fecharButton, dialogVPanel, null);
	}

	public static void show(UIObject object, PopupPanel panel) {
		panel.center();

		int posY = object.getAbsoluteTop() + (object.getOffsetHeight() - panel.getOffsetHeight()) / 2;
		int posX = object.getAbsoluteLeft() + (object.getOffsetWidth() - panel.getOffsetWidth()) / 2;

		panel.setPopupPosition(posX, posY);
		panel.setVisible(true);
	}

	public static FlexTable createFlexTable(FlexTable flexTable, String... columns) {
		createFlexTableHeader(flexTable, columns);

		flexTable.setCellSpacing(0);
		flexTable.addStyleName("FlexTable");

		return flexTable;
	}

	public static Button createButton(String label) {
		Button button = new Button(label);

		button.setStylePrimaryName("button");

		return button;
	}

	public static FlexTable createFlexTable(String... columns) {
		return createFlexTable(new FlexTable(), columns);
	}

	public static void createFlexTableHeader(FlexTable flexTable, String... columns) {
		flexTable.insertRow(0);
		flexTable.getRowFormatter().addStyleName(0, "FlexTable-Header");
		for (int i = 0; i < columns.length; i++) {
			Widget widget = new Label(columns[i]);
			int cell = flexTable.getCellCount(0);

			widget.setWidth("100%");
			widget.addStyleName("FlexTable-ColumnLabel");

			flexTable.setWidget(0, cell, widget);
			flexTable.getCellFormatter().addStyleName(0, cell, "FlexTable-ColumnLabelCell");
		}
	}

	public static Widget createCellWidget(Object cellObject) {
		if ((cellObject instanceof Widget)) {
			return (Widget) cellObject;
		}
		return new HTML(cellObject == null ? "" : cellObject.toString());
	}

	public static void addRow(FlexTable tabela, int row, Object[] cellObjects) {
		HTMLTable.RowFormatter rf = tabela.getRowFormatter();
		for (int cell = 0; cell < cellObjects.length; cell++) {
			Widget widget = createCellWidget(cellObjects[cell]);
			if (!(widget instanceof Button)) {
				widget.addStyleName("clickable");
			}
			tabela.setWidget(row, cell, widget);
			tabela.getCellFormatter().addStyleName(row, cell, "FlexTable-Cell");
		}
		rf.addStyleName(row, row % 2 == 0 ? "FlexTable-EvenRow" : "FlexTable-OddRow");
	}

	public static TextBox onlyNumbers(final TextBox tb) {
		tb.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				tb.setText(tb.getText().replaceAll("[^0-9]", ""));
			}
		});
		return tb;
	}

	public static String getEnumsAsString(Enum<?>[] enums, ConstantsWithLookup constantsWithLookup) {
		String str = "";
		Enum[] arrayOfEnum = enums;
		int j = enums.length;
		for (int i = 0; i < j; i++) {
			Enum<?> en = arrayOfEnum[i];
			if (str.length() > 0) {
				str = str + ", ";
			}
			str = str + constantsWithLookup.getString(en.name().toLowerCase());
		}
		return str;
	}

	public static String getEnumsAsString(InscritoDTO dto) {
		String str = "";
		TipoGrupo[] arrayOfTipoGrupo;
		int j = (arrayOfTipoGrupo = dto.getTiposGrupo()).length;
		for (int i = 0; i < j; i++) {
			TipoGrupo en = arrayOfTipoGrupo[i];
			if (en != TipoGrupo.OUTRO) {
				if (str.length() > 0) {
					str = str + ", ";
				}
				str = str + grupoConstants.getString(en.name().toLowerCase());
			}
		}
		if (!ValidationUtils.isEmpty(dto.getInscrito().getGrupoOutro())) {
			str = str + ", " + dto.getInscrito().getGrupoOutro();
		}
		return str;
	}

	public static SuggestBox createCidadeSuggestionBox() {
		MultiWordSuggestOracle oracle = new MultiWordSuggestOracle();
		String[] words = constants.cidadesSugeridas();
		for (int i = 0; i < words.length; i++) {
			oracle.add(words[i]);
		}
		SuggestBox suggestBox = new SuggestBox(oracle);

		return suggestBox;
	}

	public static SuggestBox createBairroSuggestionBox() {
		MultiWordSuggestOracle oracle = new MultiWordSuggestOracle();
		String[] words = constants.bairrosSugeridos();
		for (int i = 0; i < words.length; i++) {
			oracle.add(words[i]);
		}
		SuggestBox suggestBox = new SuggestBox(oracle);

		return suggestBox;
	}
}
