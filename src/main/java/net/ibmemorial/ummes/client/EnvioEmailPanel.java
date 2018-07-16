package net.ibmemorial.ummes.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.LazyPanel;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;

public class EnvioEmailPanel extends LazyPanel {
	private final UmMesParaViver entry;
	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private Button enviarButton = UiUtils.createButton("Enviar e-mails");
	private final HTML info = new HTML();
	private final boolean senhas;

	public EnvioEmailPanel(UmMesParaViver entry, boolean senhas) {
		this.entry = entry;
		this.senhas = senhas;
	}

	protected Widget createWidget() {
		VerticalPanel panel = new VerticalPanel();
		panel.setSpacing(3);

		this.enviarButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				EnvioEmailPanel.this.enviarButton.setEnabled(false);
				EnvioEmailPanel.this.enviarEmail(EnvioEmailPanel.this.info);
			}
		});
		panel.add(this.enviarButton);
		panel.add(this.info);

		return panel;
	}

	private void enviarEmail(final HTML info) {
		this.service.enviarEmail(1, this.senhas ? 2 : 1, new AsyncCallback<String>() {
			public void onFailure(Throwable caught) {
				EnvioEmailPanel.this.enviarButton.setEnabled(true);
				info.setHTML(info.getHTML() + "<br>Ocorreu um erro (" + caught.getMessage()
						+ "). Alguns e-mails podem ter sido enviados.");
			}

			public void onSuccess(String result) {
				if (result == null) {
					EnvioEmailPanel.this.enviarButton.setEnabled(true);
					return;
				}
				info.setHTML(info.getHTML() + result);

				EnvioEmailPanel.this.enviarButton.setEnabled(true);
			}
		});
	}
}
