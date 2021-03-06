<%-- 
    Document   : SetUpListados
    Created on : 25-May-2016, 12:12:38
    Author     : antonio
--%>

<%@include file="sesion.jsp" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <title>Listados de pólizas</title>
        <!--[if IE 8]><link href="css/ie8.css" rel="stylesheet" type="text/css" /><![endif]-->
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>

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
        <script type="text/javascript" src="js_tetbury/conta-comAJAX.js"></script>
        <script type="text/javascript" src="js_tetbury/ListaCias.js"></script>
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

                            <li><a href="inicio.jsp" title=""><i class="icon-cog"></i>Mi Configuraci&oacute;n</a></li>
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

                    

                </div>
            </div>
            <!-- /sidebar -->


            <!-- Content -->
            <div id="content">

                <!-- Content wrapper -->
                <div class="wrapper">


                    <!-- Page header -->
                    <div class="page-header">
                        <div class="page-title">

                            <h5 id="xTitulo">Datos del contrato</h5>

                        </div>			    	
                    </div>
                    <!-- /page header -->

                    <%
                        String database = (String) sesion.getAttribute("xDataBaseName");
                        
                    %>
                    <div class="row-fluid">

                        <div class="span12">


                                <div  class="well">	
                                    <div id="cajaForm" class="navbar">
                                        <div class="navbar-inner"><h6 id="xTitulo2">Usuario :<%= sesion.getAttribute("xUser")%> Rol : <%= sesion.getAttribute("UserTipo")%></h6></div></div>

                                    <fieldset>
                                        <input type="hidden" name="xCode" id="xCode">
                                        
                                        <div class="control-group">
                                            <label class="control-label" for="CiaName">Compañía:</label>
                                                    <select data-placeholder="Seleccione una compañía..." 
                                                            class="select" tabindex="2" id="listaCias" name="listaCias"
                                                            style="width: 350px;" onchange="seleccionarCia()">
                                                        <option></option>
                                                    </select>

                                                </div>
                                            
                                        <div class="control-group">
                                            <label class="control-label" for="desde">Desde:</label>
                                            <div class="controls">
                                                <input type="date" name="xDesde" id="xDesde" maxlength="60" class="span12"
                                                       value="">
                                            </div>

                                        </div>
                                            
                                        <div class="control-group">
                                            <label class="control-label" for="Hasta">Hasta:</label>
                                            <div class="controls">
                                                <input type="date" name="xHasta" id="xHasta" maxlength="60" class="span12"
                                                       value="">
                                            </div>

                                        </div>
                                        
                                        <div class="form-actions align-left">

                                            <input class="btn btn-primary" type="submit" value="Imprimir"  onclick="VerPDF()"/>
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


        <script>
            // Leer el listado de compañías
            LeerCias();
        </script>

    </body>
</html>
