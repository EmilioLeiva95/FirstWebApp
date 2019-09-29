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
<c:set var="ubicacion" value="actualizar"/>	
<c:set var="primerCampo" value="categoryname"/>
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
	<li><fmt:message key="categories.bc.etiqueta.actualizar" /></li>
</ul>
</div>
	<input type="hidden" name="id_ubicacion_retorno" id="id_ubicacion_retorno" value=""/>
</div>	
<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/jq/cabecera.jsp" />
</c:if>
<div id="mainContent">

    <div id="iTitle" class="ui-state-default ui-widget-content ui-corner-all">
    	<fmt:message key="categories.formulario.etiqueta.actualizar.titulo"/>
    </div>
    
    <div id="iProcessing" style="visibility: hidden" align="center">
    	<img src="${ctx}/include/images/design/processing_request.gif"></img>
    </div>

	<input type="hidden" id="pageLoc" name="pageLoc" value="actualizar"/>
	<input type="hidden" id="primerCampo" name="primerCampo" value="categoryname"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
	<c:if test="${not empty scrollTo }">
    <input type="hidden" id="scrollSmooth" value="<c:out value='${scrollTo}' />" />
    </c:if>
	<!-- valores de llaves -->
	<input type="hidden" id="category" name="category" value="${categories.category}"/>	
	


<!-- mensajes de error-->
<c:if test="${mensajesUsuario.erroresGlobales}">
<div class="ui-state-error ui-corner-all" style="padding: 0 .7em; font-size: 0.8em;"> 
	<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span> 
	<strong><fmt:message key="globales.formulario.etiqueta.error"/></strong> <br /> 
	<ul>
		<c:forEach items="${mensajesUsuario.mensajesDeError}" var="mensaje">
        	<li><c:out value="${mensaje}" escapeXml="false"/></li>
     	</c:forEach>
	</ul>
</div>
</c:if>

<div id="action-buttons">
<div id="action-bar">
	<button tabindex="2" id="btnGuardar" type="button" name="actualizar" onClick="doSubmit<c:if test="${ not empty detalle.cabecera}">Async</c:if>('categories/actualizarEjecutar');"><fmt:message key="globales.formulario.boton.actualizar.guardar"/></button>
	<button tabindex="3" id="btnCancelar" type="button" name="cancel" onClick="doSubmit<c:if test="${ not empty detalle.cabecera}">Async</c:if>('categories/cancelarActualizar');"><fmt:message key="globales.formulario.boton.actualizar.cancelar"/></button>
</div>
</div>
<br />

<!-- datos de formulario -->
<div><span style="font-size: small;">-Los campos marcados con * son obligatorios</span></div>
<div class="ui-widget ui-widget-content ui-corner-all" style="width: 99%">
		<div id="formInputHeader" class="ui-widget ui-widget-header ui-corner-top" style="padding-left: 5px;"> 
			<fmt:message key="categories.formulario.etiqueta.actualizar.titulo"/> 
		</div>
		<div style="display: inline;" id="formInput">
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['categoryname']}">	
		<div class="row">
			<span class="label" style="color: #AA0707;"> 
				<fmt:message key="categories.formulario.etiqueta.Categoryname"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</span>	 
			
			<span class="forminput" style="display: inline">
  			  <input tabindex="1" type="text" id="categoryname" name="categoryname"  value="${categories.categoryname}" size="50"  maxlength="50"/>
  			</span>
			<button type="button" class="btnAyuda" onClick="doSubmitAyuda('categories/ayudaPropiedadJson','categoryname')" ></button>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['categoryname'].mensaje}" var="mensaje">
			<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
			</c:forEach>
			
		</div>
</c:if>
		</div>
</div>		
</div>
</form>

<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>
</fmt:bundle>
