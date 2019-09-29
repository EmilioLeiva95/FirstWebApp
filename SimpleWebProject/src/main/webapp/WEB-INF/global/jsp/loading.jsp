<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cargando Aplicacion</title>

<script type="text/javascript" src="${ctx}/include/scripts/chk_cookie.js"></script>
<script type="text/javascript">


Set_Cookie( 'test', 'none', '', '/', '', '' );


function gotoEntryPoint(){
	if ( Get_Cookie( 'test' ) ){
		document.getElementById('wait').style.display = '';
		document.getElementById('wait_msg').style.display = '';
		Delete_Cookie( 'test' );
		setTimeout('doEntry()', 100);
	}else{
		document.getElementById('t_nocookie').style.display='';
	}
}

function doEntry(){
	
	//window.location='${ctx}/SecureDevice?procedure=frameset&login=<c:out value="${entidad}" default="" />';
	document.getElementById('theForm').submit();
}

</script>
</head>
<body onload="gotoEntryPoint()" bgcolor="#073b71">

<form target="_parent" name="theForm" id="theForm" action="${ctx}/SecureDevice" method="post">
	<input type="hidden" name="procedure" value="frameset"/>
	<input type="hidden" name="login" value='<c:out value="${entidad}" default="" />'/>
</form>

<br/>
<br/>
<br/>
<div id="wait" align="center" style="display: none"><img src="${ctx}/include/images/design/in-out-loader.gif"/></div>
<div id="wait_msg" align="center" style="display: none"><font size="2" color="#ffffff" face="Verdana, Helvetida, Arial"><strong>Cargando...</strong></font></div>
	<noscript>
	<table width="75%" align="center">
	<tr><td align="center">
		<img alt="Mensaje" border="0" src="${ctx}/include/images/design/error-message.png" />
	</td>
	</tr>
	<tr><td align="center">
		<font color="#ffffff" face="Verdana, Helvetida, Arial"><strong>
			SU NAVEGADOR NO SOPORTA JAVASCRIPT. POR FAVOR 
			UTILICE UN NAVEGADOR CON SOPORTE DE JAVASCRIPT Y COOKIES HABILITADOS.
		</strong></font>
	</td></tr></table>	
	</noscript>
	<table id="t_nocookie" width="75%" align="center" style="display: none">
	<tr><td align="center">
		<img alt="Mensaje" border="0" src="${ctx}/include/images/stop.png" />
	</td>
	</tr>
	<tr><td align="center">
		<font color="#ffffff" face="Verdana, Helvetida, Arial"><strong>
			SU NAVEGADOR NO SOPORTA NO CUENTA CON LOS COOKIES HABILITADOS. POR FAVOR 
			UTILICE UN NAVEGADOR CON COOKIES HABILITADOS O BIEN HABILITE SUS COOKIES.
		</strong></font>
	</td></tr></table>
	
	
</body>
</html>
