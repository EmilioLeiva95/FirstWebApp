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
<div id="mainContent">	
	<div id="iTitle" class="ui-state-default ui-widget-content ui-corner-all" style="text-align: center;">
		
	</div>

	<br/>
	
	<div align="center">
	
		<div class="ui-widget ui-widget-content">
			Ha ocurrido un error inesperado.
		</div>
		
		<div class="ui-state-error">
			${exception}
		</div>
		
	</div>
</div>
				
			

	

<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp" %>