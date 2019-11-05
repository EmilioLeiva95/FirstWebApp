package com.persistence.seguridad;

import java.io.Serializable;
import java.util.Collection;

public class UsuarioIS implements Serializable{
	public static final String USUARIO_IS = "_USUARIO_TARJETAS_";
	private static final long serialVersionUID = 1234123432L;
	private String nombreUsuario;
	private Long idUsuario;
	private Long idPerfil;
	private boolean expiroClave = false;
	private String controlHorario;
	private Collection<Perfil> perfiles;
	
	
	
	public Collection<Perfil> getPerfiles() {
		return perfiles;
	}
	public void setPerfiles(Collection<Perfil> perfiles) {
		this.perfiles = perfiles;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public Long getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}
	public Long getIdPerfil() {
		return idPerfil;
	}
	public void setIdPerfil(Long idPerfil) {
		this.idPerfil = idPerfil;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public boolean isExpiroClave() {
		return expiroClave;
	}
	public void setExpiroClave(boolean expiroClave) {
		this.expiroClave = expiroClave;
	}
	public String getControlHorario() {
		return controlHorario;
	}
	public void setControlHorario(String controlHorario) {
		this.controlHorario = controlHorario;
	}
	
	
}
