package com.persistence.abstraccion.negocio;

import java.util.Collection;
import java.util.Iterator;



import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.enlaces.CreadorDeEnlaceDetalle;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.enlaces.impl.CreadorDeEnlaceDetalleDinImpl;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.enlaces.CreadorDeEnlaceBusqueda;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.enlaces.impl.CreadorDeEnlaceBusquedaDinImpl;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.enlaces.EnlaceDetalle;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.filtro.CreadorDeFiltro;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.filtro.impl.CreadorDeFiltroSobreDtoMeta;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.orden.CreadorDeOrdenamiento;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.orden.impl.CreadorDeOrdenamientoSobreDtoMeta;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.ExcepcionEnLocalizacionDeServicio;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.LocalizadorDeServicio;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.impl.LocalizadorDeSerivicioBase;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.dependencias.LocalizadorDeServiciosAplicacion;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.log.Log;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.log.LogServiceLocator;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.ExcepcionEnDAO;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.Paginador;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.PeticionDeDatos;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.foraneos.DataConValoresForaneos;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.foraneos.DatoEnllavado;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.foraneos.Enllavador;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.NegocioOperaciones;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.NegocioDesacoplado;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.impl.NegocioOperacionesBase;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.validacion.ValidadorDeDatos;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.validacion.impl.ValidadorDeDatosSobreDtoMeta;
import com.persistence.abstraccion.dao.ProductsDao;
import com.persistence.dependenciasGlobales.DemoResolusor;

import compersistence.abstraccion.dto.Products;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.meta.DtoMeta;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.meta.DtoPropiedadForaneoMeta;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.meta.DtoPropiedadMeta;




