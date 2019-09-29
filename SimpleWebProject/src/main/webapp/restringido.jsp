<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<link href="<html:rewrite page='/include/styles/styles.css'/>" rel="stylesheet" type="text/css">
<title>Mensaje</title>
</head>
<body topmargin="5" leftmargin="0">
	<div id="mainContent">
	<div align="center"><img alt="Sesion expirada" src="${ctx}/include/images/hand_stop.png" /></div>
	<br/>
	<div align="center"><font face="Verdana, Arial, Times New Roman" size="2"><strong>Usted no cuenta con Acceso a la Opci&oacute;n Seleccionada
	</strong></font>
	</div>
	</div>
</body>
</html>
