package com.persistence.dependenciasGlobales;
          
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.ExcepcionEnLocalizacionDeServicio;  
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.LocalizadorDeServiciosMultiples;        
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.LocalizadorDeServicio;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.impl.LocalizadorDeServicioMemImpl;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.dependencias.ConstructorPrincipal;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.dependencias.Recursos;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.impl.LocalizadorDeSerivicioBase;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.Dao;
       
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.impl.PostgresLenguaje;
import com.persistence.orm.jdbc.sql.impl.CategoriesDaoJdbcSql;
import com.persistence.orm.jdbc.sql.impl.CustomersDaoJdbcSql;
import com.persistence.orm.jdbc.sql.impl.InventoryDaoJdbcSql;
import com.persistence.orm.jdbc.sql.impl.OrderlinesDaoJdbcSql;
import com.persistence.orm.jdbc.sql.impl.OrdersDaoJdbcSql;
import com.persistence.orm.jdbc.sql.impl.ProductsDaoJdbcSql;
import com.persistence.resourceBundle.MessagesResources_es_SV;
import com.persistence.abstraccion.negocio.OrderlinesNegocio;        
import com.persistence.abstraccion.negocio.CustomersNegocio;        
import com.persistence.abstraccion.negocio.OrdersNegocio;        
import com.persistence.abstraccion.negocio.InventoryNegocio;        
import com.persistence.abstraccion.negocio.ProductsNegocio;        
import com.persistence.abstraccion.negocio.CategoriesNegocio;

/**
 * Clase Resolusor, utiliza el patr&oacute;n de dise&ntilde;o IoC o tambi&eacute;n conocido como inyecci&oacute;n
 * de  dependencias, brinda la capacidad de proveer de los objetos de Negocio y de la capa DAO cuando es necesario.
 *
 * @author Systems Out of the Box
 * @version f3.1
 */
public class DemoResolusor extends ConstructorPrincipal{

	/**
	 * Atributo que almacena el objeto Resolusor
	 */
    private static DemoResolusor demoResolusor;
	private Recursos recursos = new MessagesResources_es_SV();
    /**
     * Devuelve una instancia del Resolusor utilizando el patr&oacute;n Singleton.
     * @return <code>Resolusor</code>
     */
    public static DemoResolusor getSingleton(){
         if(demoResolusor == null){
               demoResolusor =  new DemoResolusor(); 
         }
         return demoResolusor;
    }
    
	/**
     * M&eacute;todo encargado de preparar las instancias de cada objeto de Negocio, las coloca en una colecci&oacute;n
     * de objetos de Negocio para que el localizador correspondiente pueda inyectar las dependencias cuando sea necesario.<br/>
     * 
     * Tambi&eacute;n realiza el trabajo de obtener la implementaci&oacute;n del Servicio de Acesso a datos, para este caso
     * el acceso a la capa DAO, para cada objeto de Negocio espec&iacute;fico.
     */
    public void prepararInstanciasNegocio(){    
        LocalizadorDeServiciosMultiples locMultiDao = getLocMultiDao();
        
        OrderlinesNegocio orderlinesNegocio = new OrderlinesNegocio();
        orderlinesNegocio.setDao((Dao)locMultiDao.getServicio("orderlinesDao"));
        CustomersNegocio customersNegocio = new CustomersNegocio();
        customersNegocio.setDao((Dao)locMultiDao.getServicio("customersDao"));
        OrdersNegocio ordersNegocio = new OrdersNegocio();
        ordersNegocio.setDao((Dao)locMultiDao.getServicio("ordersDao"));
        InventoryNegocio inventoryNegocio = new InventoryNegocio();
        inventoryNegocio.setDao((Dao)locMultiDao.getServicio("inventoryDao"));
        ProductsNegocio productsNegocio = new ProductsNegocio();
        productsNegocio.setDao((Dao)locMultiDao.getServicio("productsDao"));
        CategoriesNegocio categoriesNegocio = new CategoriesNegocio();
        categoriesNegocio.setDao((Dao)locMultiDao.getServicio("categoriesDao"));
  
        agregarInstanciaNegocio("orderlinesNegocio",orderlinesNegocio);
        agregarInstanciaNegocio("customersNegocio",customersNegocio);
        agregarInstanciaNegocio("ordersNegocio",ordersNegocio);
        agregarInstanciaNegocio("inventoryNegocio",inventoryNegocio);
        agregarInstanciaNegocio("productsNegocio",productsNegocio);
        agregarInstanciaNegocio("categoriesNegocio",categoriesNegocio);
    }
	/**
     * Constructor de la clase, con acceso limitado.
     */
    private DemoResolusor(){
    
    }
	
	/**
	 * M&eacute;todo encargado de preparar las instancias de la capa de acceso a datos, para poder inyectar las dependencias
	 * a trav&eacute;s del Localizador correspondiente.<br/>
	 * 
	 * <ul>
	 * 	<li>Inicializa la configuraci&oacute;n del objeto encargado del Lenguaje de la base de datos a utilizar.</li>
	 * 	<li>Crea las instancias correspondientes para acceder a la capa de negocio de cada objeto de Negocio.</li>
	 * </ul>
	 * 
	 */
	public void prepararInstanciasDao(){
		final java.util.Properties params = new java.util.Properties();
				
		LocalizadorDeServicio localizadorLenguaje = new LocalizadorDeSerivicioBase() {

			public Object getServicio() throws ExcepcionEnLocalizacionDeServicio {
				return new PostgresLenguaje(params);
			}
		};			 
	
		OrderlinesDaoJdbcSql.setLocalizadorLenguaje(localizadorLenguaje);
        agregarInstanciaDao("orderlinesDao",new OrderlinesDaoJdbcSql());
		CustomersDaoJdbcSql.setLocalizadorLenguaje(localizadorLenguaje);
        agregarInstanciaDao("customersDao",new CustomersDaoJdbcSql());
		OrdersDaoJdbcSql.setLocalizadorLenguaje(localizadorLenguaje);
        agregarInstanciaDao("ordersDao",new OrdersDaoJdbcSql());
		InventoryDaoJdbcSql.setLocalizadorLenguaje(localizadorLenguaje);
        agregarInstanciaDao("inventoryDao",new InventoryDaoJdbcSql());
		ProductsDaoJdbcSql.setLocalizadorLenguaje(localizadorLenguaje);
        agregarInstanciaDao("productsDao",new ProductsDaoJdbcSql());
		CategoriesDaoJdbcSql.setLocalizadorLenguaje(localizadorLenguaje);
        agregarInstanciaDao("categoriesDao",new CategoriesDaoJdbcSql());
	}
	
	public void setRecursos(Recursos recursos){
		this.recursos = recursos;
	}
	
	public Recursos getRecursos(){
		return this.recursos;
	}
    
}


