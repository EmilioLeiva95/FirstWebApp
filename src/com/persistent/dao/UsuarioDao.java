package com.persistent.dao;

//import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.persistent.model.Usuario;

public class UsuarioDao extends DAO {

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

	public List<Usuario> allUsers() throws Exception {
		List<Usuario> list = new ArrayList<Usuario>();

		ResultSet rs;

		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn().prepareStatement("SELECT *FROM usuario");

			rs = st.executeQuery();
			while (rs.next()) {
				Usuario usr = new Usuario();
				usr.setId_user(rs.getInt("id_user"));
				usr.setNombre(rs.getString("nombre"));
				usr.setApellido(rs.getString("apellido"));
				usr.setUsername(rs.getString("username"));
				usr.setEmail(rs.getString("email"));
				usr.setFecha_creacion(rs.getString("fecha_creación"));
				usr.setLast_login(rs.getString("last_login"));
				usr.setEstado(rs.getString("estado"));
				list.add(usr);
			}
			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error USUARIO_DAO : " + e.getMessage());
			throw e;
		}
		return list;
	}

	public void insertUser(Usuario user) throws Exception {
		Timestamp fecha = new Timestamp(System.currentTimeMillis());
		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn()
					.prepareStatement("INSERT INTO usuario(nombre,apellido,username,password,email,"
							+ "fecha_creación,last_login,estado)  VALUES (?,?,?,?,?,?,?,?)");

			// st.setInt(1, user.getId_user());
			st.setString(1, user.getNombre());
			st.setString(2, user.getApellido());
			st.setString(3, user.getUsername());
			st.setString(4, user.getPassword());
			st.setString(5, user.getEmail());
			st.setTimestamp(6, fecha);
			st.setTimestamp(7, fecha);
			st.setString(8, "RG");
			st.executeUpdate();

			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error insert user : " + e.getMessage());
			throw e;
		}

	}

	public Usuario getUser(int id) throws Exception {
		ResultSet rs;
		Usuario usr = new Usuario();
		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn().prepareStatement("SELECT *FROM usuario WHERE id_user=?");
			st.setInt(1, id);
			rs = st.executeQuery();
			if (rs.next()) {
				System.out.println("Respuesta " + rs.getString(4));
				usr.setId_user(rs.getInt("id_user"));
				usr.setNombre(rs.getString("nombre"));
				usr.setApellido(rs.getString("apellido"));
				usr.setUsername(rs.getString("username"));
				usr.setPassword(rs.getString("password"));
				usr.setEmail(rs.getString("email"));
				usr.setFecha_creacion(rs.getString("fecha_creación"));
				usr.setLast_login(rs.getString("last_login"));
				usr.setEstado(rs.getString("estado"));
			}
			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error USUARIO_DAO : " + e.getMessage());
			throw e;
		}
		return usr;
	}

	public void deleteUser(int id) throws Exception {
		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn().prepareStatement("DELETE FROM usuario WHERE id_user=?");
			st.setInt(1, id);
			st.executeUpdate();
			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error USUARIO_DAO : " + e.getMessage());
			throw e;
		}

	}

	public void updateUser(Usuario user, int id) throws Exception {
		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn().prepareStatement(
					"UPDATE usuario SET nombre=?,apellido=?,username=?,password=?,email=?,estado=? WHERE id_user=?");

			st.setString(1, user.getNombre());
			st.setString(2, user.getApellido());
			st.setString(3, user.getUsername());
			st.setString(4, user.getPassword());
			st.setString(5, user.getEmail());
			st.setString(6, user.getEstado());
			st.setInt(7, id);
			st.executeUpdate();

			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error insert user : " + e.getMessage());
			throw e;
		}

	}
}
