package com.persistent.bean;

import javax.faces.bean.ManagedBean;

@ManagedBean
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
}
