<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources"/>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- BOOTSTRAP -->
<link href="${ctx}/include/styles/acf/selecter.css" rel="stylesheet">

<link href="${ctx}/include/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/include/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${ctx}/include/bootstrap/css/multiple-select.css" rel="stylesheet">
<link href="${ctx}/include/styles/ria/jquery.datetimepicker.min.css" rel="stylesheet">
<link href="${ctx}/include/bootstrap/css/bootstrap-select.css" rel="stylesheet">
<link href="${ctx}/include/bootstrap/css/select2.min.css" rel="stylesheet">
<link href="${ctx}/include/bootstrap/css/bootstrap-datepicker.css" rel="stylesheet">
<link href="${ctx}/include/styles/styles.css" rel="stylesheet">

<link href="${ctx}/include/styles/acf/dashboard.css" rel="stylesheet">
<link href="${ctx}/include/styles/acf/controlhorario_dashboard.css" rel="stylesheet">
<link href="${ctx}/include/styles/acf/controlProyecto.css" rel="stylesheet">
<link href="${ctx}/include/styles/acf/detalleTab.css" rel="stylesheet">
<link href="${ctx}/include/bootstrap/css/flat-ui.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- <link href="~/Content/font-awesome-4.5.0/css/font-awesome.css" rel="stylesheet" /> -->
<%-- <link href="${ctx}/include/bootstrap/css/modern.min.css" rel="stylesheet"> --%>

<script src="${ctx}/include/bootstrap/js/jquery-1.12.1.min.js"></script>
<script src="${ctx}/include/scripts/ria/jquery.datetimepicker.js"></script>
<script src="${ctx}/include/bootstrap/js/multiple-select.js"></script>
<script src="${ctx}/include/bootstrap/js/jquery.blockui.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.numeric.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.form.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.mask.js"></script>
<script src="${ctx}/include/bootstrap/js/bootstrap.js"></script>
<%-- <script src="${ctx}/include/bootstrap/js/bootstrap-select.min.js"></script> --%>
<script src="${ctx}/include/bootstrap/js/bootstrap-select.js"></script>
<script src="${ctx}/include/bootstrap/js/bootbox.min.js"></script>
<script src="${ctx}/include/bootstrap/js/bootstrap-tooltip.js"></script>
<%-- <script src="${ctx}/include/bootstrap/js/bootstrap-datepicker.min.js"></script> --%>
<script src="${ctx}/include/bootstrap/js/bootstrap-datepicker.js"></script>
<script src="${ctx}/include/bootstrap/js/locale/bootstrap-datepicker.es.js"></script>
<script src="${ctx}/include/bootstrap/js/select2.full.min.js"></script>
<script src="${ctx}/include/bootstrap/js/custom-bootstrap.js"></script>

<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/main.js"> </script>
   
   <style>
   
:root {
    --color-base-web: #1D71B8; 
    --color-base2-web: #FFC400;
}   
   
   
body {
	background: url(${ctx}/include/images/azul-hd.jpg) repeat-x;
	background-attachment: fixed;
	font-size: 15px !important;
	font-weight: 200 !important;
}

.container {
	margin-top: 10px;
	padding-left: 25px;
	padding-right: 25px;
	background-color: white;
	width: auto;
}

.btn-default {
	background-color: #ECF0F1;
	color: var(--color-base-web);
}

.btn-default:hover {
	background-color: var(--color-base-web);
	color: #BDC3C7;
}

html {
	height: 100%;
}

div.table-responsive {
	overflow-y: auto !important;
	max-height: 63vh !important;
}

div.row>div.panel-default{
	margin-bottom: 0px !important;
	font-size: 15px !important;
}

div.row>div.panel-default>div.form-horizontal  {
	overflow-y: auto !important;
	max-height: 60vh !important;
	
}

::-webkit-scrollbar {
	width: 5px;
}

::-webkit-scrollbar-horizontal {
	width: 5px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.3);
}

::-webkit-scrollbar-thumb {
	background-color: darkgrey;
	outline: 1px solid slategrey;
}

a:hover, a:focus {
	color: #2980B9;
}

