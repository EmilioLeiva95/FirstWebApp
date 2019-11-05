<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">

<c:if test="${ not empty productsEstado.enlaceBusqueda.enllavador}">
	<c:set var="busquedaEnllavador" value="${productsEstado.enlaceBusqueda.enllavador}"/>	
</c:if>	
<c:if test="${ not empty productsEstado.enlaceDetalle}">
	<c:set var="detalle" value="${productsEstado.enlaceDetalle}"/>	
</c:if>	
<c:if test="${productsEstado.ordenamientoAplicado}">
	<c:set var="orden" value="${productsEstado.ordenamiento}"/>	
</c:if>		
<c:if test="${not empty productsSeg}">
	<c:set var="restriccion" value="${productsSeg}"/>
</c:if>

<c:set var="nombre" value="products"/>
<c:set var="ubicacion" value="listado"/>

<% int counter = 0; %>
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %> 
<!-- Elementos no visibles -->	
	
<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post">
<div class="container">
<div class="row">
	<input type="hidden" name="idUbicacionAplicacionActual" id="idUbicacionAplicacionActual" value="${ ubicacionAplicacion.idUbicacionAplicacionActual }"/>
<ol class="breadcrumb" id="id_ubicacion_retorno">
	<li><a href="${ctx}/inicio/blank/ria"> <fmt:message key="globales.bc.etiqueta.home" /> </a> </li>
<c:if test="${ not empty ubicacionAplicacion.ruta }">
	
	<c:forEach items="${ ubicacionAplicacion.ruta }" var="ub">
		<li><a href="javascript: doSubmitBreadcrumb('<c:out value="${ ub.submit }"/>', '<c:out value="${ ub.id }"/>')"><c:out value="${ ub.label }" escapeXml="false" /></a>  </li> 
	</c:forEach>			
</c:if>
	<li class="active"><fmt:message key="products.bc.etiqueta.principal" /></li>
	<input type="hidden" name="idUbicacionAplicacionActual" id="idUbicacionAplicacionActual" value="${ ubicacionAplicacion.idUbicacionAplicacionActual }"/>
</ol>
</div>


<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/bt/cabecera.jsp" />
</c:if>
	
<div id="mainContent">
	<input type="hidden" id="maxRowNum" name="maxRowNum" value="<c:out value="${navegacion.registroFinal - 1}"/>">
	<input type="hidden" id="pageLoc" name="pageLoc" value="listado"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
	<c:if test="${ not empty busquedaEnllavador}">
	<input type="hidden" id="listadoLov" value="products"/>
	</c:if>
	<c:if test="${ not empty esAsync}">
	<input type="hidden" id="esAsync" value="${esAsync}"/>
	</c:if>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
	<!-- valores de llaves -->
    <input type="hidden" alt="notForSubmit" id="prodId" name="prodId" value=""/>
	 <input type="hidden" id="expo" name="expo" value=""/>  



<%@ include file="/WEB-INF/global/jsp/mensajes-globales-bootstrap.jsp" %>

<c:if test="${ not empty busquedaEnllavador}">
	<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em; font-size: 85%;"> 
	<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
 	<strong><fmt:message key="globales.listado.etiqueta.tipLov.titulo"/></strong>&nbsp;<fmt:message key="globales.listado.etiqueta.tipLov.mensaje"/>
	</p>
</div>
</c:if>
<!-- botones de acciones basicas -->
<div class="row">
<div class="btn-group hidden-xs" role="group" aria-label="Acciones">
<c:if test="${ empty busquedaEnllavador}">
	<c:if test="${restriccion.verDisponible}">
	<button id="btnVer" class="btn btn-default" type="button"  name="ver" onClick="if(isValueSelected()){ doSubmit('products/ver'); }"><fmt:message key="globales.listado.boton.ver"/></button>
	</c:if>
	<c:if test="${restriccion.crearDisponible}">
	<button id="btnCrear" class="btn btn-default " type="button"  name="crear" onClick="doSubmit('products/crear');"><fmt:message key="globales.listado.boton.crear"/></button>
	</c:if>
	<c:if test="${restriccion.actualizarDisponible}">	
	<button id="btnActualizar" class="btn btn-default " type="button"  name="actualizar" onClick="if(isValueSelected()){ doSubmit('products/actualizar'); }"><fmt:message key="globales.listado.boton.actualizar"/></button>
	</c:if>
	<c:if test="${restriccion.eliminarDisponible}">
	<button id="btnEliminar" class="btn btn-default " type="button"  name="eliminar" onClick="if(isValueSelected()){dialogConfirmDelete();}"><fmt:message key="globales.listado.boton.eliminar"/></button>
	</c:if>
	</c:if>
