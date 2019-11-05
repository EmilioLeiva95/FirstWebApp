<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   <script type="text/javascript">
        $(document).ready(function () {
        	 var fCount = 1;
        		 
	             $('#flyoutmenu > li ').each(function(index){
	            	var listaItem = $(this);
	            	
	            	var menuItem = listaItem.children("a:first");
	            	
	             	if(fCount < 12){
	 					$(document).bind("keydown","F"+fCount, function(evt){
	 						menuItem.focus();
	 						evt.stopPropagation();
	 						evt.preventDefault();
	 						return false;
	 					});
	 					fCount++;
	             	}
	             });
             
	            $("#flyoutmenu").wijmenu({
	                trigger: ".wijmo-wijmenu-item",
	                triggerEvent: "click",
	                mode: "flyout",
	                showing: function(e, sublist){
	                	
	                }
	            });
	            
	            // Para que se mire ordenado
	            $('#iMenuTab').height(44);
        
        });
    </script>

<!-- Aqui estaria el menu -->
<div id="iMenuTab">
<ul class="menu" id="flyoutmenu" style="display: none;">
<c:forEach var="item" items="${itemsDeMenu}">
    <c:if test="${item.visible}">
    <li>	
		<a title="menuItem|${item.llave}" id="${item.llave}" href="#"><span>${item.descripcion}</span><!--[if gt IE 6]><!--></a><!--<![endif]-->
		<!--[if lte IE 6]><table><tr><td><![endif]-->
		<ul>
	    <c:forEach var="subItem" items="${item.itemsDeMenuHijos}">
	        
	        	<c:if test="${subItem.visible}">
	        	<c:if test="${empty subItem.enlace}">
	        	<li><a target="main" href="#">${subItem.descripcion}</a>
	        		<c:if test="${not empty subItem.itemsDeMenuHijos}">
	        			<c:if test="${subItem.itemsHijosDisponiblesVisibles}">
	        			<ul>
			    		<c:forEach var="subSubItem" items="${subItem.itemsDeMenuHijos}">
			    			<c:if test="${subSubItem.visible}">
				        	<c:if test="${empty subSubItem.enlace}">
				        	<li><a target="main" href="#">${subSubItem.descripcion}</a>
				        	<c:if test="${not empty subSubItem.itemsDeMenuHijos and subSubItem.itemsHijosDisponiblesVisibles}">
				        		<ul>
				        			<c:forEach var="subSubItemSub" items="${subSubItem.itemsDeMenuHijos}">
				        				<c:if test="${subSubItemSub.visible}">
							        	<c:if test="${empty subSubItemSub.enlace}">
							        	<li><a target="main" href="#">${subSubItemSub.descripcion}</a></li>
							        	</c:if>
							        	<c:if test="${not empty subSubItemSub.enlace}">
							        	<li><a target="main" href="${ctx}${subSubItemSub.enlace}/bt?eag=${eag}">${subSubItemSub.descripcion}</a></li>
							        	</c:if>
							        	</c:if>
				        			</c:forEach>
				        		</ul>
				        	</c:if>
				        	</li>
				        	</c:if>
				        	<c:if test="${not empty subSubItem.enlace}">
				        	<li><a target="main" href="${ctx}${subSubItem.enlace}/bt?eag=${eag}">${subSubItem.descripcion}</a></li>
				        	</c:if>
				        	</c:if>
						</c:forEach>
						</ul>
						</c:if>
	        		</c:if>
	        	</li>
	        	</c:if>
	        	<c:if test="${not empty subItem.enlace}">
	        	<li><a target="main" href="${ctx}${subItem.enlace}/bt?eag=${eag}">${subItem.descripcion}</a></li>
	        	</c:if>
	        	</c:if>
		</c:forEach>
		</ul>
		<!--[if lte IE 6]></td></tr></table></a><![endif]-->
	</li>
	</c:if>
</c:forEach>

<li style="float: right; display: inline-block;">
	<a target="_parent" href="${ctx}/inicio/salir/ria"><span style="float: left;" class="ui-icon ui-icon-arrowthickstop-1-w"></span>Salir</a>
</li>
<li style="float: right; display: inline-block;">
	<a href="${ctx}/app/cambioClave/cambioClave/jq"><span style="float: left;" class="ui-icon ui-icon-person"></span>Cambio de Clave</a>
</li>
<li style="float: right; display: inline-block;">
	<a href="${ctx}/inicio/blank/ria"><span style="float: left;" class="ui-icon ui-icon-home"></span>Inicio</a>
</li>
</ul>
<br/>
</div>