a {
	color: var(--color-base-web);
}

.form-control:focus {
	border: 2px solid #2980B9;
}

.form-control:-moz-read-only { /* For Firefox */
	color: var(--color-base-web);
}

.form-control:read-only {
	color: var(--color-base-web);
}

form {
	margin-bottom: 0px !important;
}

table{
 	font-size: 14px !important; 
}

thead tr{

	background: #F0B77D;
	color: #8A5DA1;
}

.comboSize{
	height: 37px;
	padding-top: 0px;
	padding-bottom: 0px;
}




</style>

	
	<script>
	
	
	
	
		var ejecutando = false;
		var sel = false;
		function doSubmit(action) {
			if (ejecutando == false) {
				console.log('creando form');
				document.mainForm.action = '${ctx}${sPath}/' + action + '/bt';
				console.log(document.mainForm.action);
				document.mainForm.submit();
				// 				mostrarProcesando();
				// 				ejecutando = true;
			}
		}

		function doSort(col, nombre) {
			$('#columna').val(col);
			doSubmit(nombre + '/ordenamientoColumna');

		}

		function isValueSelected() {

			if (!sel) {

				bootbox
						.alert(
								'<fmt:message key="globales.listado.dialogo.seleccionarRegistro"/>',
								function() {
								});
				setTimeout(function() {
					bootbox.hideAll();
				}, 1500);

				return false;
			} else {
				return true;
			}

		}

		function dialogConfirmDelete() {
			bootbox
					.dialog({
						message : '<fmt:message key="globales.listado.dialogo.eliminar"/>',
						title : "Eliminar registro",
						buttons : {
							danger : {
								label : '<fmt:message key="globales.listado.dialogo.eliminar.opcion.negativo"/>',
							},
							success : {
								label : '<fmt:message key="globales.listado.dialogo.eliminar.opcion.positivo"/>',
								callback : function() {
									doSubmit('<c:out value="${nombre}"/>'
											+ '/eliminar');
									$(this).dialog("close");
								}
							}
						}
					});
		}

		function dialogConfirm(action) {
			bootbox.confirm(function(result) {
				if (result) {
					doSubmit(action);
				}
			});
		}

		var currentFilterFieldId = "#busqueda";
		function doBusquedaRapida(searchInputId, searchName, searchOption) {
			var cmbBusqueda = $('#campoBusqueda');
			$(searchInputId).attr('name', searchName);
			$(searchInputId).val('');
			var ctype = searchOption.attr('ctype');
			var cAlt = cmbBusqueda.attr('alt');
			var existsNumericConstraint = (typeof cAlt !== 'undefined' && cAlt !== false);
			if (ctype == 'combo') {
				$(currentFilterFieldId).fadeOut(function() {
					currentFilterFieldId = '#' + searchName;
					$(currentFilterFieldId).fadeIn('slow');
				});
			} else {
				if (ctype == 'integer') {
					if (existsNumericConstraint && cAlt != 'integer') {
						$(searchInputId).removeNumeric();
					}
					if (!existsNumericConstraint || cAlt != 'integer') {
						$(searchInputId).numeric({
							decimal : false,
							negative : false
						});
					}
					cmbBusqueda.attr('alt', 'integer');
				} else if (ctype == 'numeric') {
					if (existsNumericConstraint && cAlt != 'numeric') {
						$(searchInputId).removeNumeric();
					}
					if (!existsNumericConstraint || cAlt != 'numeric') {
						$(searchInputId).numeric({
							decimal : true
						});
					}
					cmbBusqueda.attr('alt', 'numeric');
				} else {
					if (existsNumericConstraint) {
						$(searchInputId).removeNumeric();
						cmbBusqueda.removeAttr('alt');
					}
				}
				if (!$(searchInputId).is(':visible')) {
					$(currentFilterFieldId).fadeOut(function() {
						currentFilterFieldId = searchInputId;
						$(currentFilterFieldId).fadeIn('slow');
					});
				}
			}
			;
		}

		function doFiltrarPor(espacioNombre, e) {
			if (e != null) {
				var campoBusqueda = $('#busqueda');
				var campo = campoBusqueda.attr('name');

				if (campo == null || campo == '' || campo == 'busqueda') {
					campoBusqueda.attr('name', $("#campoBusqueda option:first")
							.val());
				}

				var code = (e.keyCode ? e.keyCode : e.which);
				if (code == 13) {

					$('input[alt="notForSubmit"]').each(function(index) {
						$(this).val('');
					});

					var esAsync = $('#esAsync');
					if (esAsync.length) {//EN el listado
						doSubmit(espacioNombre + '/filtrarEjecutar');
					} else {
						doSubmit(espacioNombre + '/filtrarEjecutar');
					}
					e.stopPropagation();
					e.preventDefault();
					return false;
				}
				;
			} else {
				var esAsync = $('#esAsync');
				if (esAsync.length) {//EN el listado
					doSubmit(espacioNombre + '/filtrarEjecutar');
				} else {
					doSubmit(espacioNombre + '/filtrarEjecutar');
				}
				return false;
			}
		}

		function numericos() {
			$('input[alt="numeric"]').each(function(index) {
				$(this).numeric({
					negative : false
				});
				$(this).blur(function() {
					var amt = parseFloat(this.value);
					if (!isNaN(amt)) {
						$(this).val(amt.toFixed(2));
					}
					;
				});
				return;
			});

			$('input[alt="integer"]').each(function(index) {
				$(this).numeric({
					decimal : false,
					negative : false
				});
				return;
			});
		}

		function doForaneo(foraneo, action) {
			$("#nombreBusqueda").val(foraneo);
			//	 		doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera' || not empty esAsync}">Async</c:if>(action);
			doSubmit(action);
		}

		function mostrarProcesando() {
			$("#dialog-processing").dialog("open");
		}

		function ocultarProcesando() {
			$("#dialog-processing").dialog("close");
		}

		function doForaneoAsync(foraneo, action) {
			$("#nombreBusqueda").val(foraneo);
			doSubmitAsync(action);
		}

		function cabeceraDetalle() {
			initDialogs();
			$('#iHeader').accordion({
				collapsible : true,
				active : 0
			});
			$('#backLink').button().removeClass('ui-button-text-only').css({
				'padding' : '0.2em 0.5em',
				'margin-right' : '20px'
			}).bind("click", function(e) {
				e.stopPropagation();
			});
			;
			$('#backLinkMod').button().removeClass('ui-button-text-only').css({
				'padding' : '0.2em 0.5em',
				'margin-right' : '20px'
			}).bind("click", function(e) {
				e.stopPropagation();
			});
		}

		function refrescar() {
			var pageLoc = $('#pageLoc');
			if (pageLoc.length) {
				var ubicacion = pageLoc.val();
				$(document).unbind('keydown');
				currentFilterFieldId = "#busqueda";
				//  				initGraphics(ubicacion);
			}
			;
			$('input[onRefresh]').each(function(index) {
				var onRefreshFunc = $(this).attr('onRefresh');
				var fun = window[onRefreshFunc];
				if ($.type(fun) == 'function') {
					fun();
				}
				;
			});
			if ($('#iHeader')) {
				//  				cabeceraDetalle();
			}
		}

		function doSubmitAsync(action) {
			doSubmitAsync(action, false, null);
		}

		function doSubmitAsync(action, focoPrimerCampo, funcionComplemento) {
			if (ejecutando == false) {
				$("#mainContent").fadeOut(100);
				ejecutando = true;
				mostrarProcesando();
				var mainForm = $("#mainForm");
				mainForm.action = '${ctx}${sPath}/' + action + '/${tOut}';
				mainForm
						.ajaxForm()
						.ajaxSubmit(
								{
									url : '${ctx}${sPath}/' + action
											+ '/${tOut}',
									type : "POST",
									success : function(data) {
										ocultarProcesando();
										ejecutando = false;
										var divMainContent = $("#mainContent");
										divMainContent.fadeIn(300);
										divMainContent.empty();
										console.log(data);
										var mainContent = $(data).find(
												'#mainContent');
										if (mainContent.length) {
											alert("Error aqui quizas.");
											divMainContent.append(mainContent
													.html());
										} else {
											alert("O aqui quizas.");
											divMainContent
													.append('<div align="center"><div class="ui-widget ui-widget-content" style="margin-top:30px;">Ha ocurrido un error inesperado.</div></div>');
										}
										alert("Antes de refrescar!!");
										refrescar();
										alert("Despues de refrescar!!");
										if ($.type(funcionComplemento) == 'function') {
											alert("Entre aqui por asaber que rollos!!");
											funcionComplemento();
										}
										;

									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										ocultarProcesando();
										ejecutando = false;
										var divMainContent = $("#mainContent");
										divMainContent.fadeIn(300);
										divMainContent.empty();
										divMainContent
												.append('<div align="center" style="margin-top:30px;"><div class="ui-widget ui-widget-content">Ha ocurrido un error inesperado en el servidor.</div></div>');
									}
								});

			}
		}

		function limpiarCampos(nombreFormulario) {
			var elementos = document.getElementById(nombreFormulario);
			for (var i = 0, l = elementos.length; i < l; i++) {
				if (elementos[i].type == "text") {
					elementos[i].value = "";
				} else if (elementos[i].selectedIndex > 0) {
					elementos[i].options[0].selected = true;
				}
			}
		}

		function doSubmitBreadcrumb(action, id) {
			document.getElementById('id_ubicacion_retorno').value = id;
			doSubmit(action);
		}

		function seleccionarLov() {
			<c:if test="${ not empty busquedaEnllavador}">
			$('#crudTable tbody tr').dblclick(function() {
				doSubmit('<c:out value="${nombre}"/>' + '/buscarSeleccionar');
			});
			</c:if>
			<c:if test="${ empty busquedaEnllavador}">
			var listName = $('#listadoLov');
			if (listName.length) {
				$('#crudTable tbody tr').dblclick(function() {
					var esAsync = $('#esAsync');
					if (esAsync.length) {
						doSubmitAsync(listName.val() + '/buscarSeleccionar');
					} else {
						doSubmit(listName.val() + '/buscarSeleccionar');
					}
				});
			}
			</c:if>
		}

		// 		function bindKeyAction(shortKey, element) {
		// 			jQuery(document).bind('keydown', shortKey, function(evt) {
		// 				element.click();
		// 				evt.stopPropagation();
		// 				evt.preventDefault();
		// 				return false;
		// 			});
		// 			$('input[type!="hidden"], textarea').bind('keydown', shortKey, function(evt) {
		// 				element.click();
		// 				evt.stopPropagation();
		// 				evt.preventDefault();
		// 				return false;
		// 			});
		// 		}