<c:if test="${ not empty busquedaEnllavador}">
	<c:if test="${restriccion.crearDisponible}">
	<button id="btnCrear" class="btn btn-default " type="button"  name="crear" onClick="doSubmit('products/crear');"><fmt:message key="globales.listado.boton.crear"/></button>
	</c:if>
	<button id="btnSeleccionar" class="btn btn-default " type="button"  name="seleccionar" onClick="if(isValueSelected()){ doSubmit('products/buscarSeleccionar'); }"><fmt:message key="globales.listado.boton.seleccionar"/></button>
	<button id="btnCancelar" class="btn btn-default " type="button"  name="cancel" onClick="doSubmit('products/cancelarBuscar');"><fmt:message key="globales.listado.boton.cancelar"/></button>
</c:if>
	<c:if test="${restriccion.filtrarDisponible}">	
	<button id="btnFiltrar" class="btn btn-default " type="button"  name="filter" onClick="doSubmit('products/filtrar');"><fmt:message key="globales.listado.boton.filtrar"/></button>
	</c:if>	
	
</div>
<div class="btn-group visible-xs" role="group" aria-label="Acciones">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Acciones<span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
	<c:if test="${ empty busquedaEnllavador}">
	<c:if test="${restriccion.verDisponible}">
	<li><a href="#" onClick="if(isValueSelected()){ doSubmit('products/ver'); }"><fmt:message key="globales.listado.boton.ver"/></a></li>
	</c:if>
	<c:if test="${restriccion.crearDisponible}">
	<li><a  href="#" onClick="doSubmit('products/crear');"><fmt:message key="globales.listado.boton.crear"/></a></li>
	</c:if>
	<c:if test="${restriccion.actualizarDisponible}">	
	<li><a   href="#"onClick="if(isValueSelected()){ doSubmit('products/actualizar'); }"><fmt:message key="globales.listado.boton.actualizar"/></a></li>
	</c:if>
	<c:if test="${restriccion.eliminarDisponible}">
	<li><a  href="#" onClick="if(isValueSelected()){dialogConfirmDelete();}"><fmt:message key="globales.listado.boton.eliminar"/></a></li>
	</c:if>
	<li><a  href="#" onClick="if(isValueSelected()){ doSubmit('products/detalle'); }"><fmt:message key="globales.listado.boton.detalle"/></a></li>
	</c:if>
<c:if test="${ not empty busquedaEnllavador}">
	<c:if test="${restriccion.crearDisponible}">
	<li><button id="btnCrear" class="btn btn-link btn-responsive" type="button"  name="crear" onClick="doSubmit('products/crear');"><fmt:message key="globales.listado.boton.crear"/></button></li>
	</c:if>
	<li><button id="btnSeleccionar" class="btn btn-link btn-responsive" type="button"  name="seleccionar" onClick="if(isValueSelected()){ doSubmit('products/buscarSeleccionar'); }"><fmt:message key="globales.listado.boton.seleccionar"/></button></li>
	<li><button id="btnCancelar" class="btn btn-link btn-responsive" type="button"  name="cancel" onClick="doSubmit('products/cancelarBuscar');"><fmt:message key="globales.listado.boton.cancelar"/></button></li>
</c:if>
	<c:if test="${restriccion.filtrarDisponible}">	
	<li><a href="#" onClick="doSubmit('products/filtrar');"><fmt:message key="globales.listado.boton.filtrar"/></a></li>
	</c:if>	
  </ul>
</div>
<div class="btn-group pull-right" role="group" aria-label="Pagineo">	
<c:if test="${navegacion.paginaAnterior}">				
	<button id="btnAnterior" class="btn btn-default " type="button" name="anterior" onClick="$('#movimientoPagina').val('anterior');doSubmit('products/listado')"><span class="visible-xs">&laquo;</span><span class="hidden-xs"><fmt:message key="globales.listado.boton.anterior"/></span></button>
