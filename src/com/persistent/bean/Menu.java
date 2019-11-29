package com.persistent.bean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;


@ManagedBean
@SessionScoped
public class Menu {
	private String uri;

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public void tabUsers() {
		uri = "Usuarios.xhtml";
	}

	public void tabRoles() {
		uri = "Roles.xhtml";
	}

	public void tabPermisos() {
		uri = "Permisos.xhtml";
	}

	public void tabProductos() {
		uri = "Productos.xhtml";
	}

	public void tabProveedores() {
		//uri = "Proveedores.xhtml";
		uri = "Provider.xhtml";
	}
}
