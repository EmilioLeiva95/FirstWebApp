<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${locale}" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">
	
<c:set var="ubicacion" value="crear"/>
<c:set var="primerCampo" value="claveActual"/>
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %>

	
<form  name="mainForm" id="mainForm" action="${NewtPageRenderData.actionUrl}" method="post">

<!-- <div id="iTitle" class="ui-state-default ui-widget-content ui-corner-all"> -->
<%-- 	<fmt:message key="cambioClave.formulario.etiqueta.actualizar.titulo"/> --%>
<!-- </div> -->
	<input type="hidden" id="pageLoc" name="pageLoc" value="actualizar"/>
	<input type="hidden" id="primerCampo" name="primerCampo" value="claveActual"/>
    <input type="hidden" id="eag" name="eag" value="${eag}"/>
    <input type="hidden" id="movimientoPagina" name="movimientoPagina"/>
    <input type="hidden" id="columna" name="columna"/>
    <input type="hidden" id="fenixf31seguridad" name="fenixf31seguridad" value="<c:out value='${fenixf31seguridad}' />" />
    
    <input type="hidden" id="idUsuario" name="idUsuario" value="${cambioClave.idUsuario}"/>
	<!-- valores de llaves -->
	
	


<!-- mensajes de error-->
<c:if test="${mensajesUsuario.erroresGlobales}">
<div class="ui-state-error ui-corner-all" style="padding: 0 .7em; font-size: 0.8em;"> 
<!-- 	<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em; margin-top: .3em;"></span>  -->
	<div class="alert alert-danger"> 
	<strong><fmt:message key="globales.formulario.etiqueta.error"/></strong> <br /> 
	<ul>
		<c:forEach items="${mensajesUsuario.mensajesDeError}" var="mensaje">
        	<li><c:out value="${mensaje}" escapeXml="false"/></li>
     	</c:forEach>
	</ul>
	</div>
</div>
</c:if>

<br />

<!-- datos de formulario -->
<div class="row">	
<div class="panel panel-default" style="float: none;margin-left: 5%;margin-right: 5%;">
	<div class="panel-heading" ><strong>
		<fmt:message key="cambioClave.formulario.etiqueta.actualizar.titulo"/></strong>
	</div>
	<br/>
	<div class="form-group" >
		<label class="col-sm-2 control-label"  > 
               <fmt:message key="cambioClave.formulario.etiqueta.usuario"/></label>	 
		<span class="formvalue">
 			${cambioClave.login}	  
 		</span>
	</div>
	<div class="form-group" >
			<label class="col-sm-2 control-label"  > 
	               <fmt:message key="cambioClave.formulario.etiqueta.nombre"/>
	        </label>	
		<span class="formvalue ">
 			${cambioClave.nombre}	  
 		</span>
	</div>
	</br>
	
	<div class="form-group" >
		<label class="col-sm-2 control-label" style="color: #AA0707;" > 
               <fmt:message key="cambioClave.formulario.etiqueta.claveActual"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
		
			<div class="col-sm-5 form-inline" >
 			  <input class="form-control" tabindex="1" type="password" id="claveActual" name="claveActual" value="${claveActual}" size="50"/>
 			</div>
		<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['claveActual'].mensaje}" var="mensaje">
			<li > <c:out value="${mensaje}" escapeXml="false"/> </li>
		</c:forEach>
	</div>
	</br>
	</br>
	<div class="form-group" >
		<label class="col-sm-2 control-label" style="color: #AA0707;" > 
               <fmt:message key="cambioClave.formulario.etiqueta.claveNueva"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
		
			<div class="col-sm-5 form-inline" >
 			  <input class="form-control" tabindex="2" type="password" id="claveNueva" name="claveNueva" value="${claveNueva}" size="50"/>
 			</div>
		<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['claveNueva'].mensaje}" var="mensaje">
			<li > <c:out value="${mensaje}" escapeXml="false"/> </li>
		</c:forEach>
	</div>
	</br>
	</br>
	<div class="form-group" >
		<label class="col-sm-2 control-label" style="color: #AA0707;" > 
               <fmt:message key="cambioClave.formulario.etiqueta.confirmacionClave"/><fmt:message key="globales.formulario.etiqueta.requerido"/>			</label>	 
		
		<div class="col-sm-5 form-inline" >
 			  <input class="form-control" tabindex="3" type="password" id="confirmacionClave" value="${confirmacionClave}" name="confirmacionClave" size="50"/>
 			</div>
		<c:forEach items="${mensajesUsuario.mapaDeErroresEnPropiedades['confirmacionClave'].mensaje}" var="mensaje">
			<li> <c:out value="${mensaje}" escapeXml="false"/> </li>
		</c:forEach>
	</div>
	</br>
	</br>
	<div class="panel-footer">
	    <button class="btn btn-success" id="btnGuardar" type="submit" name="actualizar" onClick="doSubmit('cambioClave/ejecutarCambioClave');"><fmt:message key="globales.formulario.boton.actualizar.guardar"/></button>
		<button class="btn btn-danger" id="btnCancelar" type="button" name="cancel" onClick="doSubmit<c:if test="${ not empty detalle.cabecera}">Async</c:if>('cambioClave/cancelarCambioClave');"><fmt:message key="globales.formulario.boton.crear.cancelar"/></button>
	</div>		
</div>
</div>
</form>
<%-- <%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %> --%>
</fmt:bundle>
