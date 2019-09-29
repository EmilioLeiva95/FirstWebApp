<c:if test="${ mensajesUsuario.mensajes }">

<c:if test="${mensajesUsuario.erroresGlobales}">
<div id="mensajesErrores" class="ui-state-error ui-corner-all" style="margin-top: 5px; margin-bottom: 5px; padding: 0 .7em; font-size: 0.8em;font-size: 80%;"> 
	<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em; margin-top: .3em;"></span>
	<span title="Cerrar" class="ui-widget ui-state-default css-right"><a href="#" onclick="$('#mensajesErrores').fadeOut('fast');"><span class="ui-icon ui-icon-close" style="float: right; margin-right: .3em; margin-top: .3em;"></span></a></span> 
	<strong>Error:</strong>  
	<ul style="margin: 2px;">
   	<c:forEach items="${mensajesUsuario.mensajesDeError}" var="error">
      	<li><c:out value="${error}" escapeXml="false" /></li>
   	</c:forEach>
   	</ul>
</div>
</c:if>
<c:if test="${mensajesUsuario.advertencias}">
<div id="mensajesAdvertencias" class="ui-state-error ui-corner-all" style="margin-top: 5px; margin-bottom: 5px; padding: 0 .7em; font-size: 0.8em;font-size: 80%;"> 
	<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em; margin-top: .3em;"></span> 
	<span title="Cerrar" class="ui-widget ui-state-default css-right"><a href="#" onclick="$('#mensajesAdvertencias').fadeOut('fast');"><span class="ui-icon ui-icon-close" style="float: right; margin-right: .3em; margin-top: .3em;"></span></a></span>
	<strong>Advertencia:</strong> 
	<ul style="margin: 2px;">
   	<c:forEach items="${mensajesUsuario.mensajesDeAdvertencia}" var="advertencia">
	   <li><c:out value="${advertencia}" escapeXml="false" /></li>
	</c:forEach>
   	</ul>
	
</div>
</c:if>
<c:if test="${mensajesUsuario.satisfactorios}">
<div id="mensajesSatisfactorios" class="ui-state-highlight ui-corner-all" style="margin-top: 5px; margin-bottom: 5px; padding: 0 .1em; font-size: 80%;"> 
	<span title="Cerrar" class="ui-icon ui-icon-info" style="float: left; margin-right: .3em; margin-top: .3em;"></span>
	<span class="ui-widget ui-state-default css-right"><a href="#" onclick="$('#mensajesSatisfactorios').fadeOut('fast');"><span class="ui-icon ui-icon-close" style="float: right; margin-right: .3em; margin-top: .3em;"></span></a></span> 
	<strong>Mensajes</strong> 
	<ul style="margin: 2px;">
  	<c:forEach items="${mensajesUsuario.mensajesDeSatisfaccion}" var="satisfactorio">
	  <li><c:out value="${satisfactorio}" escapeXml="false" /></li>
	</c:forEach>
   	</ul>
</div>
</c:if>

</c:if>