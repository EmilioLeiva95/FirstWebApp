<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${locale}" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">
	
<c:set var="ubicacion" value="crear"/>
<c:set var="primerCampo" value="claveActual"/>
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header-sin-menu.jsp" %>

	
<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post">

<div id="mainContent">
<div class="panel panel-default">
  <div class="panel-body">
    <fmt:message key="cambioClave.formulario.etiqueta.caducada.titulo"/>
  </div>
</div>
</div>
	<input type="hidden" id="pageLoc" name="pageLoc" value="actualizar"/>
	<input type="hidden" id="primerCampo" name="primerCampo" value="claveActual"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
    
    <input type="hidden" id="idUsuario" name="idUsuario" value="${cambioClave.idUsuario}"/>
	<!-- valores de llaves -->
	
	


<!-- mensajes de error-->
<div id="mensajesSatisfactorios" class="ui-state-highlight ui-corner-all" style="margin-top: 5px; margin-bottom: 5px; padding: 0 .1em; font-size: 80%;"> 
	<span title="Cerrar" class="ui-icon ui-icon-info" style="float: left; margin-right: .3em; margin-top: .3em;"></span>
	<span class="ui-widget ui-state-default css-right"><a href="#" onclick="$('#mensajesSatisfactorios').fadeOut('fast');"><span class="ui-icon ui-icon-close" style="float: right; margin-right: .3em; margin-top: .3em;"></span></a></span>
	<div class="alert alert-danger"> 
	<strong><fmt:message key="cambioClave.formulario.etiqueta.caducada.mensajes"/></strong> 
	<ul style="margin: 2px;">
	  <li>
	  <fmt:message key="cambioClave.formulario.etiqueta.caducada.mensaje"/>
	  </li>
   	</ul>
   	</div>
</div>
<c:if test="${mensajesUsuario.erroresGlobales}">
<div class="ui-state-error ui-corner-all" style="padding: 0 .7em; font-size: 0.8em;"> 
	<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em; margin-top: .3em;"></span> 
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
<%--     <button tabindex="10" class="btn btn-success" id="btnGuardar" type="submit" name="actualizar" onClick="doSubmit('cambioClave/ejecutarCambioClave');"><fmt:message key="globales.formulario.boton.actualizar.guardar"/></button> --%>
</div>
</div>
<br />

<!-- datos de formulario -->

<div style="float: none;margin-left: 5%;margin-right: 5%;"><span style="font-size: small;">-Los campos marcados con * son obligatorios</span></div>
<div class="row">
<div class="panel panel-default" style="float: none;margin-left: 4%;margin-right: 4%;">
	<div class="panel-heading" ><strong>
			<fmt:message key="cambioClave.formulario.etiqueta.caducada.titulo"/>
			</strong>
		</div>
		<div style="display: inline;" id="formInput">
		<br/>
	<div class="form-group" >
		<label class="col-sm-2 control-label"> 
               <fmt:message key="cambioClave.formulario.etiqueta.usuario"/></label>	 
		
		<span class="formvalue" >
 			${cambioClave.login}	  
 		</span>
	</div>
	<div class="form-group" >
		<label class="col-sm-2 control-label"> 
               <fmt:message key="cambioClave.formulario.etiqueta.nombre"/></label>	 
		
		<span class="formvalue" >
 			${cambioClave.nombre}	  
 		</span>
	</div>
	<div class="form-group" >
		<label class="col-sm-2 control-label" style="color: #AA0707;""> 
               <fmt:message key="cambioClave.formulario.etiqueta.claveActual"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
		
		<span class="forminput" style="display: inline">
 			  <input tabindex="1" type="password" id="claveActual" name="claveActual" size="50"/>
 			</span>
		<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['claveActual'].mensaje}" var="mensaje">
		<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
		</c:forEach>
	</div>
	<div class="form-group" >
		<label class="col-sm-2 control-label" style="color: #AA0707;"> 
               <fmt:message key="cambioClave.formulario.etiqueta.claveNueva"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
		
		<span class="forminput" style="display: inline">
 			  <input tabindex="2" type="password" id="claveNueva" name="claveNueva" size="50"/>
 			</span>
		<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['claveNueva'].mensaje}" var="mensaje">
		<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
		</c:forEach>
	</div>
	<div class="form-group" >
		<label class="col-sm-2 control-label" style="color: #AA0707;"> 
               <fmt:message key="cambioClave.formulario.etiqueta.confirmacionClave"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
		
		<span class="forminput" style="display: inline">
 			  <input tabindex="3" type="password" id="confirmacionClave" name="confirmacionClave" size="50"/>
 			</span>
		<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['confirmacionClave'].mensaje}" var="mensaje">
		<span style="font-size: 90%; vertical-align: top;" class="ui-state-error"> <c:out value="${mensaje}" escapeXml="false"/> </span>
		</c:forEach>
	</div>
</div>
	<div class="panel-footer">
		<button tabindex="10" class="btn btn-success" id="btnGuardar" type="submit" name="actualizar" onClick="doSubmit('cambioClave/ejecutarCambioClave');"><fmt:message key="globales.formulario.boton.actualizar.guardar"/></button>
	</div>		
</div>
</div>
</form>

<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>
</fmt:bundle>
