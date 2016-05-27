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
    <input type="hidden" name="2015" id="2015">
    <input type="hidden" name="2016" id="2016">
    
    <div class="control-group">
        <label class="control-label" for="xYear">Año:</label>
        <div class="controls">
            <input type="text" name="xYear" id="xYear" maxlength="4" class="span12"
                   value="">
        </div>
        <div class="form-actions align-left">

        <input class="btn btn-primary" type="submit" value="Ver"  onclick="MakeGraph()"/>
        </div>

    </div>
    
    <div id="container" style="width: 75%;">
        <canvas id="canvas"></canvas>
    </div>
    
    <script>
        
            
        function DatosCurrentYear(mes)
        {
            
            var myJson = document.getElementById("2016").value;
            //alert(myJson);
            var obj = JSON.parse(myJson);
            
            if (obj.length < mes)
                return 0;
            else    
                return obj[mes-1].unidades;
            
        }
        
        function DatosPreviousYear(mes)
        {
            
            var myJson = document.getElementById("2015").value;
            //alert(myJson);
            var obj = JSON.parse(myJson);
            
            if (obj.length < mes)
                return 0;
            else    
                return obj[mes-1].unidades;
            
        }



function MakeGraph(){
    var barChartData = {
    labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio","Agosto","Septiembre","Noviembre","Diciembre"],
    datasets: [
        {
            label: "2016",
            fill: false,
            lineTension: 0.1,
            backgroundColor: "rgba(75,192,192,0.4)",
            borderColor: "rgba(75,192,192,1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(75,192,192,1)",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(75,192,192,1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            data: [DatosCurrentYear(1), DatosCurrentYear(2), DatosCurrentYear(3), DatosCurrentYear(4), DatosCurrentYear(5), 
                    DatosCurrentYear(6), DatosCurrentYear(7), DatosCurrentYear(8),DatosCurrentYear(9),DatosCurrentYear(10),
                DatosCurrentYear(11),DatosCurrentYear(12)],
        },
      {
            label: "2015",
            fill: false,
            lineTension: 0.1,
            backgroundColor: "rgba(220,220,220,0.5)",
            borderColor: "rgba(75,192,192,1)",
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: "rgba(75,192,192,1)",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(75,192,192,1)",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            data: [DatosPreviousYear(1), DatosPreviousYear(2), DatosPreviousYear(3), DatosPreviousYear(4), DatosPreviousYear(5), 
                    DatosPreviousYear(6), DatosPreviousYear(7), DatosPreviousYear(8),DatosPreviousYear(9),DatosPreviousYear(10),
                DatosPreviousYear(11),DatosPreviousYear(12)],

      }
    ]
};
    var ctx = document.getElementById("canvas").getContext("2d");
            
            window.myBar = new Chart(ctx, {
                type: 'bar',
                data: barChartData,
                options: {
                    // Elements options apply to all of the options unless overridden in a dataset
                    // In this case, we are setting the border of each bar to be 2px wide and green
                    elements: {
                        rectangle: {
                            borderWidth: 2,
                            borderColor: 'rgb(0, 255, 0)',
                            borderSkipped: 'bottom'
                        }
                    },
                    responsive: true,
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'Gráfico comparativo producción'
                    }
                }
            });
           }

window.onload = function() {

            ProduccionByNumeroVentas("2015");
            ProduccionByNumeroVentas("2016");
            //MakeGraph();

        };
        
</script>
</body>

</html>