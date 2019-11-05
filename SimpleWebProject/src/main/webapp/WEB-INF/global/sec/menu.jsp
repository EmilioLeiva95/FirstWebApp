<!-- %
   request.setAttribute("rootMenu",	
		     ((AmbienteSeguridadImpl)ControladorGeneralBase.getAmbienteDeSeguridad(request)).getMenu()
		   );
System.out.println("SE PUSO EL MENU :" + request.getAttribute("rootMenu"));
%-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!-- %@page import="com.persistence.fenix.f3.proof.rel1.gui.abl.dao.RecursoDao"%-->
<!--%@page import="com.persistence.fenix.f3.proof.rel1.gui.builders.ServletPrincipal"%-->
<!--%@page import="java.util.Collection"%-->
<!--%@page import="com.persistence.fenix.f3.proof.rel1.gui.sec.menu.impl.MenuImpl"%-->
<!--%@page import="java.util.Iterator"%-->
<!--%@page import="com.persistence.fenix.f3.proof.rel1.gui.sec.menu.impl.MenuItemImpl"%-->
<!--%@page import="java.io.PrintWriter"%-->
<!--%@page import="java.io.Writer"%-->
<!--%@page import="com.persistence.f3.j2eecompatible.distribuible.web.controlador.ControladorGeneralBase"%-->
<!--%@page import="com.persistence.fenix.f3.proof.rel1.gui.sec.AmbienteSeguridadImpl"%--><html>
<head>
	<title>Menu</title>              
	<link rel="stylesheet" type="text/css" href="include/menu/menusito.css" title="Default Styles" media="screen">
	<link href="include/styles/main.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="include/menu/menucode.js"></script>
	<style type="text/css">.qmfv{visibility:visible !important;}.qmfh{visibility:hidden !important;}</style>
	<script type="text/JavaScript" src="include/menu/addon.js"></script>
    <script type="text/javascript" src="include/menu/tree.js"></script>
	<script type="text/javascript" src="include/menu/bullets.js"></script>
</head>
<body>

<div id="c_title">
	<table>
	    <tbody>
		<tr>
			<td class="background">
		    <table>
				<tr class="title">
					<td class="bullet"></td><td>Menu de Opciones</td>
				</tr>
            </table>
			</td>
		</tr>
		</tbody>
	</table>
</div>

<br/>


<ul id="qm0" class="qmmc">
		<li>
			<a class="qmparent" target="main" href="SecureDevice?procedure=blank"> OPCIONES </a>
		</li>
		<c:set scope="request" var="currentMenu" value="${rootMenu}"  />
		<%
		  System.out.println("menu actual = " + request.getAttribute("currentMenu"));
		%>
		<jsp:include page="/WEB-INF/global/sec/recursiveMenu.jsp"></jsp:include>
		<li class="qmclear">&nbsp;</li>
</ul>

<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
	<script type="text/javascript">qm_create(0,false,0,250,'all',false,false,false,false);</script>


	<br>
	<form target="_parent" method="get" action="TemporaryLoginServlet">
		<div align="center"><input type="image" src="include/images/security/btnSalir.png" style="border: 0px;"/></div>
	</form>
</body>
</html>