package net.ibmemorial.ummes.client;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.MenuBar;
import com.google.gwt.user.client.ui.MenuItem;
import com.google.gwt.user.client.ui.Panel;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.VerticalPanel;

import net.ibmemorial.ummes.model.GrupoDTO;
import net.ibmemorial.ummes.model.UsuarioDTO;
import net.ibmemorial.ummes.shared.Page;

public class UmMesParaViver implements EntryPoint {
	private final ServiceAsync service = (ServiceAsync) GWT.create(Service.class);
	private final UmMesParaViverConstants constants = (UmMesParaViverConstants) GWT
			.create(UmMesParaViverConstants.class);
	private Panel mainPanel;
	private Panel content;
	private UsuarioDTO usuario;

	public void onModuleLoad() {
		RootPanel.get().setStyleName("body");
		if ((RootPanel.get("popup") != null)
				&& (ValidationUtils.isInteger(Window.Location.getParameter("codigoGrupo")))) {
			Map<String, Serializable> searchParameters = new HashMap();
			searchParameters.put("codigo", new Integer(Window.Location.getParameter("codigoGrupo")));

			this.service.getGrupos(searchParameters, 0, new AsyncCallback() {
				public void onSuccess(final Object objeto) {
					if (objeto == null) {
						return;
					}
					Page<GrupoDTO> result = (Page<GrupoDTO>) objeto;
					if (result.getResults().isEmpty()) {
						return;
					}
					UmMesParaViver.this.service.getUsuarioDTO(new AsyncCallback() {
						public void onSuccess(Object objUser) {
							UsuarioDTO user = (UsuarioDTO) objUser;
							UmMesParaViver.this.usuario = user;
							UmMesParaViver.this.setContent(new AdministrarGrupoPanel(UmMesParaViver.this, null,
									((Page<GrupoDTO>) objeto).getResults().get(0), true,
									(UmMesParaViver.this.usuario != null)
											&& (UmMesParaViver.this.usuario.getUsuario().getCodigoInscrito() != null)));
						}

						public void onFailure(Throwable caught) {
							Window.alert("Erro inesperado: " + caught.toString());
						}
					});
				}

				public void onFailure(Throwable t) {
				}
			});
			return;
		}
		if (RootPanel.get("acessoRestrito") != null) {
			LoginPanel loginPanel = new LoginPanel(this);
			RootPanel.get("acessoRestrito").add(loginPanel);
			loginPanel.setVisible(true);
		}
		if (RootPanel.get("menuAcessoRestrito") != null) {
			this.service.getUsuarioDTO(new AsyncCallback() {
				public void onSuccess(Object objeto) {
					UsuarioDTO result = (UsuarioDTO) objeto;
					UmMesParaViver.this.usuario = result;
					if (result == null) {
						UiUtils.redirect("../home.html");
						return;
					}
					RootPanel.get("menuAcessoRestrito")
							.add(UmMesParaViver.this.createMenuBarInfo(UmMesParaViver.this.usuario));
					RootPanel.get("menuAcessoRestrito")
							.add(UmMesParaViver.this.createMenuBar(UmMesParaViver.this.usuario));
				}

				public void onFailure(Throwable caught) {
					Window.alert("Erro inesperado: " + caught.toString());

					UiUtils.redirect("../home.html");
				}
			});
		} else if (RootPanel.get("gpsdisponiveis") != null) {
			setContent(new ListaGruposPanel(this, true));
		} else {
			setContent(new InscricaoHospedeiroFacilitadorPanel(this, false));
		}
	}

	public void setContent(Panel content) {
		if (this.mainPanel == null) {
			this.mainPanel = new VerticalPanel();
			this.mainPanel.setSize("737px", "150px");
		}
		if (this.content != null) {
			this.mainPanel.remove(this.content);
		}
		if (RootPanel.get("centerPanel") == null) {
			return;
		}
		this.content = content;
		this.mainPanel.add(content);
		RootPanel.get("centerPanel").add(this.mainPanel);
		this.mainPanel.setVisible(true);
		content.setVisible(true);
	}

