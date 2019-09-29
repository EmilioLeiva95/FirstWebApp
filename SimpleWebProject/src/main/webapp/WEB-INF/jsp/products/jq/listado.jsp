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
<%@ include file="/WEB-INF/global/jsp/jq-header.jsp" %>
<!-- Elementos no visibles -->	
	
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
	<li><fmt:message key="products.bc.etiqueta.principal" /></li>
</ul>
</div>
	<input type="hidden" name="id_ubicacion_retorno" id="id_ubicacion_retorno" value=""/>
</div>

<c:if test="${ not empty detalle.cabecera}">
    <jsp:include page="/WEB-INF/jsp/${detalle.cabecera.locacion}/jq/cabecera.jsp" />
</c:if>
	
<div id="mainContent">
    <div id="iTitle" class="ui-state-default ui-widget-content ui-corner-all">
    	<fmt:message key="products.listado.etiqueta.titulo"/>
    </div>
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



<%@ include file="/WEB-INF/global/jsp/mensajes-globales.jsp" %>

<c:if test="${ not empty busquedaEnllavador}">
	<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em; font-size: 85%;"> 
	<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
 	<strong><fmt:message key="globales.listado.etiqueta.tipLov.titulo"/></strong>&nbsp;<fmt:message key="globales.listado.etiqueta.tipLov.mensaje"/>
	</p>
</div>
</c:if>
<!-- botones de acciones basicas -->
<div id="action-buttons">
<div id="action-bar">
<c:if test="${ empty busquedaEnllavador}">
	<c:if test="${restriccion.verDisponible}">
	<button id="btnVer" type="button" class="ui-button ui-corner-all ui-button-color" name="ver" onClick="if(isValueSelected()){ doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/ver'); }"><fmt:message key="globales.listado.boton.ver"/></button>
	</c:if>
	<c:if test="${restriccion.crearDisponible}">
	<button id="btnCrear" type="button" class="ui-button ui-corner-all ui-button-color" name="crear" onClick="doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/crear');"><fmt:message key="globales.listado.boton.crear"/></button>
	</c:if>
	<c:if test="${restriccion.actualizarDisponible}">	
	<button id="btnActualizar" type="button" class="ui-button ui-corner-all ui-button-color" name="actualizar" onClick="if(isValueSelected()){ doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/actualizar'); }"><fmt:message key="globales.listado.boton.actualizar"/></button>
	</c:if>
	<c:if test="${restriccion.eliminarDisponible}">
	<button id="btnEliminar" type="button" class="ui-button ui-corner-all ui-button-color" name="eliminar" onClick="if(isValueSelected()){$('#dialog-confirm').dialog('open');}"><fmt:message key="globales.listado.boton.eliminar"/></button>
	</c:if>
	</c:if>
<c:if test="${ not empty busquedaEnllavador}">
	<c:if test="${restriccion.crearDisponible}">
	<button id="btnCrear" type="button" class="ui-button ui-corner-all ui-button-color" name="crear" onClick="doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/crear');"><fmt:message key="globales.listado.boton.crear"/></button>
	</c:if>
	<button id="btnSeleccionar" type="button" class="ui-button ui-corner-all ui-button-color" name="seleccionar" onClick="if(isValueSelected()){ doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/buscarSeleccionar'); }"><fmt:message key="globales.listado.boton.seleccionar"/></button>
	<button id="btnCancelar" type="button" class="ui-button ui-corner-all ui-button-color" name="cancel" onClick="doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/cancelarBuscar');"><fmt:message key="globales.listado.boton.cancelar"/></button>
</c:if>
	<c:if test="${restriccion.filtrarDisponible}">	
	<button id="btnFiltrar" type="button" class="ui-button ui-corner-all ui-button-color" name="filter" onClick="doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/filtrar');"><fmt:message key="globales.listado.boton.filtrar"/></button>
	</c:if>	
	
</div>
<div id="navigation-bar">	
<c:if test="${navegacion.paginaAnterior}">				
	<button id="btnAnterior" type="button" name="anterior" onClick="$('#movimientoPagina').val('anterior');doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/listado')"><fmt:message key="globales.listado.boton.anterior"/></button>
</c:if>
<c:if test="${!navegacion.paginaAnterior}">			
	<button id="btnAnterior" type="button" name="anterior" disabled="disabled"><fmt:message key="globales.listado.boton.anterior"/></button>
