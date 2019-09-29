<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<c:set var="MODULO" value="${initParam.modulo}" />

<script type="text/javascript">
	$(document).ready(function() {
		var fCount = 1;

		$('#flyoutmenu > li ').each(function(index) {
			var listaItem = $(this);

			var menuItem = listaItem.children("a:first");

			if (fCount < 12) {
				$(document).bind("keydown", "F" + fCount, function(evt) {
					menuItem.focus();
					evt.stopPropagation();
					evt.preventDefault();
					return false;
				});
				fCount++;
			}
		});

		// 		$("#flyoutmenu").wijmenu({
		// 			trigger : ".wijmo-wijmenu-item",
		// 			triggerEvent : "click",
		// 			mode : "flyout",
		// 			showing : function(e, sublist) {

		// 			}
		// 		});

		// Para que se mire ordenado
		$('#iMenuTab').height(44);

	});
</script>

<style>
.navbar-default {
	font-size: 15px !important;
	font-weight: 200 !important;
	background-color: #49016b;
	border-radius: 0px;
}

.navbar-nav>li>a {
	padding: 15px 21px; ::
	font-size: 15px;
	font-weight: 200;
}

.navbar-default .navbar-nav>li>a:hover, .navbar-default .navbar-nav>li>a:focus
	{
	color: #2980B9;
}

.nav>ul>li.active {
	color: #2980B9;
}

.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:hover,
	.navbar-default .navbar-nav>.open>a:focus {
	color: #2980B9;
}

.navbar-toggle:before {
	content: '' !important;
}

.dropdown-submenu {
	position: relative;
}

.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -6px;
	margin-left: -1px;
	-webkit-border-radius: 0 6px 6px 6px;
	-moz-border-radius: 0 6px 6px 6px;
	border-radius: 0 6px 6px 6px;
}

.dropdown-submenu:hover>.dropdown-menu {
	display: block;
}

.dropdown-submenu>a:after {
	display: block;
	content: " ";
	float: right;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
	border-width: 5px 0 5px 5px;
	border-left-color: #cccccc;
	margin-top: 5px;
	margin-right: -10px;
}

.dropdown-submenu:hover>a:after {
	border-left-color: #ffffff;
}

.dropdown-submenu.pull-left {
	float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
	left: -100%;
	margin-left: 10px;
	-webkit-border-radius: 6px 0 6px 6px;
	-moz-border-radius: 6px 0 6px 6px;
	border-radius: 6px 0 6px 6px;
}
</style>



<!-- Aqui estaria el menu -->
<nav class="navbar navbar-default" style="margin-bottom: 5px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse-1" aria-expanded="false"
				aria-controls="navbar" style="float: left !important;">
				<span class="sr-only">Toggle</span> <span
					class="glyphicon glyphicon-menu-hamburger"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse " id="navbar-collapse-1"
			style="background-color: #49016b;">

			<!-- <ul class="nav navbar-nav navbar-left hidden-xs">
				<li><a href="#" style="font-size: 17px; font-weight: 200;">Sistema de Información </a></li>
			</ul> -->
			<ul class="nav navbar-nav navbar-right">
				<li><a target="main" href="${ctx}/inicio/blank/ria" rel="noopener noreferrer"><span
						class="glyphicon glyphicon-home"></span> Inicio</a></li>

				<%-- <li class="dropdown"><a class="dropdown-toggle" href="#"
					type="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span
						class="glyphicon glyphicon glyphicon-th"></span> M&oacute;dulos </a>
					<ul class="dropdown-menu" style="z-index: 1000;">
						<c:forEach items="${modulos}" var="m">
							<c:if test="${MODULO != m.modulo}">
								<li><a target="_parent"
									href="${ctx}/accessor/modulos/${m.modulo}"><span></span>
									<c:out value="${m.descripcion}"></c:out> </a></li>
							</c:if>
						</c:forEach>
					</ul></li> --%>


				<li class="dropdown"><a class="dropdown-toggle" href="#"
					type="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
						<c:out value="${sessionScope['OBJETO_USUARIO'].login}" /> </a>
					<ul class="dropdown-menu" style="z-index: 1000;">
						<li><a target="_parent" href="${ctx}/inicio/salir/ria"><span
								class="glyphicon glyphicon-log-out"></span> Salir</a></li>
					</ul></li>
			</ul>

			<ul class="nav navbar-nav ">
				<c:forEach var="item" items="${itemsDeMenu}">
					<c:if test="${item.visible}">
						<li class="dropdown"><a id="${item.llave}" href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <span>${item.descripcion}</span>
								<span class="caret"> </span></a>
							<ul class="dropdown-menu">
								<c:forEach var="subItem" items="${item.itemsDeMenuHijos}">
									<c:if test="${subItem.visible}">
										<c:if test="${empty subItem.enlace}">
											<li class="dropdown-submenu"><a href="#"
												class="dropdown-toggle" data-toggle="dropdown" role="button"
												aria-haspopup="true" aria-expanded="false">${subItem.descripcion}</a>
												<c:if test="${not empty subItem.itemsDeMenuHijos}">
													<c:if test="${subItem.itemsHijosDisponiblesVisibles}">
														<ul class="dropdown-menu">
															<c:forEach var="subSubItem"
																items="${subItem.itemsDeMenuHijos}">
																<c:if test="${subSubItem.visible}">
																	<c:if test="${empty subSubItem.enlace}">
																		<li><a href="#">${subSubItem.descripcion}</a> <c:if
																				test="${not empty subSubItem.itemsDeMenuHijos and subSubItem.itemsHijosDisponiblesVisibles}">
																				<ul class="dropdown-menu">
																					<c:forEach var="subSubItemSub"
																						items="${subSubItem.itemsDeMenuHijos}">
																						<c:if test="${subSubItemSub.visible}">
																							<c:if test="${empty subSubItemSub.enlace}">
																								<li><a href="#">${subSubItemSub.descripcion}</a></li>
																							</c:if>
																							<c:if test="${not empty subSubItemSub.enlace}">
																								<li><a
																									href="${ctx}${subSubItemSub.enlace}/bt?eag=${eag}">${subSubItemSub.descripcion}</a></li>
																							</c:if>
																						</c:if>
																					</c:forEach>
																				</ul>
																			</c:if></li>
																	</c:if>
																	<c:if test="${not empty subSubItem.enlace}">
																		<li><a
																			href="${ctx}${subSubItem.enlace}/bt?eag=${eag}">${subSubItem.descripcion}</a></li>
																	</c:if>
																</c:if>
															</c:forEach>
														</ul>
													</c:if>
												</c:if></li>
										</c:if>
										<c:if test="${not empty subItem.enlace}">
											<li><a href="${ctx}${subItem.enlace}/bt?eag=${eag}">${subItem.descripcion}</a></li>
										</c:if>
									</c:if>
								</c:forEach>
							</ul></li>
					</c:if>
				</c:forEach>


			</ul>

		</div>
	</div>
</nav>
