<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%><html> 
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head> 
	<title>HTTP</title> 
	<link href="../include/styles/html/main.css" rel="stylesheet" type="text/css"/>
</head> 

<body > 
<div id="iBanner"></div>
<div id="login"> 
<form action="${ctx}/inicio/html" method="post" id="loginScreen"> 
	<input type="hidden" name="login" value="validar"/>
	<input type="hidden" name="username" value="<c:out value="${userNameLogin}"/>"/>
	<input type="hidden" name="r" value="<c:out value="${idRespuesta}"/>"/>
	<table class="ui-main-frame"> 
		<tr>
			<td align="center"> 
				<table  class="ui-frame"> 
					<tr> 
						<td class="ui-label-frame" colspan="2">Quiere que recordemos el nombre de la computadora para que no tenga que responder la pregunta la pr&oacute;xima ocasi&oacute;n que usted ingrese.&nbsp;<br/>
							<input type="radio" name="paso1" value="S">Si<br>
							<input type="radio" name="paso1" value="N" checked>No
						</td> 
				    </tr>
					<tr> 
						<td class="ui-label-frame">Pregunta&nbsp;</td> 
						<td><c:out value="${pregunta}"/></td> 
				    </tr> 
					<tr> 
						<td class="ui-label-frame">Respuesta&nbsp;</td> 
						<td><input type="text" name="respuesta" value=""></td> 
				    </tr> 
				    <tr> 
						<td width="30px"></td> 
						<td><input type="submit" name="identificar" value="Identificar"/></td> 
				    </tr> 
				     <tr> 
						<td width="150px" height="30px" colspan="2" align="left">
						<%
						java.util.Collection col = (java.util.Collection)request.getAttribute("errores");
						if (col != null && col.size()>0){
							Iterator ite = col.iterator();
							while(ite.hasNext()){
								String error = (String)ite.next();
						%>
						<font color="#ff5555"><strong><%=error%></font></strong><br/>
						<%	}
						} %>
						</td>
				    </tr>
				</table> 
			</td> 
		</tr> 
	</table>
</form>
</div> 
</body> 
</html>