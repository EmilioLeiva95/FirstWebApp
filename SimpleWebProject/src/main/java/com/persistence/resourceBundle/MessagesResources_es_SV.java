package com.persistence.resourceBundle;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.dependencias.Recursos;


import java.util.Enumeration;
import java.util.Hashtable;

public class MessagesResources_es_SV extends Recursos {
	private static Hashtable<String, String> properties = null;

	@Override	public Enumeration<String> getKeys() {
		return properties.elements();
	}

	@Override	protected Object handleGetObject(String key) {
		if(properties == null){
			inicializar();
		}
		return properties.get(key);
	}

	protected void inicializar() {
		properties = new Hashtable<String, String>();
		System.out.println("a inicializar properties");
		cargarProperties(properties,
				"es", "SV",
				new String[]{
		        "com.persistence.resourceBundle.props.Orderlines",
		        "com.persistence.resourceBundle.props.Customers",
		        "com.persistence.resourceBundle.props.Orders",
		        "com.persistence.resourceBundle.props.Inventory",
		        "com.persistence.resourceBundle.props.Products",
		        "com.persistence.resourceBundle.props.Categories",
				"com.persistence.resourceBundle.props.Globales"});
	}
}
