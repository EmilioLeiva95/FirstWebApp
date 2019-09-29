<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<html:rewrite page='/include/styles/styles.css'/>" rel="stylesheet" type="text/css">
<title>Mensaje</title>
<script type="text/javascript">
	function toLoginPage(){
		window.parent.location='${ctx}/';
	}
</script>
</head>
<body topmargin="5" leftmargin="0" onload="setTimeout('toLoginPage()', 5000);">
	<div align="center"><img alt="Sesion expirada" src="${ctx}/include/images/clock.png" /></div>
	<br/>
	<div align="center"><font face="Verdana, Arial, Times New Roman" size="2"><strong>Su sesi&oacute;n ha expirado. 
		 Para reingresar haga click <a target="_parent" href='${ctx}/'>Aqu&iacute;</a> .
	</strong></font>
</body>
</html>