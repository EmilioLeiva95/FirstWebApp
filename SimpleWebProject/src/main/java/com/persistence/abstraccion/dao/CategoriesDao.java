package com.persistence.abstraccion.dao;

import java.lang.Long;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.ExcepcionEnDAO;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.ExcepcionPorDatoNoEncontrado;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.Paginador;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.PeticionDeDatos;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.Dao;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.Transaccion;

import compersistence.abstraccion.dto.Categories;

/**
 * Interfaz que define el comportamiento para un objeto de negocio espec&iacute;fico, para que pueda interactuar con la capa DAO,
 * extiende de la interfaz {@link com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.Dao Dao}.
 * @author persistence
 * @version f3.1
 *  
 */
public interface CategoriesDao extends Dao{

    /**
     * Atributo que almacena el identificador de la columna category mapeado
	 * al atributo Category.
     */
    int CATEGORY = 1;
    /**
     * Atributo que almacena el identificador de la columna categoryname mapeado
	 * al atributo Categoryname.
     */
    int CATEGORYNAME = 2;

    /**
     * M&eacute;todo  que devuelve un DTO, formado con un objeto devuelto por la capa DAO,
	 * obtenido a trav&eacute;s de la b&uacute;squeda por id.<br/>
     * El DTO devuelto representa un registro a nivel de base de datos.
     * @param <code>id</code> Objeto que identifica la llave del DTO.
     * @return <code>Objeto</code>
     * @throws ExcepcionEnDA
     */
	Categories buscarPorID(Long categoryId) throws ExcepcionEnDAO;
    /**
     * M&eacute;todo que debe eliminar un objeto a trav&eacute;s de un id.<br/>
     * Elimina un registro a nivel de la base de datos.
     * @param <code>id</code> Objeto que identifica la llave del DTO. 
     * @throws ExcepcionEnDAO
     */
	void eliminar(Long categoryId) throws ExcepcionEnDAO;	
    /**
     * M&eacute;todo que debe actualizar un objeto.
     * Actualiza un registro a nivel de la base de datos.
     * @param <code>Objeto</code> DTO
     * @throws ExcepcionEnDAO
     */	
	void actualizar(Categories categories) throws ExcepcionEnDAO;
	/**
	 * M&eacute;todo que debe crear un objeto para el negocio. 
     * Crea un nuevo registro a nivel de base de datos.
	 * @param <code>Objeto</code> DTO.
	 * @throws ExcepcionEnDAO
	 */	
	void crear(Categories categories) throws ExcepcionEnDAO;
    /**
     * M&eacute;todo que devuelve un DTO, solicitado a trav&eacute;s de un objeto de tipo {@link PeticionDeDatos}.
     * @param peticion objeto de tipo <code>PeticionDeDatos</code>
     * @return <code>Objeto</code> DTO.
     * @throws ExcepcionEnDAO
     * @throws ExcepcionPorDatoNoEncontrado
     */
	Categories resultadoUnico(PeticionDeDatos peticion) throws ExcepcionEnDAO, ExcepcionPorDatoNoEncontrado;
	
    	 
}