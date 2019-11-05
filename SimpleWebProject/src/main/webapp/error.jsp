<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mainDisplay" value="Ingreso a configuracion de la aplicacion"/>
<%@ include file="/WEB-INF/global/jsp/jq-header.jsp" %>
<%

Throwable ex = (Throwable)request.getAttribute("exception");
String stacktrace =  null;
if(ex!=null){
	ByteArrayOutputStream bout = new ByteArrayOutputStream();
	PrintWriter pr = new PrintWriter(bout);
	ex.printStackTrace(pr);
	pr.flush();
	pr.close();
	bout.flush();
	stacktrace = new String(bout.toByteArray());
	request.setAttribute("stacktrace", stacktrace);
}
%>


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
<div id="mainContent">

<h3 class="ui-widget ui-state-error-text" style="text-align: center; font-size: large;"> ERROR </h3>

<div class="ui-widget ui-state-error" style="text-align: center;">

	<div style="text-align: center; position: relative; float: left; left: 10px; top: 10px;"> 
		<img alt="Restringido" src="${ctx}/include/images/stop.png">
	</div>

	Ha ocurrido un error inesperado.
	<br />
	<c:if test="${not empty message}">
	<p>	
	<strong> Detalle: <br /></strong>
		<c:out value="${message}"></c:out>
	</p>	
	</c:if>
	
	<p>	
	<strong> Stacktrace: <br /></strong>
	<pre>
	  <%=stacktrace %>
	</pre>
	</p>	
	
	
</div>
</div>

</body>
</html>