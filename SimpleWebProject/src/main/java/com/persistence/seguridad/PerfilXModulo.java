package com.persistence.seguridad;

import java.io.Serializable;

public class PerfilXModulo implements Serializable{

	private String perfilId;
	private String moduloId;
	public String getPerfilId() {
		return perfilId;
	}
	public void setPerfilId(String perfilId) {
		this.perfilId = perfilId;
	}
	public String getModuloId() {
		return moduloId;
	}
	public void setModuloId(String moduloId) {
		this.moduloId = moduloId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((moduloId == null) ? 0 : moduloId.hashCode());
		result = prime * result + ((perfilId == null) ? 0 : perfilId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PerfilXModulo other = (PerfilXModulo) obj;
		if (moduloId == null) {
			if (other.moduloId != null)
				return false;
		} else if (!moduloId.equals(other.moduloId))
			return false;
		if (perfilId == null) {
			if (other.perfilId != null)
				return false;
		} else if (!perfilId.equals(other.perfilId))
			return false;
		return true;
	}
	
	
	
	
}
