<%@page contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>
<fmt:bundle basename="com.persistence.resourceBundle.MessagesResources">


<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="theme" value="${initParam.theme}"/>
<c:set var="themecss" value="jquery-ui-custom.css"/>

<html>
<head>

<%-- <link rel="shortcut icon" href="${ctx}/include/images/srvfc/favicon.ico"/> --%>
<link rel="stylesheet" type="text/css" href="${ctx}/include/themes/${theme}/${themecss}"/>
<link rel="stylesheet" type="text/css" href="${ctx}/include/styles/ria/jquery.wijmo.wijmenu.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/include/styles/ria/autocomplete.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/include/styles/ria/BreadCrumb.css"/>


<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/main.js"> </script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.js"></script>  
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.fixm.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.wijmo.wijutil.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.wijmo.wijmenu.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.hotkeys.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery-typing.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.maskedinput-1.3.min.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.numeric.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.form.js"></script>
<script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.jBreadCrumb.1.1.js"></script>


<style>
	 body{
		background: url(${ctx}/include/images/background_gradient.jpg) repeat-x;
	} 

	div #crudTable_wrapper{
		font-family: Verdana, Helvetica, Arial, sans-serif; 
		font-size: 0.8em;
	}
	
	
	table tr{
		font-size: 0.75em;
		line-height: 15px;
	}
	row_selected{
		background-color: #cdedff;
	}
	
	row_150{
		width: 40%;
	}
	
	.input-readonly{
		background-color: #eeeee0;
	}
	
	.ui-buttonset .ui-button {
		font-size: 75% !important;
		line-height: 20px;
		padding-left: 5px;
		padding-right: 5px;
	}
	
	.ui-widget{
		font-size: 85% !important;
	}
	
	#action-bar{
		display:block;
		width:60%;
		float:left;
	}
	
	#navigation-bar .ui-button-text-only .ui-button-text{ 
		padding-left: 0.1em;
		padding-right: 0.1em;		
	}
	
	#navigation-bar .ui-button{
		margin-left: 0px;
	    margin-right: -0.5em; 
    }
    
    #navigation-bar a{
		width: 18px; 
    }
    
    #navigation-bar{
	    text-align:right;
	    display:block,width:35%;
	    float:right;
	    margin-left:0px;
    }
	
	.css_right {
		float: right;
	}
	
	.css_left {
		float: left;
	}
	tr.odd {
		
		background-color: #E2E4FF;
		
		
	}
	
	tr.even {
		
		background-color: white;
		
	}
	
	body{
		font: 100%/1.45em "Lucida Grande", Verdana, Arial, Helvetica, sans-serif;
		color: #111;
	}
	
	.row {
	  vertical-align: top;
      border-bottom: 1px; 
	  border-bottom-color: gray; 
	  border-bottom-style: dotted;
	  overflow: hidden;
	}

	.label {
		float: left;
		display: inline-block;
		width: 30%;
		text-align: right;
		padding-right: 5px;
		height: 25px;
	}

	.formvalue {
		float: left;
		width: 60%;
		margin-left: 5px;
		
	}
	
	.clearer{
		clear: both;
	}
	
	div.row {
      clear: both;
      /*padding-top: 5px;*/
	  /*border-bottom: 1px; 
	  border-bottom-color: gray; 
	  border-bottom-style: dotted;*/
	  /*padding-left: 10px;*/ 
	  /*margin-bottom: 5px;*/ 
	  position: relative;
	}

	div.row span.label {
		float: left;
		width: 30%;
		text-align: right;
		/*background-color : #EAEAEA;*/
		padding-right: 5px;
	}

	div.row span.forminput {
		margin-left: 5px;
		text-align: left;
	}
	
	div.row span.inputmessage {
		margin-left: 5px;
		width: 30%;
		text-align: left;
	}
	
	div.row span.ui-state-error{
		position: inherit;
		left: 25px;
	}
	
	.sq{
		line-height: 15px;
		display: inline;
		padding: .15em;	
	}
	
	.sq span.ui-button-text{
		padding: .15em .35em;
	}
	
	.soloMayusculas{
		text-transform: uppercase;
	}

	.wijmo-wijmenu-list .wijmo-wijmenu-child{
		border: 1px solid #ababab;
  		background: #fafafa;
  		font-size: 12px;
	}
	
	
</style>

