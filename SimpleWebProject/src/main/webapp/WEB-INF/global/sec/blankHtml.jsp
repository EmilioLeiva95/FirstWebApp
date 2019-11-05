<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Iterator"%><html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>.:: F&aacute;brica de Software - DEMO ::.</title>
<style>
h5{
color:#F7931E
}

p.card {
 text-align: justify;
  text-justify: inter-word;
  font-size:0.9vw;
  color:#999;
  padding:0px 15px 0px 15px
}
</style>

<%@ include file="/WEB-INF/global/jsp/jq-bootstrap-header.jsp" %>
<div align="center" style="width: 100%;height:100%">
    <div align="center" style="width: 100%;height:50%;background-color:#7201A7">
    <section>
                <section style="text-align: center;">
                    <div class="container-fluid">
                        <div class="row" style="height:10%;"></div>
                        <div class="row" style="background-color:#7201A7;height:80%;vertical-align:middle">
                            <img alt="Brand" src="${ctx}/include/images/index.png" height="50%">
                            <h6 style="color:white;font-size:2vw;"><b>Bienvenida/o</b></h6>
                            <h6 style="color:white;font-size:1.75vw;margin-top:-10px"><b>M&oacute;dulo Administraci&oacute;n de Cat&aacute;logos</b></h6>
                            <p style="color:white;font-size:1vw;margin-top:-10px">M&oacute;dulo encargado de la administraci&oacute;n de los recursos de cat&aacute;logos a los que los usuarios que acceder&aacute;n al sistema
                            <br>
                            podr&aacute;n tener acceso. Los cat&aacute;logos contienen listas ordenadas y clasificadas por categor&iacute;as que tendr&aacute;n un uso frecuente en los modulos de la aplicaci&oacute;n.
                            </p>
                        </div>
                        <div class="row" style="height:10%"></div>


                    </div>
                </section>
               

            </section>
            </div>
    <div align="center" style="width: 97%;height:40%;background-color:white">
    <div class="row">
            <div style="float:left;width:33.3%;height:100%">
            <section style="text-align: center;">
                    <div class="container-fluid">
                        <div class="row" style="height:10%;"></div>
                        <div class="row" style="height:80%;vertical-align:middle">
                            <img alt="Brand" src="${ctx}/include/images/well01.png" height="40%">
                            <h5 style="font-size:1.5vw;"><b>Cat&aacute;logos Generales</b></h5>
                            <p class="card">
                            Contiene los cat&aacute;logos que tendr&aacute;n un uso frecuente en todas las etapas del proceso de Tramitaci&oacute;n de Casos. Contiene los cat&aacute;logos referidos a 
                            la construcci&oacute;n del perfil de una persona
                            </p>
                        </div>
                        <div class="row" style="height:10%"></div>


                    </div>
                </section>
            </div>
             <div style="float:left;width:33.33%;height:100%">
             <section style="text-align: center;">
                    <div class="container-fluid">
                        <div class="row" style="height:10%;"></div>
                        <div class="row" style="height:80%;vertical-align:middle">
                            <img alt="Brand" src="${ctx}/include/images/well02.png" height="40%">
                            <h5 style="font-size:1.5vw;"><b>Cat&aacute;logos de Orientaci&oacute;n</b></h5>
                            <p class="card">
                           Contiene los cat&aacute;logos que tendr&aacute;n un uso frecuente en la etapa de Orientaci&oacute;n del proceso de Tramitaci&oacute;n de Casos. Contiene los cat&aacute;logos referidos  
                            al tipo de Gesti&oacute;n y a la naturaleza del caso mientras este se encuentre en la etapa de Orientaci&oacute;n
                            </p>
                        </div>
                        <div class="row" style="height:10%"></div>


                    </div>
                </section>
             
             </div>
             
             <div style="float:left;width:33.33%;height:100%">
             <section style="text-align: center;">
                    <div class="container-fluid">
                        <div class="row" style="height:10%;"></div>
                        <div class="row" style="height:80%;vertical-align:middle">
                             <img alt="Brand" src="${ctx}/include/images/well03.png" height="40%">
                            <h5 style="font-size:1.5vw;"><b>Cat&aacute;logos de Acci&oacute;n Inmediata</b></h5>
                            <p class="card"> Contiene los cat&aacute;logos que tendr&aacute;n un uso frecuente en la etapa de Acci&oacute;n Inmediata del proceso de Tramitaci&oacute;n de Casos. Contiene los cat&aacute;logos referidos  
                            al tipo de Acci&oacute;n Realizada y al tipo de Finalizaci&oacute;n del caso mientras este se encuentre en la etapa de Acci&oacute;n Inmediata.
                            </p>
                        </div>
                        <div class="row" style="height:10%"></div>


                    </div>
                </section>
             
             </div>
             </div>
             <br>
             
             <div class="row">
             <div style="float:left;width:33.33%;height:100%">
            <section style="text-align: center;">
                    <div class="container-fluid">
                        <div class="row" style="height:10%;"></div>
                        <div class="row" style="height:80%;vertical-align:middle">
                            <img alt="Brand" src="${ctx}/include/images/well04.png" height="40%">
                            <h5 style="font-size:1.5vw;"><b>Cat&aacute;logos de Expediente</b></h5>
                            <p class="card">
                             Contiene los cat&aacute;logos que tendr&aacute;n un uso frecuente en la etapa de Expediente del proceso de Tramitaci&oacute;n de Casos. Contiene los cat&aacute;logos referidos  
                            al los pronunciamientos, mecanismos, funcionarios y tipos de notificaciones referidos al caso mientras este se encuentre en la etapa de Acci&oacute;n Inmediata.
                            </p>
                        </div>
                        <div class="row" style="height:10%"></div>


                    </div>
                </section>
            </div>
            <div style="float:left;width:33.33%;height:100%">
            <section style="text-align: center;">
                    <div class="container-fluid">
                        <div class="row" style="height:10%;"></div>
                        <div class="row" style="height:80%;vertical-align:middle">
                            <img alt="Brand" src="${ctx}/include/images/well05.png" height="40%">
                            <h5 style="font-size:1.5vw;"><b>Cat&aacute;logos de Casos</b></h5>
                            <p class="card">
                             Contiene los cat&aacute;logos que estan relacionados directamente con los diversos casos que se procesan en el m&oacute;dulo de Tramitaci&oacute;n de Casos. Contiene los cat&aacute;logos referidos  
                            a la autoridad, derecho y al hecho que se relaciona o afecta al caso que esta siendo procesado.
                           </p>
                        </div>
                        <div class="row" style="height:10%"></div>


                    </div>
                </section>
            </div>
            
            <div style="float:left;width:33.33%;height:100%">
            <section style="text-align: center;">
                    <div class="container-fluid">
                        <div class="row" style="height:10%;"></div>
                        <div class="row" style="height:80%;vertical-align:middle">
                            <img alt="Brand" src="${ctx}/include/images/well06.png" height="40%">
                            <h5 style="font-size:1.5vw;"><b>Cat&aacute;logos de Instituci&oacute;n</b></h5>
                            <p class="card">
                             Contiene los cat&aacute;logos que estan relacionados directamente con las instituciones involucradas en el caso que se procesan en el m&oacute;dulo de Tramitaci&oacute;n de Casos. 
                           </p>
                        </div>
                        <div class="row" style="height:10%"></div>


                    </div>
                </section>
            </div>
             
   
   
    </div>
    </div>

</div>
 
<!-- <div id="logo" align="center"> -->
<%-- <img alt="watermark" src="${ctx}/include/images/blank_watermark.png"> --%>
<!-- </div> -->
</html>

