<%-- 
    Document   : BrowseMovimientos
    Created on : 01-sep-2013, 2:46:37
    Author     : antonio
--%>

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
                <script type="text/javascript" src="js_tetbury/plancontable.js"></script>
                <script type="text/javascript" src="js_tetbury/asientos.js"></script>
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
                            <img src="img/person.png" width="20" height="20" alt="" /><span><= sesion.getAttribute("xUser")%></span></a>
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

                    <h5 id="conexion">Cartera de pólizas EMPRESA <= sesion.getAttribute("NIF") %> <= sesion.getAttribute("RazonSocial") %>
                        <= sesion.getAttribute("FormaJuridica") %></h5>
                    
                   
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
                <li><a title="" href="conta-NewAsiento.jsp"><i class="icon-plus"></i>
                        <span>Nuevo Asiento</span></a>
                </li>
                <li>
                    <a class="expand"  title="" ><i class="icon-search"></i><span>Buscar:</span></a>
                    <!-- 
                         LeerAsientos() aun no está implementado
                    -->
                    <input type="text" name="xConcepto" id="xConcepto" style="height: 28px; margin-right: 10px;" size="30" maxlength="30" 
                           onkeypress="LeerAsientosByConcepto('<= sesion.getAttribute("Year_fiscal") %>');">
                </li>
            </ul>
           <div class="table-overflow">

            <table class="table table-striped table-bordered" id="oTabla">
                <thead>
                    <tr>
                        <td width="10%" hidden="true"><strong>id</strong></td>
                        <td width="60%"><strong>Concepto</strong></td>
                        <td width="10%"><strong>fecha</strong></td>
                        <td width="5%"><strong>Periodo</strong></td>
                        <td width="5%"></td>
                    </tr>
            </table>
           </div>
           <div class="table-footer">

            <div class="pagination">
                <ul>
                    <li><a onclick="paginaAnterior('<= sesion.getAttribute("Year_fiscal") %>',conn);">Anterior</a></li>

                    <li class="active"><a href="#" id="xPag">1</a></li>

                    <li><a onclick="paginaSiguiente('<= sesion.getAttribute("Year_fiscal") %>',conn);">Siguiente</a></li>
                </ul>
            </div>
                
            </div>
            
        </div>
    </div>
    <!-- /content wrapper -->

</div>
<!-- /content -->

<!-- /content container -->


                <script>
                    selectItemMenu('itemPlanContable');
                    window.pagina=1; //window.pagina;
                    window.pagsize=10; //window.pagsize;
                    var conn = LeerAsientos(<= sesion.getAttribute("Year_fiscal") %>);
                </script>
                
                <div class="modal hide fade" id="xTablaAsiento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Ver movimientos</h3>
                </div>
                <div class="modal-body">
             
                    <div class="table-overflow" id="xDiario">
                    <input type="hidden" name="xIDAsiento" id="xIDAsiento">
                    <table class="table table-striped table-bordered" id="oDiario">
                        <thead>
                            <tr>
                                <td width="10%"><strong>Cuenta</strong></td>
                                <td width="40%" ><strong>Concepto</strong></td>
                                <td width="10%"><strong>Debe</strong></td>
                                <td width="10%"><strong>Haber</strong></td>
                            </tr>
                    </table>
                        <script>
                            //connAsi=AsientosMovimiento();
                        </script>

                    </div>

                        <div class="modal-footer">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                            <input class="btn btn-primary" type="submit" value="Pagar"/>
                        </div>
                    
                </div>
                </div>
</body>
</html>
