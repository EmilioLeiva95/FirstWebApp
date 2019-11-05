<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%><html>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<head> 
	<title>WAP</title> 
	<link href="${ctx}/include/styles/wap/main.css" rel="stylesheet" type="text/css"/>
</head> 
<body class="ui-body-login"> 
<div id="login">
<form action="${ctx}/inicio/autenticar/wap" method="post" id="loginScreen">
	<input type="hidden" name="login" value="identificar"/>
	<table class="ui-background">  
		<tr> 
			<td align="center"> 
				<table class="ui-fields"> 
					<tr> 
						<td class="ui-label">Usuario&nbsp;</td> 
						<td><input type="text" style="" name="username" size="30px"></td> 
				    </tr> 
				    <tr> 
						<td class="ui-label">Clave&nbsp;</td> 
						<td><input type="password" style="" name="password" size="30px"></td> 
				    </tr>
				    <tr> 
						<td width="30px"></td> 
						<td><input type="submit" name="Login" value="Login" /></td> 
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