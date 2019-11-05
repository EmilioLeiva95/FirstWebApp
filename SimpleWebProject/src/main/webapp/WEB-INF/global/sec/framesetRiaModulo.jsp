<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header-sin-menu.jsp"%>
<head>
	<link rel="shortcut icon" href="${ctx}/include/images/favicon.ico"/>
	<title>Sistema de Información </title>
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
	$(document).ready(function() {
		$('input:submit, input:reset').button();
	});
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


.selectModulo {
	border: solid white;
	text-align: center;
	background: darkorange;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
}

.selectModulo:hover{
 	-ms-transform: scale(1.1); /* IE 9 */
    -webkit-transform: scale(1.1); /* Safari 3-8 */
    transform: scale(1.1); 
    background: #387dc3;

   color:white;
    
}

.wellshadow{
	-webkit-box-shadow: 11px 13px 5px -4px rgba(38,36,33,0.26);
	-moz-box-shadow: 11px 13px 5px -4px rgba(38,36,33,0.26);
	box-shadow: 11px 13px 5px -4px rgba(38,36,33,0.26);

}



</style>
</head>
<script>
	$(document).ready(function() {
		$('input:submit, input:reset').button();
	});
</script>
<body>
<div class="" style="padding: 0px !important; margin-left: 0px; margin-right: 0px; width: 100%;">
<div class="">
<!-- iframe src="${ctx}/inicio/blank/ria" class="col-md-10 col-sm-10 col-xs-12" scrolling="auto" name="main" height="100%" frameborder="0" style="margin: 0px;padding: 0px !important; display: inline-block;width: 100%;margin-bottom: -40%;"></iframe-->

<div class="row" style="padding-top: 15%;width: 100%;height:100%;padding-left: 30%;padding-right:30%">
<form id="formModulo" action="${ctx}/inicio/cargarmenu/ria" method="POST">

<section>
	<div class="form-group well wellshadow">
  <div class="row">
  		<div id="row" class="row" style="text-align: center;">
			<strong style="color:#1D71B8;font-size:18px">Seleccione el m&oacute;dulo al que desea ingresar</strong>

		</div>
  </br></br>
  <input type="hidden" name="idSelectMod" id="idSelectMod">
  	<c:forEach items="${modulos}" var="m">
	    <div class="col-sm-4 selectModulo" style="height:15%" onclick="$('#idSelectMod').val('${m.idModulo}');document.getElementById('formModulo').submit();">
	    	<c:out value="${m.descripcion}"></c:out> 
	      <p></p>
	    </div>
    </c:forEach>
</div><br>
</div>

</section>
</form>
</div>


</div>
</div>
</body>

</html>