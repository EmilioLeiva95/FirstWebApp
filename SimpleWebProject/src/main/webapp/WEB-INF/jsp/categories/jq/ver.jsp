<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">
<c:if test="${ not empty categoriesEstado.enlaceDetalle}">
	<c:set var="detalle" value="${categoriesEstado.enlaceDetalle}"/>	
	<c:set var="detalleEnllavador" value="${detalle.enllavador}"/>
</c:if>		

<c:set var="nombre" value="categories"/>
<c:set var="ubicacion" value="ver"/>

<%@ include file="/WEB-INF/global/jsp/jq-header.jsp" %>

<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post">
<div class="breadCrumbHolder module" style="margin-bottom: 3px;">
<div id="breadcrumb" class="breadCrumb module ui-widget ui-widget-content" style="width: 99%;">
<ul>
	<li><a href="${ctx}/inicio/blank/ria"> <fmt:message key="globales.bc.etiqueta.home" /> </a> </li>
<c:if test="${ not empty ubicacionAplicacion.ruta }">
	<input type="hidden" name="idUbicacionAplicacionActual" id="idUbicacionAplicacionActual" value="${ ubicacionAplicacion.idUbicacionAplicacionActual }"/>
	<c:forEach items="${ ubicacionAplicacion.ruta }" var="ub">
		<li><a href="javascript: doSubmitBreadcrumb('<c:out value="${ ub.submit }"/>', '<c:out value="${ ub.id }"/>')"><c:out value="${ ub.label }" escapeXml="false" /></a>  </li> 
	</c:forEach>			
</c:if>
	<li><fmt:message key="categories.bc.etiqueta.ver" /></li>
</ul>
</div>
	<input type="hidden" name="id_ubicacion_retorno" id="id_ubicacion_retorno" value=""/>
</div>
<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/jq/cabecera.jsp" />
</c:if>
<div id="mainContent">
	
    <div id="iTitle" class="ui-state-default ui-widget-content ui-corner-all">
    	<fmt:message key="categories.formulario.etiqueta.ver.titulo"/>
    </div>

    <div id="iProcessing" style="visibility: hidden" align="center">
    	<img src="${ctx}/include/images/design/processing_request.gif"></img>
    </div>
	<input type="hidden" id="pageLoc" name="pageLoc" value="ver"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
	<!-- valores de llaves -->
	
	

<div id="action-buttons">
<div id="action-bar">
	<button id="btnCancelar" type="button" name="regresar" onClick="doSubmit<c:if test="${ not empty detalle.cabecera}">Async</c:if>('categories/cancelarVer');"><fmt:message key="globales.formulario.boton.regresar"/></button>
</div>
</div>
<br />

<!-- datos de formulario -->
<div class="ui-widget ui-widget-content ui-corner-all" style="width: 99%">
		<div id="formInputHeader" class="ui-widget ui-widget-header ui-corner-top" style="padding-left: 5px;"> 
			<fmt:message key="categories.formulario.etiqueta.ver.titulo"/> 
		</div>
		
	
		<div class="row">
			<span class="label ui-state-default"> 
				<fmt:message key="categories.formulario.etiqueta.Categoryname"/>
			</span>	 
			
			<span class="formvalue">
                ${categories.categoryname}		    
			</span>
			
			<span class="clearer"></span>
		</div>
	
		
</div>		
</div>
</form>

<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>
</fmt:bundle>
