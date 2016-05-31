
<%@include file="sesion.jsp" %>
<!doctype html>
<html>

<head>
    <title>Gráfico comparativo producción</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <script src="js_tetbury/conta-comAJAX.js"></script>
    <script src="js_tetbury/PanelPolizas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="dist/Chart.bundle.js"></script>
    
    <style>
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
    </style>
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
        
        <div id="content">

        <!-- Content wrapper -->
        <div class="wrapper">
            
        <div id="container">
    <input type="hidden" name="PrePolizas" id="PrePolizas">
    <input type="hidden" name="CurrPolizas" id="CurrPolizas">
    <input type="hidden" name="PreTotal" id="PreTotal">
    <input type="hidden" name="CurrTotal" id="CurrTotal">
    <input type="hidden" name="PreComision" id="PreComision">
    <input type="hidden" name="CurrComision" id="CurrComision">
    <div class="control-group">

        <h2 class="title" >Modo del gráfico</h2>
        <div class="controls"><div class="control-group">

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

            <input class="btn btn-primary" type="button" value="Leer Datos"  onclick="ReadValuesGrafico()"/>
            <input class="btn btn-primary" type="button" value="Ver Gráfico" disabled="disabled" id="VerGrafico" name="VerGrafico" onclick="MakeGraph()"/>
        </div>

    </div>
    
    <div id="container" style="width: 75%;">
        <canvas id="canvas"></canvas>
    </div>
    
        </div>
        </div>
        </div>
</div> 
<!-- contenedor de la pagian -->
</body>

</html>