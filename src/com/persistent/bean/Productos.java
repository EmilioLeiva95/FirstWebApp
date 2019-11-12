package com.persistent.bean;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import com.persistent.dao.ProductoDao;
import com.persistent.model.Producto;

@ManagedBean
@SessionScoped
public class Productos {
	private Producto prodSave = new Producto();
	private Producto prodUpdate;

	public void saveProduct() {
		ProductoDao data = new ProductoDao();
		Functions f = new Functions();
		try {
			if (f.validateVoid(prodSave.getDescripcion()) && f.validateVoid(prodSave.getFabricante())
					&& f.validateVoid(prodSave.getCodigo_barras()) && f.validateVoid(prodSave.getEstado())
					&& prodSave.getPrecio() != null && prodSave.getExistencia() != 0) {
				int idUser = (int) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("id");
				String nameUser = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
						.get("nombre");

				prodSave.setId_usu_ing(String.valueOf(idUser));
				prodSave.setNom_usu_ing(nameUser);
				prodSave.setId_usu_mod(String.valueOf(idUser));
				prodSave.setNom_usu_mod(nameUser);

				data.insertProduct(prodSave);

			} else {
				addMessage("Todos los campos son obligatorios");
				System.out.println("Campo invalido");
			}
		} catch (Exception e) {
			System.out.println("Ocurrio un error login : " + e.getMessage());
		}

	}

	public void addMessage(String summary) {
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, summary, null);
		FacesContext.getCurrentInstance().addMessage(null, message);
	}

	public Producto getProdSave() {
		return prodSave;
	}

	public void setProdSave(Producto prodSave) {
		this.prodSave = prodSave;
	}

	public Producto getProdUpdate() {
		return prodUpdate;
	}

	public void setProdUpdate(Producto prodUpdate) {
		this.prodUpdate = prodUpdate;
	}

}
