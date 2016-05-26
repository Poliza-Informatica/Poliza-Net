<%-- 
    Document   : PanelPolizas
    Created on : 26-may-2016, 10:16:11
    Author     : antonio
--%>


<%@page import="es.redmoon.poliza.net.datosper.SQLDatosPer"%>
<%@include file="sesion.jsp" %>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="datosper" class="es.redmoon.poliza.net.datosper.BeanDatosPer" scope="session"/>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <title>Panel de Control</title>
        <!--[if IE 8]><link href="css/ie8.css" rel="stylesheet" type="text/css" /><![endif]-->
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
        
        <script type="text/javascript" src="js/plugins/charts/excanvas.min.js"></script>
        <script type="text/javascript" src="js/plugins/charts/jquery.flot.js"></script>
        <script type="text/javascript" src="js/plugins/charts/jquery.flot.orderBars.js"></script>
        <script type="text/javascript" src="js/plugins/charts/jquery.flot.resize.js"></script>
        <script type="text/javascript" src="js/plugins/charts/jquery.flot.pie.js"></script>
        <script type="text/javascript" src="js/plugins/charts/jquery.sparkline.min.js"></script>

        <script type="text/javascript" src="js/plugins/ui/jquery.easytabs.min.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.collapsible.min.js"></script>
        <script type="text/javascript" src="js/plugins/ui/jquery.mousewheel.js"></script>
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

        <script type="text/javascript" src="js/charts/chartIRPF.js"></script>
        <script type="text/javascript" src="js/charts/chartIVA.js"></script>
        <script type="text/javascript" src="js/charts/chartVentas.js"></script>
        <script type="text/javascript" src="js/charts/chartCompras.js"></script>
        <script type="text/javascript" src="js/charts/chartNominas.js"></script>
        <script type="text/javascript" src="js/charts/chartSociedades.js"></script>
        <script type="text/javascript" src="js/charts/chartResultados.js"></script>

        <script type="text/javascript" src="js_tetbury/grid.js"></script>
        <script type="text/javascript" src="js_tetbury/conta-comAJAX.js"></script>
        <script type="text/javascript" src="js_tetbury/panelfacturacion.js"></script>


        <%
            String database = (String) sesion.getAttribute("xDataBaseName");
            SQLDatosPer myDatos = new SQLDatosPer(database);

            /*
            int diasmes = myDatos.getDiasEndMonth();
            int dias = myDatos.getDiasPeriodo();
            int finalyear = myDatos.getDiasEndYear();
            int mes = myDatos.getNumeroMes();*/

            //String xYear = myDatos.getFiscal_year();
            //String xPeri = myDatos.getPerido();

            datosper.setNif(myDatos.getNif());
            datosper.setNombre(myDatos.getNombre());
            //datosper.setCarga_impositiva(myDatos.getCarga_impositiva());

            // TuplasDatosPanel tp = myCliente.getDatosPanel("trimestral");
            /*
            TuplasDatosPanel tp = new SQLPanelFacturacion(database).getDatosPanel(xYear, xPeri, "TRIM");

            datospanel.setSumaIRPF(tp.getSumaIRPF());
            datospanel.setSumaIVA(tp.getSumaIVA());
            datospanel.setSumaVentas(tp.getSumaVentas());
            datospanel.setSumaCompras(tp.getSumaCompras());
            datospanel.setNominas(tp.getNominas());
            datospanel.setSeguridad_s(tp.getSeguridad_s());
            datospanel.setSociedades(tp.getSociedades());
            datospanel.setResultado(BigDecimal.ZERO);

            // Ponemos los valores formateados 
            datospanel.setsSumaIRPF();
            datospanel.setsSumaIVA();
            datospanel.setsSumaVentas();
            datospanel.setsSumaCompras();
            datospanel.setsNominas();
            datospanel.setsSociedades();
            datospanel.setsSeguridad_s();
            datospanel.setsResultado();*/
        %>

        <script>
            var periodo = "trimestral";
           // changePeriodo(periodo);


        </script>
    </head>


    <body>

        <!-- Fixed top -->
        <div id="top">
            <div class="fixed">
                <a href="inicio.jsp" title="" class="logo"><img src="img/logo.png" alt="" /></a>
                <ul class="top-menu">
                    <li><a class="fullview"></a></li>


                    <li class="dropdown">
                        <a class="user-menu" data-toggle="dropdown"><!--<img src="img/userpic.png" alt="" />-->
                            <img src="img/person.png" width="20" height="20" alt="" /><span><%= sesion.getAttribute("xUser")%></span></a>
                        <ul class="dropdown-menu">

                            <li><a href="DatosFacturacion.jsp" title=""><i class="icon-cog"></i>Mi Configuraci&oacute;n</a></li>
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
                    <%@include file="menu.jsp" %>
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


            <!-- Content 
            ***************************************************************************
                    Contenido de la página
            ***************************************************************************
            -->
            <div id="content">

                <!-- Content wrapper -->
                <div class="wrapper">

                    <!-- Breadcrumbs line -->
                    <div class="crumbs">
                        <ul id="breadcrumbs" class="breadcrumb"> 
                            <li class="active"><a href="#">Panel de control</a></li>
                            <!--<li class="active"><a href="calendar.html" title="">Calendar</a></li>-->
                        </ul>

                        <ul class="alt-buttons">

                        </ul>
                    </div>
                    <!-- /breadcrumbs line -->
                    <br />

                    <p>
                    <h5 class="widget-name"><i class="icon-signal"> </i>Panel de resultados</h5><h5 style="color: #007ED1"><%= sesion.getAttribute("NIF") + " " + sesion.getAttribute("RazonSocial") + " " + sesion.getAttribute("FormaJuridica")%></h5>
                    <div class="row-fluid">
                                <div class="span12">
                                    
                    <div id="scrollspy-data" class="navbar navbar-static">
                        <div class="navbar-inner">
                            <div class="container">
                                <h6 id="xTituloPeriodo">A vista de trimestre fiscal</h6>
                                <ul class="nav pull-right">

                                    <li class="active"><a href="#" ><i class="icon-eye-open"></i>Vista de Gestión</a></li>
                                    <li><a href="conta-Balance.jsp" ><i class="icon-book"></i>Vista de Contabilidad</a></li>

                                </ul>
                            </div>
                        </div>

                        <ul class="toolbar">
                            <li><a  title="Actualizar" onclick="ActualizarTodo();"><i class="icon-refresh"></i><span>Actualizar</span></a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Seleccione el periodo <b class="caret"></b></a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a onclick="changePeriodo('mensual')">Mensual</a></li>
                                    <li><a onclick="changePeriodo('trimestral')">Trimestral</a></li>
                                    <li><a onclick="changePeriodo('anual')">Anual</a></li>
                                </ul>
                            </li>

                        </ul>

                        <div class="well invoice">

                            
                            <div class= "table-overflow">
                            <table class="table table-striped table-bordered">

                                <tbody>
                                    <tr>
                                        <td>Ventas</td>
                                        <td> </td>
                                        <td style="text-align: right; color: blue; font-size: large;"><%= "ventas" %></td>
                                    </tr>
                                    <tr>
                                        <td> Compras y gastos deducibles</td>
                                        <td> </td>
                                        <td style="text-align: right; color: #000000; font-size: large;"><%= "gastos"%></td>
                                    </tr>
                                    <tr>
                                        <td>Nóminas a <%= "diasmes"%> días</td>
                                        <td><a href="BrowseNominas.jsp" >Ver Nóminas</a></td>
                                        <td style="text-align: right; color: #000000; font-size: large;"><%= "nóminas"%></td>
                                    </tr>
                                    <tr>
                                        <td>Seguridad Social a <%= "diasmes"%> días</td>
                                        <td><a href="BrowseSeguridadSocial.jsp" >Ver cuenta de la Seguridad Social</a></td>
                                        <td style="text-align: right; color: #000000; font-size: large;"><%= "seguridad social"%></td>
                                    </tr>
                                    <tr>
                                        <td>IRPF a <%= "dias"%> días</td>
                                        <td><a href="BrowseIRPF.jsp" >Ver cuenta de IRPF </a></td>
                                        <td style="text-align: right; color: #000000; font-size: large;"><%= "irpf"%></td>
                                    </tr>
                                    <tr>
                                        <td>IVA a <%= "dias"%> días</td>
                                        <td><a href="BrowseIVA.jsp" >Ver cuenta de IVA</a></td>
                                        <td style="text-align: right; color: #000000; font-size: large;"><%= "iva"%></td>
                                    </tr>
                                    <tr>
                                        <td>Sociedades-carga fiscal: <%= "21"%>%  a <%= "dias" %> días</td>
                                        <td><a href="BrowseSociedades.jsp" >Ver Impuesto de Sociedades</a></td>
                                        <td style="text-align: right; color: #000000; font-size: large;"><%= "sociedades"%></td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                            <div class="row-fluid">
                                <div class="span6">
                                    <div class="invoice-from pull-left">
                                        <h5>Resultados  a <%= "dias" %> días de finalizar el periodo</h5>
                                    </div>
                                </div>

                                <div class="span6">
                                    <div class="total pull-right">
                                        <span>Total Resultados</span>
                                        <strong class="text-error"><%= "Total"%></strong>
                                    </div>
                                </div>
                            </div>

                            <div class="invoice-footer">

                            </div>

                        </div>
                        <br/>

                    </div>
                                    </div>
                            </div>
                    <!-- /invoice -->


                    <!-- -->


                    <!-- Earnings stats widgets -->
                    <div class="row-fluid">

                        <div class="span4">
                            <div class="widget">
                                <div class="navbar"><div class="navbar-inner"><h6>IRPF</h6></div></div>
                                <div class="well body">
                                    <ul class="stats-details">
                                        <li>
                                            <strong>Total IRPF</strong>

                                        </li>
                                        <li>
                                            <div class="number">
                                                <a href="#" title="" data-toggle="dropdown"></a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="#" title=""><i class="icon-refresh"></i>Reload data</a></li>
                                                    <li><a href="#" title=""><i class="icon-calendar"></i>Change time period</a></li>
                                                    <li><a href="#" title=""><i class="icon-cog"></i>Parameters</a></li>
                                                    <li><a href="#" title=""><i class="icon-download-alt"></i>Download statement</a></li>
                                                </ul>
                                                <span><%= "20.253"%>€</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="graph" id="chartIRPF"></div>
                                </div>
                            </div>
                        </div>

                        <div class="span4">
                            <div class="widget">
                                <div class="navbar"><div class="navbar-inner"><h6>IVA</h6></div></div>
                                <div class="well body">
                                    <ul class="stats-details">
                                        <li>
                                            <strong>Total IVA

                                            </strong>

                                        </li>
                                        <li>
                                            <div class="number">
                                                <a href="#" title="" data-toggle="dropdown"></a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="#" title=""><i class="icon-refresh"></i>Reload data</a></li>
                                                    <li><a href="#" title=""><i class="icon-calendar"></i>Change time period</a></li>
                                                    <li><a href="#" title=""><i class="icon-cog"></i>Parameters</a></li>
                                                    <li><a href="#" title=""><i class="icon-download-alt"></i>Download statement</a></li>
                                                </ul>
                                                <span><%= "datospanel.getSumaIVA()"%>€</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="graph" id="chartIVA"></div>
                                </div>
                            </div>
                        </div>

                        <div class="span4">
                            <div class="widget">
                                <div class="navbar"><div class="navbar-inner"><h6>Ventas</h6></div></div>
                                <div class="well body">
                                    <ul class="stats-details">
                                        <li>
                                            <strong>Total Ventas</strong>

                                        </li>
                                        <li>
                                            <div class="number">
                                                <a href="#" title="" data-toggle="dropdown"></a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="#" title=""><i class="icon-refresh"></i>Reload data</a></li>
                                                    <li><a href="#" title=""><i class="icon-calendar"></i>Change time period</a></li>
                                                    <li><a href="#" title=""><i class="icon-cog"></i>Parameters<strong class="badge badge-info">9</strong></a></li>
                                                    <li><a href="#" title=""><i class="icon-download-alt"></i>Download statement</a></li>
                                                </ul>
                                                <span><%= "datospanel.getSumaVentas()"%>€</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="graph" id="chartVentas"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /earnings stats widgets -->



                    <!-- Earnings stats widgets -->
                    <div class="row-fluid">

                        <div class="span4">
                            <div class="widget">
                                <div class="navbar"><div class="navbar-inner"><h6>Compras</h6></div></div>
                                <div class="well body">
                                    <ul class="stats-details">
                                        <li>
                                            <strong>Total Compras</strong>

                                        </li>
                                        <li>
                                            <div class="number">
                                                <a href="#" title="" data-toggle="dropdown"></a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="#" title=""><i class="icon-refresh"></i>Reload data</a></li>
                                                    <li><a href="#" title=""><i class="icon-calendar"></i>Change time period</a></li>
                                                    <li><a href="#" title=""><i class="icon-cog"></i>Parameters</a></li>
                                                    <li><a href="#" title=""><i class="icon-download-alt"></i>Download statement</a></li>
                                                </ul>
                                                <span><%= "datospanel.getSumaCompras()"%>€</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="graph" id="chartCompras"></div>
                                </div>
                            </div>
                        </div>

                        <div class="span4">
                            <div class="widget">
                                <div class="navbar"><div class="navbar-inner"><h6>Nóminas</h6></div></div>
                                <div class="well body">
                                    <ul class="stats-details">
                                        <li>
                                            <strong>Total Nóminas

                                            </strong>

                                        </li>
                                        <li>
                                            <div class="number">
                                                <a href="#" title="" data-toggle="dropdown"></a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="#" title=""><i class="icon-refresh"></i>Reload data</a></li>
                                                    <li><a href="#" title=""><i class="icon-calendar"></i>Change time period</a></li>
                                                    <li><a href="#" title=""><i class="icon-cog"></i>Parameters</a></li>
                                                    <li><a href="#" title=""><i class="icon-download-alt"></i>Download statement</a></li>
                                                </ul>
                                                <span><%= "datospanel.getNominas()"%>€</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="graph" id="chartNominas"></div>
                                </div>
                            </div>
                        </div>

                        <div class="span4">
                            <div class="widget">
                                <div class="navbar"><div class="navbar-inner"><h6>Sociedades</h6></div></div>
                                <div class="well body">
                                    <ul class="stats-details">
                                        <li>
                                            <strong>Total Sociedades</strong>

                                        </li>
                                        <li>
                                            <div class="number">
                                                <a href="#" title="" data-toggle="dropdown"></a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="#" title=""><i class="icon-refresh"></i>Reload data</a></li>
                                                    <li><a href="#" title=""><i class="icon-calendar"></i>Change time period</a></li>
                                                    <li><a href="#" title=""><i class="icon-cog"></i>Parameters<strong class="badge badge-info">9</strong></a></li>
                                                    <li><a href="#" title=""><i class="icon-download-alt"></i>Download statement</a></li>
                                                </ul>
                                                <span><%= "datospanel.getSociedades()"%>€</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="graph" id="chartSociedades"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /earnings stats widgets -->


                    <!-- Earnings stats widgets -->
                    <div class="row-fluid">

                        <div class="span4">
                            <div class="widget">
                                <div class="navbar"><div class="navbar-inner"><h6>Resultados</h6></div></div>
                                <div class="well body">
                                    <ul class="stats-details">
                                        <li>
                                            <strong>Total Resultado</strong>

                                        </li>
                                        <li>
                                            <div class="number">
                                                <a href="#" title="" data-toggle="dropdown"></a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li><a href="#" title=""><i class="icon-refresh"></i>Reload data</a></li>
                                                    <li><a href="#" title=""><i class="icon-calendar"></i>Change time period</a></li>
                                                    <li><a href="#" title=""><i class="icon-cog"></i>Parameters</a></li>
                                                    <li><a href="#" title=""><i class="icon-download-alt"></i>Download statement</a></li>
                                                </ul>
                                                <span><%= "datospanel.getResultado()"%>€</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="graph" id="chartResultados"></div>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>
                <!-- /content wrapper -->

            </div>
            <!-- /content -->

        </div>
        <!-- /content container -->
        <script>
        </script>



    </body>
</html>