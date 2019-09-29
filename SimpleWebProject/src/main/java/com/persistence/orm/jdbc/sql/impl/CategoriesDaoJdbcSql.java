package com.persistence.orm.jdbc.sql.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.Connection;
import java.util.Collection;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.Dao;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.ExcepcionEnDAO;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.ExcepcionPorDatoNoEncontrado;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.PeticionDeDatos;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.Transaccion;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dao.foraneos.DataConValoresForaneos;
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.SQLColumnaMeta;
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.SQLEntidadMeta;
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.SQLImplementacionBasica;
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.SQLImplementacionOperacionesComunes;
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.SQLLenguaje;
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.SQLOperaciones;
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.SQLUtils;
import com.persistence.f3.app.distribuibles.implementaciones.dao.jdbcsql.TransaccionJdbc;
import com.persistence.abstraccion.dao.CategoriesDao;

import compersistence.abstraccion.dto.Categories;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.LocalizadorDeServicio;

import java.lang.Long;




/**
 * Clase que hereda comportamientos de {@link SQLImplementacionBasica} e implementa el comportamiento definido en la capa DAO.<br/>
 * Esta clase es una implementaci&oacute;n intermedia para el DAO de <b>Categories</b>
 * asociado a la tabla <b>categories</b>, en esta clase se construyen todos los sql para las operaciones de listado,
 * creaci&oacute;n, consulta, actualizaci&oacute;n y elminaci&oacute;n.<br/>
 * @author Systems Out of the Box
 * @version f3.1
 *
 */
public class CategoriesDaoJdbcSql extends SQLImplementacionBasica implements CategoriesDao{

	/**
	 * Atributo del tipo {@link SQLEntidadMeta}, que almacena la descripci&oacute;n del negocio como una entidad.<br/>
	 * Entre sus caracter&iacute;sticas tiene el nombre de la tabla, nombre de la secuencia, posici&oacute;n de las columnas,
	 * nombre de las columnas y tipos de datos para la columna.<br/>
	 * El arreglo que recibe son objetos de tipo {@link SQLColumnaMeta}, y definen informaci&oacute;n para obtener las columnas.
	 */
	public static final SQLEntidadMeta SQL_ENTIDAD_META = new SQLEntidadMeta("categories", new SQLColumnaMeta[]{
        new SQLColumnaMeta(0, "categories", "E0", 1, "category", "C1", Types.BIGINT ,true)
     ,  new SQLColumnaMeta(0, "categories", "E0", 2, "categoryname", "C2", Types.VARCHAR )
	});
	
	


	/**
	 * Atributo que almacena el <code>String</code> para obtener el listado de registros del negocio.
	 */
	public static final String SELECT_HEADER_SQL =  
		"SELECT E0.category AS C1 , E0.categoryname AS C2" +
		"  FROM categories E0";
	/**
	 * Atributo que almacena el <code>String</code> para obtener el n&uacute;mero de registros presentes en el negocio.
	 */
	public static final String COUNT_HEADER_SQL =   "SELECT COUNT(*) FROM categories";    												
	/**
	 * Atributo que almacena el <code>String</code> para la inserci&oacute;n, sin id, de un nuevo registro en la tabla.
	 */
	public static final String CREATE_SQL = 
		"INSERT INTO categories (" +
		"categoryname" +
		") VALUES (?)";
	/**
	 * Atributo que almacena el <code>String</code> para insertar, con id, un registro en la table.
	 */
	public static final String CREATE_SQL_CON_ID = 
		"INSERT INTO categories (" +
		"category,categoryname" +
		") VALUES (?,?)";
	/**
	 * Atributo que almacena el <code>String</code> para la atualizaci&oacute; de un registro en la tabla.
	 */
	public static final String UPDATE_SQL = 
		"UPDATE categories" +
		" SET categoryname= ? " +
		" WHERE category= ? ";
	/**
	 * Atributo que almacena el <code>String</code> para la eliminaci&oacute; de un registro en la tabla.
	 */
	public static final String DELETE_SQL =  
		"DELETE FROM categories" +
		" WHERE category= ? ";
	/**
	 * Atributo que almacena el <code>String</code> para la b&uacute;squeda por id de un registro de la tabla.
	 */
	public static final String FIND_BY_ID_SQL = 
		"SELECT E0.category AS C1 , E0.categoryname AS C2" +
		"  FROM categories E0" +
		" WHERE E0.category= ? ";
	/**
	 * Atributo que almacena el <code>String</code> para la creacion de la tabla en la base de datos.
	 */
	public static final String CREATE_TABLE_DDL = 
		"CREATE TABLE categories (" +
		"    category LONG NOT NULL," +
		"    categoryname VARCHAR(50)  NOT NULL" +
		")";
	/**
	 * Atributo que almacena un objeto del tipo {@link SQLLenguaje}.
	 */
	private static SQLLenguaje lenguaje;
	