// 		function bindAllActionKeys() {
// 			var btn;
// 			btn = $('#btnCrear');
// 			if (btn.length) {
// 				bindKeyAction('Shift+n', btn);
// 			}

// 			btn = $('#btnVer');
// 			if (btn.length) {
// 				bindKeyAction('Shift+v', btn);
// 			}

// 			btn = $('#btnActualizar');
// 			if (btn.length) {
// 				bindKeyAction('Shift+m', btn);
// 			}

// 			btn = $('#btnEliminar');
// 			if (btn.length) {
// 				bindKeyAction('Shift+e', btn);
// 			}

// 			btn = $('#btnDetalle');
// 			if (btn.length) {
// 				bindKeyAction('Shift+d', btn);
// 			}

// 			btn = $('#btnAnular');
// 			if (btn.length) {
// 				bindKeyAction('Shift+a', btn);
// 			}

// 			btn = $('#btnProcesar');
// 			if (btn.length) {
// 				bindKeyAction('Shift+p', btn);
// 			}

// 			btn = $('#btnSeleccionar');
// 			if (btn.length) {
// 				bindKeyAction('Shift+s', btn);
// 			}

// 			btn = $('#btnFiltrar');
// 			if (btn.length) {
// 				bindKeyAction('Shift+f', btn);
// 			}

