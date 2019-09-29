<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>
<fmt:bundle basename="com.persistence.firebellied.poc.hipotecario.resourceBundle.MessagesResources"/>
<html>
<head>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- BOOTSTRAP -->
<link href="${ctx}/include/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/include/bootstrap/css/bootstrap-datepicker.css" rel="stylesheet">
<link href="${ctx}/include/bootstrap/css/flat-ui.min.css" rel="stylesheet">
    <script src="${ctx}/include/bootstrap/js/jquery-1.12.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.numeric.js"></script>
	<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.form.js"></script>
    <script src="${ctx}/include/bootstrap/js/bootstrap.js"></script>
    <script src="${ctx}/include/bootstrap/js/bootbox.min.js"></script>
    <script src="${ctx}/include/bootstrap/js/bootstrap-datepicker.min.js"></script>
    <script src="${ctx}/include/bootstrap/js/custom-bootstrap.js"></script>
    <script type="text/javascript" language="javascript"
	src="${ctx}/include/scripts/main.js"> </script>
   
   <style>
	body {
 		background: url(${ctx}/include/images/azul-hd.jpg) repeat-x; 
		background-attachment: fixed;
	}
/*  	.container {  */
/*      margin-top: 30px;  */
/*      box-shadow: 0 0 30px black;  */
/*      padding:15px 15px 15px 15px;  */
/*      padding-left: 25px;  */
/*      padding-right: 25px;  */
/*      background-color: white;  */
/*      border-radius: 15px;  */
/*  	} */
 	
 	.login-form {
 	border: 4px solid rgba(0, 0, 0, 0.31) !important; 
    margin: 30px auto;
    max-width: 400px;
    background-color: rgba(255,255,255,1);  
    padding:15px 15px 15px 15px;
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    border-radius: 15px;
    padding-bottom: 20px; 
    box-shadow: 3px 3px 5px #333;
   
	}	
	
	.footer {
    position: fixed !important;
    bottom: 0;
    width: 100%;
    height: 60px;
    background-color: #f5f5f5;
    z-index: 50;
} 

