package com.persistent.bean;

import javax.faces.bean.ManagedBean;

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
			if (data.validate(user, pwd))
				return "Main.xhtml?faces-redirect=true";
			else {

				return "";

			}

		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}

		return "";
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
