package net.ibmemorial.ummes.model;

import java.io.Serializable;

public class UsuarioDTO implements Serializable {
	private Usuario usuario;
	private Role[] roles;

	public UsuarioDTO() {
	}

	public UsuarioDTO(Usuario usuario, Role[] roles) {
		this.usuario = usuario;
		this.roles = roles;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Role[] getRoles() {
		return this.roles;
	}

	public void setRoles(Role[] roles) {
		this.roles = roles;
	}

	public boolean isUserInRole(String role) {
		if (this.roles == null) {
			return false;
		}
		Role[] arrayOfRole;
		int j = (arrayOfRole = this.roles).length;
		for (int i = 0; i < j; i++) {
			Role r = arrayOfRole[i];
			if (r.getCodigo().equals(role)) {
				return true;
			}
		}

		return false;
	}
}