</c:if>
<c:if test="${!navegacion.paginaAnterior}">			
	<button id="btnAnterior" class="btn btn-default " type="button" name="anterior" disabled="disabled"><span class="visible-xs">&laquo;</span><span class="hidden-xs"><fmt:message key="globales.listado.boton.anterior"/></span></button>
</c:if>
<c:if test="${not empty navegacion.listadoPaginas}">
<c:forEach items="${navegacion.listadoPaginas}" var="p">
	<c:if test="${p == navegacion.noPaginaActual}">
	<button id="pag<c:out value="${p}" />" class="btn btn-default " type="button" name="pag<c:out value="${p}" />" disabled="disabled"><c:out value="${p}" /></button>
	</c:if>
	<c:if test="${p != navegacion.noPaginaActual}">
	<button id="pag<c:out value="${p}" />"  onClick="$('#movimientoPagina').val('${p}');doSubmit('products/listado')" class="btn btn-default " type="button" name="pag<c:out value="${p}"/>"><c:out value="${p}" /></button>	
	</c:if> 
</c:forEach>
</c:if>
<c:if test="${navegacion.paginaSiguiente}">			
	<button id="btnSiguiente" class="btn btn-default " type="button" name="siguiente" onClick="$('#movimientoPagina').val('siguiente');doSubmit('products/listado')" ><span class="visible-xs">&raquo;</span><span class="hidden-xs"><fmt:message key="globales.listado.boton.siguiente"/></span></button>
</c:if>
<c:if test="${!navegacion.paginaSiguiente}">			
	<button id="btnSiguiente" class="btn btn-default " type="button" name="siguiente" disabled="disabled"><span class="visible-xs">&raquo;</span><span class="hidden-xs"><fmt:message key="globales.listado.boton.siguiente"/></span></button>
</c:if>
	
</div>
</div>
<br/>

<div class="row">

<div class="form-group form-inline pull-left " >
<c:if test="${ not empty orden}">
	<div style="display:block; float: left;">
		<button id="btnRemoverOrden" type="button"  class="btn btn-default" name="cancel" onClick="doSubmit('products/removerOrdenamiento');"><fmt:message key="globales.listado.boton.removerOrden"/></button>
	</div>
</c:if>
<c:if test="${navegacion.filtroAplicado}">
	<div style="display:block; float: left;">
		<button id="btnRemoverFiltro" type="button" class="btn btn-default" name="nofilter" onClick="doSubmit('products/removerFiltrar');"><fmt:message key="globales.listado.boton.removerFiltro"/></button>
	</div>			
</c:if>
</div>
<div class="form-group form-inline pull-right hidden-xs" >
	<div id="crudTable_filter" style="display: block; text-align: right; float: right; margin-top: 6px; margin-bottom: 6px;"> 
		<fmt:message key="globales.listado.etiqueta.busquedaRapida"/>
		<select id="campoBusqueda" name="campoBusqueda" onchange="doBusquedaRapida('#busqueda', this.value, $('option:selected', this));" class="form-control">
			<option value="category"><fmt:message key="products.listado.etiqueta.Category"/></option>
			<option value="title"><fmt:message key="products.listado.etiqueta.Title"/></option>
			<option value="actor"><fmt:message key="products.listado.etiqueta.Actor"/></option>
			<option value="special"><fmt:message key="products.listado.etiqueta.Special"/></option>
			<option value="commonProdId"><fmt:message key="products.listado.etiqueta.CommonProdId"/></option>
		</select> &nbsp;
		<input onkeypress="doFiltrarPor('products', event)" type="text" id="busqueda" name="busqueda" class="form-control" style="width:150px; height: 32px;"/>
	</div>
