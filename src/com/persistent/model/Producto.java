package com.persistent.model;

public class Producto {
	private int id_producto;
	private String descripcion;
	private Float precio;
	private String codigo_barras;
	private String fabricante;
	private String estado;
	private int existencia;
	private String id_usu_ing;
	private String nom_usu_ing;
	private String fec_ing;
	private String id_usu_mod;
	private String nom_usu_mod;
	private String fec_mod;

	public int getId_producto() {
		return id_producto;
	}

	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Float getPrecio() {
		return precio;
	}

	public void setPrecio(Float precio) {
		this.precio = precio;
	}

	public String getCodigo_barras() {
		return codigo_barras;
	}

	public void setCodigo_barras(String codigo_barras) {
		this.codigo_barras = codigo_barras;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public int getExistencia() {
		return existencia;
	}

	public void setExistencia(int existencia) {
		this.existencia = existencia;
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

	public String getFec_ing() {
		return fec_ing;
	}

	public void setFec_ing(String fec_ing) {
		this.fec_ing = fec_ing;
	}

	public String getFec_mod() {
		return fec_mod;
	}

	public void setFec_mod(String fec_mod) {
		this.fec_mod = fec_mod;
	}

}
