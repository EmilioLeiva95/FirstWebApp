<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>

<% int counter = 0; %>
<%@ include file="/WEB-INF/global/jsp/jq-header.jsp" %>

<style>
	body{
		font: 100%/1.45em "Lucida Grande", Verdana, Arial, Helvetica, sans-serif;
		color: #111;
	}
</style>
<script>
	$(document).ready(function(){
		
	});
</script>
<body>
	
	<div id="iTitle" class="ui-state-default ui-widget-content ui-corner-all" style="text-align: center;">
		La F&aacute;brica de Software
	</div>

	<br/>
	
	<div align="center">
	
		<div class="ui-widget ui-widget-content">
			Ha ocurrido una excepcion en la Capa de Acceso de Datos.
		</div>
		
		<div class="ui-state-error">
			Error SQL : {exception.sqlException}
			<br />
		</div>
	</div>
	
				
			

	

<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>