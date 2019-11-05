<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.persistence.f3.app.distribuibles.abstraccion.comunes.seguridad.menu.ItemDeMenu"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="theme" value="${initParam['theme']}"/>
<c:set var="ui" value="${initParam['ui']}"/>
<c:if test="${!empty itemsDeMenu}">
	<c:forEach items="${itemsDeMenu}" var="item">
	<c:set scope="request" var="debugItem" value="${item}"/>
	
        	<c:choose>
              	<c:when test="${item.itemsHijosDisponibles}">
              	   <c:choose>
              	   <c:when test="${item.visible}">
					<c:set scope="request" var="itemsDeMenu" value="${item.itemsDeMenuHijos}"/>
					<li>
					<a href="#">${item.descripcion}</a> 
					<ul><jsp:include page="recursiveMenu.jsp"></jsp:include></ul>
				  	</li>
				   </c:when>
				   </c:choose>
               </c:when>
               <c:when test="${item.enlaceDisponible}">
                  <c:choose>
                  <c:when test="${item.visible}">
               		    <li><a target="main" href="${ctx}${item.enlace}/${ui}?eag=${eag}">${item.descripcion}</a></li>
                  </c:when>
                  </c:choose>
               </c:when>
               <c:otherwise>
                   <c:set scope="request" var="itemsDeMenu" value="${item.itemsDeMenuHijos}"/>
					<li><a href="#">${item.descripcion}</a></li>
               </c:otherwise>
           </c:choose>
 		
	</c:forEach>
</c:if>