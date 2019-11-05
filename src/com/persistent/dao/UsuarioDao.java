package com.persistent.dao;

//import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.persistent.model.Usuario;

public class UsuarioDao extends DAO {
	private Usuario usr;

	public boolean validate(String username, String password) throws Exception {
		ResultSet rs;

		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn()
					.prepareStatement("SELECT *FROM usuario WHERE username=? and password=?");
			st.setString(1, username);
			st.setString(2, password);
			rs = st.executeQuery();
			if (rs.next()) {
				System.out.println("Respuesta " + rs.getString(4));
				return true;
			}
			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error USUARIO_DAO : " + e.getMessage());
			throw e;
		}
		return false;
	}

	public Usuario getUsr() {
		return usr;
	}

	public void setUsr(Usuario usr) {
		this.usr = usr;
	}

}