// 			btn = $('#btnAnterior');
// 			if (btn.length) {
// 				bindKeyAction('Shift+pageup', btn);
// 			}

// 			btn = $('#btnSiguiente');
// 			if (btn.length) {
// 				bindKeyAction('Shift+pagedown', btn);
// 			}

// 			btn = $('#btnRemoverOrden');
// 			if (btn.length) {
// 				bindKeyAction('Shift+o', btn);
// 			}

// 			btn = $('#btnRemoverFiltro');
// 			if (btn.length) {
// 				bindKeyAction('Shift+r', btn);
// 			}

// 			btn = $('#btnCancelar');
// 			if (btn.length) {
// 				bindKeyAction('esc', btn);
// 			}

// 			btn = $('#btnGuardar');
// 			if (btn.length) {
// 				bindKeyAction('ctrl+g', btn);
// 			}

// 			btn = $('#btnAplicarFiltro');
// 			if (btn.length) {
// 				bindKeyAction('ctrl+a', btn);
// 			}

// 			btn = $('#btnLimpiar');
// 			if (btn.length) {
// 				bindKeyAction('ctrl+l', btn);
// 			}

// 			btn = $('#backLink');
// 			if (btn.length) {
// 				bindKeyAction('esc', btn);
// 			}

// 			btn = $('#headerInfo');
// 			if (btn.length) {
// 				bindHeaderInfo(btn);
// 			}

