package com.persistence.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.negocio.ExcepcionEnNegocio;



public class FileUpdaterSQL {

	public static final String AUSENCIA = "A";
	public static final String ENCVIAJE = "V";
	public static final String ENCEQUIPO = "E";
	public static final String FALTA_HORARIO = "F";
	public static final String USUARIO = "U";
	public static final String ACCION_PERSONAL01 = "A1";
	public static final String ACCION_PERSONAL02 = "A2";
	public static final String EMPLEADO_CONTRATO = "C";
	public static final String EMPLEADO_FIRMA = "F";
	public static final String EMPLEADO_FOTO = "T";
	public static final String EMPLEADO_PUESTO = "P";
	
	public static void fileUpdate(File docFile,String nombreArchivo,String tipoDocumento, Long tamDocumento, Long iddoc,Connection conn,String tipoRegistro) throws ExcepcionEnNegocio{
		QueryRunner runner = new QueryRunner();

		try {
			InputStream documento = new FileInputStream(docFile);
			
			if(tipoRegistro.equals(AUSENCIA)){
				runner.update(conn, UPDATE_SQL_AUSENCIA,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(ENCVIAJE)){
				runner.update(conn, UPDATE_SQL_VIAJE,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(ENCEQUIPO)){
				runner.update(conn, UPDATE_SQL_EQUIPO,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(FALTA_HORARIO)){
				runner.update(conn, UPDATE_SQL_FALTA_HORARIO,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(USUARIO)){
				runner.update(conn, UPDATE_SQL_USUARIO,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(ACCION_PERSONAL01)){
				runner.update(conn, UPDATE_SQL_ACCION_PERSONAL01,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(ACCION_PERSONAL02)){
				runner.update(conn, UPDATE_SQL_ACCION_PERSONAL02,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(EMPLEADO_CONTRATO)){
				runner.update(conn, UPDATE_SQL_EMPLEADO_CONTRATO,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(EMPLEADO_FIRMA)){
				runner.update(conn, UPDATE_SQL_EMPLEADO_FIRMA,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(EMPLEADO_FOTO)){
				runner.update(conn, UPDATE_SQL_EMPLEADO_FOTO,documento,tipoDocumento,tamDocumento, iddoc);
			}
			if(tipoRegistro.equals(EMPLEADO_PUESTO)){
				runner.update(conn, UPDATE_SQL_EMPLEADO_PUESTO,documento,tipoDocumento,tamDocumento, iddoc);
			}
			
			conn.close();
		} catch (SQLException e) {
			ExcepcionEnNegocio eed = new ExcepcionEnNegocio();
			e.printStackTrace();
			eed.setStackTrace(e.getStackTrace());
			throw eed;
		} catch (FileNotFoundException e) {
			ExcepcionEnNegocio eed = new ExcepcionEnNegocio("No es posible recuperar archivo temporal. ");
			e.printStackTrace();
			eed.setStackTrace(e.getStackTrace());
			throw eed;
		}
	}
	
	
	
	
	public static void actualizarAnexoPartida(Connection conn,Long idAnexoPartidaNuevo, long idAnexoPartidaViejo, String userName) throws ExcepcionEnNegocio{
			QueryRunner runner = new QueryRunner();
		
		try {
			runner.update(conn,SQL_INSERT_DET_DISP_BANCO_POSPGO,idAnexoPartidaNuevo,new Date(),userName,new Date(),userName,new Date(),idAnexoPartidaViejo);
			runner.update(conn,SQL_INSERT_MOV_BANCO_PAR_GASTO,idAnexoPartidaNuevo,new Date(),userName,new Date(),userName,new Date(),idAnexoPartidaViejo);
			runner.update(conn,SQL_INSERT_DET_CXC_PO,idAnexoPartidaNuevo,new Date(),userName,new Date(),userName,new Date(),idAnexoPartidaViejo);
			runner.update(conn,SQL_INSERT_DET_DISP_BANCO,idAnexoPartidaNuevo,new Date(),userName,new Date(),userName,new Date(),idAnexoPartidaViejo);
			runner.update(conn,SQL_INSERT_DET_CXC,idAnexoPartidaNuevo,new Date(),userName,new Date(),userName,new Date(),idAnexoPartidaViejo);
			
			conn.close();
		} catch (SQLException e) {
			ExcepcionEnNegocio eed = new ExcepcionEnNegocio();
			e.printStackTrace();
			eed.setStackTrace(e.getStackTrace());
			throw eed;
		}
	}
	
	public static final String UPDATE_SQL_AUSENCIA = "UPDATE AUSENCIA SET  DOCUMENTO=?, "
			+ "CONTENTTYPE=?,TAMANIO=?  WHERE ID_AUSENCIA=?";
	
	public static final String UPDATE_SQL_VIAJE = "UPDATE ENC_VIAJE SET  DOCUMENTO=?, "
			+ "CONTENTTYPE=?,TAMANIO=?  WHERE ID_ENC_VIAJE=?";
	
	public static final String UPDATE_SQL_EQUIPO = "UPDATE ENC_COMPRA_EQUIPO SET  DOCUMENTO=?, "
			+ "CONTENTTYPE=?,TAMANIO=?  WHERE ID_ENC_COMPRA_EQUIPO=?";
	
	public static final String UPDATE_SQL_FALTA_HORARIO = "UPDATE ACCION_HORARIO SET  DOCUMENTO=?, "
			+ "CONTENTTYPE=?,TAMANIO=?  WHERE ID_ACCION_HORARIO=?";
	
	public static final String UPDATE_SQL_USUARIO = "UPDATE USUARIO SET FIRMA=?, "
			+ "CONTENTTYPE=?,TAMANIO=?  WHERE ID_USUARIO=?";
	
	public static final String UPDATE_SQL_ACCION_PERSONAL01 = " UPDATE ACCION_PERSONAL SET 01_BYTEDOC = ?, 01_CONTENTTYPE = ?, "
			+ " 01_TAMANIO = ?  WHERE ID_ACCION_PERSONAL = ?";
	
	public static final String UPDATE_SQL_ACCION_PERSONAL02 = " UPDATE ACCION_PERSONAL SET 02_BYTEDOC = ?, 02_CONTENTTYPE = ?, "
			+ " 02_TAMANIO = ?  WHERE ID_ACCION_PERSONAL = ?";
	
	public static final String UPDATE_SQL_EMPLEADO_CONTRATO = " UPDATE EMPLEADO SET CONT_BYTEDOC = ?, CONT_CONTENTTYPE =?,"
			+ "	CONT_TAMANIO = ? WHERE ID_EMPLEADO = ?";
	
	public static final String UPDATE_SQL_EMPLEADO_FIRMA = " UPDATE EMPLEADO SET FIRMA_BYTEDOC = ?, FIRMA_CONTENTTYPE =?,"
			+ "	FIRMA_TAMANIO = ? WHERE ID_EMPLEADO = ?";
	
	public static final String UPDATE_SQL_EMPLEADO_FOTO = " UPDATE EMPLEADO SET FOTO_BYTEDOC = ?, FOTO_CONTENTTYPE =?,"
			+ "	FOTO_TAMANIO = ? WHERE ID_EMPLEADO = ?";
	
	public static final String UPDATE_SQL_EMPLEADO_PUESTO = " UPDATE EMPLEADO SET DESCR_BYTEDOC = ?, DESCR_CONTENTTYPE =?,"
			+ "	DESCR_TAMANIO = ? WHERE ID_EMPLEADO = ?";
	
	public static final String 	SQL_INSERT_DET_DISP_BANCO_POSPGO= "INSERT INTO DET_DISP_BANCO_POSPGO (ID_ENC_CXC,ORDEN,DESCRIPCION,MONTO,ESTADO,FECHA_ESTADO,USUARIO_ING,FECHA_ING,USUARIO_ULT_ACT,FECHA_ULT_ACT)"
	+" SELECT ?,ORDEN,DESCRIPCION,MONTO,ESTADO,?,?,?,?,? FROM DET_DISP_BANCO_POSPGO WHERE ID_ENC_CXC = ?";
	
	public static final String SQL_INSERT_MOV_BANCO_PAR_GASTO="INSERT INTO MOV_BANCO_PAR_GASTO (ID_ENC_CXC,ORDEN,CONCEPTO,MONTO,ESTADO,FECHA_ESTADO,USUARIO_ING,FECHA_ING,"
	+" USUARIO_ULT_ACT,FECHA_ULT_ACT) SELECT ?,ORDEN,CONCEPTO,MONTO,ESTADO,?,?,?,?,?"
	+" FROM MOV_BANCO_PAR_GASTO WHERE ID_ENC_CXC=?";
	
	public static final String SQL_INSERT_DET_CXC_PO= "INSERT INTO DET_CXC_PO (ID_ENC_CXC,ID_PAIS,ID_PERIODO_CXC,MONTO,ESTADO,FECHA_ESTADO,USUARIO_ING,FECHA_ING,"
   + " USUARIO_ULT_ACT,FECHA_ULT_ACT) SELECT ?,ID_PAIS,ID_PERIODO_CXC,MONTO,ESTADO,?,?,?,?,? FROM DET_CXC_PO WHERE ID_ENC_CXC=?";

	public static final String SQL_INSERT_DET_DISP_BANCO="INSERT INTO DET_DISP_BANCO (ID_ENC_CXC,ID_PAIS,MONTO,ESTADO,FECHA_ESTADO,USUARIO_ING,FECHA_ING,USUARIO_ULT_ACT,FECHA_ULT_ACT)"
    +" SELECT ?,ID_PAIS,MONTO,ESTADO,?,?,?,?,? FROM DET_DISP_BANCO WHERE ID_ENC_CXC=?";
	
	 public static final String SQL_INSERT_DET_CXC="INSERT INTO DET_CXC (ID_ENC_CXC,ID_PAIS,ID_PERIODO_CXC,MONTO,ESTADO,FECHA_ESTADO,USUARIO_ING,"
	+" FECHA_ING,USUARIO_ULT_ACT,FECHA_ULT_ACT) SELECT ?,ID_PAIS,ID_PERIODO_CXC,MONTO,ESTADO,?,?,?,?,? FROM DET_CXC WHERE ID_ENC_CXC=?";
	 
}
