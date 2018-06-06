package net.ibmemorial.ummes.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.event.dom.client.KeyUpEvent;
import com.google.gwt.event.dom.client.KeyUpHandler;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DecoratorPanel;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.LazyPanel;
import com.google.gwt.user.client.ui.MenuBar;
import com.google.gwt.user.client.ui.PasswordTextBox;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;
import net.ibmemorial.ummes.model.UsuarioDTO;

public class LoginPanel extends LazyPanel {
	private final UmMesParaViver entry;
	private static final String DEFAULT_STYLE = "LoginPanel";

	public LoginPanel(UmMesParaViver entry) {
		this.entry = entry;
	}

	private final LoginConstants constants = (LoginConstants) GWT.create(LoginConstants.class);
	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private final HTML usuarioLabel = new HTML(this.constants.usuarioLabel());
	private final TextBox usuarioTextBox = UiUtils.createTextBox((TextBox) create("usuarioTextBox", new TextBox()),
			100);
	private final HTML senhaLabel = new HTML(this.constants.senhaLabel());
	private final PasswordTextBox senhaTextBox = (PasswordTextBox) create("senhaTextBox", new PasswordTextBox());

	private <T extends Widget> T create(String style, T widget) {
		widget.addStyleName("LoginPanel-" + style);
		return widget;
	}

	protected Widget createWidget() {
		DecoratorPanel panel = new DecoratorPanel();
		panel.setStyleName("LoginPanel");

		final MenuBar menu = new MenuBar();
		menu.addItem("Entrar / Logar", new Command() {
			public void execute() {
				DialogBox db = LoginPanel.this.createDialog();
				db.center();

				db.setPopupPosition(menu.getAbsoluteLeft() + menu.getOffsetWidth() - 225, menu.getAbsoluteTop());
				db.show();
				LoginPanel.this.usuarioTextBox.setFocus(true);
			}
		});
		panel.add(menu);

		return panel;
	}

	private DialogBox createDialog() {
		VerticalPanel dialogPanel = new VerticalPanel();
		dialogPanel.setSize("210px", "100px");

		this.usuarioTextBox.setText("");
		this.usuarioTextBox.setWidth("200px");
		this.senhaTextBox.setText("");
		this.senhaTextBox.setWidth("200px");

		final HTML mensagemErro = new HTML(this.constants.errorsDialogTitle());
		mensagemErro.setVisible(false);
		mensagemErro.getElement().setId("mensagemErro");

		this.usuarioTextBox.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == 13) {
					LoginPanel.this.logar(mensagemErro);
				}
			}
		});
		this.senhaTextBox.addKeyUpHandler(new KeyUpHandler() {
			public void onKeyUp(KeyUpEvent event) {
				if (event.getNativeKeyCode() == 13) {
					LoginPanel.this.logar(mensagemErro);
				}
			}
		});
		dialogPanel.add(mensagemErro);

		dialogPanel.add(UiUtils.createPanel(this.usuarioLabel, this.usuarioTextBox));
		dialogPanel.add(UiUtils.createPanel(this.senhaLabel, this.senhaTextBox));

		final DialogBox dialogBox = new DialogBox();
		dialogBox.setText(this.constants.titulo());
		dialogBox.addStyleName("LoginPanel-DialogBox");
		dialogBox.setAnimationEnabled(true);

		Button sairButton = new Button(this.constants.sairButton());
		sairButton.getElement().setId("sairButton");

		Button entrarButton = new Button(this.constants.logarButton());
		entrarButton.getElement().setId("entrarButton");

		HorizontalPanel buttonPanel = UiUtils.createHPanel(new Widget[] { sairButton, entrarButton });
		buttonPanel.setCellWidth(sairButton, "148px");

		dialogPanel.add(buttonPanel);

		dialogBox.setWidget(dialogPanel);

		sairButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				dialogBox.hide();
			}
		});
		entrarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				LoginPanel.this.logar(mensagemErro);
			}
		});
		return dialogBox;
	}

	private void logar(final HTML mensagemErro) {
		this.service.logar(this.usuarioTextBox.getText(), this.senhaTextBox.getText(), new AsyncCallback() {
			public void onSuccess(Object result) {
				if (result != null) {
					UiUtils.redirect("../acessoRestrito.html");
				} else {
					mensagemErro.setVisible(true);
				}
			}

			public void onFailure(Throwable caught) {
				mensagemErro.setVisible(true);
			}
		});
	}
}