/**
 * Clase que hereda de {@link NegocioDesacoplado}. Esta clase se encarga de tener toda la informaci&oacute;n
 * y operaciones que pertenecen a un negocio en espec&iacute;fico, y permite modificar comportamientos de cada negocio.<br/>
 *
 * DTO_META: Atributo que almacena todas las reglas que rigen a las propiedades de un objeto de Negocio.
 * En esta secci&oacute;n se definen las reglas que condicionan a cada propiedad de este Negocio.
 * @see {@link DtoMeta}
 *
 * CREADORES_DETALLE: Atributo que alamcena objetos de tipo {@link CreadorDeEnlaceDetalle}, cada uno de estos objetos define la informaci&oacute;n
 * que se enlazar&aacute; a este negocio. <br/>
 * La relaci&oacute;n que surge con este atributo es la denominado maestro-detalle, este Negocio es el maestro u objeto for&aacute;neo
 * de cada uno de los objetos que se definen en el atributo.
 * 
 * Este arreglo tiene implementaciones del tipo {@link CreadorDeEnlaceBusquedaDinImpl} que son instanciados al momento de la creaci&oacute;n del atributo,
 * recibiendo en el constructor el atributo {@link #DTO_META} definido en este negocio y el DTO_META definido en el objeto negocio asociado,
 * conocido como  detalle, al mismo tiempo se definen los datos que enlazar&aacute;n al objeto maestro con el detalle.
 * @see {@link CreadorDeEnlaceDetalle} 
 *
 * CREADORES_BUSQUEDA: Atributo que almacena objetos de tipo {@link CreadorDeEnlaceBusqueda}, cada uno de estos objetos define la informaci&oacute;n
 * que se enlazar&aacute; con los objetos de negocio foraneos, a los cuales se les conoce como maestros.<br/>
 * La relaci&oacute;n que surge con este atributo es la denominado detalle-maestro, cada uno de los objetos definidos en este atributo son objetos
 * de Negocio maestro o foraneos.  
 *
 * Este arreglo tiene implementaciones del tipo {@link CreadorDeEnlaceBusquedaDinImpl}, que son instanciados al momento de la creaci&oacute;n del atributo,
 * recibiendo en el constructor el atributo {@link #DTO_META} definido en este negocio, y el DTO_META definido en el negocio asociado, conocido como maestro,
 * al mismo tiempo se definen las propiedades del maestro que ser&aacute;n visibles al momento de desplegar el listado de datos en modo lista de valores.
 *
 * validadorDeDatos: Atributo que almacena un objeto que contiene la informaci&oacute;n de validaci&oacute;n de datos para este Negocio.<br/>
 *
 * Al crear la instancia de la clase <code>ValidadorDeDatosSobreDtoMeta</code>, que implementa un objeto del tipo {@link ValidadorDeDatos}, 
 * permite sobreescribir cada uno de los m&eacute;todos que posee para validar datos, y de esta manera personalizar la validaci&oacute;n de las
 * propiedades del objeto de Negocio.
 *
 * creadorDeFiltro: Atributo que almacena un objeto que contiene la informaci&oacute;n del filtro aplicado.<br/>
 *
 * Al crear la instancia de la clase <code>CreadorDeFiltroSobreDtoMeta</code>, que implementa un objeto del tipo {@link CreadorDeFiltro}, 
 * permite sobreescribir cada uno de los m&eacute;todos que posee para aplicar filtro, y de esta manera personalizar la aplicaci&oacute;n del
 * filtro.
 *
 * creadorDeOrdenamiento: Atributo que almacena un objeto que contiene la informaci&oacute;n del ordenamiento aplicado.<br/>
 *
 * Al crear la instancia de la clase <code>CreadorDeOrdenamientoSobreDtoMeta</code>, que implementa un objeto del tipo {@link CreadorDeOrdenamiento}, 
 * permite sobreescribir cada uno de los m&eacute;todos que posee para aplicar ordenamiento, y de esta manera personalizar la aplicaci&oacute;n del
 * ordenamiento.
 *
 * negocioOperaciones: Atributo que almacena un objeto que contiene la informaci&oacute;n de la operaciones b&aacute;sicas para esta clase Negocio.<br/>
 *
 * Al crear la instancia de la clase <code>NegocioOperacionesBase</code>, que implementa un objeto del tipo {@link NegocioOperaciones}, 
 * permite sobreescribir cada uno de los m&eacute;todos que posee para aplicar operaciones de llenado de informaci&oacute;n. Entre las operaciones
 * b&aacute;sicas se encuentra el manejo de las colecciones de objetos detalle, objetos maestros y las reglas de negocio para cada propiedad.
 *
 * @author Systems Out of the Box
 * @version f3.1
 */

  public class ProductsNegocio extends NegocioDesacoplado {
	protected Log log = LogServiceLocator.getDefaultImplementation().getLog(ProductsNegocio.class);
	
	public static final DtoMeta DTO_META = new DtoMeta(DemoResolusor.getSingleton().getContenedorDeDtoMeta(), "products",  Products.class, 	
			new DtoPropiedadMeta[]{
        new DtoPropiedadMeta(ProductsDao.PRODID,"prodId",DtoPropiedadMeta.DATO_LLAVE , 10) 
     ,  new DtoPropiedadMeta(ProductsDao.CATEGORY,"category",DtoPropiedadMeta.NO_NULL , 10) 
     ,  new DtoPropiedadMeta(ProductsDao.TITLE,"title",DtoPropiedadMeta.NO_NULL , 50) 
     ,  new DtoPropiedadMeta(ProductsDao.ACTOR,"actor",DtoPropiedadMeta.NO_NULL , 50) 
     ,  new DtoPropiedadMeta(ProductsDao.PRICE,"price",DtoPropiedadMeta.NO_NULL , 12) 
     ,  new DtoPropiedadMeta(ProductsDao.SPECIAL,"special",DtoPropiedadMeta.NULL , 5) 
     ,  new DtoPropiedadMeta(ProductsDao.COMMONPRODID,"commonProdId",DtoPropiedadMeta.NO_NULL , 10) 
	       },
            DtoMeta.OPERACIONES_BUSQUEDAS_CAMPOS_PRIOPIOS
    );
	
	
	
	public Log getLogNegocio(){
		return log;
	}
    
    
    
    
    
    
	public static final CreadorDeEnlaceDetalle[] CREADORES_DETALLE = new CreadorDeEnlaceDetalle[]{
     };
     
     
     
	public static final CreadorDeEnlaceBusqueda[] CREADORES_BUSQUEDA = new CreadorDeEnlaceBusqueda[]{
     };
     
	    
    /**
     * Atributo que almacena el objeto que permite acceder a la capa DAO para este negocio.
     * @see {@link Dao}
     */
    private  ProductsDao productsDao;
    /**
     * Devuelve el atributo que permite acceder a la capa DAO.
     * @return <code>Objeto</code> - objeto de tipo Dao.
     */
	public ProductsDao getProductsDao() {
		if(productsDao == null){
			productsDao = (ProductsDao)getDao();
		}
		return productsDao;
	}    

	private ValidadorDeDatos validadorDeDatos = new ValidadorDeDatosSobreDtoMeta(DTO_META);
	
	private CreadorDeFiltro creadorDeFiltro = new CreadorDeFiltroSobreDtoMeta(DTO_META);
	
	private CreadorDeOrdenamiento creadorDeOrdenamiento = new CreadorDeOrdenamientoSobreDtoMeta(DTO_META);
	
	private NegocioOperaciones negocioOperaciones = new NegocioOperacionesBase(CREADORES_DETALLE, CREADORES_BUSQUEDA, DTO_META, DemoResolusor.getSingleton());
	
	/**
	 * Devuelve un objeto de tipo {@link NegocioOperaciones}
	 * @return <code>NegocioOperaciones</code>
	 */
	public NegocioOperaciones getNegocioOperaciones() {
		return negocioOperaciones;
	}	
	/**
	 * Devuelve un objeto de tipo {@link #ValidadorDeDatos}
	 * @return <code>ValidadorDeDatos</code>
	 */
	public ValidadorDeDatos getValidadorDeDatos() {
		return validadorDeDatos;
	}
	/**
	 * Devuelve un objeto de tipo {@link #CreadorDeFiltro}
	 * @return <code>CreadorDeFiltro</code>
	 */
	public CreadorDeFiltro getCreadorDeFiltro(){
	    return creadorDeFiltro;
	}
	/**
	 * Devuelve un objeto de tipo {@link #CreadorDeOrdenamiento}
	 * @return <code>CreadorDeOrdenamiento</code>
	 */
	public CreadorDeOrdenamiento getCreadorDeOrdenamiento(){
		return creadorDeOrdenamiento;
	}
	/**
	 * Devuelve un objeto Resolusor.
	 * @return <code>LocalizadorDeServiciosAplicacion</code>
	 */
	public LocalizadorDeServiciosAplicacion getLocalizadorDeServiciosAplicacion(){
		return DemoResolusor.getSingleton();
	}




}