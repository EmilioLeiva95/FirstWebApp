<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${locale}" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">
	
<c:if test="${ not empty productsEstado.enlaceDetalle}">
	<c:set var="detalle" value="${productsEstado.enlaceDetalle}"/>	
	<c:set var="detalleEnllavador" value="${detalle.enllavador}"/>
</c:if>

<c:set var="nombre" value="products"/>
<c:set var="ubicacion" value="crear"/>
<c:set var="primerCampo" value="category"/>
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %> 

	
<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post">
<div class="container">

<div class="row">
	<input type="hidden" name="id_ubicacion_retorno" id="id_ubicacion_retorno" value=""/>
</div>
<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/bt/cabecera.jsp" />
</c:if>


	<input type="hidden" id="pageLoc" name="pageLoc" value="crear"/>
	<input type="hidden" id="primerCampo" name="primerCampo" value="category"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
	<c:if test="${not empty scrollTo }">
    <input type="hidden" id="scrollSmooth" value="<c:out value='${scrollTo}' />" />
    </c:if>
	<!-- valores de llaves -->
	
	

<%@ include file="/WEB-INF/global/jsp/mensajes-globales-bootstrap.jsp" %>


<!-- datos de formulario -->
<!--<div><span style="font-size: small;">-Los campos marcados con * son obligatorios</span></div> -->
<div class="row">
	<div class="panel panel-default" style="float: none;margin-left: 5%;margin-right: 5%;">
	<div class="panel-heading" ><strong><fmt:message key="products.formulario.etiqueta.crear.titulo"/></strong></div>
	
		<div class="panel-body form-horizontal">
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['category']}">	
		<div class="form-group" >
			<label class="col-sm-2 control-label" style="color: #AA0707;"> 
                <fmt:message key="products.formulario.etiqueta.Category"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
			
			<div class="col-sm-7 form-inline" >
		        <input class="form-control" tabindex="1" type="text" alt="integer" id="category" name="category"  value="${products.category}" size="10" maxlength="10"/>
			</div>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['category'].mensaje}" var="mensaje">
			<li > <c:out value="${mensaje}" escapeXml="false"/> </li>
			</c:forEach>
			
		</div>
</c:if>	
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['title']}">	
		<div class="form-group" >
			<label class="col-sm-2 control-label" style="color: #AA0707;"> 
                <fmt:message key="products.formulario.etiqueta.Title"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
			
			<div class="col-sm-7 form-inline" >
  			  <input class="form-control" tabindex="2" type="text" id="title" name="title"  value="${products.title}" size="50"  maxlength="50"/>
  			</div>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['title'].mensaje}" var="mensaje">
			<li > <c:out value="${mensaje}" escapeXml="false"/> </li>
			</c:forEach>
			
		</div>
</c:if>	
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['actor']}">	
		<div class="form-group" >
			<label class="col-sm-2 control-label" style="color: #AA0707;"> 
                <fmt:message key="products.formulario.etiqueta.Actor"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
			
			<div class="col-sm-7 form-inline" >
  			  <input class="form-control" tabindex="3" type="text" id="actor" name="actor"  value="${products.actor}" size="50"  maxlength="50"/>
  			</div>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['actor'].mensaje}" var="mensaje">
			<li > <c:out value="${mensaje}" escapeXml="false"/> </li>
			</c:forEach>
			
		</div>
</c:if>	
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['price']}">	
		<div class="form-group" >
			<label class="col-sm-2 control-label" style="color: #AA0707;"> 
                <fmt:message key="products.formulario.etiqueta.Price"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
			
			<div class="col-sm-7 form-inline" >
		        <input class="form-control" tabindex="4" type="text" alt="numeric" id="price" name="price"  value="${products.price}" size="10" maxlength="12"/>
			</div>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['price'].mensaje}" var="mensaje">
			<li > <c:out value="${mensaje}" escapeXml="false"/> </li>
			</c:forEach>
			
		</div>
</c:if>	
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['special']}">	
		<div class="form-group" >
			<label class="col-sm-2 control-label" > 
                <fmt:message key="products.formulario.etiqueta.Special"/>			</label>	 
			
			<div class="col-sm-7 form-inline" >
		        <input class="form-control" tabindex="5" type="text" alt="integer" id="special" name="special"  value="${products.special}" size="10" maxlength="5"/>
			</div>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['special'].mensaje}" var="mensaje">
			<li > <c:out value="${mensaje}" escapeXml="false"/> </li>
			</c:forEach>
			
		</div>
</c:if>	
<c:if test="${ empty detalleEnllavador.valoresEnllavador or empty detalleEnllavador.valoresEnllavador['commonProdId']}">	
		<div class="form-group" >
			<label class="col-sm-2 control-label" style="color: #AA0707;"> 
                <fmt:message key="products.formulario.etiqueta.CommonProdId"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
			
			<div class="col-sm-7 form-inline" >
		        <input class="form-control" tabindex="6" type="text" alt="integer" id="commonProdId" name="commonProdId"  value="${products.commonProdId}" size="10" maxlength="10"/>
			</div>
			<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['commonProdId'].mensaje}" var="mensaje">
			<li > <c:out value="${mensaje}" escapeXml="false"/> </li>
			</c:forEach>
			
		</div>
</c:if>	
		</div>
		<div class="panel-footer">

	    	<button class="btn btn-danger" tabindex="7" id="btnCancelar" type="button" name="cancel" onClick="doSubmit('products/cancelarCrear');"><fmt:message key="globales.formulario.boton.crear.cancelar"/></button>
			<button class="btn btn-success" tabindex="8" id="btnGuardar" type="submit" name="ok" onClick="doSubmit('products/crearEjecutar');"><fmt:message key="globales.formulario.boton.crear.guardar"/></button>
		

	  	</div>
</div>		
</div>
</form>

<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>
</fmt:bundle>
