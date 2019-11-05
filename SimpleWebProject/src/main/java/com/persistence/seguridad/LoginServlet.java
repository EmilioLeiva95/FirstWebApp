package com.persistence.seguridad;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.Collection;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.ExcepcionEnLocalizacionDeServicio;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.dependencias.impl.LocalizadorDeSerivicioBase;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.estado.DatosAplicacion;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.estado.EstadoAplicacion;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.estado.ExcepcionEnUtileriaDeEstado;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.AmbienteDeSeguridad;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.multiAplicacion.dto.RepositorioSeguridad;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.multiAplicacion.dto.SeguridadDeUsuarioAplicacion;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.multiAplicacion.dto.Usuario;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.multiAplicacion.dto.adaptadores.AmbienteDeSeguridadImpl;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.multiAplicacion.sql.impl.ConstructorDeSeguridadSql;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.multiAplicacion.xml.impl.ConstructorDeSeguridad;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.xml.LocalizadorNodoDeAcceso;
import com.persistence.f3.app.distribuibles.abstraccion.comunes.xml.NodoDeAcceso;
import com.persistence.f3.app.distribuibles.implementaciones.web.triton.impl.servlet.TritonServletHelper;
import com.persistence.dependenciasGlobales.DemoResolusor;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final String APP_CONTEXT = "/app";

	private static final long serialVersionUID = 1L;

	private static RepositorioSeguridad repositorioSeguridad;
	
	private static final Map<String, Integer> ACCIONES = new Hashtable<String, Integer>();
	
	private static boolean configurationReady = false;
	
	private static final class  AmbienteDeSeguridadPorUsuarioLoc extends LocalizadorDeSerivicioBase implements Serializable{
		
		public AmbienteDeSeguridadPorUsuarioLoc(String usuario) {
			super();
			this.usuario = usuario;
		}
		
		private String usuario;
		
		public Object getServicio() throws ExcepcionEnLocalizacionDeServicio {
			SeguridadDeUsuarioAplicacion segUsuario = repositorioSeguridad.getUniAplicacion().getSeguridadDeUsuarioAplicacionC(usuario);
			if(segUsuario.isUsuarioAsignado()){
				segUsuario.setUsuario(repositorioSeguridad.getUsuario(usuario));	
			}
			
			return new AmbienteDeSeguridadImpl(segUsuario);		
		}
		
	}
	
	 
	public static final int AUTENTICAR = 1;
	public static final int MENU = 2;
	public static final int BANNER = 3;
	public static final int BLANK = 4;
	public static final int FRAMESET = 5;
	public static final int WAP = 6;
	public static final int HTML = 7;
	public static final int RIA = 8;
	public static final int LOGIN = 9;
	public static final int SALIR = 10;
	public static final int RECARGAR_SEGURIDAD = 11;
	public static final int REDIRECT = 12;
	public static final int SELECCIONAR_ENTIDAD = 13;
	public static final int INGRESO_ENTIDAD = 14;

	
	static{
		ACCIONES.put("autenticar", new Integer(AUTENTICAR));
		ACCIONES.put("menu", new Integer(MENU));
		ACCIONES.put("banner", new Integer(BANNER));
		ACCIONES.put("blank", new Integer(BLANK));
		ACCIONES.put("frameset", new Integer(FRAMESET));
		ACCIONES.put("salir", new Integer(SALIR));
		ACCIONES.put("recargarSeguridad", new Integer(RECARGAR_SEGURIDAD));
		ACCIONES.put("entidadMunicipalSelect", new Integer(SELECCIONAR_ENTIDAD));
		ACCIONES.put("ingresoEntidad", new Integer(INGRESO_ENTIDAD));
		
		ACCIONES.put("wap", new Integer(WAP));
		ACCIONES.put("html", new Integer(HTML));
		ACCIONES.put("ria", new Integer(RIA));
		ACCIONES.put("redirect", new Integer(REDIRECT));
	}
	
	
	public static int parseAccion(String accion){
		Integer accionInt = ACCIONES.get(accion);
		if(accionInt == null){
			return LOGIN;
		}
		return accionInt.intValue();
	}
	
	
	public static int parseTipo(String tipo){
		Integer tipoInt = ACCIONES.get(tipo);
		if(tipoInt==null){
			return HTML;
		}
		return tipoInt.intValue();
	}
	
	
	private static String pathConfiguracion;
	
	public static void recargarSeguridad() throws ServletException{
		try{
			/** 
			 * SEGURIDAD XML */
			
			NodoDeAcceso nodo = LocalizadorNodoDeAcceso.getNodoDeAccesoST(new FileInputStream(pathConfiguracion));
			repositorioSeguridad = new RepositorioSeguridad();
			ConstructorDeSeguridad.construirUniSeguridad(nodo, repositorioSeguridad);
			
			/*  
			 * SEGURIDAD POR BASE DE DATOS
			 *
			 */
			/*
			NodoDeAcceso nodo = LocalizadorNodoDeAcceso.getNodoDeAccesoST(new FileInputStream(pathConfiguracion));
			repositorioSeguridad = new RepositorioSeguridad();
			ConstructorDeSeguridadSql constructorDeSeguridad = new ConstructorDeSeguridadSql();
			constructorDeSeguridad.setLocalizadorDeConexion(DemoResolusor.getSingleton().getLocalizadorDeConexionPrincipal());
			constructorDeSeguridad.setRespositorioSeguridad(repositorioSeguridad);
			constructorDeSeguridad.setNodoDeAcceso(nodo);
			constructorDeSeguridad.construirUniSeguridad();
			*/
		}catch(Exception e){
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		
	}
	
	public void init(ServletConfig config) throws ServletException {
		pathConfiguracion =	config.getServletContext().getRealPath(config.getInitParameter("Configuracion"));
		recargarSeguridad();
		configurationReady = true;
			
		super.init(config);	
	}


	/**
     * @see HttpServlet#HttpSeq\rvlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proc(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   proc(request, response);	
	}

	
	public static Usuario obtenerUsuario(String username){
		return repositorioSeguridad.getUsuario(username);		
	}
	
	
	protected void proc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestedUri =  request.getRequestURI();
		String servletPath = request.getServletPath();
		String deployMent = request.getContextPath();
		String pathLimpio =  "";
		
		RequestDispatcher rd = null;		
		Collection<String> errores = new LinkedList<String>();
		request.setAttribute("errores", errores);
		
		String sesion = request.getParameter("sesion");
		if(sesion != null){
			verificarSesionActiva(request, response,rd);
			return;
		}
		
		//listado de variables comunes:
		
		TritonServletHelper tritonServletHelper = null;
		DatosAplicacion datosAplicacion =   null;
		EstadoAplicacion estadoAplicacion = null;
		AmbienteDeSeguridad ambienteDeSeguridad  = null;
		HttpSession sUser = null;
		
		request.setAttribute("sPath", APP_CONTEXT);
		request.setAttribute("locale", "es_SV");
		
		if(requestedUri.length() > servletPath.length() + deployMent.length() + 1){
			int inicioDeProcesador = servletPath.length() + deployMent.length() + 1;
			pathLimpio = requestedUri.substring(inicioDeProcesador);
		}
		
		String[] acciones =  pathLimpio.split("/");
		
		
		int tipo = RIA;
		int accion = LOGIN;

		
		switch (acciones.length) {
		case 0:
			//no trae nada valores por defecto
			break;
		case 1:
			//unicamente tiene el tipo 
			tipo = parseTipo(acciones[0]);
		     break;	
		case 2:
		default:
			//contiene tipo y accion
			tipo = parseTipo(acciones[1]);
			accion = parseAccion(acciones[0]);
			break;
		}
		
		
		//a este punto ya tenemos todos los valores parseados
		switch (accion) {
		   case RECARGAR_SEGURIDAD:
			   recargarSeguridad();
			   accion = LOGIN;
			   break;
		   case SALIR:					
				accion = LOGIN;
				break;
		}
		
		accion:
		switch (accion) {
		case REDIRECT:
			rd = request.getRequestDispatcher("/WEB-INF/global/jsp/redirect.jsp");
			break;
		case MENU:
		   tritonServletHelper = TritonServletHelper.getTritonServletHelper(DemoResolusor.getSingleton());
		   datosAplicacion =  tritonServletHelper.getDatosAplicacion(request, response);
		   estadoAplicacion = datosAplicacion.getEstadoAplicacion();		   
		   ambienteDeSeguridad = estadoAplicacion.getAmbienteDeSeguridad();
		   Collection itemsDeMenu = ambienteDeSeguridad.getItemsDeMenu();

		   
		   request.setAttribute("itemsDeMenu", itemsDeMenu);
		   rd = request.getRequestDispatcher("/WEB-INF/global/sec/menuRia.jsp");
		   
			try {
				tritonServletHelper.actualizarEstadoAplicacion(datosAplicacion);
			} catch (ExcepcionEnUtileriaDeEstado e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;		
		case BLANK:
			   tritonServletHelper = TritonServletHelper.getTritonServletHelper(DemoResolusor.getSingleton());
			   datosAplicacion =  tritonServletHelper.getDatosAplicacion(request, response);
			   estadoAplicacion = datosAplicacion.getEstadoAplicacion();		   
			   ambienteDeSeguridad = estadoAplicacion.getAmbienteDeSeguridad();
			   Collection itemsDeMenu2 = ambienteDeSeguridad.getItemsDeMenu();

			   request.setAttribute("itemsDeMenu", itemsDeMenu2);
			   rd = request.getRequestDispatcher("/WEB-INF/global/sec/blankHtml.jsp");
			   
			break;		
		case BANNER:
				rd = request.getRequestDispatcher("/WEB-INF/global/sec/bannerRia.jsp");
			break;

		case AUTENTICAR:
			//proceso de login
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(username!=null){
				Usuario usuarioObj = null; 
				try{
					usuarioObj = obtenerUsuario(username);
				}catch(Exception e){
					errores.add(e.getMessage());
				}
				if(usuarioObj!=null && usuarioObj.checkPassword(password)){
					AmbienteDeSeguridadPorUsuarioLoc ambienteSeguridadLoc = new AmbienteDeSeguridadPorUsuarioLoc(username);
					tritonServletHelper = TritonServletHelper.getTritonServletHelper(DemoResolusor.getSingleton());
					datosAplicacion =  tritonServletHelper.getDatosAplicacion(request, response);
					estadoAplicacion = datosAplicacion.getEstadoAplicacion();
					estadoAplicacion.setAmbienteDeSeguridadLoc(ambienteSeguridadLoc);

					ambienteDeSeguridad = estadoAplicacion.getAmbienteDeSeguridad();
					Collection itemsDeMenu3 = ambienteDeSeguridad.getItemsDeMenu();
					

					request.getSession().setAttribute("itemsDeMenu", itemsDeMenu3);
					request.getSession().setAttribute(AmbienteDeSeguridad.OBJETO_USUARIO, usuarioObj);
					
					

					try {
						tritonServletHelper.actualizarEstadoAplicacion(datosAplicacion);
					} catch (ExcepcionEnUtileriaDeEstado e) {
						e.printStackTrace();
					}
					
					rd = request.getRequestDispatcher("/WEB-INF/global/sec/blankHtml.jsp");
					break accion;
					
				}
				errores.add("usuario o password invalido");
			}
		case LOGIN:
		default: //LOGIN
			//este es el login
			HttpSession session = request.getSession(false);
			if (session != null) {
				synchronized (session) {
					session.invalidate();
				}
			}						
			
			rd = request.getRequestDispatcher("/WEB-INF/global/sec/loginRia.jsp");
			break accion;
		}
		rd.forward(request, response);
	}


	
	private void verificarSesionActiva(HttpServletRequest request, HttpServletResponse response, RequestDispatcher rd) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Usuario usuario = (Usuario)session.getAttribute(AmbienteDeSeguridad.OBJETO_USUARIO);
		StringBuffer dataJson = new StringBuffer("{\"valor\":}");
		int pos = dataJson.lastIndexOf(":") + 1;
		if(usuario == null){
			dataJson.insert(pos, false);
		}else{
			dataJson.insert(pos, true);
		}
		
		String jsonData = dataJson.toString();
		request.setAttribute("jsonData", jsonData);
		rd = request.getRequestDispatcher("/WEB-INF/global/jsp/json.jsp");
		rd.forward(request, response);
	}

}