	public MenuBar createMenuBar(UsuarioDTO dto) {
		final MenuBar menu = new MenuBar();

		menu.ensureDebugId("menuAcessoRestrito");
		menu.setAutoOpen(true);
		menu.setAnimationEnabled(true);
		if (dto.getUsuario().getCodigoInscrito() != null) {
			this.service.getGrupoByUsuario(dto.getUsuario().getCodigoInscrito(), new AsyncCallback() {
				public void onSuccess(final Object result) {
					if (result == null) {
						return;
					}
					menu.addItem("Membros do Meu Grupo", new Command() {
						public void execute() {
							UmMesParaViver.this.setContent(new AdministrarGrupoPanel(UmMesParaViver.this, null,
									(GrupoDTO) result, false, true));
						}
					});
					menu.addItem("Material de Apoio", new Command() {
						public void execute() {
							UmMesParaViver.this.setContent(new MaterialPanel(UmMesParaViver.this));
						}
					});
				}

				public void onFailure(Throwable t) {
				}
			});
		}
		if ((dto.isUserInRole("STAND")) || (dto.isUserInRole("ADMIN"))) {
			if (dto.isUserInRole("ADMIN")) {
				MenuBar inscricoesMenu = new MenuBar(true);
				inscricoesMenu.setAnimationEnabled(true);
				menu.addItem(new MenuItem(this.constants.inscricoes(), inscricoesMenu));

				inscricoesMenu.addItem(this.constants.inscreverFacilitadoresHospedeiros(), new Command() {
					public void execute() {
						UmMesParaViver.this
								.setContent(new InscricaoHospedeiroFacilitadorPanel(UmMesParaViver.this, true));
					}
				});
				inscricoesMenu.addStyleName("clickable");
				inscricoesMenu.addItem(this.constants.inscricoesRealizadas(), new Command() {
					public void execute() {
						UmMesParaViver.this.setContent(new ListaInscricoesPanel(UmMesParaViver.this));
					}
				});
				MenuBar gruposMenu = new MenuBar(true);
				gruposMenu.setAnimationEnabled(true);
				menu.addItem(new MenuItem(this.constants.gruposMenu(), gruposMenu));

				gruposMenu.addItem(this.constants.formarGrupos(), new Command() {
					public void execute() {
						UmMesParaViver.this.setContent(new FormacaoGruposPanel(UmMesParaViver.this));
					}
				});
				gruposMenu.addItem(this.constants.administrarGrupos(), new Command() {
					public void execute() {
						UmMesParaViver.this.setContent(new ListaGruposPanel(UmMesParaViver.this, false));
					}
				});
				gruposMenu.addItem("Enviar e-mail da Cria��o do Grupo", new Command() {
					public void execute() {
						UmMesParaViver.this.setContent(new EnvioEmailPanel(UmMesParaViver.this, false));
					}
				});
				gruposMenu.addItem("Enviar e-mail de Senhas de Acesso", new Command() {
					public void execute() {
						UmMesParaViver.this.setContent(new EnvioEmailPanel(UmMesParaViver.this, true));
					}
				});
			}
			if (dto.isUserInRole("STAND")) {
				menu.addItem(this.constants.inscreverFacilitadoresHospedeiros(), new Command() {
					public void execute() {
						UmMesParaViver.this
								.setContent(new InscricaoHospedeiroFacilitadorPanel(UmMesParaViver.this, true));
					}
				});
				menu.addItem("Inscrever Participantes", new Command() {
					public void execute() {
						UmMesParaViver.this.setContent(new ListaGruposPanel(UmMesParaViver.this, false));
					}
				});
			}
		}
		return menu;
	}

	public MenuBar createMenuBarInfo(UsuarioDTO dto) {
		MenuBar menu = new MenuBar();
		menu.ensureDebugId("menuAcessoRestritoInfo");
		menu.setAutoOpen(true);
		menu.setAnimationEnabled(true);

		menu.addItem(this.constants.bemVindo() + ' ' + dto.getUsuario().getNome(), new Command() {
			public void execute() {
			}
		});
		menu.addSeparator();

		menu.addItem("Sair", new Command() {
			public void execute() {
				UmMesParaViver.this.service.logout(new AsyncCallback() {
					public void onSuccess(Object result) {
						UiUtils.redirect("../home.html");
					}

					public void onFailure(Throwable caught) {
						UiUtils.redirect("../home.html");
					}
				});
			}
		});
		return menu;
	}

	public boolean isUserInRole(String role) {
		return (this.usuario != null) && (this.usuario.isUserInRole(role));
	}
}
