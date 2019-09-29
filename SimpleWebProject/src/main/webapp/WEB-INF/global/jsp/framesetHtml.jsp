<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<head>
	<title>DEMO DAI</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<link href="${ctx}/include/styles/styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/include/scripts/prototype.js"></script>
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
  <frame src="bannerExterno.jsp" name="banner" scrolling="NO" noresize >
  <frameset rows="*" cols="192,*" framespacing="0" frameborder="NO" border="0">
    <frame src="show?page=menu.jsp" name="menu" scrolling="NO" noresize>
    <frame src="show?page=blank.jsp" name="main">
  </frameset>
</frameset>

<noframes>
	<body class="fondo" ></body>
</noframes>
</html>