	/**
	 * M&eacute;todo que realiza la creaci&oacute;n de un DTO, del negocio, a partir del resultado de alguna consulta.
	 * @param <code>rst</code> objeto de tipo <code>Resultset</code>, que contiene los resultados de la consulta.
	 * @return <code>Object</code> - representa al DTO creado.
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static Object crearDtoST(ResultSet rst)
			throws SQLException, ExcepcionEnDAO {
 	    Categories theDto = new Categories();
     	theDto.setCategory(SQLUtils.getLongFromResultSet(rst, "C1"));
		theDto.setCategoryname(rst.getString("C2"));
		return theDto;
	}
	
	







	/**
	 * M&eacute;todo que coloca los valores provenientes del objeto Dto en el objeto PreparedStatement,
	 * el cual proviene de la llamada a la implementacion de {@link SQLOperaciones}, este m&eacute;todo
	 * no toma en cuenta el valor del <code>id</code>, puesto que se asume que es un valor secuencial
	 * autonumerico o serial propio de la base de datos.
	 * 
	 * @param <code>theDtoUntyped</code> objeto sin tipo que almacena al DTO del negocio.
	 * @param <code>smt</code> objeto de tipo <code>PreparedStatement</code>
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static void operacionesParaCrearST(Object theDtoUntyped, PreparedStatement smt)
			    throws SQLException, ExcepcionEnDAO {			
	        Categories theDto = (Categories)theDtoUntyped;
				String categoryname = theDto.getCategoryname();     
		     
		SQLUtils.setIntoStatement( 1, categoryname, smt);  
    		
	}

	/**
	 * M&eacute;todo que coloca los valores provenientes del objeto Dto en el objeto PreparedStatement,
	 * el cual proviene de la llamada a la implementacion de {@link SQLOperaciones}, este m&eacute;todo
	 * toma en cuenta el <code>id</code>, lo que quiere decir que se usa al momento de  crear registros
	 * en donde el identificador no es un valor secuencial autonumerico o serial propio de la base de datos
	 *
	 * @param <code>theDtoUntyped</code> objeto sin tipo que almacena al DTO del negocio.
	 * @param <code>smt</code> objeto de tipo <code>PreparedStatement</code>
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static void operacionesParaCrearConIdST(Object theDtoUntyped, PreparedStatement smt)
			    throws SQLException, ExcepcionEnDAO {			
	        Categories theDto = (Categories)theDtoUntyped;
				Long category = theDto.getCategory();     
		String categoryname = theDto.getCategoryname();     
	
		SQLUtils.setIntoStatement( 1, category, smt);
    	
		SQLUtils.setIntoStatement( 2, categoryname, smt);
    		
	}

	/**
	 * M&eacute;todo que coloca el identificador recibido en el objeto PreparedStatement, para poder ser eliminado.
	 * @param <code>theIdUntyped</code> objeto sin tipo que identifica al <code>id</code>.
	 * @param <code>smt</code> objeto de tipo <code>PreparedStatement</code>
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static void operacionesParaEliminarST(Object theIdUntyped, PreparedStatement smt)
			    throws SQLException, ExcepcionEnDAO {
			Long theId = (Long)theIdUntyped;
		SQLUtils.setIntoStatement( 1, theId, smt);
	}

	/**
	 * M&eacute;todo que coloca el identificador recibido, en el objeto PreparedStatement para poder hacer la consulta de busqueda.
	 * @param <code>theIdUntyped</code> objeto sin tipo que identifica al <code>id</code>.
	 * @param <code>smt</code> objeto de tipo <code>PreparedStatement</code>
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static void operacionesParaBuscarPorIdST(Object theIdUntyped, PreparedStatement smt)
			    throws SQLException, ExcepcionEnDAO {
			Long theId = (Long)theIdUntyped;
			SQLUtils.setIntoStatement( 1, theId, smt);
		}

	/**
	 * M&eacute;todo que coloca los valores provenientes del objeto Dto en el objeto PreparedStatement,
	 * el cual proviene de la llamada a la implementacion de {@link SQLOperaciones} para poder actualizar
     * un registro en espec&iacute;fico.
	 * 
	 * @param <code>theDtoUntyped</code> objeto sin tipo que almacena al DTO del negocio.
	 * @param <code>smt</code> objeto de tipo <code>PreparedStatement</code>
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static void operacionesParaActualizarST(Object theDtoUntyped, PreparedStatement smt)
			    throws SQLException, ExcepcionEnDAO {
			Categories theDto = (Categories)theDtoUntyped;
				Long category = theDto.getCategory();     
		String categoryname = theDto.getCategoryname();     
		     
		SQLUtils.setIntoStatement( 1, categoryname, smt);  
        		     
		SQLUtils.setIntoStatement( 2, category, smt);  
    			
	}


	/**
	 * M&eacute;todo que ejecuta una petici&oacute;n de datos a trav&eacute;s de un objeto {@link PreparedStatement},
	 * y un objeto del tipo {@link PeticionDeDatos}, el cual en su implementaci&oacute;n define una serie de restricciones
	 * usadas para hacer la petici&oacute;n.
	 *
	 * @param <code>peticion</code> objeto de tipo <code>PeticionDeDatos</code>.
	 * @param <code>smt</code> objeto de tipo <code>PreparedStatement</code>.
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static void operacionesParaPeticionDeDatosST(PeticionDeDatos peticion,
			PreparedStatement smt) throws SQLException, ExcepcionEnDAO {
		SQLImplementacionOperacionesComunes.operacionesParaPeticionDeDatosST( peticion, smt, SQL_OPERACIONES, null);	
	}	
	
	/**
	 * M&eacute;todo que ejecuta una petici&oacute;n de datos a trav&eacute;s de un objeto {@link PreparedStatement},
     * y un objeto del tipo {@link PeticionDeDatos}, el cual en su implementaci&oacute;n define una serie de restricciones
     * usadas para hacer la petici&oacute;n.
	 *
	 * @param <code>peticion</code> objeto de tipo <code>PeticionDeDatos</code>.
	 * @param <code>smt</code> objeto de tipo <code>PreparedStatement</code>.
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static void operacionesParaPeticionDeDatosFST(PeticionDeDatos peticion,
			PreparedStatement smt) throws SQLException, ExcepcionEnDAO {
		SQLImplementacionOperacionesComunes.operacionesParaPeticionDeDatosST( peticion, smt, SQL_OPERACIONES, null);	
	}	

	/**
	 * M&eacute;todo que ejecuta una petici&oacute;n de conteo a trav&eacute;s de un objeto {@link PreparedStatement},
     * y un objeto del tipo {@link PeticionDeDatos}, el cual en su implementaci&oacute;n define una serie de restricciones
     * usadas para hacer la petici&oacute;n.
	 *
	 * @param <code>peticion</code> objeto de tipo <code>PeticionDeDatos</code>.
	 * @param <code>smt</code> objeto de tipo <code>PreparedStatement</code>.
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static void operacionesParaConteoST(PeticionDeDatos peticion,
			PreparedStatement smt) throws SQLException, ExcepcionEnDAO {
		SQLImplementacionOperacionesComunes.operacionesParaPeticionDeDatosST( peticion, smt, SQL_OPERACIONES, null);
	}

	/**
	 * M&eacute;todo que agrega al atributo {@link #SELECT_HEADER_SQL} las condiciones de b&uacute;squeda
     * que vienen en el objeto del tipo {@link PeticionDeDatos}
     *
	 * @param <code>peticion</code> objeto de tipo <code>PeticionDeDatos</code>, que contiene las condiciones de la consulta.
	 * @return <code>String</code> - la consulta condicionada como cadena de caracteres.
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static String getSqlParaPeticionDeDatosST(PeticionDeDatos peticion)
			throws SQLException, ExcepcionEnDAO {
		return SELECT_HEADER_SQL + SQLImplementacionOperacionesComunes.crearCondicionesSQLST( peticion, SQL_OPERACIONES, SQLImplementacionOperacionesComunes.COND_ALIAS_ORDEN_WHERE);
	}
	
	
	
	

	/**
	 * M&eacute;todo que agrega al atributo {@link #COUNT_HEADER_SQL} las condiciones de conteo
	 * que vienen en el objeto de tipo {@link PeticionDeDatos}.
	 *
	 * @param <code>peticion</code> objeto de tipo <code>PeticionDeDatos</code>, que contiene las condiciones de la consulta.
	 * @return <code>String</code> - la consulta condicionada como cadena de caracteres.
	 * @throws SQLException
	 * @throws ExcepcionEnDAO
	 */
	public static String getSqlDeConteoST(PeticionDeDatos peticion)
			throws SQLException, ExcepcionEnDAO {
		return COUNT_HEADER_SQL + SQLImplementacionOperacionesComunes.crearCondicionesSQLST( peticion, SQL_OPERACIONES, SQLImplementacionOperacionesComunes.COND_SQL_WHERE);
	}
	
