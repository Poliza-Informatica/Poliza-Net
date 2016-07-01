<%@page import="es.redmoon.poliza.net.polizas.TuplasPolizasMV"%>
<%@page import="es.redmoon.poliza.net.polizas.SQLPolizas"%>
<%@include file="sesion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="poliza" class="es.redmoon.poliza.net.polizas.BeanPolizasMV" scope="session"/>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Poliza-Net by Póliza Informática 2000</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Retina.js - Load first for faster HQ mobile images. -->
    <script src="assets/js/plugins/retina/retina.min.js"></script>
    <!-- Font Awesome -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Default Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,600,500,700,800,900' rel='stylesheet' type='text/css'>
    <!-- Modern Style Fonts (Include these is you are using body.modern!) -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Cardo:400,400italic,700' rel='stylesheet' type='text/css'>
    <!-- Vintage Style Fonts (Include these if you are using body.vintage!) -->
    <link href='https://fonts.googleapis.com/css?family=Sanchez:400italic,400' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Cardo:400,400italic,700' rel='stylesheet' type='text/css'>
    <!-- Plugin CSS -->
    <link href="assets/css/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/owl-carousel/owl.theme.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/owl-carousel/owl.transitions.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/magnific-popup.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/background.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/animate.css" rel="stylesheet" type="text/css">
    <!-- Vitality Theme CSS -->
    <!-- Uncomment the color scheme you want to use. -->
    <!-- <link href="assets/css/vitality-red.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-aqua.css" rel="stylesheet" type="text/css"> -->
    <link href="assets/css/vitality-blue.css" rel="stylesheet" type="text/css">
    <!-- <link href="assets/css/vitality-green.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-orange.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-pink.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-purple.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-tan.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-turquoise.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-yellow.css" rel="stylesheet" type="text/css"> -->
    <!-- IE8 support for HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style>
    #canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
        height: 150px;
    }
    </style>
    <link href="css/redmoon.css" rel="stylesheet">
    <script src="js_tetbury/gridV2.js"></script>
    <script src="js_tetbury/conta-comAJAX.js"></script>
    <script src="js_tetbury/PanelPolizas.js"></script>
    <script src="js_tetbury/PolizasLeer.js"></script>
    <script src="js_tetbury/RecibosLeer.js"></script>
    <script src="js_tetbury/SiniestrosLeer.js"></script>
</head>
<!-- Alternate Body Classes: .modern and .vintage -->

