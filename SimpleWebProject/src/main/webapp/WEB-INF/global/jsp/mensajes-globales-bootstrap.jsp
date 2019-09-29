
<script>
window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 60000);
</script>

<c:if test="${ mensajesUsuario.mensajes }">

<c:if test="${mensajesUsuario.erroresGlobales}">
<div id="mensajesErrores"  class="alert alert-danger alert-dismissible" role="alert"> 
	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> 
	<strong>Error:</strong>  
	<ul style="margin: 2px;">
   	<c:forEach items="${mensajesUsuario.mensajesDeError}" var="error">
      	<li><c:out value="${error}" escapeXml="false" /></li>
   	</c:forEach>
   	</ul>
</div>
</c:if>
<c:if test="${mensajesUsuario.advertencias}">
<div id="mensajesAdvertencias" class="alert alert-warning alert-dismissible" role="alert"> 
	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<strong>Advertencia:</strong> 
	<ul style="margin: 2px;">
   	<c:forEach items="${mensajesUsuario.mensajesDeAdvertencia}" var="advertencia">
	   <li><c:out value="${advertencia}" escapeXml="false" /></li>
	</c:forEach>
   	</ul>
	
</div>
</c:if>
<c:if test="${mensajesUsuario.satisfactorios}">
<div id="mensajesSatisfactorios" class="alert alert-success alert-dismissible" role="alert"> 
	 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<strong>Mensajes</strong> 
	<ul style="margin: 2px;">
  	<c:forEach items="${mensajesUsuario.mensajesDeSatisfaccion}" var="satisfactorio">
	  <li><c:out value="${satisfactorio}" escapeXml="false" /></li>
	</c:forEach>
   	</ul>
</div>
</c:if>

</c:if>