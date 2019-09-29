<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<link rel="shortcut icon" href="${ctx}/include/images/favicon.ico">
	<title> :: Facturing Demo :: </title>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<link href="${ctx}/include/styles/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.js"></script>  


</head>
<frameset rows="50,*" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="${ctx}${sPath}/application/banner" name="banner" scrolling="NO" noresize >
  <frameset rows="*" cols="192,*" framespacing="0" frameborder="NO" border="0">

    <frame src="${ctx}${sPath}/application/menu" name="menu" scrolling="NO" noresize>
    <frame src="${ctx}/home.jsp" name="main">
  </frameset>
</frameset>

<noframes>
<body> </body>	
</noframes>

</html>