</div>
</div>
<c:if test="${restriccion.listadoDisponible or not empty busquedaEnllavador}">
<div class="row">
<div class="panel panel-default">
<div class="panel-heading " ><strong><fmt:message key="products.listado.etiqueta.titulo"/></strong></div>
<div class="table-responsive">
<table id="crudTable" width="100%" class="table table-condensed table-bordered  table-hover table-striped" >
	<thead>
		<tr>
  			<th onclick="doSort('category','${nombre}')" sort="${orden.mapaDeValores['category'].strOrden}"><fmt:message key="products.listado.etiqueta.Category"/><c:if test="${orden.mapaDeValores['category'].strOrden == 'DESC'}"><span class="pull-right glyphicon glyphicon-triangle-bottom"></span></c:if><c:if test="${orden.mapaDeValores['category'].strOrden == 'ASC'}"><span class="pull-right glyphicon glyphicon-triangle-top"></span></c:if></th>
  			<th onclick="doSort('title','${nombre}')" sort="${orden.mapaDeValores['title'].strOrden}"><fmt:message key="products.listado.etiqueta.Title"/><c:if test="${orden.mapaDeValores['title'].strOrden == 'DESC'}"><span class="pull-right glyphicon glyphicon-triangle-bottom"></span></c:if><c:if test="${orden.mapaDeValores['title'].strOrden == 'ASC'}"><span class="pull-right glyphicon glyphicon-triangle-top"></span></c:if></th>
  			<th onclick="doSort('actor','${nombre}')" sort="${orden.mapaDeValores['actor'].strOrden}"><fmt:message key="products.listado.etiqueta.Actor"/><c:if test="${orden.mapaDeValores['actor'].strOrden == 'DESC'}"><span class="pull-right glyphicon glyphicon-triangle-bottom"></span></c:if><c:if test="${orden.mapaDeValores['actor'].strOrden == 'ASC'}"><span class="pull-right glyphicon glyphicon-triangle-top"></span></c:if></th>
  			<th onclick="doSort('price','${nombre}')" sort="${orden.mapaDeValores['price'].strOrden}"><fmt:message key="products.listado.etiqueta.Price"/><c:if test="${orden.mapaDeValores['price'].strOrden == 'DESC'}"><span class="pull-right glyphicon glyphicon-triangle-bottom"></span></c:if><c:if test="${orden.mapaDeValores['price'].strOrden == 'ASC'}"><span class="pull-right glyphicon glyphicon-triangle-top"></span></c:if></th>
  			<th onclick="doSort('special','${nombre}')" sort="${orden.mapaDeValores['special'].strOrden}"><fmt:message key="products.listado.etiqueta.Special"/><c:if test="${orden.mapaDeValores['special'].strOrden == 'DESC'}"><span class="pull-right glyphicon glyphicon-triangle-bottom"></span></c:if><c:if test="${orden.mapaDeValores['special'].strOrden == 'ASC'}"><span class="pull-right glyphicon glyphicon-triangle-top"></span></c:if></th>
  			<th onclick="doSort('commonProdId','${nombre}')" sort="${orden.mapaDeValores['commonProdId'].strOrden}"><fmt:message key="products.listado.etiqueta.CommonProdId"/><c:if test="${orden.mapaDeValores['commonProdId'].strOrden == 'DESC'}"><span class="pull-right glyphicon glyphicon-triangle-bottom"></span></c:if><c:if test="${orden.mapaDeValores['commonProdId'].strOrden == 'ASC'}"><span class="pull-right glyphicon glyphicon-triangle-top"></span></c:if></th>
		</tr>
	</thead>	
	<tbody>
<c:forEach items="${coleccionResultados}" var="dto">
		<tr onclick="$('#prodId').val('${dto.prodId}'); selectDeSelectObject(this, 'success'); sel = true; currentRow = $(this).parent().children().index($(this));">  
		<td><c:out value="${dto.category}"/></td>
		<td><c:out value="${dto.title}"/></td>
		<td><c:out value="${dto.actor}"/></td>
		<td><c:out value="${dto.price}"/></td>
		<td><c:out value="${dto.special}"/></td>
		<td><c:out value="${dto.commonProdId}"/></td>
		</tr>
</c:forEach>
	</tbody>
</table>
</div>

</c:if>
<div class="bg-primary">
	<c:if test="${navegacion.totalRegistros <= 0}">
		<fmt:message key="globales.listado.etiqueta.sinRegistros" />
    </c:if>
    <c:if test="${navegacion.totalRegistros > 0}">
    	<fmt:message key="globales.listado.etiqueta.numRegistros">
    		<fmt:param><c:out value="${navegacion.registroInicial}"/></fmt:param>
    		<fmt:param><c:out value="${navegacion.registroFinal}"/></fmt:param>
    		<fmt:param><c:out value="${navegacion.totalRegistros}"/></fmt:param>
    	</fmt:message>
    </c:if>	
</div>
</div>
</div>
<br/>
</div>
</form>
<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>
</fmt:bundle>