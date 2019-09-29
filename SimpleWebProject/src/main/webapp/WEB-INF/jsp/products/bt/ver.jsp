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
<c:set var="ubicacion" value="ver"/>

<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %>

<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post">
<div class="container">
	<input type="hidden" name="id_ubicacion_retorno" id="id_ubicacion_retorno" value=""/>

<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/bt/cabecera.jsp" />
</c:if>
<div id="mainContent">
	
    <div id="iProcessing" style="visibility: hidden" align="center">
    	<img src="${ctx}/include/images/design/processing_request.gif"></img>
    </div>
	<input type="hidden" id="pageLoc" name="pageLoc" value="ver"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
	<!-- valores de llaves -->
	
	


<br />
<div class="row">
		<div id="action-buttons" class="btn-group" role="group">
			<button id="btnCancelar" type="button" name="regresar" class="btn btn-default" onClick="doSubmit('products/cancelarVer');"><fmt:message key="globales.formulario.boton.regresar"/></button>
		</div>
	
</div>
<br />
<!-- datos de formulario -->
<div class="row">
<!-- datos de formulario -->
<div class="panel panel-default">
  <div class="panel-heading">
			<h3 class="panel-title"><fmt:message key="products.formulario.etiqueta.ver.titulo"/></h3> 
  </div>
  <div class="panel-body form-horizontal">
		
	
		<div class="form-group">
			<span class="col-sm-2 control-label text-info">  
				<fmt:message key="products.formulario.etiqueta.Category"/>
			</span>	 
			
			<div class="col-sm-6">
				<span class="form-control">
                ${products.category}	    
			</span>
			</div>
			
			<span role="separator" class="divider"></span>
		</div>
	
	
		<div class="form-group">
			<span class="col-sm-2 control-label text-info">  
				<fmt:message key="products.formulario.etiqueta.Title"/>
			</span>	 
			
			<div class="col-sm-6">
				<span class="form-control">
                ${products.title}	    
			</span>
			</div>
			
			<span role="separator" class="divider"></span>
		</div>
	
	
		<div class="form-group">
			<span class="col-sm-2 control-label text-info">  
				<fmt:message key="products.formulario.etiqueta.Actor"/>
			</span>	 
			
			<div class="col-sm-6">
				<span class="form-control">
                ${products.actor}	    
			</span>
			</div>
			
			<span role="separator" class="divider"></span>
		</div>
	
	
		<div class="form-group">
			<span class="col-sm-2 control-label text-info">  
				<fmt:message key="products.formulario.etiqueta.Price"/>
			</span>	 
			
			<div class="col-sm-6">
				<span class="form-control">
                ${products.price}	    
			</span>
			</div>
			
			<span role="separator" class="divider"></span>
		</div>
	
	
		<div class="form-group">
			<span class="col-sm-2 control-label text-info">  
				<fmt:message key="products.formulario.etiqueta.Special"/>
			</span>	 
			
			<div class="col-sm-6">
				<span class="form-control">
                ${products.special}	    
			</span>
			</div>
			
			<span role="separator" class="divider"></span>
		</div>
	
	
		<div class="form-group">
			<span class="col-sm-2 control-label text-info">  
				<fmt:message key="products.formulario.etiqueta.CommonProdId"/>
			</span>	 
			
			<div class="col-sm-6">
				<span class="form-control">
                ${products.commonProdId}	    
			</span>
			</div>
			
			<span role="separator" class="divider"></span>
		</div>
	

		</div>
</div>		
</div>		
</div>		
</div>
</form>

<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>
</fmt:bundle>