	/**
	 * M&eacute;todo que se utiliza para actualizar un registro a nivel de tabla, recibe como par&aacute;metro un DTO del negocio
	 * que contiene la informaci&oacute;n a actualizar, e invoca la funci&oacute;n <code>actualizar</code> de la clase de la que hereda.
	 *
	 * @param <code>categories</code> objeto del tipo <code>Categories</code>.
	 * @throws ExcepcionEnDAO
	 * @see {@link SQLImplementacionBasica}
	 */
	public void actualizar(Categories categories) throws ExcepcionEnDAO {
	    actualizar(categories, AUTO_COMMIT);
	
	}
	
	/**
	 * M&eacute;todo utilizado para realizar una b&uacute;squeda de un registro espec&iacute;fico, utilizando un identificador.
	 *
	 * @param <code>categoryId</code> objeto del tipo <code>Long</code>.
	 * @return <code>Categories</code> - un objeto DTO.
	 * @throws ExcepcionEnDAO
	 * @see {@link SQLImplementacionBasica}
	 */
	public Categories buscarPorID(Long categoryId)
			throws ExcepcionEnDAO {
		return (Categories)buscarPorID(categoryId, AUTO_COMMIT);				 
	}

	/**
	 * M&eacute;todo utilizado para la creaci&oacute;n de un registro, a nivel de tabla, a partir de la informaci&oacute;n
	 * recibida en un DTO del objeto de Negocio, e invoca la funci&oacute;n <code>crear</code> de la clase de la que hereda.
	 * 
	 * @param <code>categories</code> objeto del tipo <code>Categories</code>.
	 * @throws ExcepcionEnDAO
	 * @see {@link SQLImplementacionBasica}
	 */
	public void crear(Categories categories) throws ExcepcionEnDAO {
	    crear(categories, AUTO_COMMIT);		
	}

