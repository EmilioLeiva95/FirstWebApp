package com.persistent.bean;

import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import com.persistent.dao.UsuarioDao;
import com.persistent.model.Usuario;
import com.persistent.bean.Functions;

@ManagedBean
@SessionScoped
public class Usuarios {
	private String uri;
	private Usuario users;
	private List<Usuario> listUsers;
	private String nombre;
	private String apellido;
	private String username;
	private String password;
	private String email;

	public void listarUsers() {
		uri = "Usuarios.xhtml";
		try {
			UsuarioDao data = new UsuarioDao();
			listUsers = data.allUsers();
		} catch (Exception e) {
			System.out.println("Ocurrio un error al intentar obtener usuarios: " + e.getMessage());
		}
	}

	public void saveUser() {
		Functions f = new Functions();
		Usuario s = new Usuario();
		UsuarioDao data = new UsuarioDao();
		try {
			if (f.validateVoid(nombre) && f.validateVoid(apellido) && f.validateVoid(username)
					&& f.validateVoid(password) && f.validateVoid(email)) {
				s.setNombre(nombre);
				s.setApellido(apellido);
				s.setUsername(username);
				s.setPassword(password);
				s.setEmail(email);
				data.insertUser(s);
				this.listarUsers();
				this.voidParameter();
			} else {
				addMessage("Todos los campos son obligatorios");
				System.out.println("Campo invalido");
			}
		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}
	}

	public void getItemUser(int id) {
		UsuarioDao data = new UsuarioDao();
		try {
			users = data.getUser(id);
		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}

	}

	public void deleteUser(int id) {
		UsuarioDao data = new UsuarioDao();
		System.out.println("deleteUser " + id);

		try {
			data.deleteUser(id);
			this.listarUsers();
		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}

	}

	public void updateUser(int id) {
		UsuarioDao data = new UsuarioDao();
		System.out.println("Nombre " + users.getNombre());
		try {
			data.updateUser(users, id);
			this.listarUsers();
		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}
	}

	public void voidParameter() {
		nombre = "";
		apellido = "";
		username = "";
		email = "";
		password = "";

	}

	public void addMessage(String summary) {
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, null);
		FacesContext.getCurrentInstance().addMessage(null, message);
	}

	public Usuario getUsers() {
		return users;
	}

	public void setUsers(Usuario users) {
		this.users = users;
	}

	public List<Usuario> getListUsers() {
		return listUsers;
	}

	public void setListUsers(List<Usuario> listUsers) {
		this.listUsers = listUsers;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