</c:if>
<c:if test="${not empty navegacion.listadoPaginas}">
<c:forEach items="${navegacion.listadoPaginas}" var="p">
	<c:if test="${p == navegacion.noPaginaActual}">
	<button id="pag<c:out value="${p}" />" class="ui-button-text ui-state-highlight" type="button" name="pag<c:out value="${p}" />" disabled="disabled"><c:out value="${p}" /></button>
	</c:if>
	<c:if test="${p != navegacion.noPaginaActual}">
	<button id="pag<c:out value="${p}" />"  onClick="$('#movimientoPagina').val('${p}');doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/listado')" type="button" name="pag<c:out value="${p}"/>"><c:out value="${p}" /></button>	
	</c:if> 
</c:forEach>
</c:if>
<c:if test="${navegacion.paginaSiguiente}">			
	<button id="btnSiguiente" type="button" name="siguiente" onClick="$('#movimientoPagina').val('siguiente');doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/listado')" ><fmt:message key="globales.listado.boton.siguiente"/></button>
</c:if>
<c:if test="${!navegacion.paginaSiguiente}">			
	<button id="btnSiguiente" type="button" name="siguiente" disabled="disabled"><fmt:message key="globales.listado.boton.siguiente"/></button>
</c:if>
	
</div>
</div>
<br/>

<div class="ui-widget fg-toolbar ui-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix">

<c:if test="${ not empty orden}">
	<div style="display:block; float: left;">
		<button id="btnRemoverOrden" type="button" class="ui-button ui-corner-all ui-button-color" name="cancel" onClick="doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/removerOrdenamiento');"><fmt:message key="globales.listado.boton.removerOrden"/></button>
	</div>
</c:if>
<c:if test="${navegacion.filtroAplicado}">
	<div style="display:block; float: left;">
		<button id="btnRemoverFiltro" type="button" class="ui-button ui-corner-all ui-button-color" name="nofilter" onClick="doSubmit<c:if test="${ not empty detalle.cabecera || not empty esAsync}">Async</c:if>('products/removerFiltrar');"><fmt:message key="globales.listado.boton.removerFiltro"/></button>
	</div>			
</c:if>
	<div id="crudTable_filter" style="display: block; text-align: right; float: right; margin-top: 6px; margin-bottom: 6px;"> 
		<fmt:message key="globales.listado.etiqueta.busquedaRapida"/>
		<select id="campoBusqueda" name="campoBusqueda" onchange="doBusquedaRapida('#busqueda', this.value, $('option:selected', this));" class="ui-widget ui-widget-content ui-state-default">
			<option value="category"><fmt:message key="products.listado.etiqueta.Category"/></option>
			<option value="title"><fmt:message key="products.listado.etiqueta.Title"/></option>
			<option value="actor"><fmt:message key="products.listado.etiqueta.Actor"/></option>
			<option value="special"><fmt:message key="products.listado.etiqueta.Special"/></option>
			<option value="commonProdId"><fmt:message key="products.listado.etiqueta.CommonProdId"/></option>
		</select> &nbsp;
		<input onkeypress="doFiltrarPor('products', event)" type="text" id="busqueda" name="busqueda" class="ui-widget ui-widget-content " style="width:150px; height: 18px;"/>
	</div>
</div>
<c:if test="${restriccion.listadoDisponible or not empty busquedaEnllavador}">
<table id="crudTable" width="100%">
	<thead>
		<tr>
  			<th onclick="doSort('category','${nombre}')" sort="${orden.mapaDeValores['category'].strOrden}"><fmt:message key="products.listado.etiqueta.Category"/></th>
  			<th onclick="doSort('title','${nombre}')" sort="${orden.mapaDeValores['title'].strOrden}"><fmt:message key="products.listado.etiqueta.Title"/></th>
  			<th onclick="doSort('actor','${nombre}')" sort="${orden.mapaDeValores['actor'].strOrden}"><fmt:message key="products.listado.etiqueta.Actor"/></th>
  			<th onclick="doSort('price','${nombre}')" sort="${orden.mapaDeValores['price'].strOrden}"><fmt:message key="products.listado.etiqueta.Price"/></th>
  			<th onclick="doSort('special','${nombre}')" sort="${orden.mapaDeValores['special'].strOrden}"><fmt:message key="products.listado.etiqueta.Special"/></th>
  			<th onclick="doSort('commonProdId','${nombre}')" sort="${orden.mapaDeValores['commonProdId'].strOrden}"><fmt:message key="products.listado.etiqueta.CommonProdId"/></th>
		</tr>
	</thead>	
	<tbody>
<c:forEach items="${coleccionResultados}" var="dto">
		<tr onclick="$('#prodId').val('${dto.prodId}'); selectDeSelectObject(this, 'ui-state-active'); sel = true; currentRow = $(this).parent().children().index($(this));">  
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
</c:if>
<div class="ui-widget fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
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
<br/>
</div>
</form>
<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>
</fmt:bundle>