// 			var lstTab = $('#detailTabs');
// 			if (lstTab.length) {
// 				var currentTab = $('#detailTabs li a[class^="ui-selected"]');
// 				var tabIndex = $('#detailTabs li a').index(currentTab);
// 				var tabMax = 0;

// 				var liTabs = $('#detailTabs li');
// 				tabMax = liTabs.length - 1;

// 				function changeCurrentTab() {
// 					var btnTab = $('#detailTabs li a')[tabIndex];
// 					if (btnTab) {
// 						btnTab.onclick();
// 					}
// 				}

// 				$(document).bind('keydown', 'shift+right', function(evt) {
// 					if (tabIndex < tabMax) {
// 						tabIndex++;
// 						changeCurrentTab();
// 					}
// 				});

// 				$(document).bind('keydown', 'shift+left', function(evt) {
// 					if (tabIndex > 0) {
// 						tabIndex--;
// 						changeCurrentTab();
// 					}
// 				});

// 			}
// 		}

		$(document).ready(function() {
			
			$('.selectpicker').selectpicker({
				noneSelectedText: 'No Hay Selecci&oacute;n',
				noneResultsText: 'No hay resultados {0}',
			    countSelectedText: 'Seleccionados {0} de {1}',
			    maxOptionsText: ['L&iacute;mite alcanzado ({n} {var} max)', 'L&iacute;mite del grupo alcanzado({n} {var} max)', ['elementos', 'element']],
			    multipleSeparator: ', ',
			    selectAllText: 'Seleccionar Todos',
			    deselectAllText: 'Desmarcar Todos'
			});
			
// 			$('.datepicker').datepicker({
// 				language: 'es'
// 			});
			
			numericos();
			seleccionarLov();
// 			bindAllActionKeys();
		});
		
		
		
// 		 $.datepicker.regional['es'] = {
// 				 closeText: 'Cerrar',
// 				 prevText: '< Ant',
// 				 nextText: 'Sig >',
// 				 currentText: 'Hoy',
// 				 monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
// 				 monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
// 				 dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
// 				 dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
// 				 dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
// 				 weekHeader: 'Sm',
// 				 dateFormat: 'dd/mm/yy',
// 				 firstDay: 1,
// 				 isRTL: false,
// 				 showMonthAfterYear: false,
// 				 yearSuffix: ''
// 				 };
// 				 $.datepicker.setDefaults($.datepicker.regional['es']);
// 				$(function () {
// 				$("#fecha").datepicker();
// 				});
		
	</script>
		
</head>
<body>
	<div id="dialog-processing" title="Procesando..."
		style="display: none;">
		<span style="font-size: 85%"> <fmt:message
				key="globales.pagina.dialogo.procesando" /></span>
	</div>
<%@ include file="/WEB-INF/global/jsp/jq-horizontal-bootstrap.jsp" %>