	/**
	 * M&eacute;todo utilizado para la eliminaci&oacute;n de un registro, a nivel de tabla,
	 * que se busca a trav&eacute;s del identificador recibido. Se invoca la funci&oacute;n <code>eliminar</code> de la clase de la que hereda.
	 *
	 * @param <code>categoryId</code> objeto del tipo <code>Long</code>.
	 * @throws ExcepcionEnDAO
	 * @see {@link SQLImplementacionBasica}
	 */
	public void eliminar(Long categoryId) throws ExcepcionEnDAO {
	    eliminar(categoryId, AUTO_COMMIT);		
	}

	/**
	 * M&eacute;todo utilizado para devolver un &uacute;nico resultado de la petici&oacute;n recibida,
	 * la cual se realiza a trav&eacuate;s del objeto de tipo {@link PeticionDeDatos}.
	 * 
	 * @param <code>peticion</code> objeto de tipo <code>PeticionDeDatos</code>, que contiene las condiciones de la consulta.
	 * @return <code>Categories</code> - un objeto DTO.
	 * @throws ExcepcionEnDAO
	 * @throws ExcepcionPorDatoNoEncontrado
	 * @see {@link SQLImplementacionBasica}
	 */
	public Categories resultadoUnico(PeticionDeDatos peticion)
			throws ExcepcionEnDAO, ExcepcionPorDatoNoEncontrado {
		return (Categories)resultadoUnico(peticion, AUTO_COMMIT);
	}
	
