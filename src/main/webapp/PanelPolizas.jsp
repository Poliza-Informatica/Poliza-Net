<!doctype html>
<html>

<head>
    <title>Gráfico comparativo producción</title>
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
    <input type="hidden" name="PrePolizas" id="PrePolizas">
    <input type="hidden" name="CurrPolizas" id="CurrPolizas">
    <input type="hidden" name="PreTotal" id="PreTotal">
    <input type="hidden" name="CurrTotal" id="CurrTotal">
    <input type="hidden" name="PreComision" id="PreComision">
    <input type="hidden" name="CurrComision" id="CurrComision">
    <div class="control-group">

        <label class="control-label" for="RadioTipo">Modo del gráfico</label>
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
            <input class="btn btn-primary" type="button" value="Ver Gráfico" disabled="true" id="VerGrafico" name="VerGrafico" onclick="MakeGraph()"/>
        </div>

    </div>
    
    <div id="container" style="width: 75%;">
        <canvas id="canvas"></canvas>
    </div>
    

</body>

</html>