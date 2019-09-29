<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mainDisplay" value="Ingreso a configuracion de la aplicacion"/>
<%@ include file="/WEB-INF/global/jsp/jq-header.jsp" %>

<style type="text/css">
	.message {
		background: #FCE9C0 url(include/images/alert.png) left no-repeat;
		background-position: 15px;
		border-top: 2px solid #DBAC48;
		border-bottom: 2px solid #DBAC48;
		padding: 15px 10px 15px 50px;
		font-family: Lucida Grande, Lucida Sans, Arial, sans-serif; 
		font-size: 1em;
	}
</style>




<br />
<div style="text-align: center;"> 
	<img alt="Restringido" src="${ctx}/include/images/stop.png">
</div>
<h3 class="ui-widget ui-state-error-text" style="text-align: center; font-size: large;"> ERROR </h3>
<br />
<div class="ui-widget ui-state-error" style="text-align: center;">

	Ha ocurrido un error inesperado.
	<br />
	<c:if test="${not empty f_message}">
	<p>	
	<strong> Detalle: <br /></strong>
		<c:out value="${f_message}"></c:out>
	</p>	
	</c:if>
	<button onclick="history.go(-1);">Regresar</button>
</div>


</body>
</html>