<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">
	
<c:if test="${ not empty parametroGeneralEstado.enlaceDetalle}">
	<c:set var="detalle" value="${parametroGeneralEstado.enlaceDetalle}"/>	
	<c:set var="detalleEnllavador" value="${detalle.enllavador}"/>
</c:if>		

<c:set var="ubicacion" value="actualizar"/>	
<c:set var="primerCampo" value="numDiasCaducaClave"/>
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %>
	
<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post" target="_parent">
<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/bt/cabecera.jsp" />
</c:if>
<div id="mainContent">
<div id="iProcessing" style="visibility: hidden" align="center">
	<img src="${ctx}/include/images/design/processing_request.gif"></img>
</div>

<!-- <div id="iTitle" class="ui-state-default ui-widget-content ui-corner-all"> -->
<%-- 	<fmt:message key="ambienteSeguridad.formulario.etiqueta.titulo"/>  --%>
<!-- </div> -->

	<input type="hidden" id="pageLoc" name="pageLoc" value="actualizar"/>
	<input type="hidden" id="primerCampo" name="primerCampo" value="numDiasCaducaClave"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
	<!-- valores de llaves -->
	<input type="hidden" id="idParametroGeneral" name="idParametroGeneral" value="${parametroGeneral.idParametroGeneral}"/>	
	


<!-- mensajes de error-->
<%@ include file="/WEB-INF/global/jsp/mensajes-globales.jsp" %>
	<div id="action-buttons">
	<div id="action-bar" style="float: none;margin-left: 2%;margin-right: 2%;">
		<button tabindex="13" id="btnGuardar" class="btn btn-info" type="button" name="actualizar" onClick="doSubmit('ambienteSeguridad/recargarSeguridad');"><fmt:message key="ambienteSeguridad.formulario.etiqueta.boton"/></button>
	</div>
	</div>
<br />

<!-- datos de formulario -->

<div class="panel panel-default" style="float: none;margin-left: 2%;margin-right: 2%;">
  <div class="panel-body"> 
			<fmt:message key="ambienteSeguridad.formulario.etiqueta.titulo"/> 
		
		<div>
			<fmt:message key="ambienteSeguridad.formulario.etiqueta.leyenda"/>
			<br/>
		</div>
</div>
			<div class="panel-footer">
			<strong><fmt:message key="ambienteSeguridad.formulario.etiqueta.advertencia"/></strong> 
			<fmt:message key="ambienteSeguridad.formulario.etiqueta.salida" />
			</div>	
</div>	
</div>
</form>

<%-- <%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %> --%>
</fmt:bundle>
