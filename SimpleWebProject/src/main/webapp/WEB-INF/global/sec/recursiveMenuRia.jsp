<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<li data-toggle="collapse"  data-target="#${item.llave}" name-target="${item.llave}" class="collapsed menuItem" data-parent="#menulist">
					<a href="#">${item.descripcion}    <span class="glyphicon glyphicon-triangle-bottom" style="float: inherit;vertical-align: middle;"></span></a>
					</li>
					<ul id="${item.llave}" class="sub-menu collapse"><jsp:include page="recursiveMenuRia.jsp"></jsp:include></ul>
				   </c:when>
				   </c:choose>
               </c:when>
               <c:when test="${item.enlaceDisponible}">
                  <c:choose>
                  <c:when test="${item.visible}">
               		    <li >
               		    <a target="main" href="${ctx}${item.enlace}/bt?eag=${eag}"><span class="glyphicon glyphicon-menu-right"></span>  ${item.descripcion}</a>
               		    </li>
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