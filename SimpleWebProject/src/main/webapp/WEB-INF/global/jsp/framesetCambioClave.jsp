<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title> :: Sistema de Monitoreo :: </title>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<link href="${ctx}/include/styles/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.js"></script>  


</head>
<frameset rows="50,*" cols="*" frameborder="NO" border="0" framespacing="0">
	<frame src="LoginServlet?page=banner.jsp" name="banner" scrolling="NO" noresize >
	<frame src="${ctx}/app/usuario/cambiarClave/bt" name="main">
</frameset>

<noframes>
<body> </body>	
</noframes>

</html>