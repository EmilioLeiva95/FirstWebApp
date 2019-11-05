<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<c:if test="${!empty currentMenu}">
	<c:forEach items="${currentMenu.menuItems}" var="item">
    	<li>
        	<c:choose>
              	<c:when test="${item.menuAvailable}">
              	   <c:choose>
              	   <c:when test="${item.visible}">
					<c:set scope="request" var="currentMenu" value="${item.subMenu}"/>
					<a class="qmparent" href="javascript:void(0)">${item.display}</a>
					<ul>
						<jsp:include page="/WEB-INF/global/sec/recursiveMenuHtml.jsp"></jsp:include>
					</ul>
				   </c:when>
				   </c:choose>
               </c:when>
               <c:when test="${item.urlAvailable}">
                  <c:choose>
                  <c:when test="${item.visible}">
               		<a class="qmparent" target="main" href="${ctx}${item.url}">${item.display}</a>
                  </c:when>
                  </c:choose>
               </c:when>
               <c:otherwise>
                   NADA
               </c:otherwise>
           </c:choose>
 		</li>
	</c:forEach>

</c:if>

