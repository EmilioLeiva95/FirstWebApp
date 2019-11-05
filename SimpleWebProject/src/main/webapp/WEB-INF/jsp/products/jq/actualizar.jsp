<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">
	
<c:if test="${ not empty productsEstado.enlaceDetalle}">
	<c:set var="detalle" value="${productsEstado.enlaceDetalle}"/>	
	<c:set var="detalleEnllavador" value="${detalle.enllavador}"/>
</c:if>		

<c:set var="nombre" value="products"/>
<c:set var="ubicacion" value="actualizar"/>	
<c:set var="primerCampo" value="category"/>
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
	<li><fmt:message key="products.bc.etiqueta.actualizar" /></li>
</ul>
</div>
	<input type="hidden" name="id_ubicacion_retorno" id="id_ubicacion_retorno" value=""/>
</div>	
<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/jq/cabecera.jsp" />
</c:if>
<div id="mainContent">

    <div id="iTitle" class="ui-state-default ui-widget-content ui-corner-all">
    	<fmt:message key="products.formulario.etiqueta.actualizar.titulo"/>
    </div>
    
    <div id="iProcessing" style="visibility: hidden" align="center">
    	<img src="${ctx}/include/images/design/processing_request.gif"></img>
    </div>

	<input type="hidden" id="pageLoc" name="pageLoc" value="actualizar"/>
	<input type="hidden" id="primerCampo" name="primerCampo" value="category"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
	<c:if test="${not empty scrollTo }">
    <input type="hidden" id="scrollSmooth" value="<c:out value='${scrollTo}' />" />
    </c:if>
	<!-- valores de llaves -->
	<input type="hidden" id="prodId" name="prodId" value="${products.prodId}"/>	
	


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
	<button tabindex="7" id="btnGuardar" type="button" name="actualizar" onClick="doSubmit<c:if test="${ not empty detalle.cabecera}">Async</c:if>('products/actualizarEjecutar');"><fmt:message key="globales.formulario.boton.actualizar.guardar"/></button>
	<button tabindex="8" id="btnCancelar" type="button" name="cancel" onClick="doSubmit<c:if test="${ not empty detalle.cabecera}">Async</c:if>('products/cancelarActualizar');"><fmt:message key="globales.formulario.boton.actualizar.cancelar"/></button>
</div>
</div>
<br />

<!-- datos de formulario -->
<div><span style="font-size: small;">-Los campos marcados con * son obligatorios</span></div>
<div class="ui-widget ui-widget-content ui-corner-all" style="width: 99%">
		<div id="formInputHeader" class="ui-widget ui-widget-header ui-corner-top" style="padding-left: 5px;"> 
			<fmt:message key="products.formulario.etiqueta.actualizar.titulo"/> 
		</div>
		<div style="display: inline;" id="formInput">
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['category']}">	
		<div class="row">
			<span class="label" style="color: #AA0707;"> 
				<fmt:message key="products.formulario.etiqueta.Category"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</span>	 
			
			<span class="forminput" style="display: inline">
		        <input tabindex="1" alt="integer" type="text" id="category" name="category"  value="${products.category}" size="10" maxlength="10"/>
			</span>
			<button type="button" class="btnAyuda" onClick="doSubmitAyuda('products/ayudaPropiedadJson','category')" ></button>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['category'].mensaje}" var="mensaje">
			<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
			</c:forEach>
			
		</div>
</c:if>
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['title']}">	
		<div class="row">
			<span class="label" style="color: #AA0707;"> 
				<fmt:message key="products.formulario.etiqueta.Title"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</span>	 
			
			<span class="forminput" style="display: inline">
  			  <input tabindex="2" type="text" id="title" name="title"  value="${products.title}" size="50"  maxlength="50"/>
  			</span>
			<button type="button" class="btnAyuda" onClick="doSubmitAyuda('products/ayudaPropiedadJson','title')" ></button>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['title'].mensaje}" var="mensaje">
			<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
			</c:forEach>
			
		</div>
</c:if>
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['actor']}">	
		<div class="row">
			<span class="label" style="color: #AA0707;"> 
				<fmt:message key="products.formulario.etiqueta.Actor"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</span>	 
			
			<span class="forminput" style="display: inline">
  			  <input tabindex="3" type="text" id="actor" name="actor"  value="${products.actor}" size="50"  maxlength="50"/>
  			</span>
			<button type="button" class="btnAyuda" onClick="doSubmitAyuda('products/ayudaPropiedadJson','actor')" ></button>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['actor'].mensaje}" var="mensaje">
			<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
			</c:forEach>
			
		</div>
</c:if>
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['price']}">	
		<div class="row">
			<span class="label" style="color: #AA0707;"> 
				<fmt:message key="products.formulario.etiqueta.Price"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</span>	 
			
			<span class="forminput" style="display: inline">
		        <input tabindex="4" alt="numeric" type="text" id="price" name="price"  value="${products.price}" size="10" maxlength="12"/>
			</span>
			<button type="button" class="btnAyuda" onClick="doSubmitAyuda('products/ayudaPropiedadJson','price')" ></button>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['price'].mensaje}" var="mensaje">
			<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
			</c:forEach>
			
		</div>
</c:if>
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['special']}">	
		<div class="row">
			<span class="label" > 
				<fmt:message key="products.formulario.etiqueta.Special"/>			</span>	 
			
			<span class="forminput" style="display: inline">
		        <input tabindex="5" alt="integer" type="text" id="special" name="special"  value="${products.special}" size="10" maxlength="5"/>
			</span>
			<button type="button" class="btnAyuda" onClick="doSubmitAyuda('products/ayudaPropiedadJson','special')" ></button>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['special'].mensaje}" var="mensaje">
			<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
			</c:forEach>
			
		</div>
</c:if>
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['commonProdId']}">	
		<div class="row">
			<span class="label" style="color: #AA0707;"> 
				<fmt:message key="products.formulario.etiqueta.CommonProdId"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</span>	 
			
			<span class="forminput" style="display: inline">
		        <input tabindex="6" alt="integer" type="text" id="commonProdId" name="commonProdId"  value="${products.commonProdId}" size="10" maxlength="10"/>
			</span>
			<button type="button" class="btnAyuda" onClick="doSubmitAyuda('products/ayudaPropiedadJson','commonProdId')" ></button>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['commonProdId'].mensaje}" var="mensaje">
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
