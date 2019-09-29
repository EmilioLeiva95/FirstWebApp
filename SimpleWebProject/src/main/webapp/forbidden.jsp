<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header-sin-menu.jsp"%>
<head>
<link rel="shortcut icon" href="${ctx}/include/images/favicon.ico" />
<title>Proyecto Demo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<link href="${ctx}/include/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="${ctx}/include/bootstrap/css/errorStyle.css"
	rel="stylesheet">
<script src="${ctx}/include/bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="${ctx}/include/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" language="javascript"
	src="${ctx}/include/scripts/ria/jquery.js"></script>

<style type="text/css">

</style>
</head>
<script>
	$(document).ready(function() {
		$('input:submit, input:reset').button();
	});
</script>
<body>
<div id="notfound">
<div class="notfound">
<div class="notfound-404"></div>
<h1>ACCESO DENEGADO</h1>
<h2></h2>
<p>Usted no cuenta con los permisos suficientes para acceder al m&oacute;dulo o no cuenta con las credenciales de usuario necesarias. Por favor vuelva a identificarse en la pantalla de Login</p>
<a href="${ctx}/accessor/salir">Volver a Login</a>
</div>
</div>

</html>