<%@page contentType="text/html; charset=iso-8859-1"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ not empty locale}">
	<fmt:setLocale value="${ locale }" />
</c:if>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="theme" value="${initParam.theme}"/>
<c:set var="themecss" value="jquery-ui-custom.css"/>

<html>
<head>

<link rel="shortcut icon" href="${ctx}/include/images/favicon.ico"/>
<c:if test="${not fn:contains(header['User-Agent'],'MSIE')}">
<link rel="stylesheet" type="text/css" href="${ctx}/include/themes/${theme}/${themecss}"/>
</c:if>
<c:if test="${fn:contains(header['User-Agent'],'MSIE')}">
<link rel="stylesheet" type="text/css" href="${ctx}/include/themes/graymint/${themecss}"/>
</c:if>
<link rel="stylesheet" type="text/css" href="${ctx}/include/styles/ria/jquery.wijmo.wijmenu.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/include/styles/ria/autocomplete.css"/>
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
<style>
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
	
	#navigation-bar .ui-button-text-only .ui-button-text
	{ 
		padding-left: 0.1em;
		padding-right: 0.1em;		
	}
	
	#navigation-bar .ui-button
	{
		margin-left: 0px;
	    margin-right: -0.5em; 
    }
    
    #navigation-bar a 
	{
		width: 18px; 
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
		display: block;
		width: 30%;
		text-align: right;
		padding-right: 5px;
		
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

</style>
<script type="text/javascript">
var counter = 6;
function startCountdown(stopFunction){
	counter--;
	if(counter > 0){
		$('#cont').empty();
		$('#cont').append(counter);
		setTimeout(function(){startCountdown(stopFunction);}, 1000);
	}else{
		if(stopFunction)
			stopFunction();
	}
}
$(document).ready(function(){
	startCountdown(function(){
		window.parent.location="${ctx}/accessor/salir";
	});
});
</script>
<title>Sistema Registro</title>
</head>
<body>
<div style="padding-left: 20%; padding-right: 20%; margin-top: 5em;">
<div class="ui-state-error ui-corner-all" style="padding: 0 .7em; font-size: 1em;"> 
	<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em; margin-top: 2px;"></span> 
	<strong>Sesi&oacute;n Expirada</strong> <br /> 
	<img style="height: 40px; width: 40px;float: left;margin-right: 30px;" src="${ctx}/include/images/hand_stop.png" alt="stop"/>
	<ul>
        	<li>Su sesi&oacute;n ha expirado. Ser&aacute; redirigido a la pantalla de entrada en <strong><span id="cont">5</span></strong> segundos.</li>
	</ul>
</div>
</div>
</body>
</html>