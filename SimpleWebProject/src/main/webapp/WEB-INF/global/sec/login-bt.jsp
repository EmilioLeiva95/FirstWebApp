<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Iterator"%>

<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">
<%
	int counter = 0;
%>
<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header-sin-menu.jsp"%>

<!--[if IE]>
<script type="text/javascript">
window.location = "${ctx}/notSupported.html";
</script>
<![endif]-->

<script type="text/javascript">
    if (window.navigator.msPointerEnabled) {
        window.location = "${ctx}/notSupported.html";
    }
</script>
<script>
	


	$(document).ready(function() {
		$('#selectable').selectable();
		$('input:submit, input:reset').button();
	});
</script>
<body style="height: 100%; background-image: url('${ctx}/include/images/blue-yellow.jpg'); background-repeat:no-repeat; margin: auto; background-size: 100% 100%; background-attachment: fixed;">

<div id="img">
	<section class="container">
		
			<section class="login-form">
				<section style="text-align: center;">
					<div class="container-fluid">
						<div class="row">
							<h6>Sistema de Información </h6>
							<img alt="Brand" src="${ctx}/include/images/index.png" class=""
								width="160" height=200/>
						</div>
<!-- 						<div id="row"> -->
<%-- 							<span><fmt:message key="globales.bc.etiqueta.version"/>-</span> --%>
<%-- 							<span><fmt:message key="globales.bc.etiqueta.relaese"/></span> --%>
<!-- 						</div> -->

					</div>
				</section>
				<hr />
				<div>
					<form action="${ctx}/inicio/autenticar/ria" method="POST"
						name="formlogin" id="loginScreen">
						<section>
						<input type="hidden" name="origen" value="L" >
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="text-primary glyphicon glyphicon-user" style="color:#1D71B8;"></span>
									</div>
									<input type="text" id="username" name='username'
										placeholder="Usuario" required class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="text-primary glyphicon glyphicon-lock" style="color:#1D71B8; "></span>
									</div>
									<input type="password" name='password' placeholder="Password"
										required class="form-control" />
								</div>
							</div>
							<!-- div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="text-primary glyphicon glyphicon-lock" style="color:#1D71B8; "></span>
									</div>
									<input type="text" name='perfil' placeholder="perfil"
										required class="form-control" />
								</div>
							</div-->
							<!-- div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="text-primary glyphicon glyphicon-lock" style="color:#1D71B8; "></span>
									</div>
									<input type="text" name='modulo' placeholder="modulo"
										required class="form-control" />
								</div>
							</div-->
							

							<!-- 						<div class="form-group"> -->
							<!-- 							<input type="checkbox" name="_spring_security_remember_me" value="0"> Recordarm&eacute; -->
							<!-- 						</div> -->

							<button type="submit" name="go" class="btn btn-block btn-default"
								style="background-color: #1D71B8; color: white;">Iniciar
								Sesi&oacute;n</button>
						</section>
						<hr>
<!-- 					</form> -->
<%-- 					<c:if test="${not empty param.login_error}"> --%>
<!-- 						<font color="red"> Error al tratar de ingresar. Intente -->
<%-- 							nuevamente.<br /> <br /> Causa: <c:out --%>
<%-- 								value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />. --%>
<!-- 						</font> -->
<%-- 					</c:if> --%>
						<div>
							<%
								java.util.Collection col = (java.util.Collection) request
										.getAttribute("errores");
								if (col != null && col.size() > 0) {
									Iterator ite = col.iterator();
									while (ite.hasNext()) {
										String error = (String) ite.next();
							%>
							<font color="#840505"><strong><%=error%></font></strong><br />
							<%
								}
								}
							%>
						</div></div>
			</section>
		
	</section>
</div>
<br>

<!-- 	<footer class="footer"> -->
<!-- 		<div class="container" style="text-align: center;"> -->
<!-- 			<p class="text-muted" style="color: #7F8C8D;"> -->
<!-- 			</p> -->
<!-- 		</div> -->
<!-- 	</footer> -->
	<%@ include file="/WEB-INF/global/jsp/jq-footer.jsp"%>
	</fmt:bundle>