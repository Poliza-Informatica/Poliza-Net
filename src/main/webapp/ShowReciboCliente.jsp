<%-- 
    Document   : ShowPoliza
    Created on : 25-Abril-2015, 23:08:38
    Author     : antonio
--%>

<%@page import="es.redmoon.poliza.net.recibos.TuplasVWrecibos_clientes"%>
<%@page import="es.redmoon.poliza.net.recibos.TuplasRecibos"%>
<%@include file="sesion.jsp" %>
<%@page import="java.util.List"%>
<%@page import="es.redmoon.poliza.net.recibos.SQLRecibos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="recibo" class="es.redmoon.poliza.net.recibos.BeanTuplasVWrecibos_clientes" scope="session"/>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <title>Datos del recibo</title>
        <!--[if IE 8]><link href="css/ie8.css" rel="stylesheet" type="text/css" /><![endif]-->
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>


        <script type="text/javascript" src="js/plugins/charts/excanvas.min.js"></script>
        <script type="text/javascript" src="js/plugins/charts/jquery.flot.js"></script>
        <script type="text/javascript" src="js/plugins/charts/jquery.flot.resize.js"></script>
        <script type="text/javascript" src="js/plugins/charts/jquery.sparkline.min.js"></script>

        <script type="text/javascript" src="js/plugins/ui/jquery.easytabs.min.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.collapsible.min.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.mousewheel.js"></script>
        <script type="text/javascript" src="js/plugins/ui/prettify.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.bootbox.min.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.colorpicker.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.timepicker.min.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.jgrowl.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.fancybox.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.fullcalendar.min.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.elfinder.js"></script>

        <script type="text/javascript" src="js/plugins/uploader/plupload.js"></script>
        <script type="text/javascript" src="js/plugins/uploader/plupload.html4.js"></script>
        <script type="text/javascript" src="js/plugins/uploader/plupload.html5.js"></script>
        <script type="text/javascript" src="js/plugins/uploader/jquery.plupload.queue.js"></script>

        <script type="text/javascript" src="js/plugins/forms/jquery.uniform.min.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.autosize.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.inputlimiter.min.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.tagsinput.min.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.inputmask.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.select2.min.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.listbox.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.validation.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.validationEngine-en.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.form.wizard.js"></script>
        <script type="text/javascript" src="js/plugins/forms/jquery.form.js"></script>
        <script type="text/javascript" src="js/plugins/tables/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/files/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/files/functions.js"></script>
    </head>
    <body>

        <!-- Fixed top -->
        <div id="top">
            <div class="fixed">
                <a href="inicio.jsp" title="" class="logo"><img src="img/LogoPoliza.gif" alt="" /></a>
                <ul class="top-menu">
                    <li><a class="fullview"></a></li>


                    <li class="dropdown">
                        <a class="user-menu" data-toggle="dropdown"><!--<img src="img/userpic.png" alt="" />-->
                            <img src="img/person.png" width="20" height="20" alt="" /><span><%= sesion.getAttribute("xUser")%></span></a>
                        <ul class="dropdown-menu">

                            <li><a href="BrowsePolizasInit.jsp" title=""><i class="icon-cog"></i>Mi Configuraci&oacute;n</a></li>
                            <li><a href="logout.jsp" title=""><i class="icon-remove"></i>Salir</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /fixed top -->


        <!-- Content container -->
        <div id="container">

            <!-- Sidebar -->
            <div id="sidebar">

                <div class="sidebar-tabs">
                    <ul class="tabs-nav two-items">
                        <li><a href="#general" title=""><i class="icon-reorder"></i></a></li>
                        <li><a href="#stuff" title=""><i class="icon-cogs"></i></a></li>
                    </ul>

                    <div id="general">		            

                        <!-- Main navigation -->
                       
                        <!-- /main navigation -->

                    </div>

                    <div id="stuff">
                        <!-- Datepicker -->
                        <div class="widget">
                            <h6 class="widget-name"><i class="icon-calendar"></i>Calendario</h6>
                            <div class="inlinepicker datepicker-liquid"></div>
                        </div>
                        <!-- /datepicker -->
                    </div>

                </div>
            </div>
            <!-- /sidebar -->


            <!-- Content -->
            <div id="content">

                <!-- Content wrapper -->
                <div class="wrapper">

                    <!-- Breadcrumbs line -->
                    <div class="crumbs">
                        <ul id="breadcrumbs" class="breadcrumb"> 
                            <li><a href="#">Lista de pólizas</a></li>
                            <li class="active"><a href="#">Datos del recibo</a></li>
                            <!--<li class="active"><a href="calendar.html" title="">Calendar</a></li>-->
                        </ul>

                        <ul class="alt-buttons">

                        </ul>
                    </div>
                    <!-- /breadcrumbs line -->

                    <%
                        String database = (String) sesion.getAttribute("xDataBaseName");
                        String xIDRecibo = request.getParameter("xIDRecibo");
                        
                        if (xIDRecibo != null && !xIDRecibo.isEmpty()) {
                            SQLRecibos myRecibo = new SQLRecibos(database);
                            TuplasVWrecibos_clientes myTupla = myRecibo.getReciboByID(Integer.parseInt(xIDRecibo));
                            recibo.setId(myTupla.getId());
                            recibo.setRiesgo_asegurado(myTupla.getRiesgo_asegurado());
                            recibo.setPoliza(myTupla.getPoliza());
                            recibo.setCia_name(myTupla.getCia_name());
                            recibo.setTotal_recibo(myTupla.getTotal_recibo());
                            recibo.setNombre(myTupla.getNombre());
                            recibo.setEfecto(myTupla.getEfecto());
                            
                        } else {
                            recibo.setId("0");
                            
                        }
                    %>
                    
                    <!-- Page header -->
                    <div class="page-header">
                        <div class="page-title">

                            <h5 id="xTitulo">Datos del recibo <%= recibo.getRiesgo_asegurado() %></h5>

                        </div>			    	
                    </div>
                    <!-- /page header -->

                    
                    <div class="row-fluid">

                        <div class="span12">


                            <form class="form-horizontal" action="#" id="ViewRecibo" method="post">
                                <div  class="well">	
                                    <div id="cajaForm" class="navbar">
                                        <div class="navbar-inner"><h6 id="xTitulo2">Usuario :<%= sesion.getAttribute("xUser")%> Rol : <%= sesion.getAttribute("UserTipo")%></h6></div></div>

                                    <fieldset>
                                        <input type="hidden" name="xIDPoliza" id="xIDPoliza" value="<%= recibo.getId()%>">

                                        <div class="control-group">
                                            <label class="control-label" for="Riesgo">Riesgo asegurado:</label>
                                            <div class="controls">
                                                <input type="text" name="xRiesgo" maxlength="40" class="span12"
                                                       readonly = "readonly"
                                                       value="<%= recibo.getRiesgo_asegurado()%>">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="control-label" for="CiaName">Compañía:</label>
                                            <div class="controls">
                                                <input type="text" name="CiaName" maxlength="40" class="span12"
                                                       readonly = "readonly"
                                                       value="<%= recibo.getCia_name()%>">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="control-label" for="Poliza">Póliza:</label>
                                            <div class="controls">
                                                <input type="text" name="Poliza" maxlength="40" class="span12"
                                                       readonly = "readonly"
                                                       value="<%= recibo.getPoliza()%>">
                                            </div>

                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="Razonsocial">Tomador:</label>
                                            <div class="controls">
                                                <input type="text" name="xNombre" maxlength="40" class="span12"
                                                       readonly = "readonly"
                                                       value="<%= recibo.getNombre()%>">
                                            </div>

                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="efecto">fecha efecto:</label>
                                            <div class="controls">
                                                <input type="text" name="efecto" maxlength="40" class="span12"
                                                       readonly = "readonly"
                                                       value="<%= recibo.getEfecto() %>">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="importe">Importe recibo</label>
                                            <div class="controls">
                                                <input type="text" name="importe" maxlength="40"  class="span12"
                                                       readonly = "readonly"
                                                       value="<%= recibo.getTotal_recibo() %>">
                                            </div>
                                        </div>
                                                                                        
                                    </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /content wrapper -->

            </div>
            <!-- /content -->

        </div>
        <!-- /content container -->


    </body>
</html>