	/**
	 * Atributo del tipo {@link SQLOperaciones}, almacena la operaciones disponibles para esta implementaci&oacute;n.<br/>
	 * Algunas de las llamadas a los m&eacute;todos se realiza a trav&eacute;s de la invocaci&oacute;n de estas implementaciones.
	 */
    public static final SQLOperaciones	SQL_OPERACIONES =  new SQLOperaciones() {
			
			public int getManejoForaneosPorDefecto() {
				return Dao.SIN_FORANEOS;
			}
			
			
			public void operacionesParaPeticionDeDatosF(PeticionDeDatos request,
					PreparedStatement smt) throws SQLException, ExcepcionEnDAO {
				CategoriesDaoJdbcSql.operacionesParaPeticionDeDatosFST(request, smt);
			}
			
			public void operacionesParaPeticionDeDatos(PeticionDeDatos request,
					PreparedStatement smt) throws SQLException, ExcepcionEnDAO {
				CategoriesDaoJdbcSql.operacionesParaPeticionDeDatosST(request, smt);
			}
			
			public void operacionesParaEliminar(Object theId, PreparedStatement smt)
					throws SQLException, ExcepcionEnDAO {
				CategoriesDaoJdbcSql.operacionesParaEliminarST(theId, smt);
			}
			
			public void operacionesParaCrear(Object theDto, PreparedStatement smt)
					throws SQLException, ExcepcionEnDAO {
				CategoriesDaoJdbcSql.operacionesParaCrearST(theDto, smt);
			}
			
			public void operacionesParaCrearConId(Object theDto, PreparedStatement smt) 
			        throws SQLException, ExcepcionEnDAO {
			    CategoriesDaoJdbcSql.operacionesParaCrearConIdST(theDto, smt);
            }
			
			public void operacionesParaConteo(PeticionDeDatos request,
					PreparedStatement smt) throws SQLException, ExcepcionEnDAO {
				CategoriesDaoJdbcSql.operacionesParaConteoST(request, smt);				
			}
			
			public void operacionesParaBuscarPorId(Object theId, PreparedStatement smt)
					throws SQLException, ExcepcionEnDAO {
				CategoriesDaoJdbcSql.operacionesParaBuscarPorIdST(theId, smt);
			}
			
			public void operacionesParaActualizar(Object theDto, PreparedStatement smt)
					throws SQLException, ExcepcionEnDAO {
				CategoriesDaoJdbcSql.operacionesParaActualizarST(theDto, smt);
				
			}
			
			public String getSqlParaPeticionDeDatosF(PeticionDeDatos request)
					throws SQLException, ExcepcionEnDAO {	
				return null;
			}
			
			public String getSqlParaPeticionDeDatos(PeticionDeDatos request)
					throws SQLException, ExcepcionEnDAO {
				return CategoriesDaoJdbcSql.getSqlParaPeticionDeDatosST(request);
			}
			
			public String getSqlDeConteo(PeticionDeDatos request) throws SQLException,
					ExcepcionEnDAO {
				return CategoriesDaoJdbcSql.getSqlDeConteoST(request);
			}
			
			public SQLEntidadMeta getSQLEntidadMeta() throws ExcepcionEnDAO {
				return CategoriesDaoJdbcSql.SQL_ENTIDAD_META;
			}
			
			public String getEliminarSql() {
				return  CategoriesDaoJdbcSql.DELETE_SQL;
			}
			
			public String getCrearSql() {
				return  CategoriesDaoJdbcSql.CREATE_SQL;
			}
			
			public String getCrearSqlConId(){
			    return  CategoriesDaoJdbcSql.CREATE_SQL_CON_ID;
			}			
			
			public String getBuscarPorIdSqlF() {
				return null;
			}
			
			public String getBuscarPorIdSql() {				
				return CategoriesDaoJdbcSql.FIND_BY_ID_SQL;
			}
			
			public String getActualizarSql() {				
				return CategoriesDaoJdbcSql.UPDATE_SQL;
			}
			
			public Object crearDto(ResultSet rst) throws SQLException, ExcepcionEnDAO {
				return CategoriesDaoJdbcSql.crearDtoST(rst);
			}
	        
	        public Object crearDataConValoresForaneos(ResultSet rst)
					throws SQLException, ExcepcionEnDAO {
				return null;
			}
			
	        public Object crearDataConValoresForaneosNoRel(ResultSet rst, Connection conn)
					throws SQLException, ExcepcionEnDAO {
				return null;
			}
			
			
            public boolean isForaneosDisponible(){
				return false;
            
            }
            
            public SQLLenguaje getSQLLenguaje() {
                return CategoriesDaoJdbcSql.getLenguaje();
            }
            
            public void setIdEnDto(Object theDto, Object dtoId) {
                setIdEnDtoST(theDto, dtoId);
            }
	};
	
	
	
	
	