<script>
	
	//DEFINICION VARIABLES
	var ejecutando = false;
	var sel = false;
	var showingMenu = false;
	var currentRow = -1;
	var currentTab = 0;
	var maxRow = 0;
	
	// AGREGADO PARA SOPORTAR SECUENCIAS DE ESCAPE DE HTML 
	var __entityMap = {
			escape: {
			    "&": "&amp;",
			    "<": "&lt;",
			    ">": "&gt;",
			    '"': '&quot;',
			    "'": '&#39;',
			    "/": '&#x2F;'
			},
			unescape: {
				"&amp;" : "&",
			    "&lt;"  : "<",
			    "&gt;"  : ">",
			    '&quot;': '"',
			    '&#39;' : "'",
			    '&#x2F;': "/"
			} 
	};
	
	var unescapeRegexp = new RegExp('(&amp;|&lt;|&gt;|&quot;|&#39;|&#x2F)', 'g');
	
	String.prototype.escapeHTML = function() {
	    return String(this).replace(/[&<>"'\/]/g, function (s) {
	        return __entityMap.escape[s];
	    });
	}
	
	String.prototype.unescapeHTML = function() {
	    return String(this).replace(unescapeRegexp, function(s){
	    	return __entityMap.unescape[s];
	    });
	}
	// FIN AGREGADO PARA SOPORTAR SECUENCIAS DE ESCAPE DE HTML  -  
	
	//******************************INICIO FUNCIONES******************************
	function breadCrumbInit(){
		
		//$('#breadcrumb').css({'background-color':'#fafafa'}).jBreadCrumb({minimumCompressionElements: 6, previewWidth: 10});
		$('#breadcrumb').addClass('ui-button ui-state-disabled').jBreadCrumb({minimumCompressionElements: 6, previewWidth: 10});
		
	}
	
	function scrollToButton(aid){
	    var aTag = $("#btn" + aid);
	    scrollSmoothTo(aTag);
	}
	
	function scrollSmoothTo(jqObj){
		if(jqObj.length){
		    $('html,body').animate({scrollTop: jqObj.offset().top},'slow');
		    jqObj.focus();
	    }
	}
	
	function objToString(o) {
	    var s = '{\n';
	    for (var p in o)
	        s += '    "' + p + '": "' + o[p] + '"\n';
	    return s + '}';
	}
	
	// helper
	function elementToString(n, useRefs) {
	    var attr = "", nest = "", a = n.attributes;
	    for (var i=0; a && i < a.length; i++)
	        attr += ' ' + a[i].nodeName + '="' + a[i].nodeValue + '"';
	
	    if (n.hasChildNodes == false)
	        return "<" + n.nodeName + "\/>";
	
	    for (var i=0; i < n.childNodes.length; i++) {
	        var c = n.childNodes.item(i);
	        if (c.nodeType == 1)       nest += elementToString(c);
	        else if (c.nodeType == 2)  attr += " " + c.nodeName + "=\"" + c.nodeValue + "\" ";
	        else if (c.nodeType == 3)  nest += c.nodeValue;
	    }
	    var s = "<" + n.nodeName + attr + ">" + nest + "<\/" + n.nodeName + ">";
	    return useRefs ? s.replace(/</g,'&lt;').replace(/>/g,'&gt;') : s;
	}
	
	function isValueSelected(){
		
		if(!sel){
			$( "#dialog-alert" ).dialog("open");
			return false;	
		}else{
			return true;
		}				 
	}
	
	function doCheckSubmit(action){
		if(isValueSelected()){
			doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera'}">Async</c:if>(action);
		}
	}
	
	function doSubmitBreadcrumb(action, id){
		document.getElementById('id_ubicacion_retorno').value = id;
		doSubmit(action);
	}
	
	function doSubmit(action){	
		if (ejecutando == false){
			document.mainForm.action = '${ctx}${sPath}/' + action + '/${tOut}';
			document.mainForm.submit();
			mostrarProcesando();
			ejecutando = true;
		}
	}
	
	function doSubmitAndWait(action){	
			document.mainForm.action = '${ctx}${sPath}/' + action + '/${tOut}';
			document.mainForm.submit();
			mostrarDialogoEspera();
	}
	
	function mostrarDialogoEspera(){
		ejecutando = true;
		$("#dialog-confirm-download").dialog('open');
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
	
	function dialogAyuda(){
		$('.btnAyuda').button({
			icons: {
	            primary: "ui-icon-help"
	        },
	        text: false
		}).css({'margin': '4px','height': '20px', 'width': '20px' , 'position': 'absolute', 'top-margin': '5px'});
		dialogHelp();
	}
	
	function mostrarProcesando(){
		$( "#dialog-processing" ).dialog("open");
	}
	
	function ocultarProcesando(){
		$( "#dialog-processing" ).dialog("close");
	}
	
	function doSort(col,nombre){
		$('#columna').val(col);
		var esAsync = $('#esAsync');
		if(esAsync.length){
			doSubmitAsync(nombre + '/ordenamientoColumna');
		}else{
			doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera'}">Async</c:if>(nombre + '/ordenamientoColumna');
		}
	}
	
	function initDialogs(){
		dialogConfirm();
		dialogConfirmCasaMatriz();
		dialogConfirmCasaParam();
		dialogConfirmProcess();
		dialogConfirmCreate();
		dialogAlert();
		dialogProcessing();
		if($('#btnReporte').length){
			dialogConfirmDownload();	
		};
	}
	
	function dialogConfirm(){
		$( "#dialog-confirm" ).dialog({ 
			autoOpen: false,
			resizable: false,
			height:200,
			modal: true,
			position: ['center', 75],
			buttons: {
				'<fmt:message key="globales.listado.dialogo.eliminar.opcion.positivo"/>': function() {
					doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera'}">Async</c:if>('<c:out value="${nombre}"/>' + '/eliminar');
					$( this ).dialog( "close" );
				},
				'<fmt:message key="globales.listado.dialogo.eliminar.opcion.negativo"/>': function() {
					$( this ).dialog( "close" );
				}
			}
		});
	}
	
	function dialogConfirmCasaMatriz(){
		$( "#dialog-confirm-casa" ).dialog({
			autoOpen: false,
			resizable: false,
			height:210,
			width: 500,
			modal: true,
			position: ['center', 75],
			buttons: {
				'<fmt:message key="globales.listado.dialogo.eliminar.opcion.negativo"/>': function() {
					$( this ).dialog( "close" );
				}
				,
				'<fmt:message key="globales.listado.dialogo.eliminar.opcion.positivo"/>': function() {
					doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera'}">Async</c:if>('<c:out value="${nombre}"/>' + '/eliminar');
					$( this ).dialog( "close" );
				}
			}
		});
	}
	
	function dialogConfirmCasaParam(){
		$( "#dialog-confirm-casaParam" ).dialog({
			autoOpen: false,
			resizable: false,
			height:210,
			width: 500,
			modal: true,
			position: ['center', 75],
			buttons: {
				'<fmt:message key="globales.listado.dialogo.eliminar.opcion.negativo"/>': function() {
					$( this ).dialog( "close" );
				}
				,
				'<fmt:message key="globales.listado.dialogo.eliminar.opcion.positivo"/>': function() {
					doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera'}">Async</c:if>('<c:out value="${nombre}"/>' + '/eliminar');
					$( this ).dialog( "close" );
				}
			}
		});
	}
	
	function dialogConfirmDownload(){
		$( "#dialog-confirm-download" ).dialog({
			autoOpen: false,
			resizable: false,
			height:200,
			close: function(){
				ejecutando = false;
			},
			modal: true,
			position: ['center', 75],
			buttons: {
				'Continuar': function() {
					ejecutando = false;
					$( this ).dialog( "close" );
				}
			}
		});
	}
	
	function dialogGeneric(){
		$( "#dialog-generic" ).dialog({
			autoOpen: false,
			resizable: false,
			height:190,
			width:400,
			modal: true,
			position: ['center', 75],
			buttons: {
				'<fmt:message key="globales.listado.dialogo.general.opcion.cerrar"/>': function() {
					$( this ).dialog( "close" );
				}
			}
		});
	}
	
	function dialogConfirmProcess(){
		$( "#dialog-confirm-process" ).dialog({
			autoOpen: false,
			resizable: false,
			height:200,
			modal: true,
			position: ['center', 75],
			buttons: {
				'<fmt:message key="globales.listado.dialogo.procesar.opcion.positivo"/>': function() {
					doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera'}">Async</c:if>('<c:out value="${nombre}"/>' + '/procesar');
					$( this ).dialog( "close" );
				},
				'<fmt:message key="globales.listado.dialogo.procesar.opcion.negativo"/>': function() {
					$( this ).dialog( "close" );
				}
			}
		});
	}
	
	function dialogHelp(){
		$( "#dialog-ayuda" ).dialog({
			autoOpen: false,
			resizable: false,
			width:300,
			height:450,
			modal: true,
			position: ['right', 75],
			buttons: {
				'<fmt:message key="globales.listado.dialogo.general.opcion.cerrar"/>': function() {
					$( this ).dialog( "close" );
				}
			}
			
		});
	}
	
	function mostrarDialogoGeneral(title, message){
		var dialogo = $( "#dialog-generic" );
		var mensaje = $( "#dialog-message-generic" );
		
		dialogo.removeAttr('title');
		dialogo.attr('title', title);
		
		mensaje.empty();
		mensaje.append(message);
		
		dialogGeneric();
		dialogo.dialog('open');
	}
	
	function dialogConfirmCreate(){
		$( "#dialog-confirm-create" ).dialog({
			autoOpen: false,
			resizable: false,
			height:200,
			modal: true,
			position: ['center', 75],
			buttons: {
				'<fmt:message key="globales.formulario.dialogo.crear.opcion.positivo"/>': function() {
					doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera'}">Async</c:if>('<c:out value="${nombre}"/>' + '/eliminar');					
				},
				'<fmt:message key="globales.formulario.dialogo.crear.opcion.negativo"/>': function() {
					$( this ).dialog( "close" );
				}
			}
		});
	}
	
	function dialogAlert(){
		$( "#dialog-alert" ).dialog({
			autoOpen: false,
			resizable: false,
			height:200,
			modal: true,
			position: ['center', 75],
			buttons: {
				Ok: function() {
						$( this ).dialog( "close" );
					}
			}
		});

	}
	
	function dialogProcessing(){
		$( "#dialog-processing" ).dialog({
			autoOpen: false,
			resizable: false,
			height:100,
			position:['right', 'top'],
			modal: false
		});
	}
	
	function seleccionarLov(){
		<c:if test="${ not empty busquedaEnllavador}">		
		$('#crudTable tbody tr').dblclick(function(){
			doSubmit('<c:out value="${nombre}"/>' + '/buscarSeleccionar');
		});
		</c:if>
		<c:if test="${ empty busquedaEnllavador}">		
		var listName = $('#listadoLov');
		if(listName.length){
			$('#crudTable tbody tr').dblclick(function(){
				var esAsync = $('#esAsync');
				if(esAsync.length){
					doSubmitAsync(listName.val() + '/buscarSeleccionar');
				}else{
					doSubmit(listName.val() + '/buscarSeleccionar');
				}
			});			
		}
		</c:if>
	}
	
	function doForaneo(foraneo, action){
		$("#nombreBusqueda").val(foraneo);
// 		doSubmit<c:if test="${ not empty detalle.cabecera || ubicacion == 'cabecera' || not empty esAsync}">Async</c:if>(action);
		doSubmit(action);
	}
	
	function doForaneoAsync(foraneo, action){
		$("#nombreBusqueda").val(foraneo);
		doSubmitAsync(action);
	}
	
	function formarListado(){
		var ct = $('#crudTable');
		ct.addClass('ui-widget');
		// Estilizacion de las cabeceras 
		$('thead tr th', ct).addClass('ui-state-default');
		// Estilizacion de las filas impares
		$('tbody tr:odd', ct).addClass('ui-odd odd');
		// Estilizacion de las filas pares				
		$('tbody tr:even', ct).addClass('ui-even even');
		// Botones 
		$("button, input:submit, input:reset, input:button").button();
		$('#action-buttons').css({'width':'100%'}).addClass('ui-helper-clearfix');
		$('#navigation-bar').buttonset();
<c:if test="${fn:contains(header['User-Agent'],'MSIE')}">				
		$('#navigation-bar :button[id^="pag"]').css({'margin-right':'0.01em'});
</c:if>		
	}
	
	function crudTable(){
		var ct = $('#crudTable');
		$('thead tr th[onclick]', ct).each(function(index){
			var iconClass = $(this).attr('sort');
			
			if(iconClass == 'DESC'){
				iconClass = 'ui-icon-triangle-1-s';
			}else if(iconClass == 'ASC'){
				iconClass = 'ui-icon-triangle-1-n';
			}else{
				iconClass = 'ui-icon-carat-2-n-s';
			}
			var oldHtml = $(this).html();
			$(this).html('<div style="cursor: pointer; display: block;"><span class="css_right ui-icon ' + iconClass +'"></span>' + oldHtml + ' </div> ');
		});
		
		$('tbody tr', ct).each(function(index){
			$(this).css({'font-weight':'normal'});
		});
		
		if(ct.length){
			changeCurrentCell();
			teclado();
		}
	}
	
	function title(){
		if($('#iTitle').length){
			$('#iTitle').css({'margin-bottom':'1%'});
		}
	}
	
	function busqueda(){
		$('#busqueda').keypress(function(e){
	        code= (e.keyCode ? e.keyCode : e.which);
	        if (code == 13){
// 	        	doFiltrarPor();
				e.stopPropagation();
				e.preventDefault();
				return false;
			}
		});
		$('#busqueda').attr('name', $("#campoBusqueda option:first").val());
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
	
	function botones(){
		// Botones 
		$("button, input:submit, input:reset, input:button").button();
		$("button.sq").css({'padding':'.15em'});
		$('#action-buttons').css({'width':'100%'}).addClass('ui-helper-clearfix');
		$('#action-bar').buttonset();
		$('#action-bar input').css({'width':'6em'});
		// Fix visual
		$('span.ui-state-default').css({'border-top':'0px'});
		
		//botones de crear...
// 		$("button, input:submit, input:reset, input:button").button();
// 		$("button.sq").css({'padding':'.15em'});
// 		$('#action-buttons').css({'width':'100%'}).addClass('ui-helper-clearfix');
// 		$('#action-bar').buttonset().css({'display':'block','width':'40%', 'float':'left'});
// 		$('#action-bar input').css({'width':'75px'});
	}
	
	function onfocusAction(){
		// Onfocus action
		$('.row > span > input, .row > span > textarea, .row > span > select').focus(function(){
			$(this).parents('.row').addClass("ui-state-active");
		}).blur(function(){
			$(this).parents('.row').removeClass("ui-state-active");
		});
	}
	
	function fecha(){
		var dFields = $('input[cdate]');
		 dFields.datepicker({
		    closeText: 'Cerrar',
			prevText: '&#x3c;Ant',
			nextText: 'Sig&#x3e;',
			currentText: 'Hoy',
			monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
			'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
			monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
			'Jul','Ago','Sep','Oct','Nov','Dic'],
			dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
			dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
			dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
			weekHeader: 'Sm',
			dateFormat: 'dd-mm-yy',
			//firstDay: 1,
			isRTL: false,
			showMonthAfterYear: false,
			yearRange: "c-30:c+10",
			changeMonth: true,
			changeYear: true,
			yearSuffix: '',
			onSelect: function( selectedDate ) {
				if($(this).attr('cattr')){
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(
							instance.settings.dateFormat ||
							$.datepicker._defaults.dateFormat,
							selectedDate, instance.settings );
					$('#' + $(this).attr('cdate')).datepicker('option', $(this).attr('cattr'), date);
				}
			}
		});
		
		 dFields.each(function(index){
			$(this).mask("99-99-9999");
		});
	}
	
	function getLocale(){
		if ( navigator ) {
		    if ( navigator.language ) {
		        return navigator.language;
		    }
		    else if ( navigator.browserLanguage ) {
		        return navigator.browserLanguage;
		    }
		    else if ( navigator.systemLanguage ) {
		        return navigator.systemLanguage;
		    }
		    else if ( navigator.userLanguage ) {
		        return navigator.userLanguage;
		    }
		}
	}
	
	function focoPrimerCampo(){
		var primerCampo = <c:if test="${ not empty primerCampo}">$('#<c:out value="${primerCampo}"/>');</c:if> <c:if test="${empty primerCampo}">null;</c:if>
		if(primerCampo == null || !primerCampo.length){
			var nombreCampo = $('#primerCampo').val();
			primerCampo = $("#"+nombreCampo);
		}
		
		if(primerCampo.length){
			autoFocusPrimerCampo(primerCampo);
		}else{
			primerCampo = $('input[tabindex=2]');
			if(!primerCampo.length){primerCampo = $('button[tabindex=2]');};
			autoFocusPrimerCampo(primerCampo);
		};			
	}
	
	function autoFocusPrimerCampo(primerCampoObject){
		if(primerCampoObject != null && primerCampoObject.length){
			primerCampoObject.focus();
			jQuery(document).bind('keydown', 'ctrl+p', function(evt) {
				primerCampoObject.focus();
				evt.stopPropagation();
				evt.preventDefault();
				return false;
			});			
		};
	}
	
	//CAMPOS CON AUTOCOMPLEMENTO
	function doSeleccionarAutoComplemento(action, negocioBusqueda, campoComplemento, propBusqueda, llave){
		$.ajax({
			  url: '${ctx}${sPath}/' + action + '/${tOut}',
			  data: $.param({
				  idForaneoAuto: llave,
				  negocioBusquedaAuto: negocioBusqueda,
				  random: Math.random 
			  })  + "&" + $('#mainForm').serialize(),
			  context: document.mainForm,
			  type: "POST",
              dataType: "json",
			  success: function(data){
			  }
			});
	}
	
	function highlightMatch(s, t) {
		  var matcher = new RegExp("("+$.ui.autocomplete.escapeRegex(t)+")", "i" );//como modificador se le deberia de enviar i(g de global) para que encuentre todos los matches si se hiciera un LIKE en la cadena completa como autocomplemento
		  return s.replace(matcher, "<b>$1</b>");
	}
	
	function autoComplemento(){
		$('input[alt^="auto|"]').each(function(){
			var autoCompleteInput = $(this);
			var parametros = autoCompleteInput.attr("alt").split("|");
			var action = parametros[1];
			var acParam = action.split("/");
			var negocioBusqueda = parametros[2];
			var campoComplemento = $("#"+parametros[3]);
			var propBusqueda = parametros[4];
			var campoLlave = $("#"+parametros[5]);
			var validacionMensaje = $("#"+parametros[6]);
			
			autoCompleteInput.blur(function(evt){
				if((campoLlave.val() == "" && autoCompleteInput.val() != "")){
					validacionCodigo(acParam[0],campoComplemento,propBusqueda,campoLlave,negocioBusqueda, autoCompleteInput,validacionMensaje);
				}else{
					validacionMensaje.empty();
				}
			});
			
			autoCompleteInput.typing({
			    start: function (event, elem) {
			    	campoLlave.val('');
			    	campoComplemento.val('');
			    },
			    stop: function (event, elem) {
			    }
			});
			
			var cacheData = null;
			autoCompleteInput.autocomplete({
				autoFocus: true,
				minLength: 1,
				search: function(request, response){
					campoComplemento.val('');
					campoLlave.val('');
					autoCompleteInput.addClass('ac_loading');
					return true;
				}, 
				source: function(request, response){
					$.ajax({
						  url: '${ctx}${sPath}/' + action + '/${tOut}',
						  data: $.param({
							  negocioBusquedaAuto: negocioBusqueda,
							  propiedadBusqueda: propBusqueda,
							  busqueda: request.term,
							  random: Math.random
						  }) + "&" + $('#mainForm').serialize(),
						  context: document.mainForm,
						  type: "POST",
						  success: function(data){
							  cacheData = $.map(data, function(item){
								  return{
									  	label: highlightMatch(item.label + ' ' + item.aux, request.term),
									  	value: item.label, //Lo que se muestra a ir cambiando de menu necesario que la variable se llame value
									  	aux:item.aux, // Complemento del autocomplete que se muestra en un campo anexo
									  	key: item.value // Identificador del valor seleccionado.
									  };});
							  response(cacheData);
							  autoCompleteInput.removeClass('ac_loading');
						  }
						});
				},
				select: function( event, ui ) {
					autoCompleteInput.val(ui.item.value);
					campoComplemento.val(ui.item.aux);
					campoLlave.val(ui.item.key);
					validacionMensaje.empty();
					doSeleccionarAutoComplemento(acParam[0]+'/autoSeleccion', negocioBusqueda, campoComplemento, propBusqueda, ui.item.key);
					return false;
				}
			}) .data( "autocomplete" )._renderItem = function( ul, item ) {
	            return $( "<li></li>" )
	                  .data( "item.autocomplete", item )
	                  .append( $( "<a></a>" ).html(item.label) )
	                  .appendTo( ul );
	          };
	          
		});
	}
	
	function validacionCodigo(negocio,campoComplemento,propBusqueda,campoLlave,negocioBusqueda, campoAutocomplemento, validacionMensaje){
		var codigo = campoAutocomplemento.val();
		var campoMensaje = validacionMensaje;
		
		campoMensaje.empty();
		campoMensaje.addClass('ac_loading_label');
		campoMensaje.append("Validando...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		campoMensaje.fadeIn(100);
		
		$.ajax({
			  url: '${ctx}${sPath}/' + negocio + "/validarAutoComplemento" + '/${tOut}',
			  data: $.param({
				  propiedadBusqueda: propBusqueda,
				  valorPropiedadBusqueda: codigo,
				  negocioBusqueda: negocioBusqueda,
				  random: Math.random
			  }) + "&" + $('#mainForm').serialize(),
			  context: document.mainForm,
			  type: "POST",
              dataType: "json",
	          error: function(data,error){
		        	campoComplemento.val('');
					campoLlave.val('');
					campoAutocomplemento.val('');
		        	campoMensaje.removeClass('ac_loading_label');
		        	campoMensaje.empty();
		        	campoMensaje.append('<span style="font-size: 90%;" class="ui-state-error">ERROR: no se ha podido validar contra el servidor.</span>');
	           },
			  success: function(data){
				  if(data.value){
					  campoLlave.val('');
					  campoLlave.val(data.value);
					  
					  campoAutocomplemento.val('');
					  campoAutocomplemento.val(data.label);
					  
					  campoComplemento.val('');
					  campoComplemento.val(data.aux);
					  campoMensaje.empty();
				  }else{
					  campoComplemento.val('');
					  campoLlave.val('');
					  campoAutocomplemento.val('');
					  campoMensaje.fadeOut(100);
					  campoMensaje.removeClass('ac_loading_label');
					  campoMensaje.empty();
					  campoMensaje.append('<span style="font-size: 90%;" class="ui-state-error"> <fmt:message key="globales.validacion.autoComplemento"/> </span>');
					  campoMensaje.fadeIn(100);
				  }
			  }
			});	
	}
	
	function bindKeyAction(shortKey, element) {
		jQuery(document).bind('keydown', shortKey, function(evt) {
			element.click();
			evt.stopPropagation();
			evt.preventDefault();
			return false;
		});
		$('input[type!="hidden"], textarea').bind('keydown', shortKey, function(evt) {
			element.click();
			evt.stopPropagation();
			evt.preventDefault();
			return false;
		});
	}

	function bindHeaderInfo(btn){
		$(document).bind("keydown", 'shift+c', function(evt){
			btn.click();
			evt.stopPropagation();
			evt.preventDefault();
			return false;
		});
	}
	
	function bindAllActionKeys() {
		var btn;
		btn = $('#btnCrear');
		if (btn.length) {
			bindKeyAction('Shift+n', btn);
		}
		
		btn = $('#btnVer');
		if (btn.length) {
			bindKeyAction('Shift+v', btn);
		}
		
		btn = $('#btnActualizar');
		if (btn.length) {
			bindKeyAction('Shift+m', btn);
		}
		
		btn = $('#btnEliminar');
		if (btn.length) {
			bindKeyAction('Shift+e', btn);
		}
		
		btn = $('#btnDetalle');
		if (btn.length) {
			bindKeyAction('Shift+d', btn);
		}
		
		btn = $('#btnAnular');
		if (btn.length) {
			bindKeyAction('Shift+a', btn);
		}
		
		btn = $('#btnProcesar');
		if (btn.length) {
			bindKeyAction('Shift+p', btn);
		}
		
		btn = $('#btnSeleccionar');
		if (btn.length) {
			bindKeyAction('Shift+s', btn);
		}
		
		btn = $('#btnFiltrar');
		if (btn.length) {
			bindKeyAction('Shift+f', btn);
		}
		
		btn = $('#btnAnterior');
		if (btn.length) {
			bindKeyAction('Shift+pageup', btn);
		}
		
		btn = $('#btnSiguiente');
		if (btn.length) {
			bindKeyAction('Shift+pagedown', btn);
		}
		
		btn = $('#btnRemoverOrden');
		if (btn.length) {
			bindKeyAction('Shift+o', btn);
		}
		
		btn = $('#btnRemoverFiltro');
		if (btn.length) {
			bindKeyAction('Shift+r', btn);
		}
		
		btn = $('#btnCancelar');
		if (btn.length) {
			bindKeyAction('esc', btn);
		}

		btn = $('#btnGuardar');
		if (btn.length) {
			bindKeyAction('ctrl+g', btn);
		}
		
		btn = $('#btnAplicarFiltro');
		if (btn.length) {
			bindKeyAction('ctrl+a', btn);
		}
		
		btn = $('#btnLimpiar');
		if (btn.length) {
			bindKeyAction('ctrl+l', btn);
		}
		
		btn = $('#backLink');
		if(btn.length){
			bindKeyAction('esc', btn);
		}
		
		btn = $('#headerInfo');
		if(btn.length){
			bindHeaderInfo(btn);
		}
		
		var lstTab = $('#detailTabs');
		if(lstTab.length){
			var currentTab = $('#detailTabs li a[class^="ui-selected"]');
			var tabIndex = $('#detailTabs li a').index(currentTab);
			var tabMax = 0;
			
			var liTabs = $('#detailTabs li');
			tabMax = liTabs.length - 1;
			
			function changeCurrentTab(){
				var btnTab = $('#detailTabs li a')[tabIndex];
				if(btnTab){
					btnTab.onclick();
				}
			}

			$(document).bind('keydown','shift+right',function(evt){
				if(tabIndex < tabMax ){
					tabIndex++;
					changeCurrentTab();
				}
			});
			
			$(document).bind('keydown','shift+left',function(evt){
				if(tabIndex > 0 ){
					tabIndex--;
					changeCurrentTab();
				}
			});
			
		}
	}
	
	function changeCurrentCell() {
        var tableRow = $('#crudTable tbody tr')[currentRow];
        if(tableRow)
        	tableRow.onclick();
    }
	
	function bajarFila(evt){
		var maximoFilas = $('#maxRowNum');
		if(maximoFilas.length){
			maxRow = maximoFilas.val();
		}
		
		if(currentRow < maxRow){
			currentRow++;
			changeCurrentCell();
			evt.stopPropagation();
			evt.preventDefault();
			return false;
    	}else{
    		return true;
    	}
	}
	
	function subirFila(evt){
		if(currentRow > 0){
			currentRow--;
			changeCurrentCell();
			evt.stopPropagation();
			evt.preventDefault();
			return false;
		}else{
			return true;
		}
	}
	
	function teclado(){
		$(document).unbind('keydown', subirFila);
		$(document).unbind('keydown', bajarFila);
		
		$(document).bind('keydown','up', subirFila);
		$(document).bind('keydown','down', bajarFila);
	}
	
	function refrescar(){
		var pageLoc = $('#pageLoc');
		if(pageLoc.length){
			var ubicacion = pageLoc.val();
			$(document).unbind('keydown');
			currentFilterFieldId="#busqueda";
			initGraphics(ubicacion);
		};
		$('input[onRefresh]').each(function(index){
			var onRefreshFunc = $(this).attr('onRefresh');
			var fun = window[onRefreshFunc];
			if($.type(fun) == 'function'){
				fun();
			};
		});
// 		if($('#iHeader').length){
// 			cabeceraDetalle();
// 		}
	}

	function doSubmitAyuda(action, helpkey){
		if (ejecutando == false){
			ejecutando = true;
			var labelMensaje = $('#dialog-help-message');
			
			labelMensaje.empty();
			$('#dialog-ayuda').dialog('open');
			labelMensaje.append('<div align="center"><img src="${ctx}/include/images/loader8.gif" alt="cargando"/></div>');
			labelMensaje.fadeIn();
			
			$.ajax({
				  url: '${ctx}${sPath}/' + action + '/${tOut}',
				  data: $.param({
					  'LLAVE_AYUDA': helpkey,
					  'random': Math.random
				  }),
				  context: document.mainForm,
				  type: "POST",
	              dataType: "json",
		          error: function(data,error){
		        	  ejecutando = false;
		        	  labelMensaje.fadeOut(function(){
						  labelMensaje.empty();
						  labelMensaje.append('No se ha podido cargar la ayuda solicitada.');
						  labelMensaje.fadeIn();
					  });
		           },
				  success: function(data){
					  ejecutando = false;
					  labelMensaje.fadeOut(function(){
						  labelMensaje.empty();
						  labelMensaje.append('<div>'+data.ayuda.unescapeHTML()+'</div>');
						  //labelMensaje.append($('<div/>').text(data.ayuda).html());
						  labelMensaje.fadeIn();
					  });
				  }
				});
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

					var divBreadcrumb = $('#breadcrumb');
					var innerBreadcrumb = divBreadcrumb.html();
					divBreadcrumb.fadeIn(10);
					divBreadcrumb.empty();
					
					var breadcrumb = $(data).find('#breadcrumb');
					if(breadcrumb.length){
						divBreadcrumb.append(breadcrumb.html());
					}else{
						divBreadcrumb.append(innerBreadcrumb);
					}
					
					var divMainContent = $("#mainContent"); 
					divMainContent.fadeIn(300);
					divMainContent.empty();
					 
					var mainContent = $(data).find('#mainContent');
					if(mainContent.length){
						divMainContent.append(mainContent.html());
					}else{
						divMainContent.append('<div align="center"><div class="ui-widget ui-widget-content" style="margin-top:30px;">Ha ocurrido un error inesperado.</div></div>');
					}
					
					refrescar();
					if($.type(funcionComplemento) == 'function'){
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
	
	function initGraphics(ubicacion){
		bindAllActionKeys();
		botones();
		title();
		breadCrumbInit();
		
		
		//LISTADO
		if(ubicacion == 'listado'){
			formarListado();
// 			getLocale();
			initDialogs();
			crudTable();
// 			busqueda();
			seleccionarLov();
		}
		
		//VER
		if(ubicacion == 'ver'){
			dialogProcessing();
			$(".row").fixm();
		}
		
		//FILTRAR CREAR Y ACTUALIZAR Y REPORTES
		if(ubicacion == 'filtrar' || ubicacion == 'crear' || ubicacion == 'actualizar' || ubicacion == 'reporte'){
			onfocusAction();
			fecha();
			dialogProcessing();
			focoPrimerCampo();
			//CAMPOS CON AUTOCOMPLEMENTO
			autoComplemento();
			numericos();
			$(':input[readonly]').addClass('input-readonly');
			//agregando return false a los button de submit para que no haya doble submit
			$(':button[type="submit"]').each(function(index){
				var currAttr = $(this).attr('onClick');
				if(currAttr != '' && typeof currAttr != 'undefined'){
					$(this).attr('onClick',currAttr + ' return false;');
				}
			});
			//Scroll hacia campo
			var scrollTo = $('#scrollSmooth');
			if(scrollTo.length){
				scrollToButton(scrollTo.val());
			}
			// Dialog de ayuda
			dialogAyuda();
		}
		
		//CABECERA
		if(ubicacion == 'cabecera'){
			cabeceraDetalle();			
		};
		
		//mayusculas();
		
	};
	
	function cabeceraDetalle(){
		initDialogs();
		$('#iHeader').accordion({collapsible: true, active: 0});
		$('#backLink').button().removeClass('ui-button-text-only').css({'padding':'0.2em 0.5em', 'margin-right':'20px'}).bind("click", function(e) {e.stopPropagation();});;
		$('#backLinkMod').button().removeClass('ui-button-text-only').css({'padding':'0.2em 0.5em', 'margin-right':'20px'}).bind("click", function(e) {e.stopPropagation();});
	}
	
	function mayusculas(){
		$('input[type=text][alt!=ignoreMayus], textarea[alt!=ignoreMayus]').each(function(index){
			$(this).addClass("soloMayusculas");
			$(this).keyup(function(event) {
				if(event.keyCode != 16 && event.keyCode != 9 && (event.keyCode < 35 || event.keyCode > 40)){//se agrega desde 35 (antes 37)) para incluir home y end 35, 36
			        // Remember original caret position
			        var caretPosition = getCaretPosition(this);
	
			        // Uppercase-ize contents
		            this.value = this.value.toUpperCase();
// 			        $(this).removeClass("soloMayusculas");
// 			        this.value = valMayus;
// 			        $(this).addClass("soloMayusculas");
	
			        // Reset caret position
			        setCaretPosition(this, caretPosition);
				}
		    });
			$(this).blur(function(event) {
	            this.value = this.value.toUpperCase();
		    });
		});
	}
	
	function getCaretPosition(ctrl) {
	    var CaretPos = 0;    // IE Support
	    if (document.selection) {
	        ctrl.focus();
	        var Sel = document.selection.createRange();
	        Sel.moveStart('character', -ctrl.value.length);
	        CaretPos = Sel.text.length;
	    }
	    // Firefox support
	    else if (ctrl.selectionStart || ctrl.selectionStart == '0') {
	        CaretPos = ctrl.selectionStart;
	    }

	    return CaretPos;
	}

	function setCaretPosition(ctrl, pos) {
	    if (ctrl.setSelectionRange) {
	        ctrl.focus();
	        ctrl.setSelectionRange(pos,pos);
	    }
	    else if (ctrl.createTextRange) {
	        var range = ctrl.createTextRange();
	        range.collapse(true);
	        range.moveEnd('character', pos);
	        range.moveStart('character', pos);
	        range.select();
	    }
	}

	
	var currentFilterFieldId="#busqueda";
	function doBusquedaRapida(searchInputId, searchName, searchOption){
		$(searchInputId).attr('name', searchName);
		$(searchInputId).val('');
		
		if(searchOption.attr('ctype')){
			$(currentFilterFieldId).fadeOut(function(){
				currentFilterFieldId = '#'+searchName;
				$(currentFilterFieldId).fadeIn('slow');
			});
		}else{
			if(!$(searchInputId).is(':visible')){
				$(currentFilterFieldId).fadeOut(function(){
					currentFilterFieldId = searchInputId;
					$(currentFilterFieldId).fadeIn('slow');
				});
			}
		};
	}
	//******************************FIN FUNCIONES*****************************
	

	$(document).ready(function() {
		initGraphics('<c:out value="${ubicacion}"/>');
	});

</script>
</head>

<body>
<div id="dialog-ayuda" title='Ayuda'  style="display: none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span><label id="dialog-help-message"></label></p>
</div>
<div id="dialog-confirm-download" title='Reporte'  style="display: none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span> Cierre la ventana cuando el reporte haya sido recibido. </p>
</div>
<div id="dialog-confirm" title='Confirmar'  style="display: none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span> <fmt:message key="globales.listado.dialogo.eliminar"/></p>
</div>
<div id="dialog-confirm-casa" title='Confirmar'  style="display: none;">
	<p ><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0; "></span> <fmt:message key="comision.listado.eliminar.transaccion"/></p>
</div>
<div id="dialog-confirm-casaParam" title='Confirmar'  style="display: none;">
	<p ><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0; "></span> <fmt:message key="comision.listado.eliminar.transaccionEliminar"/></p>
</div>
<div id="dialog-confirm-process" title='Confirmar'  style="display: none;">
	<p ><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span> <fmt:message key="globales.listado.dialogo.procesar"/></p>
</div>

<div id="dialog-confirm-create" title='Confirmar'  style="display: none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span> <fmt:message key="globales.formulario.dialogo.crear"/></p>
</div>

<div id="dialog-alert" title='Alerta'  style="display: none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span><fmt:message key="globales.listado.dialogo.seleccionarRegistro"/></p>
</div>
<div id="dialog-generic" title='Alerta' style="display: none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span><label id="dialog-message-generic"></label></p>
</div>
<div id="dialog-processing" title="Procesando..."  style="display: none;">
	<span style="font-size: 85%"> <fmt:message key="globales.pagina.dialogo.procesando"/></span>
</div>
</fmt:bundle>
<!--[if lt IE 7]>   
<div class="ui-widget ui-widget-content ui-state-error" style="font-size: 10px; width: 100%;">
	Navegador: <c:out value="${header['User-Agent']}" /> Usted est&aacute; utilizando un navegador no soportado por el sistema.  Algunas opciones podr&iacute;an no funcionar correctamente.<br /> Por favor considere
	utilizar un navegador mas reciente como <a target="_parent" href="https://www.google.com/chrome" >Google Chrome</a> o <a target="_parent" href="http://www.mozilla.org/es-ES/firefox">Firefox</a>
</div> <br />
<![endif]-->
