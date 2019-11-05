<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header-sin-menu.jsp"%>
<head>
<link rel="shortcut icon" href="${ctx}/include/images/favicon.ico" />
<title>Proyecto Demo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<link href="${ctx}/include/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${ctx}/include/bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="${ctx}/include/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" language="javascript"
	src="${ctx}/include/scripts/ria/jquery.js"></script>

<style type="text/css">
iframe {
	outline: none;
	box-sizing: border-box;
	
}

.menu {
	float: left;
}

.bodyContent {
	float: left;
	/*border: none; removed so you can see the iframe in this example*/
}

.wellshadow {
	-webkit-box-shadow: 11px 13px 5px -4px rgba(38, 36, 33, 0.26);
	-moz-box-shadow: 11px 13px 5px -4px rgba(38, 36, 33, 0.26);
	box-shadow: 11px 13px 5px -4px rgba(38, 36, 33, 0.26);
}
</style>
</head>
<script>
	$(document).ready(function() {
		$('input:submit, input:reset').button();
	});
</script>
<body >
	<div class="" style="padding: 0px !important; margin-left: 0px; margin-right: 0px; width: 100%;">
		<div class="" >			
			<%-- <iframe src="${ctx}/inicio/menu/ria" class="col-md-2 col-sm-2 col-lg-2 hidden-xs menu" scrolling="no" name="menu" height="100%" frameborder="0" id="frameMenu" style="padding-right: 0px !important;padding-left: 0px !important;" ></iframe> --%>
			<div>
				<div class="row"
					style="padding-top: 15%; width: 100%; height: 100%; padding-left: 30%; padding-right: 30%">

					<form action="${ctx}/inicio/modulo/ria" method="POST">
						<section>

							<div class="form-group well wellshadow">
								<input type="hidden" name="frameThing" value="S">
								<input type="hidden" name="username" value="${username}">
								<input type="hidden" name="password" value="${password}">
								<input type="hidden" id="tipoJornada" name="tipoJornada">
								<div id="row" style="text-align: center;">
									<strong style="color: #1D71B8">Seleccione el perfil
										con el que desea ingresar</strong>
								</div>

								<table class="table">
									<thead>
										<tr>

										</tr>
									</thead>
									<tbody>
									<c:forEach items="${itemsPerfil}" var="t">
												<div class="radio">
												  <label>
												    <input type="radio" name="perfil" id="opciones${t.idSegPerfil}" onclick="$('#btSubmit').attr('disabled',false)" value="${t.idSegPerfil}" >
												    	<c:if test="${t.jornada == 'T'}">
												    		<c:out value="${t.descripcion}, Jornada de Turno "></c:out>
												    	</c:if>
												    	<c:if test="${t.jornada == 'O'}">
												    		<c:out value="${t.descripcion}, Jornada Ordinaria "></c:out>
												    	</c:if>
												  </label>
												</div>
											</c:forEach>
									</tbody>
								</table>

								<button type="submit" disabled="disabled" id="btSubmit"
									style="color: #1D71B8; margin-left: 80%"
									class="btn btn-warning">Ingresar</button>
							</div>
				</div>
			</div>
			</section>
			</form>
		</div>


	</div>
</body>

</html>