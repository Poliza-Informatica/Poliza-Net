<%-- 
    Document   : BrowseMovimientos
    Created on : 01-sep-2013, 2:46:37
    Author     : antonio
--%>
<%@include file="sesion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
            <link href="css/main.css" rel="stylesheet" type="text/css" />
            <title>Consultar Pólizas</title>
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
                
                <script type="text/javascript" src="js_tetbury/grid.js"></script>
                <script type="text/javascript" src="js_tetbury/conta-comAJAX.js"></script>
                <script type="text/javascript" src="js_tetbury/PolizasLeer.js"></script>
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

                            <li><a href="index.jsp" title=""><i class="icon-cog"></i>Mi Configuraci&oacute;n</a></li>
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
                <!-- <@include file="menu.jsp" %> -->
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
                    <li class="active"><a href="#">Diario de Asientos</a></li>
                    <!--<li class="active"><a href="calendar.html" title="">Calendar</a></li>-->
                </ul>

                <ul class="alt-buttons">

                </ul>
            </div>
            <!-- /breadcrumbs line -->

            <!-- Page header -->
            <div class="page-header">
                <div class="page-title">

                    <h5 id="conexion">Cartera de pólizas <%= sesion.getAttribute("NIF") %> <%= sesion.getAttribute("RazonSocial") %>
                        <%= sesion.getAttribute("FormaJuridica") %></h5>
                    
                   
                </div>			    	
            </div>

    <!-- ***************************************
    Conectado con contabilidad INTERNA
    ******************************************** -->

    <!-- 
        Tabla de movimientos cuentas
    -->
    
    
            <div class="navbar">
                <div class="navbar-inner"><h6>Cartera de pólizas</h6>


                </div>                            

            </div>
            <ul class="toolbar">
                <li><a title="" href="#"><i class="icon-plus"></i>
                        <span>Nuevo Asiento</span></a>
                </li>
                <li>
                    <a class="expand"  title="" ><i class="icon-search"></i><span>Buscar:</span></a>
                    
                    <input type="text" name="xBuscar" id="xBuscar" style="height: 28px; margin-right: 10px;" size="30" maxlength="30" 
                           onkeypress="LeerPolizasByBuscar();">
                </li>
            </ul>
           <div class="table-overflow">

            <table class="table table-striped table-bordered" id="oTabla">
                <thead>
                    <tr>
                        <td width="1%" hidden="hidden"><strong>id</strong></td>
                        <td width="10%"><strong>NIF</strong></td>
                        <td width="35%"><strong>Nombre</strong></td>
                        <td width="10%"><strong>Póliza</strong></td>
                        <td width="5%"><strong>Efecto</strong></td>
                        <td width="20%"><strong>Riesgo asegurado</strong></td>
                        <td width="5%"></td>
                    </tr>
            </table>
           </div>
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
</body>
</html>
