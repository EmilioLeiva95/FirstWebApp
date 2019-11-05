package com.persistent.dao;

import java.sql.DriverManager;

import java.sql.Connection;

public class DAO {
	private Connection cnn;

	public void ConnectionPostgresql() {
		String urlDatabase = "jdbc:postgresql://localhost:5432/Persistent";
		try {
			Class.forName("org.postgresql.Driver");
			cnn = DriverManager.getConnection(urlDatabase, "postgres", "admin");
		} catch (Exception e) {
			System.out.println("Ocurrio un error en connections : " + e.toString());
		}
	}

	public void closeDB() {

		try {
			System.out.println("Intentando cerrar conexion....");
			if (cnn != null)
				cnn.close();

		} catch (Exception e) {
			System.out.println("Ocurrio un error al cerrar base de datos : " + e.getMessage());
		}
	}

	public Connection getCnn() {
		return cnn;
	}

	public void setCnn(Connection cnn) {
		this.cnn = cnn;
	}

}
