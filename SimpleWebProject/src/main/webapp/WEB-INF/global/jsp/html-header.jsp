<%@ page session="false" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<meta http-equiv="Content-Language" content="en" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="${ctx}/include/styles/html/main.css" rel="stylesheet" type="text/css">
<link href="${ctx}/include/styles/html/menu.css" rel="stylesheet" type="text/css">
<link href="${ctx}/include/styles/html/calendar-blue.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="${ctx}/include/scripts/html/main.js"> </script>
<script language="javascript" type="text/javascript" src="${ctx}/include/scripts/html/general.js"> </script>
<script language="javascript" type="text/javascript" src="${ctx}/include/scripts/html/calendar.js"></script>
<script language="javascript" type="text/javascript" src="${ctx}/include/scripts/html/calendar-setup.js"></script>
<script language="javascript" type="text/javascript" src="${ctx}/include/scripts/html/calendar-es.js"></script>
    

<script type="text/javascript">

var ejecutando = false;

function doSubmit(action){	
	if (ejecutando == false){
		document.mainForm.action = '${ctx}${sPath}/' + action + '/${tOut}';
		document.mainForm.submit();
		mostrarProcesando();
		ejecutando = true;
	}
}

function doUpdateAndSubmit(id,value,action){	
	updateElementValue(id,value);
	doSubmit(action);
}

function mostrarProcesando(){
	document.getElementById("cProcessing").style.visibility="visible";
}

function ocultarProcesando(){
	document.getElementById("cProcessing").style.visibility="hidden";
}

</script>
		
</head>	
<body>
<%@ include file="/WEB-INF/global/jsp/jq-horizontal.jsp" %>
<!-- 
<div id="iTitle" class="ui-gradient ui-corner-all">
	<span class="ui-bullet"></span>
	<span class="ui-title">${mainDisplay}</span>
</div>
-->
<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post"  >
<input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
<input type="hidden" id="columna" name="columna"/>
<input type="hidden" id="eag" name="eag" value="${eag}"/>
<input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />