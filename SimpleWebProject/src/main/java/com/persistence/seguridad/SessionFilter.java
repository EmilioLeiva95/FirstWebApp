package com.persistence.seguridad;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.AmbienteDeSeguridad;

/**
 * Servlet Filter implementation class SessionFilter
 */
public class SessionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public SessionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest servletRequest = (HttpServletRequest)request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession(false);
		
		String requestedUri =  servletRequest.getRequestURI();
		boolean ignoreSession = requestedUri.contains("aplicacionDispositivo");
		
		
		if(!ignoreSession && (session == null || session.getAttribute(AmbienteDeSeguridad.OBJETO_USUARIO) == null)){
			// aqui estallamos!!!
			System.err.println("SESION EXPIRADA -- REDIRIGIENDO HACIA PAGINA DE FINALIZACION DE SESION ");
			System.err.println(servletRequest.getContextPath() + "/WEB-INF/global/jsp/redirect.jsp");
			servletRequest.getRequestDispatcher("/WEB-INF/global/jsp/redirect.jsp").forward(servletRequest, servletResponse);
		}else{
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
