
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="shortcut icon" href="${ctx}/include/images/monitor_mini_16.ico">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Demo</title>
	<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.js"></script>  
	<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery-ui-1.8.13.custom.min.js"></script>

<style type="text/css">
	.message {
		background: #FCE9C0 url(include/images/alert.png) left no-repeat;
		background-position: 15px;
		border-top: 2px solid #DBAC48;
		border-bottom: 2px solid #DBAC48;
		padding: 15px 10px 15px 50px;
		font-family: Lucida Grande, Lucida Sans, Arial, sans-serif; 
		font-size: 1em;
	}
</style>
<script type="text/javascript">
	var isIE6 = false;
</script>
<!--[if lt IE 7]>
<script type="text/javascript">
	isIE6 = true;
</script>
<![endif]-->

<script type="text/javascript">

	$(document).ready(function(){
		if(isIE6){
			$('#ie9').show();
		}else{
			// Redirect
			//en la rama de release, este redirect apunta a /accessor/alive, para forzar el checkeo de autorizacion, lo cual
			//triggerea un 403 en caso se ingrese de forma "ilegal" al modulo
			window.location.href = '${ctx}/inicio/autenticar/ria';
		}
	});

	
</script>

<c:if test="">


</c:if>
</head>
<body>
<noscript>
<div class="message">
<p>JavaScript esta deshabilitado o no esta soportado por su
navegador. El aplicativo requiere de JavaScript habilitado y un
navegador capaz de soportarlo.</p>
</div>
</noscript>

<div id="ie9" class="message" style="display: none;">
<p>
	Su navegador corresponde a una version no soportada de Internet Explorer. <br />
	Por favor considere utilizar una version mas reciente de Internet Explorer o bien,
	utilizar otras alternativas como <a href="http://www.mozilla.com/" title="Mozilla Firefox"> Firefox </a>
	o <a href="http://www.google.com/chrome" title="Google Chrome">Google Chrome</a>.
</p>
</div>

</body>
</html>