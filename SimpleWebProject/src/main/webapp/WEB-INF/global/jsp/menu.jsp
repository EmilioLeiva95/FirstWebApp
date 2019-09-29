
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/global/jsp/jq-header.jsp" %>
	<style type="text/css">
		a {
			text-decoration: none;
		}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function($){
		$("#selectable div").each(function(){
			$(this).click(function(){
				$("#selectable div").each(function(){
					$(this).removeClass("ui-state-highlight");
				});
				$(this).addClass("ui-state-highlight");
			});
		});	
	});
	</script>

<body>

<sec:authentication property="principal" var="user" scope="session"/>

<div class="ui-widget ui-widget-content ui-state-default" style="font-size: 0.7em; width: 180px;">
	<span style="font-weight: bolder; margin-top: 2px; margin-left: 3px;"> Usuario </span> <br />
	<span style="margin-left: 8px;"> ${user.username} </span>
</div>

	
<br />
	
<div id="selectable">	
	<c:forEach items="${menuItems}" var="m" >
	<a target="main" href="${ctx}${sPath}${m.enlace}/${ui}" >
	<div class="ui-widget ui-widget-content ui-state-default" style="font-size: 0.7em; width: 180px;">	
		<span style="margin-left: 5px;">${m.descripcion}</span>
	</div>
	</a>
	</c:forEach>
</div>

<br />

<form action="${ctx}${sPath}/application/theme" target="_parent" id="themeform">
	
	<div class="ui-widget">  Tema : </div>
	<select name="theme" id="theme" class="ui-state-default" style="font-size: 0.7em; width: 180px;" onchange="$('#themeform').submit();">
		<option value="eggplant" ${theme == 'eggplant' ? 'selected="selected"' : ''}>eggplant</option>
		<option value="flick" ${theme == 'flick' ? 'selected="selected"' : ''}>flick</option>
		<option value="mint-choc" ${theme == 'mint-choc' ? 'selected="selected"' : ''}>mint-choc</option>
		<option value="overcast" ${theme == 'overcast' ? 'selected="selected"' : ''}>overcast</option>
		<option value="redmond" ${theme == 'redmond' ? 'selected="selected"' : ''}>redmond</option>
		<option value="skyhigh" ${theme == 'skyhigh' ? 'selected="selected"' : ''}>skyhigh</option>
		<option value="start" ${theme == 'start' ? 'selected="selected"' : ''}>start</option>
		<option value="swanky-purse" ${theme == 'swanky-purse' ? 'selected="selected"' : ''}>swanky-purse</option>
		<option value="ui-lightness" ${theme == 'ui-lightness' ? 'selected="selected"' : ''}>ui-lightness</option>
	</select>
</form>

<br/>
<sec:authorize access="isAuthenticated()">
	<a target="_parent" style="text-decoration: none;" href='<spring:url value="/j_spring_security_logout" htmlEscape="true" />'>
	<div class="ui-widget ui-widget-content ui-state-default" style="width: 180px;">
		<span class="ui-icon ui-icon-key" style="float: left; margin-right: 3px;"> </span> 
		Logout
	</div>
	</a>
</sec:authorize>

</body>
</html>