.form-control:focus {
	border: 2px solid #2980B9;
}
	
	</style>
	
	<script>
		var ejecutando = false;
		var sel = false;
		function doSubmit(action){	
			if (ejecutando == false){
				console.log('creando form');
				document.mainForm.action = '${ctx}${sPath}/' + action + '/bt';
				console.log(document.mainForm.action);
				document.mainForm.submit();
// 				mostrarProcesando();
// 				ejecutando = true;
			}
		}
		
		
		function doSort(col,nombre){
			$('#columna').val(col);
			doSubmit(nombre+'/ordenamientoColumna'); 
			 
		}
		
		function isValueSelected(){
			
			if(!sel){

				 bootbox.alert('<fmt:message key="globales.listado.dialogo.seleccionarRegistro"/>', function() {
				 });
				 setTimeout(function() {
					    bootbox.hideAll();
					}, 1500);
				 
				 
						
				return false;	
			}else{
				return true;
			}

		}
		
		
		
		function dialogConfirmDelete(){		
			bootbox.dialog({
				  message: '<fmt:message key="globales.listado.dialogo.eliminar"/>',
				  title: "Eliminar registro",
				  buttons: {
				    danger: {
				      label: '<fmt:message key="globales.listado.dialogo.eliminar.opcion.negativo"/>',
				    },
				  success: {
				      label: '<fmt:message key="globales.listado.dialogo.eliminar.opcion.positivo"/>',
				      callback: function() {
				    	  doSubmit('<c:out value="${nombre}"/>' + '/eliminar');
							$( this ).dialog( "close" );
				      }
				    }
				  }
				});
		}
		
			
		function dialogConfirm(action){
			bootbox.confirm(function(result) {
			    if (result) {
			    	doSubmit(action);
			    } 
			});
		}
		
		var currentFilterFieldId="#busqueda";
		function doBusquedaRapida(searchInputId, searchName, searchOption){
			var cmbBusqueda = $('#campoBusqueda');
			$(searchInputId).attr('name', searchName);
			$(searchInputId).val('');
			var ctype = searchOption.attr('ctype');
			var cAlt = cmbBusqueda.attr('alt');
			var existsNumericConstraint = (typeof cAlt !== 'undefined' && cAlt !== false);
			if( ctype == 'combo'){
				$(currentFilterFieldId).fadeOut(function(){
				currentFilterFieldId = '#'+searchName;
				$(currentFilterFieldId).fadeIn('slow');
			});
			}else{
				if(ctype == 'integer'){
					if(existsNumericConstraint && cAlt != 'integer'){
						$(searchInputId).removeNumeric();
					}
					if(!existsNumericConstraint || cAlt != 'integer'){
						$(searchInputId).numeric({ decimal: false, negative: false });
					}
					cmbBusqueda.attr('alt', 'integer');
				}else if(ctype == 'numeric'){
					if(existsNumericConstraint && cAlt != 'numeric'){
						$(searchInputId).removeNumeric();
					}
					if(!existsNumericConstraint || cAlt != 'numeric'){
						$(searchInputId).numeric({decimal: true});
					}
					cmbBusqueda.attr('alt', 'numeric');
				}else{
					if(existsNumericConstraint){
					$(searchInputId).removeNumeric();
					cmbBusqueda.removeAttr('alt');
				}
			}
			if(!$(searchInputId).is(':visible')){
				$(currentFilterFieldId).fadeOut(function(){
					currentFilterFieldId = searchInputId;
					$(currentFilterFieldId).fadeIn('slow');
				});
			}
		};
		}
		
		function doFiltrarPor(espacioNombre, e){
			if(e != null){
				var campoBusqueda = $('#busqueda');
				var campo = campoBusqueda.attr('name');
				
				if(campo == null || campo == '' || campo == 'busqueda'){
					campoBusqueda.attr('name', $("#campoBusqueda option:first").val());				
				}
				
				var code= (e.keyCode ? e.keyCode : e.which);
		        if (code == 13){
		        	
		        	$('input[alt="notForSubmit"]').each(function(index){
		        		$(this).val('');	
		        	});
		        	
		        	var esAsync = $('#esAsync');
					if(esAsync.length){//EN el listado
						doSubmitAsync(espacioNombre + '/filtrarEjecutar');
					}else{
		    			doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera' || not empty esAsync}">Async</c:if>(espacioNombre + '/filtrarEjecutar');
					}
					e.stopPropagation();
					e.preventDefault();
					return false;
				};
			}else{
				var esAsync = $('#esAsync');
				if(esAsync.length){//EN el listado
					doSubmitAsync(espacioNombre + '/filtrarEjecutar');
				}else{
	    			doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera' || not empty esAsync}">Async</c:if>(espacioNombre + '/filtrarEjecutar');
				}
				return false;
			}
		}
		
		function numericos(){
			$('input[alt="numeric"]').each(function(index){
				$(this).numeric({ negative : false });
				$(this).blur(function(){
					var amt = parseFloat(this.value);
					if(!isNaN(amt)){
	                	$(this).val(amt.toFixed(2));
					};
				});
				return;
			});
			
			$('input[alt="integer"]').each(function(index){
				$(this).numeric({ decimal: false, negative: false });
				return;
			});
		}
		
		function doForaneo(foraneo, action){
			$("#nombreBusqueda").val(foraneo);
//	 		doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera' || not empty esAsync}">Async</c:if>(action);
			doSubmit(action);
		}
		
		function mostrarProcesando(){
			$( "#dialog-processing" ).dialog("open");
		}
		
		function ocultarProcesando(){
			$( "#dialog-processing" ).dialog("close");
		}
		
		function doForaneoAsync(foraneo, action){
			$("#nombreBusqueda").val(foraneo);
			doSubmitAsync(action);
		}
		
		function cabeceraDetalle(){
			initDialogs();
			$('#iHeader').accordion({collapsible: true, active: 0});
			$('#backLink').button().removeClass('ui-button-text-only').css({'padding':'0.2em 0.5em', 'margin-right':'20px'}).bind("click", function(e) {e.stopPropagation();});;
			$('#backLinkMod').button().removeClass('ui-button-text-only').css({'padding':'0.2em 0.5em', 'margin-right':'20px'}).bind("click", function(e) {e.stopPropagation();});
		}
		
		function refrescar(){
			var pageLoc = $('#pageLoc');
			if(pageLoc.length){
				var ubicacion = pageLoc.val();
				$(document).unbind('keydown');
				currentFilterFieldId="#busqueda";
//  				initGraphics(ubicacion);
			};
			$('input[onRefresh]').each(function(index){
				var onRefreshFunc = $(this).attr('onRefresh');
				var fun = window[onRefreshFunc];
				if($.type(fun) == 'function'){
					fun();
				};
			});
			if($('#iHeader')){
//  				cabeceraDetalle();
			}
		}
		
		function doSubmitAsync(action){
			doSubmitAsync(action,false, null);
		}
		
		function doSubmitAsync(action, focoPrimerCampo, funcionComplemento){
			if (ejecutando == false){
				$("#mainContent").fadeOut(100);
				ejecutando = true;
 				mostrarProcesando();
				var mainForm = $("#mainForm");
				mainForm.action = '${ctx}${sPath}/' + action + '/${tOut}';
				mainForm.ajaxForm().ajaxSubmit({
					url: '${ctx}${sPath}/' + action + '/${tOut}',
					type: "POST",
					success: function(data){
 						ocultarProcesando();
						ejecutando = false;
						var divMainContent = $("#mainContent"); 
						divMainContent.fadeIn(300);
						divMainContent.empty();
						console.log(data);
						var mainContent = $(data).find('#mainContent');
						if(mainContent.length){
							alert("Error aqui quizas.");
							divMainContent.append(mainContent.html());
						}else{
							alert("O aqui quizas.");
							divMainContent.append('<div align="center"><div class="ui-widget ui-widget-content" style="margin-top:30px;">Ha ocurrido un error inesperado.</div></div>');
						}
						alert("Antes de refrescar!!"); 
						refrescar();
						alert("Despues de refrescar!!");
						if($.type(funcionComplemento) == 'function'){
							alert("Entre aqui por asaber que rollos!!");
							funcionComplemento();
						};
						
					  },
					error: function(jqXHR, textStatus, errorThrown){
						ocultarProcesando();
						ejecutando = false;
						var divMainContent = $("#mainContent");
						divMainContent.fadeIn(300);
						divMainContent.empty();
						divMainContent.append('<div align="center" style="margin-top:30px;"><div class="ui-widget ui-widget-content">Ha ocurrido un error inesperado en el servidor.</div></div>');
					}
				});
				
			}
		}
		
		function limpiarCampos(nombreFormulario){
			var elementos = document.getElementById(nombreFormulario);
			for(var i=0,l=elementos.length; i<l; i++){
				if (elementos[i].type == "text"){
					elementos[i].value = "";
				}else if(elementos[i].selectedIndex > 0){
					elementos[i].options[0].selected = true;
				}
			}
		}
		
		function doSubmitBreadcrumb(action, id){
			document.getElementById('id_ubicacion_retorno').value = id;
			doSubmit(action);
		}
		
		$(document).ready(function() {
			numericos();
		});
		
		
		
		</script>
		
</head>
<body>
	<div id="dialog-processing" title="Procesando..."
		style="display: none;">
		<span style="font-size: 85%"> <fmt:message
				key="globales.pagina.dialogo.procesando" /></span>
	</div>