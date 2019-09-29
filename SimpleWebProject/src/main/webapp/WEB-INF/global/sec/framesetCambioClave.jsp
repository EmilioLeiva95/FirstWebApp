<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<head>
	<link rel="shortcut icon" href="${ctx}/include/images/favicon.ico"/>
	<title>Sistema de Información de Gestión Institucional</title>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.js"></script>

<script>

	function loaded(){
		$.ajax({
			  async : false,
			  url: '${ctx}/inicio/',
			  data: $.param({
				  sesion: "isActiva"
			  }),
			  context: document.mainForm,
			  type: "POST",
	          dataType: "json",
			  success: function(data){
			  		if(!data.valor){
			  			window.location.href =	'${ctx}/inicio/redirect/ria';
			  		}
			  }
			});
	}
</script>
</head>

<frameset onload="loaded();" rows="*" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="${ctx}/app/cambioClave/cambioClave/bt" name="main">
</frameset>

<noframes>
	<body class="fondo" >
	
		se probo alog
	</body>
</noframes>
</html>