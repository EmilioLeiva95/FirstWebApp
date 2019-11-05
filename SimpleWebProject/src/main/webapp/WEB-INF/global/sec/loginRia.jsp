<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Iterator"%><html>
 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="theme" value="${initParam.theme}"/>
<c:set var="themecss" value="jquery-ui-custom.css"/>
 
<head>
		<link rel="shortcut icon" href="${ctx}/include/images/favicon.ico"/>
        <title>.:: F&aacute;brica de Software - DEMO ::.</title>
       
        <link rel="stylesheet" type="text/css" href="${ctx}/include/themes/${theme}/${themecss}"/>
        <style>
       
        h1, h2, h3, a, li, ul{ margin:0; padding:0; outline:0;}
body{font-family:Tahoma, Verdana, Arial; font-size:10px; background: url(${ctx}/include/images/background_gradient.jpg) repeat-x; top left #ffffff; margin:0; padding:0;}
img, div { behavior: url(iepngfix.htc) }
 
 
div#header{height:100px; width:100%; background: url("${ctx}/include/images/bgheader.png") repeat-x bottom left transparent;}
 
div#header div#header-content{height:75px; width:642px; margin:0 auto;}
div#logo{float:left; margin-left: 10px; margin-top: 5px;}
div#logo a{}
div#logo img{border:0; margin:0px;}
div#logo-mined{float:right}
div#logo-mined a{}
div#logo-mined img{border:0; margin:15px 0px 0px 10px;}
 
/* div#body{height:560px; width:780px; margin: 0px auto; background: url("${ctx}/include/images/bgbody.png") no-repeat top center transparent;} */
div#body{height:560px; width:780px; margin: 0px auto;}
div#spacer{clear:both; height:5px; width:780px;}
div.clr{clear:both;}
div#welcome{height:75px;}
div#form-container{width:558px; margin:0 auto; height:315px; background:url("${ctx}/include/images/form.png") no-repeat top center transparent;}
div#logo-pna{float:left}
div#logo-pna img{margin:30px 18px; border:0;}
div#form{float:left; width:250px; height:285px;}
div#form form{width:100%;}
div#form-i{width:206px; margin:0 auto;}
div#form-i p{font-size:1.1em;}
div#form-i p.plogin{color:#ED1B2F; margin:40px 10px 20px 10px;}
div#form-i p.login{color:#000000; margin:5px 15px;}
div.txt{background:url("${ctx}/include/images/inputtext.png") no-repeat top center; width:206px; border:none; height:38px; padding:5px 10px 10px 10px}
div.txt input{height:25px; width:190px; margin:0px 10px 13px; border:none; background:transparent; padding:0px}
div.bttn{text-align:right;}
div.bttn input{width: 82px; height: 28px; padding:5px 8px; background:url("${ctx}/include/images/inputsubmit.png") no-repeat left top transparent; border:none; color:#ffffff; font-size:1.1em; cursor:pointer;}
div.bttn:hover input{width: 82px; height: 28px; padding:5px 8px; background:url("${ctx}/include/images/inputsubmit_hover.png") no-repeat left top transparent; border:none; color:#ffffff; font-size:1.1em; cursor:pointer;}
       
        </style>
         <script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${ctx}/include/scripts/ria/jquery-ui-1.8.13.custom.min.js"></script>
<script>
        $(document).ready(function() {
                
                $('#username').focus();
                
        });
</script>
</head>
 
<body style="background-color: #fffff;" >
<%-- 			<div style="background-image: url('${ctx}/include/images/background_izq.png'); background-repeat:repeat-x; float:left;"><a></a></div> --%>
			<div id="img" style="width: 916px; height: 100%; background-image: url('${ctx}/include/images/background.png'); background-repeat:no-repeat; margin: 0 auto ;  ">

                <br /><br /><br /><br />
                <div id="spacer"></div>
                <div id="body">
                        <div id="welcome">
<!--                         	<div style="display: table; margin: 0 auto; color: white; font-size: 26px; -->
<!--                         	font-weight: bold; text-align: center;"> -->
<!--                         	Sistema  -->
<!-- 			                </div> -->
								<div id="img1" style="background-image: url('${ctx}/include/images/name.png'); background-repeat:no-repeat; height: 100px; width: 400px ;margin: 0 auto ; "></div>

                        </div>
                        <div id="form-container">
                        
                                <div id="logo-pna">
                                        <a href="#">
                                                <img src="${ctx}/include/images/Logo_login.fw2.png" border="0" />
                                        </a>
                                </div>
                                <div id="form">
                                        <div id="form-i">
                                                <form action="${ctx}/inicio/autenticar/ria" method="POST" name="formlogin" id="loginScreen">
                                                        <p class="plogin">
                                                                Ingrese su usuario y clave:
                                                        </p>
                                                        <p class="login">
                                                                Usuario:
                                                        </p>
                                                        <div class="txt">
                                                                <input type="text" id="username" name="username" value="" maxlength="30" />
                                                        </div>
                                                       
                                                        <p class="login">
                                                                Clave:
                                                        </p>
                                                        <div class="txt">
                                                                <input type="password" name="password" value="" maxlength="16" />
                                                        </div>
                                                        <div class="bttn">
                                                                <input type="submit" style="color: white; font-weight: bold;" value="Entrar &#187;"/>
                                                        </div>
                                                        <div>
                                                        <%
                                                                java.util.Collection col = (java.util.Collection)request.getAttribute("errores");
                                                                if (col != null && col.size()>0){
                                                                        Iterator ite = col.iterator();
                                                                        while(ite.hasNext()){
                                                                                String error = (String)ite.next();
                                                                %>
                                                                <font color="#840505"><strong><%=error%></font></strong><br/>
                                                                <%      }
                                                                }
                                                        %>
                                                        </div>
                                                </form>
                                               
                                        </div>
                                </div>
                                <div class="clr"></div>
                        </div>
                </div>
                
                
                <div class="" style="height: 50px;">
                        
                </div>
                
                <div style="margin-left: 5px; font-size: 10px; font-family: Arial Helvetica sans-serif;">
<!--                 	build 201308191046 -->
                </div>
            </div>
			<div style="background-image: url('${ctx}/include/images/background_der.png');background-repeat:repeat-x; " aling="right"><a></a></div>
</body>
</html>