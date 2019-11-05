<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<head>
	<link rel="shortcut icon" href="${ctx}/include/images/favicon.ico"/>
	<title>.:: F&aacute;brica de Software - DEMO ::.</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<link href="${ctx}/include/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <script src="${ctx}/include/bootstrap/js/jquery-1.12.1.min.js"></script>
 <script src="${ctx}/include/bootstrap/js/bootstrap.js"></script>

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
		
		
		function ocultarMenu() {
			$('#menuOcultar').toggle();
		}
	}
</script>
<style type="text/css">

iframe { 
    outline: none;
    box-sizing: border-box;
}
.menu {
    float: left;
}
.bodyContent {
    float: left;
    /*border: none; removed so you can see the iframe in this example*/
}

</style>
</head>
<body>
 
<iframe src="${ctx}/inicio/blank/ria" scrolling="auto" name="main" height="100%" frameborder="0" style="margin: 0px;padding: 0px !important; display: inline-block;"></iframe>

</body>

</html>