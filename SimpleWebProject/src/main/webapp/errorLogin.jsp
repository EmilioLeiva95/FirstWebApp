<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mainDisplay" value="Ingreso a configuracion de la aplicacion"/>
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp"%>
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
	.pre{padding:8px;margin:0 10px 15px 35px;width:95%;font-size:13px;line-height:1;color:inherit;white-space:pre;background-color:#fff;border:2px solid #e7e9ec;border-radius:6px}
</style>


<div id="mainContent" style="background-color:#f2f2f2;height:100%">

<p style="text-align: center; font-size: 14px;color:#cd0a0a;"><b>NOTIFICACIÓN</b>  </p>

<div class="ui-widget ui-state-error" style="text-align: center;border:1px solid #cd0a0a; background-color:#fff7f4">


	<div style="color:#cd0a0a;font-size:12px">Estimado Usuario:</div>
	
	
	
	
	<strong><br /></strong>
	<label class="pre" style="font-size: 16px; background-color:#f5f5f5"><c:out  value="${errorActual}" />
	</label>
	<br>
	
	<div style="margin:0 10px 10px 35px;text-align:right;width:95%">
	   <button id="btnCancelar" onclick="location.href= '${ctx}/accessor/salir';" type="button" name="regresar" class="btn btn-danger">Regresar a Login</button>
	</div>
	
		


	
	
</div>
</div>

</body>
</html>