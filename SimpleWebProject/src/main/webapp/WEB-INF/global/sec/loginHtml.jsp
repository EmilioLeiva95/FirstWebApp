<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<head> 
	<title>HTTP</title> 
	<link href="${ctx}/include/styles/html/main.css" rel="stylesheet" type="text/css"/>
</head> 

<body > 
<div id="login"> 
<form action="${ctx}/inicio/autenticar/html" method="post" id="loginScreen"> 
	<input type="hidden" name="login" value="identificar"/>
	<table class="ui-background" border="0"> 
		<tr>
			<td> 
				<table  class="ui-fields" border="0">
<!--				    <tr> -->
<!--						<td class="ui-label"><img src="/bancamovil/simpleCaptcha.jpg">: </td>						 -->
<!--						<td><input type="text" name="captcha"></td> -->
<!--				    </tr> -->
				     
				    
				
					<tr> 
						<td class="ui-label">Usuario&nbsp;</td> 
						<td><input type="text" name="username"></td> 
				    </tr>
					<tr> 
						<td class="ui-label">Password&nbsp;</td> 
						<td><input type="password" name="password"></td> 
				    </tr>
				    
				    
<!--				    <tr> -->
<!--				        <td class="ui-label">&nbsp;</td>-->
<!--						<td > <img src="/bancamovil/simpleCaptcha.jpg"></td> -->
<!--				    </tr> -->
<!--				    -->
<!--				    <tr> -->
<!--				    <td class="ui-label">&nbsp;</td>-->
<!--						<td  > <input type="text" name="captcha" value=""></td> -->
<!--				    </tr> -->
				     
				    <!--
					<tr> 
						<td class="ui-label">Contrase&ntilde;a&nbsp;</td> 
						<td><input type="password" name="password" value=""></td> 
				    </tr> 
				    -->
				    <tr> 
						<td width="30px"></td> 
						<td><input type="submit" name="Login" value="Login"/></td> 
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