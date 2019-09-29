<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html> 

<%-- <%@ include file="/WEB-INF/global/jsp/jq-header.jsp" %> --%>
<head>

<c:if test="${_USUARIO_TARJETAS_['controlHorario'] == 'N'}">
</c:if>
</head>
<style>
.obs{
	vertical-align: center;
}
.profile{
	border: 2px dotted #CDCDCD; 
	width: 800px;
	height: 300px;
}
.column-obs{
	width: 70%;
	vertical-align: top;
}
.column-img{
	width: 30%;
}
</style>

<script>




</script>

<%-- <%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %>  --%>

<div style="vertical-align: center;">

</div>
<!-- <div align="center" style="width: 100%"> -->
 
<!-- </div> -->
 
NO HAY MENU 
<!-- <div id="logo" align="center"> -->
<%-- <img alt="watermark" src="${ctx}/include/images/blank_watermark.png"> --%>
<!-- </div> -->
</html>