<body id="page-top">
    
    <!-- Navigation -->
    <!-- Note: navbar-default and navbar-inverse are both supported with this theme. -->
    <nav class="navbar navbar-inverse navbar-fixed-top navbar-expanded">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <img src="assets/img/legal/logo.png" class="img-responsive" alt="">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#graficos">Gráficos</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#section_polizas">Pólizas</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#section_recibos">Recibos</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#section_sini">Siniestros</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contacto</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    
    
    
    <!-- Instructions: Set your background image using the URL below. -->
    <header style="background-image: url('assets/img/legal/bg-header.jpg')">
        
        <!-- <div id="canvas-holder" style="width:75%"> -->
        <canvas id="chart-area" class="img-responsive img-centered">
        </canvas>
        <input type="hidden" name="RamosAutos" id="RamosAutos">
        <input type="hidden" name="RamosDiversos" id="RamosDiversos">
        <input type="hidden" name="RamosVida" id="RamosVida">
        <div class="scroll-down">
            <a class="btn page-scroll" href="#graficos"><i class="fa fa-angle-down fa-fw"></i></a>
        </div>
    </header>
    
    
    <!-- Sección gráficos  -->
    <section id="graficos">
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-lg-12 wow fadeIn">
                    <h3>Gráficos de producción</h3>
                    <hr class="colored">
                </div>
            </div>
            <div class="row text-center content-row">
                <input type="hidden" name="PrePolizas" id="PrePolizas">
                <input type="hidden" name="CurrPolizas" id="CurrPolizas">
                <input type="hidden" name="PreTotal" id="PreTotal">
                <input type="hidden" name="CurrTotal" id="CurrTotal">
                <input type="hidden" name="PreComision" id="PreComision">
                <input type="hidden" name="CurrComision" id="CurrComision">
                
                
                <div class="control-group">

                        <div class="controls">
                            <div class="control-group">

                            <label>Nº Pólizas</label>
                            <input type = "radio"
                                   name = "RadioTipo"
                                   id = "Recibos"
                                   value = "Recibos"
                                   checked = "checked" />

                            <label>Total</label>
                            <input type = "radio" 
                                   name = "RadioTipo"
                                   id = "Total"
                                   value = "Total" />
                            <label>Comisión</label>
                            <input type = "radio" 
                                   name = "RadioTipo"
                                   id = "Comision"
                                   value = "Comision" />

                            </div>
                        </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label" for="xYear">Año:</label>
                    <div class="controls">
                        <input type="text" name="xYear" id="xYear" maxlength="4" class="span12"
                               value="">
                    </div>
                    <div class="form-actions align-left">

                        <input class="btn btn-primary btn-xs" type="button" value="Leer Datos"  onclick="ReadValuesGrafico()"/>
                        <input class="btn btn-primary btn-xs" type="button" value="Ver Gráfico" disabled="disabled" id="VerGrafico" name="VerGrafico" onclick="MakeGraph()"/>
                    </div>

                </div>
    

                <canvas id="canvas"></canvas>

                
            </div>
        </div>
    </section>
    
    
    
    <!-- Búsquedas de pólizas  -->
    <section id="section_polizas" class="bg-gray">
        <div class="container text-center wow fadeIn">
            <div class="row">
                <div class="col-lg-12">
                    <h3>Búsquedas de pólizas</h3>
                    <input type="text" name="xBuscar" id="xBuscar" style="height: 28px; margin-right: 10px;" size="60" maxlength="30" 
                           onkeypress="LeerPolizasByBuscar();">
                    <hr class="colored">
                </div>
            </div>
            <div class="row content-row">
                <div class="col-lg-12">
                    <div class="table-overflow">

                    <table class="table table-striped table-bordered" id="oTablaPolizas">
                        <thead>
                            <tr>
                                <td width="1%" hidden="hidden"><strong>id</strong></td>
                                <td width="8%"><strong>NIF</strong></td>
                                <td width="35%"><strong>Nombre</strong></td>
                                <td width="5%"><strong>Póliza</strong></td>
                                <td width="5%"><strong>Efecto</strong></td>
                                <td width="20%"><strong>Riesgo asegurado</strong></td>
                                <td width="15%"></td>
                            </tr>
                    </table>
                        <div class="table-footer">

                        <div class="pagination">
                            <ul>
                                <li><a onclick="conn.PrevPage('accion=PolizasByBuscar&xBuscar='+document.getElementById('xBuscar').value);">Anterior</a></li>

                                <li class="active"><a href="#" id="xPag">1</a></li>

                                <li><a onclick="conn.NextPage('accion=PolizasByBuscar&xBuscar='+document.getElementById('xBuscar').value);">Siguiente</a></li>
                            </ul>
                        </div>
                                    <script>

                                        var pag=1; //window.pagina;
                                        var tama=10; //window.pagsize;

                                        //alert(direccion);
                                        var conn=LeerPolizasByBuscar();
                                    </script>
                        </div>
                   </div>
                </div>
            </div>
        </div>
    </section>
    <!--
    <aside class="cta-quote" style="background-image: url('assets/img/legal/bg-aside.jpg');">
        <div class="container wow fadeIn">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <span class="quote">We use the practical application of legal theories and knowledge to pursue and uphold justice.</span>
                    <hr class=" colored">
                    <a class="btn btn-outline-light page-scroll" href="#contact">Contact Us</a>
                </div>
            </div>
        </div>
    </aside> -->

    
    <!-- Recibos  -->
    <section id="section_recibos" class="bg-gray">
        <div class="container text-center wow fadeIn">
            <div class="row">
                <div class="col-lg-12">
                    <h3>Recibos de la póliza</h3>
                    <hr class="colored">
                </div>
            </div>
            <div class="row content-row">
                <div class="col-lg-12">
                    <div class="table-overflow">
                     <input type="hidden" name="xIDRecibo" id="xIDRecibo">
                    <table class="table table-striped table-bordered" id="oTablaRecibos">
                        <thead>
                            <tr>
                                <td width="1%" hidden="hidden"><strong>id</strong></td>
                                <td width="8%"><strong>Número</strong></td>
                                <td width="5%"><strong>Estado</strong></td>
                                <td width="5%"><strong>Efecto</strong></td>
                                <td width="5%"><strong>Importe</strong></td>
                                <td width="15%"></td>
                            </tr>
                    </table>
                   </div>
                </div>
            </div>
        </div>
    </section>
    
    
    
    <!-- Búsquedas de siniestros   -->
    <section id="section_sini" class="services">
        <div class="container text-center wow fadeIn">
            <div class="row">
                <div class="col-lg-12">
                    <h3>Búsquedas de siniestros</h3>
                    <input type="text" name="xBuscarSini" id="xBuscarSini" style="height: 28px; margin-right: 10px;" size="60" maxlength="30" 
                           onkeypress="LeerSiniestrosByBuscar();">
                    <hr class="colored">
                </div>
            </div>
            <div class="row content-row">
                <div class="col-lg-12">
                    <div class="table-overflow">

                    <table class="table table-striped table-bordered" id="oTablaSini">
                        <thead>
                            <tr>
                                <td width="5%"><strong>Exp.Agencia</strong></td>
                                <td width="5%"><strong>Póliza</strong></td>
                                <td width="5%"><strong>Exp.Cía</strong></td>
                                <td width="5%"><strong>Fecha</strong></td>
                                <td width="15%"><strong>Lugar</strong></td>
                                <td width="15%"></td>
                            </tr>
                    </table>
                        <!-- table footer -->
                        <div class="table-footer">

                            <div class="pagination">
                                <ul>
                                    <li><a onclick="conn.PrevPage('accion=LeerSinisestrosByBuscar');">Anterior</a></li>

                                    <li class="active"><a href="#" id="xPag">1</a></li>

                                    <li><a onclick="conn.NextPage('accion=LeerSinisestrosByBuscar');">Siguiente</a></li>
                                </ul>
                            </div>
                                        <script>

                                            var pag=1; //window.pagina;
                                            var tama=10; //window.pagsize;

                                            //alert(direccion);
                                            var conn=LeerSiniestrosByBuscar();
                                        </script>
                       </div>
                   </div>
                </div>
            </div>
        </div>
    </section>
                                            
    
    <section id="contact">
        <div class="container wow fadeIn">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Contacto</h2>
                    <hr class="colored">
                    <p>Por favor comenta tu caso y te daremos una respuesta personalizada.</p>
                </div>
            </div>
            <div class="row content-row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="name" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email</label>
                                <input type="email" class="form-control" placeholder="dirección de correo" id="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Teléfono</label>
                                <input type="tel" class="form-control" placeholder="Teléfono" id="phone" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Mensaje</label>
                                <textarea rows="5" class="form-control" placeholder="Mensaje" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-outline-dark">Enviar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer" style="background-image: url('assets/img/bg-footer.jpg')">
        <div class="container text-center">
            <div class="row">
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-phone"></i> Teléfono</h4>
                    <p>+34 958-635980 </p>
                </div>
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-map-marker"></i> Dirección postal</h4>
                    <p>Calle Mariana Pineda, Edificio Heliconia Bajo, 
                        <br> 18690 Almuñécar - Granada (España) </p>
                </div>
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-envelope"></i> Email</h4>
                    <p><a href="mailto:mail@example.com">poliza@polizainformatica.com</a>
                    </p>
                </div>
            </div>
            <div class="row social">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li><a href="#"><i class="fa fa-facebook fa-fw fa-2x"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-twitter fa-fw fa-2x"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin fa-fw fa-2x"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row copyright">
                <div class="col-lg-12">
                    <p class="small">&copy; 2016 Póliza Informática 2000</p>
                </div>
            </div>
        </div>
    </footer>
    
    <!--  Pantalla modal de contratos  -->
    
    <div class="portfolio-modal modal fade" id="ContratoModal" tabindex="-1" role="dialog" aria-hidden="true" style="background-image: url('assets/img/portfolio/bg-1.jpg')">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        
                        <form class="form-horizontal" action="#" id="ViewPoliza" method="post">
                                <div  class="well">	
                                    <div id="cajaForm" class="navbar">
                                        <div class="form-group col-xs-12 floating-label-form-group label-success">
                                            <h6 id="xTitulo2">Usuario : <%= sesion.getAttribute("xUser")%> Rol : <%= sesion.getAttribute("UserTipo")%></h6>
                                        </div>
                                    </div>

                                    <fieldset>
                                        <input type="hidden" name="xIDPoliza" id="xIDPoliza">

                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="Riesgo">Riesgo asegurado</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xRiesgo" name="Riesgo" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="CiaName">Compañía</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="CiaName" name="CiaName" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="Poliza">Póliza</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="Poliza" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="NIF">NIF/CIF</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xNIF" name="xNIF" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="Razonsocial">Tomador</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xNombre" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>

                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="Móvil">Teléfono/Móvil</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xMovil" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="eMailF">e-Mail</label>
                                            <div class="col-sm-10">
                                                <input type="email" id="xMail" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="iban">IBAN</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xIBAN" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>
                                        </div>
                                                                                        
                                    </fieldset>
                            </form>
                        
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
                                            
        <!-- PANTALLA MODAL DE RECIBOS    -->
        
        <div class="portfolio-modal modal fade" id="RecibosModal" tabindex="-1" role="dialog" aria-hidden="true" style="background-image: url('assets/img/portfolio/bg-1.jpg')">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        
                        <form class="form-horizontal" action="#" id="ViewRecibo">
                                <div  class="well">	
                                    <div id="cajaForm" class="navbar">
                                        <div class="form-group col-xs-12 floating-label-form-group label-success">
                                            <h6 id="xTitulo2">Usuario : <%= sesion.getAttribute("xUser")%> Rol : <%= sesion.getAttribute("UserTipo")%></h6>
                                        </div>
                                    </div>

                                    <fieldset>

                                        
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="xRiesgoAsegurado">Riesgo asegurado</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xRiesgoAsegurado" name="xRiesgoAsegurado" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="n_recibo">Nº Recibo</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="n_recibo" name="n_recibo" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="Poliza">Póliza</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="id_poliza" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="xEfecto">fecha efecto</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xEfecto" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>
                                        </div>
                                        
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="xVencimiento">vencimiento</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xVencimiento" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="xImporte">Importe</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xImporte" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>
                                        </div>

                                                                                        
                                    </fieldset>
                            </form>
                        
                </div>
            </div>
        </div>
        </div>
        </div>
    </div>
                                        
    <!--   MODAL DEL DETALLE DE UN SINIESTRO  -->
    
    <div class="portfolio-modal modal fade" id="SiniestroModal" tabindex="-1" role="dialog" aria-hidden="true" style="background-image: url('assets/img/portfolio/bg-1.jpg')">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        
                        <form class="form-horizontal" action="#" id="ViewSiniestro">
                                <div  class="well">
                                    <div id="cajaForm" class="navbar">
                                        <div class="form-group col-xs-12 floating-label-form-group label-success">
                                            <h6 id="xTitulo2">Usuario : <%= sesion.getAttribute("xUser")%> Rol : <%= sesion.getAttribute("UserTipo")%></h6>
                                        </div>
                                    </div>

                                    <fieldset>
                                        <input type="hidden" name="xExpe_Agencia" id="xExpe_Agencia">

                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="xExpeCia">Expediente Cía</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="xExpeCia" name="xExpeCia" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="num_poliza">Póliza</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="num_poliza" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="fechayhora">Fecha y hora</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="fechayhora" name="fechayhora" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="col-sm-2 label-default" for="lugar">Lugar</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="lugar" class="form-control input-lg"
                                                       readonly = "readonly">
                                            </div>

                                        </div>
                                                                                        
                                    </fieldset>
                            </form>
                        
                    </div>
                </div>
                    <!--  Tabla del seguimiento    -->

                        <div class="row">
                            <div class="col-xs-12">
                                <h3>Seguimiento del siniestro</h3>
                                <hr class="colored">
                            </div>
                        </div>
                        <div class="row bg-gray">
                        
                            <div class="col-xs-12">
                                <div class="table-overflow">
                                    
                                <table class="table table-bordered table-responsive" id="oTablaSeguiSini">
                                    <thead>
                                        <tr style="color: black;">
                                            <td width="10%">Fecha</td>
                                            <td width="50%">Descripción</td>
                                        </tr>
                                </table>

                               </div>
                            </div>
                        
                    </div>

        </div>
        </div>
    </div>
    <!-- Core Scripts -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap/bootstrap.min.js"></script>
    <!-- Plugin Scripts -->
    <script src="assets/js/plugins/jquery.easing.min.js"></script>
    <script src="assets/js/plugins/classie.js"></script>
    <script src="assets/js/plugins/cbpAnimatedHeader.js"></script>
    <script src="assets/js/plugins/owl-carousel/owl.carousel.js"></script>
    <script src="assets/js/plugins/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/plugins/background/core.js"></script>
    <script src="assets/js/plugins/background/transition.js"></script>
    <script src="assets/js/plugins/background/background.js"></script>
    <script src="assets/js/plugins/jquery.mixitup.js"></script>
    <script src="assets/js/plugins/wow/wow.min.js"></script>
    <script src="assets/js/contact_me.js"></script>
    <script src="assets/js/plugins/jqBootstrapValidation.js"></script>
    <!-- Vitality Theme Scripts -->
    <script src="assets/js/vitality.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="dist/Chart.min.js"></script>
    <script src="dist/Chart.bundle.min.js"></script>
    <script>MakeDonut();</script>
</body>

</html>
