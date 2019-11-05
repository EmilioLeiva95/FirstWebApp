package com.persistent.bean;

import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import com.persistent.dao.UsuarioDao;

@ManagedBean
public class Login {

	private boolean isLogin = false;
	private String user;
	private String pwd;

	public String validate() {
		System.out.println("Dentro de funcion validate " + user + " " + pwd);
		UsuarioDao data = new UsuarioDao();

		try {
			if (this.validateVoid(user) && this.validateVoid(pwd)) {
				if (data.validate(user, pwd))
					return "Main.xhtml?faces-redirect=true";
				else {
					addMessage("Usuario invalido");
					// return "";
				}
			} else {
				addMessage("Campo invalido");
				System.out.println("Campo invalido");
			}
		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}

		return "";
	}

	public void addMessage(String summary) {
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, null);
		FacesContext.getCurrentInstance().addMessage(null, message);
	}

	// Metodo que valida si una cadena esta vacia
	public boolean validateVoid(String text) {
		if (text != null && !text.equals(""))
			return true;
		return false;
	}

	// Metodo para validar cadena de password con un minimo de 8 caracteres y una
	// mayuscula, un numero,un caracter especial
	public boolean validatePass(String pwd) {
		String regex = "^(?=.*\\d)(?=.*[\\u0021-\\u002b\\u003c-\\u0040])(?=.*[A-Z])\\S{8,}$";
		if (Pattern.matches(regex, pwd))
			return true;

		return false;
	}


	public boolean isLogin() {
		return isLogin;
	}

	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String usr) {
		this.user = usr;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
