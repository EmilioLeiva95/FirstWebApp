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
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %>
	
<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post">
<div class="container">
<div class="row">
<ol class="breadcrumb" id="id_ubicacion_retorno">
	<li><a href="${ctx}/inicio/blank/ria"> <fmt:message key="globales.bc.etiqueta.home" /> </a> </li>
<c:if test="${ not empty ubicacionAplicacion.ruta }">
	
	<c:forEach items="${ ubicacionAplicacion.ruta }" var="ub">
		<li><a href="javascript: doSubmitBreadcrumb('<c:out value="${ ub.submit }"/>', '<c:out value="${ ub.id }"/>')"><c:out value="${ ub.label }" escapeXml="false" /></a>  </li> 
	</c:forEach>			
</c:if>
	<li><fmt:message key="categories.bc.etiqueta.actualizar" /></li>
	<input type="hidden" name="idUbicacionAplicacionActual" id="idUbicacionAplicacionActual" value="${ ubicacionAplicacion.idUbicacionAplicacionActual }"/>
</ol>
</div>
	<input type="hidden" name="id_ubicacion_retorno" id="id_ubicacion_retorno" value=""/>
	
<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/bt/cabecera.jsp" />
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
<%@ include file="/WEB-INF/global/jsp/mensajes-globales-bootstrap.jsp" %>



<!-- datos de formulario -->
<div><span style="font-size: small;">-Los campos marcados con * son obligatorios</span></div>
<div class="row">
	<div class="panel panel-default" style="float: none;margin-left: 5%;margin-right: 5%;">
	<div class="panel-heading" ><strong><fmt:message key="categories.formulario.etiqueta.crear.titulo"/></strong></div>
	
		<div class="panel-body form-horizontal">
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['categoryname']}">	
		<div class="form-group">
			<span class="col-sm-2 control-label" style="color: #AA0707;"> 
				<fmt:message key="categories.formulario.etiqueta.Categoryname"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</span>	 
			
			<div class="col-sm-7 form-inline" >
  			  <input class="form-control" tabindex="1" type="text" id="categoryname" name="categoryname"  value="${categories.categoryname}" size="50"  maxlength="50"/>
  			</div>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['categoryname'].mensaje}" var="mensaje">
			<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
			</c:forEach>
			
		</div>
</c:if>
		</div>
		<div class="panel-footer">

			<button class="btn btn-danger" tabindex="2" id="btnCancelar" type="button" name="cancel" onClick="doSubmit('categories/cancelarActualizar');"><fmt:message key="globales.formulario.boton.actualizar.cancelar"/></button>
			<button class="btn btn-success" tabindex="3" id="btnGuardar" type="submit" name="actualizar" onClick="doSubmit('categories/actualizarEjecutar');"><fmt:message key="globales.formulario.boton.actualizar.guardar"/></button>	
	  	</div>
</div>		
</div>
</form>

<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>
</fmt:bundle>
