package com.persistent.bean;

import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import com.persistent.dao.ProductoDao;
import com.persistent.dao.ProveedorDao;
import com.persistent.model.Proveedor;

@ManagedBean
@SessionScoped
public class Proveedores {
	private Proveedor provSave = new Proveedor();
	private Proveedor provUpdate;
	private List<Proveedor> listProveedor;

	public void saveProveedor() {
		ProveedorDao data = new ProveedorDao();
		Functions f = new Functions();
		try {
			if (f.validateVoid(provSave.getDescripcion()) && f.validateVoid(provSave.getPais())
					&& f.validateVoid(provSave.getRepresentante()) && f.validateVoid(provSave.getEstado())) {
				int idUser = (int) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("id");
				String nameUser = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
						.get("nombre");

				provSave.setId_usu_ing(String.valueOf(idUser));
				provSave.setNom_usu_ing(nameUser);
				provSave.setId_usu_mod(String.valueOf(idUser));
				provSave.setNom_usu_mod(nameUser);

				data.insertProveedor(provSave);
				provSave = new Proveedor();
				this.listarAllProviders();
			} else {
				addMessage("Todos los campos son obligatorios");
				System.out.println("Campo invalido");
			}
		} catch (Exception e) {
			System.out.println("Ocurrio un error saveProveedor : " + e.getMessage());
		}

	}

	public void listarAllProviders() {
		try {
			ProveedorDao data = new ProveedorDao();
			listProveedor = data.allProviders();
		} catch (Exception e) {
			System.out.println("Ocurrio un error al intentar obtener all provider: " + e.getMessage());
		}
	}

	public void getItemProvider(int id) {
		ProveedorDao data = new ProveedorDao();
		try {
			provUpdate = data.getProvider(id);
		} catch (Exception e) {
			System.out.println("Ocurrio un error al obtener producto: " + e.getMessage());
		}
	}

	public void updateProduct(int id) {
		ProveedorDao data = new ProveedorDao();
		try {
			int idUser = (int) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("id");
			String nameUser = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
					.get("nombre");

			provUpdate.setId_usu_mod(String.valueOf(idUser));
			provUpdate.setNom_usu_mod(nameUser);

			data.updateProvider(provUpdate, id);
			this.listarAllProviders();
		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}
	}

	public void deleteProduct(int id) {
		ProveedorDao data = new ProveedorDao();
		try {
			// data.deleteProduct(id);

		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}

	}

	public void addMessage(String summary) {
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, null);
		FacesContext.getCurrentInstance().addMessage(null, message);
	}

	public Proveedor getProvSave() {
		return provSave;
	}

	public void setProvSave(Proveedor provSave) {
		this.provSave = provSave;
	}

	public Proveedor getProvUpdate() {
		return provUpdate;
	}

	public void setProvUpdate(Proveedor provUpdate) {
		this.provUpdate = provUpdate;
	}

	public List<Proveedor> getListProveedor() {
		return listProveedor;
	}

	public void setListProveedor(List<Proveedor> listProveedor) {
		this.listProveedor = listProveedor;
	}

}
