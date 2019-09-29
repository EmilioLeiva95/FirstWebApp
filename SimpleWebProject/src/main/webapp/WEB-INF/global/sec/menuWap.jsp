<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>Menu</title>              
	<link rel="stylesheet" type="text/css" href="${ctx}/include/menu/menusito.css" title="Default Styles" media="screen">
	<link href="${ctx}/include/styles/wap/main.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/include/styles/wap/menu.css" rel="stylesheet" type="text/css">
</head>
<body>

<br/>
<div id="iMenu">
	<b class="ui-round-top"> 
	<b class="ui-line-one"></b><b class="ui-line-two"></b><b class="ui-line-three"></b><b class="ui-line-four"></b> 
    </b> 
  	<table border="0" width="100%" align="center" cellspacing="0" cellpadding="0">
     	<tr class="ui-menu-button"><td><a class="ui-parent"> Opciones </a></td></tr>
     	<tr class="ui-menu-button"><td><a class="ui-parent">Seguridad</a></td></tr>
     	<tr class="ui-menu-button"><td><a class="ui-item" href="${ctx}/app/appUser/inicio/wap?eag=${eag}">Usuarios</a></td></tr>
     	<tr class="ui-menu-button"><td><a class="ui-item" href="${ctx}/app/appRole/inicio/wap?eag=${eag}">Roles</a></td></tr>
     	<tr class="ui-menu-button"><td><a class="ui-parent">Facturacion</a></td></tr>
     	<tr class="ui-menu-button"><td><a class="ui-item" href="${ctx}/app/customer/inicio/wap?eag=${eag}">Customer</a></td></tr>
     	<tr class="ui-menu-button"><td><a class="ui-item" href="${ctx}/app/invoice/inicio/wap?eag=${eag}">Invoce</a></td></tr>
     	<tr class="ui-menu-button"><td><a class="ui-item" href="${ctx}/app/item/inicio/wap?eag=${eag}">Item</a></td></tr>
     	<tr class="ui-menu-button"><td><a class="ui-item" href="${ctx}/app/invoicePayment/inicio/wap?eag=${eag}">Payment</a></td></tr>
	    <tr class="ui-menu-button"><td><a class="ui-item" href="${ctx}/app/product/inicio/wap?eag=${eag}">Product</a></td></tr> 
  	</table>
  	<b class="ui-round-bottom"> 
	<b class="ui-line-four"></b><b class="ui-line-three"></b><b class="ui-line-two"></b><b class="ui-line-one"></b> 
  	</b> 
</div>
<br>
	<table border="0" width="100%" align="center" cellspacing="0" cellpadding="0">
     	<tr class="ui-menu-button">
     	<td><a class="ui-parent" href="${ctx}/inicio/wap"> Salir </a></td>
     	</tr>
     </table>	
</body>
</html>