<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<c:set var="theme" value="${initParam.theme}"/>
<c:set var="ui" value="${initParam.ui}"/>

<c:set var="themecss" value="jquery-ui-custom.css"/>
<html>
<head>
	<title>Pagina inicial</title>
<%-- 	<link rel="stylesheet" type="text/css" href="${ctx}/include/themes/${theme}/${themecss}"> --%>
	
<%-- 	<script language="javascript" type="text/javascript" src="${ctx}/include/scripts/html/main.js"> </script> --%>
<%-- 	<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.js"></script>   --%>
<%-- 	<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery-ui-1.8.13.custom.min.js"></script> --%>
<%-- 	<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.accmenu.js"></script> --%>
	
<!-- 	<script> -->
// 		$(document).ready(function($){
			
// 		});
<!-- 	</script> -->
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %> 
</head>
<body>

<div class="ui-widget ui-widget-content ui-state-default" style="font-size: 0.8em; width: 100%; vertical-align: middle;">
	 <span style="font-size: 1.1em;"> Pagina inicial del Sistema de Monitoreo </span>
</div>
<div id="userDiv" class="ui-widget ui-widget-content" style="font-size: 0.8em; width: 100%; vertical-align: middle;">
	Bienvenido <strong><c:out value="${seguridadUsuarioAplicacion.nombre}"/></strong>
</div>


mdifmisndfinmsaudfnasunhfuasnfuas


</body>
</html>