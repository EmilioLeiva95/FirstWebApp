package com.persistent.model;

import java.util.Date;

public class Proveedor {
	private int id_proveedor;
	private String descripcion;
	private String pais;
	private String representante;
	private String contacto;
	private String direccion;
	private Date contrato;
	private String estado;
	private String id_usu_ing;
	private String nom_usu_ing;
	private String fec_ing;
	private String id_usu_mod;
	private String nom_usu_mod;
	private String fec_mod;
	private String date_contrato;

	public String getDate_contrato() {
		return date_contrato;
	}

	public void setDate_contrato(String date_contrato) {
		this.date_contrato = date_contrato;
	}

	public int getId_proveedor() {
		return id_proveedor;
	}

	public void setId_proveedor(int id_proveedor) {
		this.id_proveedor = id_proveedor;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getRepresentante() {
		return representante;
	}

	public void setRepresentante(String representante) {
		this.representante = representante;
	}

	public String getContacto() {
		return contacto;
	}

	public void setContacto(String contacto) {
		this.contacto = contacto;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getId_usu_ing() {
		return id_usu_ing;
	}

	public void setId_usu_ing(String id_usu_ing) {
		this.id_usu_ing = id_usu_ing;
	}

	public String getNom_usu_ing() {
		return nom_usu_ing;
	}

	public void setNom_usu_ing(String nom_usu_ing) {
		this.nom_usu_ing = nom_usu_ing;
	}

	public String getFec_ing() {
		return fec_ing;
	}

	public void setFec_ing(String fec_ing) {
		this.fec_ing = fec_ing;
	}

	public String getId_usu_mod() {
		return id_usu_mod;
	}

	public void setId_usu_mod(String id_usu_mod) {
		this.id_usu_mod = id_usu_mod;
	}

	public String getNom_usu_mod() {
		return nom_usu_mod;
	}

	public void setNom_usu_mod(String nom_usu_mod) {
		this.nom_usu_mod = nom_usu_mod;
	}

	public String getFec_mod() {
		return fec_mod;
	}

	public void setFec_mod(String fec_mod) {
		this.fec_mod = fec_mod;
	}

	public Date getContrato() {
		return contrato;
	}

	public void setContrato(Date contrato) {
		this.contrato = contrato;
	}

}
