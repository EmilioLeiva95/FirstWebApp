<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="path" value="${pageContext.request.servletPath}"/>
<c:set var="theme" value="${initParam.theme}"/>
<c:set var="ui" value="${initParam.ui}"/>

<c:set var="themecss" value="jquery-ui-custom.css"/>
<html>
<head>
	<title>Menu</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header-sin-menu.jsp"%>
	
	
    <style type="text/css">
    
:root {
    --color-base-texto: #FFFFFF; 
    --color-base-web: #1D71B8;
}
    
    .nav-side-menu {
  overflow: auto;
  font-size: 14px;
  font-weight: 300;
  background-color: var(--color-base-web);
  position: fixed;
  top: 0px;
  width: 300px;
  height: 100%;
  color: var(--color-base-texto);
}
.nav-side-menu .brand {
  background-color: var(--color-base-web) !important;
  line-height: 50px;
  display: block;
  text-align: center;
  font-size: 14px;
  -webkit-box-shadow: 0px 10px 10px 0px rgba(0,0,0,0.73);
	-moz-box-shadow: 0px 10px 10px 0px rgba(0,0,0,0.73);
	box-shadow: 0px 10px 10px 0px rgba(0,0,0,0.73);
/*    border-bottom: 1px solid #415160; */
}
.nav-side-menu .toggle-btn {
  display: none;
}
.nav-side-menu ul,
.nav-side-menu li {
  list-style: none;
  padding: 0px;
  margin-bottom: 0px;
  line-height: 35px;
  cursor: pointer;
  list-style-type: none; 
  background-color: var(--color-base-web);
}

.nav-side-menu ul .active,
.nav-side-menu li .active {
/*   border-left: 3px solid #2980B9; */
  background-color: #4f5b69;
}
.nav-side-menu ul .sub-menu li.active,
.nav-side-menu li .sub-menu li.active {
  color: #1ABC9C;
  background-color: #4f5b69;
}
.nav-side-menu ul .sub-menu li.active a,
.nav-side-menu li .sub-menu li.active a {
   color: #FFC400; 
}
.nav-side-menu ul .sub-menu li a,
.nav-side-menu li .sub-menu li a {
  display:inline-block;
  width: 100%;
}
.nav-side-menu ul .sub-menu li,
.nav-side-menu li .sub-menu li {
  background-color: #1D71B8;
  border: none;
  line-height: 28px;
  margin-left: 0px;
}
.nav-side-menu ul .sub-menu li:hover,
.nav-side-menu li .sub-menu li:hover {
  background-color: #020203;
}

.nav-side-menu li {
  padding-left: 10px;
/*   border-bottom: 1px solid #415160; */
}
.nav-side-menu li a {
  text-decoration: none;
  color: var(--color-base-texto);;
}
.nav-side-menu li a i {
  padding-left: 10px;
  width: 20px;
  padding-right: 20px;
}
.nav-side-menu li:hover {
/*   border-left: 3px solid #2980B9; */
  background-color: var(--color-base-web);
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -o-transition: all 1s ease;
  -ms-transition: all 1s ease;
  transition: all 1s ease;
}
@media (max-width: 767px) {
  .nav-side-menu {
    position: relative;
    width: 100%;
    margin-bottom: 10px;
  }
  .nav-side-menu .toggle-btn {
    display: block;
    cursor: pointer;
    position: absolute;
    right: 10px;
    top: 10px;
    z-index: 10 !important;
    padding: 3px;
    background-color: #ffffff;
    color: #000;
    width: 40px;
    text-align: center;
  }
  .brand {
    text-align: center !important;
    font-size: 22px;
    padding-left: 20px;
    line-height: 50px !important;
   
  }
}

@media (min-width: 767px) {
  .nav-side-menu .menu-list .menu-content {
    display: block;
  }
}
body {
  margin: 0px;
  padding: 0px;
}

::-webkit-scrollbar {
    width: 3px;
}
 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 3px rgba(0,0,0,0.3);
}
 
::-webkit-scrollbar-thumb {
  background-color: darkgrey;
  outline: 1px solid slategrey;
}
    </style>
	
	<script type="text/javascript">
	
	$(document).ready(function () {
    $('.menu-content li.menuItem').click(function(e) {      
    
        var $parent = $(this);
        if (!$parent.hasClass('active')) {
        	$('.menu-content li.menuItem').removeClass('active');
            $parent.addClass('active');
            var nameTarget = $parent.attr("name-target");
            $('ul.sub-menu').collapse('hide');
        }
        else{
        	$('.menu-content li.menuItem').removeClass('active');
        	$('ul.sub-menu li').removeClass('active');
        }
        e.preventDefault();
    });
    
    $('ul.sub-menu li a ').click(function(e) {
    
    	var $parent = $(this).parent();
        if (!$parent.hasClass('active')) {
        	$('ul.sub-menu li').removeClass('active');
        	$parent.addClass('active');
        }

    	$(this).children().click();
    });
});
	
	
</script>
	
</head>
<body>
<div class="nav-side-menu">
<div class="menu-list" >
<ul id="menulist" class="menu-content ">
	<c:set scope="request" var="itemsDeMenu" value="${itemsDeMenu}"  />
	<jsp:include page="recursiveMenuRia.jsp"></jsp:include>
</ul>
</div>
<div class="menu-list" >
<ul class="menu-content">
<br>
</ul>
</div>
</div>
</body>
</html>