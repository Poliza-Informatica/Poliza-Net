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
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,600,500,700,800,900' rel='stylesheet' type='text/css'>
    <!-- Modern Style Fonts (Include these is you are using body.modern!) -->
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Cardo:400,400italic,700' rel='stylesheet' type='text/css'>
    <!-- Vintage Style Fonts (Include these if you are using body.vintage!) -->
    <link href='http://fonts.googleapis.com/css?family=Sanchez:400italic,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Cardo:400,400italic,700' rel='stylesheet' type='text/css'>
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
    <script src="js_tetbury/grid.js"></script>
    <script src="js_tetbury/conta-comAJAX.js"></script>
    <script src="js_tetbury/PanelPolizas.js"></script>
    <script src="js_tetbury/PolizasLeer.js"></script>
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
                        <a class="page-scroll" href="#about">Gráficos</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#team">Pólizas</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#jurisdictions">Contrato</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#locations">Locations</a>
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
        <div class="intro-content">
            <img src="assets/img/legal/profile.png" class="img-responsive img-centered" alt="">
            <div class="brand-name">Póliza-Net</div>
            <hr class="colored">
            <div class="brand-name-subtext">Gestión para mediadores de seguros</div>
        </div>
        <div class="scroll-down">
            <a class="btn page-scroll" href="#about"><i class="fa fa-angle-down fa-fw"></i></a>
        </div>
    </header>
    
    <!-- Sección gráficos  -->
    <section id="about">
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
    <section id="team" class="bg-gray">
        <div class="container text-center wow fadeIn">
            <div class="row">
                <div class="col-lg-12">
                    <h3>Búsquedas de pólizas</h3>
                    <input type="text" name="xBuscar" id="xBuscar" style="height: 28px; margin-right: 10px;" size="30" maxlength="30" 
                           onkeypress="LeerPolizasByBuscar();">
                    <hr class="colored">
                </div>
            </div>
            <div class="row content-row">
                <div class="col-lg-12">
                    <div class="table-overflow">

                    <table class="table table-striped table-bordered" id="oTabla">
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
    </aside>
    
    <section id="jurisdictions" class="services">
        <%
                        String database = (String) sesion.getAttribute("xDataBaseName");
                        String xIDPoliza = request.getParameter("xIDPoliza");
                        
                        if (xIDPoliza != null && !xIDPoliza.isEmpty()) {
                            SQLPolizas myPoliza = new SQLPolizas(database);
                            TuplasPolizasMV myTupla = myPoliza.getTuplaByIDFromMVpolizas_asegurado(Integer.parseInt(xIDPoliza));
                            poliza.setId(myTupla.getId());
                            poliza.setNif(myTupla.getNif());
                            poliza.setNombre(myTupla.getNombre());
                            poliza.setRiesgo_asegurado(myTupla.getRiesgo_asegurado());
                            poliza.setCia_name(myTupla.getCiaName());
                            poliza.setPoliza(myTupla.getPoliza());
                            poliza.setTlf1(myTupla.getTlf1());
                            poliza.setEmail(myTupla.getEmail());
                            poliza.setIban(myTupla.getIban());
                        } else {
                            poliza.setId("0");
                            poliza.setNif("");
                            poliza.setNombre("");
                        }
                    %>
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-8 col-lg-offset-2"> 
                    <form class="form-horizontal" action="#" id="ViewPoliza" method="post">
                                <div  class="well">	
                                    <div id="cajaForm" class="navbar">
                                        <div class="form-group col-xs-12 floating-label-form-group controls"><h6 id="xTitulo2">Usuario : <%= sesion.getAttribute("xUser")%> Rol : <%= sesion.getAttribute("UserTipo")%></h6></div></div>

                                    <fieldset>
                                        <input type="hidden" name="xIDPoliza" id="xIDPoliza" value="<%= poliza.getId()%>">

                                        <div class="control-group">
                                            <label class="control-label" for="Riesgo">Riesgo asegurado:</label>
                                            <div class="controls">
                                                <input type="text" name="xRiesgo" class="form-control input-lg"
                                                       readonly = "readonly"
                                                       value="<%= poliza.getRiesgo_asegurado()%>">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="control-label" for="CiaName">Compañía:</label>
                                            <div class="controls">
                                                <input type="text" name="CiaName" class="form-control input-lg"
                                                       readonly = "readonly"
                                                       value="<%= poliza.getCia_name()%>">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="control-label" for="Poliza">Póliza:</label>
                                            <div class="controls">
                                                <input type="text" name="Poliza" class="form-control input-lg"
                                                       readonly = "readonly"
                                                       value="<%= poliza.getPoliza()%>">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="control-label" for="NIF">NIF/CIF:</label>
                                            <div class="controls">
                                                <input type="text" name="xNIF" id="xNIF" class="form-control input-lg"
                                                       readonly = "readonly" 
                                                       value="<%= poliza.getNif()%>">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="Razonsocial">Tomador:</label>
                                            <div class="controls">
                                                <input type="text" name="xNombre" class="form-control input-lg"
                                                       readonly = "readonly"
                                                       value="<%= poliza.getNombre()%>">
                                            </div>

                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="Móvil">Teléfono/Móvil:</label>
                                            <div class="controls">
                                                <input type="text" name="xMovil" class="form-control input-lg"
                                                       readonly = "readonly"
                                                       value="<%= poliza.getTlf1() %>">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="eMailF">e-Mail:</label>
                                            <div class="controls">
                                                <input type="email" name="xMail" class="form-control input-lg"
                                                       readonly = "readonly"
                                                       value="<%= poliza.getEmail() %>">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="iban">IBAN:</label>
                                            <div class="controls">
                                                <input type="text" name="xIBAN" class="form-control input-lg"
                                                       readonly = "readonly"
                                                       value="<%= poliza.getIban() %>">
                                            </div>
                                        </div>
                                                                                        
                                    </fieldset>
                            </form>
                </div> 
            </div>
            
        </div>
    </section>
                                            
    <section id="locations" class="pricing" style="background-image: url('assets/img/legal/bg-locations.jpg')">
        <div class="container wow fadeIn">
            <div class="row text-center">
                <div class="col-lg-12">
                    <h2>Locations</h2>
                    <hr class="colored">
                    <p>Our firm has nine locations across three different states. We serve clients in the Western United States.</p>
                </div>
            </div>
            <div class="row content-row">
                <div class="col-md-4">
                    <div class="pricing-item">
                        <h3>West Coast</h3>
                        <hr class="colored">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <strong>San Fransisco, CA</strong>
                                <br><em>415-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                            <li class="list-group-item">
                                <strong>Portland, OR</strong>
                                <br><em>503-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                            <li class="list-group-item">
                                <strong>Seattle, WA</strong>
                                <br><em>206-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pricing-item">
                        <h3>Midwest</h3>
                        <hr class="colored">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <strong>Bismarck, ND</strong>
                                <br><em>701-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                            <li class="list-group-item">
                                <strong>Pierre, ND</strong>
                                <br><em>605-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                            <li class="list-group-item">
                                <strong>Helena, MT</strong>
                                <br><em>406-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pricing-item">
                        <h3>Southwest</h3>
                        <hr class="colored">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <strong>Denver, CO</strong>
                                <br><em>303-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                            <li class="list-group-item">
                                <strong>Phoenix, AZ</strong>
                                <br><em>602-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                            <li class="list-group-item">
                                <strong>Albuquerque, NM</strong>
                                <br><em>505-555-5555</em>
                                <br>Mon - Fri: 8am to 5pm
                                <br><a href="#">Website</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="contact">
        <div class="container wow fadeIn">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Contact Us</h2>
                    <hr class="colored">
                    <p>Please tell us about your case and we will let you know what we can do to help you.</p>
                </div>
            </div>
            <div class="row content-row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="Name" id="name" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Message</label>
                                <textarea rows="5" class="form-control" placeholder="Message" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-outline-dark">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <a href="https://wrapbootstrap.com/theme/vitality-multipurpose-one-page-theme-WB02K3KK3" class="btn btn-block btn-full-width">Buy Vitality Now!</a>
    <footer class="footer" style="background-image: url('assets/img/bg-footer.jpg')">
        <div class="container text-center">
            <div class="row">
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-phone"></i> Call</h4>
                    <p>555-213-4567</p>
                </div>
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-map-marker"></i> Visit</h4>
                    <p>3481 Melrose Place
                        <br>Beverly Hills, CA 90210</p>
                </div>
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-envelope"></i> Email</h4>
                    <p><a href="mailto:mail@example.com">mail@example.com</a>
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
                    <p class="small">&copy; 2015 Start Bootstrap Themes</p>
                </div>
            </div>
        </div>
    </footer>
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
</body>

</html>
