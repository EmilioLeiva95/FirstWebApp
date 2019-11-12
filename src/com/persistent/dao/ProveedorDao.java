package com.persistent.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.persistent.model.Producto;
import com.persistent.model.Proveedor;

public class ProveedorDao extends DAO {
	public void insertProveedor(Proveedor pv) throws Exception {
		Timestamp fecha = new Timestamp(System.currentTimeMillis());
		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn().prepareStatement(
					"INSERT INTO proveedor(descripcion,pais,representante,contacto,dirección,contrato,estado,id_usu_ing,"
							+ "nom_usu_ing,fec_ing,id_usu_mod,nom_usu_mod,fec_mod)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");

			st.setString(1, pv.getDescripcion());
			st.setString(2, pv.getPais());
			st.setString(3, pv.getRepresentante());
			st.setString(4, pv.getContacto());

			st.setString(5, pv.getDireccion());
			st.setTimestamp(6, new Timestamp(pv.getContrato().getTime()));
			st.setString(7, pv.getEstado());

			st.setString(8, pv.getId_usu_ing());
			st.setString(9, pv.getNom_usu_ing());
			st.setTimestamp(10, fecha);

			st.setString(11, pv.getId_usu_mod());
			st.setString(12, pv.getNom_usu_mod());
			st.setTimestamp(13, fecha);
			st.executeUpdate();

			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error insert product : " + e.getMessage());
			throw e;
		}
	}

	public List<Proveedor> allProviders() throws Exception {
		List<Proveedor> list = new ArrayList<Proveedor>();

		ResultSet rs;

		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn().prepareStatement("SELECT *FROM proveedor");

			rs = st.executeQuery();
			while (rs.next()) {
				Proveedor pv = new Proveedor();
				pv.setId_proveedor(rs.getInt("id_proveedor"));
				pv.setDescripcion(rs.getString("descripcion"));
				pv.setContacto(rs.getString("contacto"));
				pv.setDireccion(rs.getString("dirección"));
				pv.setEstado(rs.getString("estado"));
				pv.setPais(rs.getString("pais"));
				pv.setDate_contrato(rs.getString("contrato"));
				pv.setRepresentante(rs.getString("representante"));

				list.add(pv);
			}
			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error GET LIST PRODUCT : " + e.getMessage());
			throw e;
		}
		return list;
	}

	public Proveedor getProvider(int id) throws Exception {
		ResultSet rs;
		Proveedor pv = new Proveedor();
		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn().prepareStatement("SELECT *FROM proveedor WHERE id_proveedor=?");
			st.setInt(1, id);
			rs = st.executeQuery();
			if (rs.next()) {
				pv.setId_proveedor(rs.getInt("id_proveedor"));
				pv.setDescripcion(rs.getString("descripcion"));
				pv.setContacto(rs.getString("contacto"));
				pv.setDireccion(rs.getString("dirección"));
				pv.setEstado(rs.getString("estado"));
				pv.setPais(rs.getString("pais"));
				pv.setDate_contrato(rs.getString("contrato"));
				pv.setRepresentante(rs.getString("representante"));

			}
			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error getProduct : " + e.getMessage());
			throw e;
		}
		return pv;
	}

	public void updateProvider(Proveedor pv, int id) throws Exception {
		Timestamp fecha = new Timestamp(System.currentTimeMillis());
		try {
			this.ConnectionPostgresql();
			PreparedStatement st = this.getCnn().prepareStatement(
					"UPDATE proveedor SET descripcion=?,pais=?,representante=?,contacto=?,dirección=?,contrato=?,"
							+ "id_usu_mod=?,nom_usu_mod=?,fec_mod=? WHERE id_proveedor=?");

			st.setString(1, pv.getDescripcion());
			st.setString(2, pv.getPais());
			st.setString(3, pv.getRepresentante());
			st.setString(4, pv.getContacto());

			st.setString(5, pv.getDireccion());
			st.setString(6, pv.getDate_contrato());
			st.setString(7, pv.getEstado());

			st.setString(11, pv.getId_usu_mod());
			st.setString(12, pv.getNom_usu_mod());
			st.setTimestamp(13, fecha);

			st.executeUpdate();

			this.closeDB();

		} catch (Exception e) {
			System.out.println("Ocurrio un error updateProduct : " + e.getMessage());
			throw e;
		}
	}
}
