<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<head>
	<title>SOB - F3 Demo</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">


<script>

	function loaded(){
			new Ajax.Request('${ctx}/SecureDevice',
					  {
					    method:'post',
					    parameters: {procedure: 'session_check'},
					    onSuccess: function(transport){
					      var response = transport.responseText || "no response text";
					      if(response == 'false'){
						      window.alert('----------- ADVERTENCIA -----------\n UD NO POSEE UNA SESION ACTIVA \n SERA REDIRIGIDO HACIA LA PAGINA DE LOGIN');
						      window.location.href =	'${ctx}/SecureDevice?login=${login}';
					      }
					    },
					    onFailure: function(){ window.alert('Something went wrong...'); }
					  });
	}

	
</script>
</head>

<frameset onload="loaded();" rows="100,*" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="${ctx}/inicio/banner/html" name="banner" scrolling="NO" noresize >
  <frameset rows="*" cols="192,*" framespacing="0" frameborder="NO" border="0">
    <frame src='<c:url value="/inicio/menu/html?eag=${eag}" />' name="menu" scrolling="NO" noresize>
    <!-- <frame src="${ctx}/inicio/menu/html?eag=${eag}" name="menu" scrolling="NO" noresize>-->
    <frame src="${ctx}/inicio/blank/html" name="main">
  </frameset>
</frameset>

<noframes>
	<body class="fondo" ></body>
</noframes>
</html>