<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="ui-widget ui-corner-bottom ui-widget-content ui-state-highlight" align="left" style="margin-left: 8px; margin-right: 8px; height: 73px;" ><img src="${ctx}/include/images/banner.png"/></div>
		
<div class="ui-widget ui-corner-bottom ui-state-default" style="position: absolute; right: 10px; top: 0px; height: 25px; padding: 0px 10px;">
	<table style="font-size: 12px;">
		<tr>
			<td align="right"><span>Usuario: </span></td>
			<td>
				<span style="font-weight: bold;"> <c:out escapeXml="false" value="${sessionScope['OBJETO_USUARIO'].nombre}"/>  (<c:out value="${sessionScope['OBJETO_USUARIO'].login}"/>)</span>
			</td>
		</tr>
	</table> 
</div>