	/**
	 * Devuelve el atributo {@link #SQL_OPERACIONES}.
	 * @return <code>SQLOperaciones</code> - objeto del tipo {@link SQLOperaciones}
	 */
    public SQLOperaciones getSqlOperaciones() {
       return SQL_OPERACIONES;
	}
	
	/**
	 * Devuelve el atributo {@link #lenguaje}
	 * @return <code>SQLLenguaje</code> - objeto del tipo {@link SQLLenguaje}
	 */	
	public static SQLLenguaje getLenguaje() {
		return lenguaje;
	}
	
	/**
	 * M&eacute;todo que permite obtener a trav&eacute;s de un Servicio la implementaci&oacute;n del objeto de Lenguaje,
	 * y coloca las reglas de negocio almacenadas en el atributo {@link #SQL_ENTIDAD_META}.
	 * @param <code>localizadorLenguaje</code> objeto del tipo {@link LocalizadorDeServicio} que posee informaci&oacute;n para trabajar con la base de datos.
	 */
	public static void setLocalizadorLenguaje(LocalizadorDeServicio localizadorLenguaje) {
		lenguaje = (SQLLenguaje) localizadorLenguaje.getServicio();
		lenguaje.setSqlEntidadMeta(SQL_ENTIDAD_META);
	}

	/**
	 * M&eacute;todo que agrega un identificador a un DTO del tipo <code>Categories</code>.
	 * @param <code>theDtoUntyped</code> objeto gen&eacute;rico, que representa a un <code>DTO</code>.
	 * @param <code>dtoIdUntyped</code> objeto gen&eacute;rico, que representa al identificador.
	 */
	public static void setIdEnDtoST(Object theDtoUntyped, Object dtoIdUntyped){
	    Categories dto = (Categories)theDtoUntyped;
        Long dtoId = (Long) dtoIdUntyped;;
        dto.setCategory(dtoId);

	}	
	
	
}
