/**
 * 
 * @param {type} xYear
 * @returns {Conectar}
 */
function ProduccionAll(xYear)
{

    //var pag=window.pagina;
    //var tama=window.pagsize;
    //alert(xYear);
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=ProduccionAll&xYear='+xYear;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaProduccion(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @returns {unresolved}
 */
function ListaProduccion(pageRequest) {


    if (pageRequest.readyState === 4)
    {
        if (pageRequest.status === 200)
        {
            // Solo descomentar para depuración
            //alert(pageRequest.responseText);
            if (pageRequest.responseText === 'Error')
                alert(pageRequest.responseText);
            else
            {
                PutValProduccion(pageRequest.responseText);
                //return pageRequest.responseText;

            }


        }
    }
    else
        return;
}

/**
 * 
 * @param {type} myJson
 * @returns {undefined}
 */
function PutValProduccion(myJson)
{
    



var arjson=[[{"mes":1,"unidades":14}, {"mes":2,"unidades":16}, {"mes":3,"unidades":20}, {"mes":4,"unidades":30}, {"mes":5,"unidades":15}, {"mes":6,"unidades":2}], [{"mes":1,"unidades":24}, {"mes":2,"unidades":32}, {"mes":3,"unidades":31}, {"mes":4,"unidades":46}, {"mes":5,"unidades":28}, {"mes":6,"unidades":39}, {"mes":7,"unidades":52}, {"mes":8,"unidades":28}, {"mes":9,"unidades":23}, {"mes":10,"unidades":35}, {"mes":11,"unidades":23}, {"mes":12,"unidades":40}], [{"mes":1,"unidades":10637.64}, {"mes":2,"unidades":39403.14}, {"mes":3,"unidades":34304.48}, {"mes":4,"unidades":37952.36}, {"mes":5,"unidades":36166.42}, {"mes":6,"unidades":8819.17}, {"mes":9,"unidades":888.49}, {"mes":10,"unidades":439.68}], [{"mes":1,"unidades":62456.69}, {"mes":2,"unidades":34101.90}, {"mes":3,"unidades":27859.79}, {"mes":4,"unidades":33318.74}, {"mes":5,"unidades":42939.25}, {"mes":6,"unidades":45690.54}, {"mes":7,"unidades":47841.30}, {"mes":8,"unidades":36329.52}, {"mes":9,"unidades":61707.46}, {"mes":10,"unidades":58301.85}, {"mes":11,"unidades":27944.40}, {"mes":12,"unidades":97241.89}], [{"mes":1,"unidades":1582.91}, {"mes":2,"unidades":5484.30}, {"mes":3,"unidades":4390.83}, {"mes":4,"unidades":4909.21}, {"mes":5,"unidades":4944.74}, {"mes":6,"unidades":1156.23}, {"mes":9,"unidades":160.42}, {"mes":10,"unidades":50.09}], [{"mes":1,"unidades":7821.19}, {"mes":2,"unidades":4996.55}, {"mes":3,"unidades":3702.60}, {"mes":4,"unidades":4935.64}, {"mes":5,"unidades":4413.21}, {"mes":6,"unidades":5547.34}, {"mes":7,"unidades":4761.19}, {"mes":8,"unidades":5249.86}, {"mes":9,"unidades":6777.20}, {"mes":10,"unidades":7048.52}, {"mes":11,"unidades":3828.69}, {"mes":12,"unidades":6005.34}]];

    var obj = JSON.parse(myJson[0]);
    //var current = JSON.parse(obj[0]);
    alert(obj);
    
    
    //document.getElementById(PreCurr).value=myJson;
    

    /*
   for (j = 0; j <= (obj.length - 1); j++)
    {
        
        $('#listaCias').append($('<option>', { 
            value: obj[j].code,
            text : obj[j].nombre
    }));
    }*/
    
    /*
    var xCliente = document.getElementById('xIDCliente').value;
    if( xCliente.length>0 )
        setClienteIndex(xCliente); */
    
}

/**
 * 
 * @param {type} xYear
 * @param {type} PreCurr
 * @returns {Conectar}
 */
function ProduccionByNumeroVentas(xYear, PreCurr)
{

    //var pag=window.pagina;
    //var tama=window.pagsize;
    //alert(xYear);
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=ProduccionByNumeroVentas&xYear='+xYear;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaNumeroVentas(conn.pageRequest, PreCurr); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} xYear
 * @param {type} PreCurr
 * @returns {Conectar}
 */
function ProduccionByTotal(xYear, PreCurr)
{

    //var pag=window.pagina;
    //var tama=window.pagsize;
    //alert(xYear);
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=ProduccionByTotal&xYear='+xYear;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaNumeroVentas(conn.pageRequest, PreCurr); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} xYear
 * @param {type} PreCurr
 * @returns {Conectar}
 */
function ProduccionByComision(xYear, PreCurr)
{

    //var pag=window.pagina;
    //var tama=window.pagsize;
    //alert(xYear);
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=ProduccionByComision&xYear='+xYear;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaNumeroVentas(conn.pageRequest, PreCurr); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @param {type} PreCurr
 * @returns {unresolved}
 */
function ListaNumeroVentas(pageRequest, PreCurr) {


    if (pageRequest.readyState === 4)
    {
        if (pageRequest.status === 200)
        {
            // Solo descomentar para depuración
            //alert(pageRequest.responseText);
            if (pageRequest.responseText === 'Error')
                alert(pageRequest.responseText);
            else
            {
                PutValNumeroVentas(pageRequest.responseText, PreCurr);
                //return pageRequest.responseText;

            }


        }
    }
    else
        return;
}

/**
 * 
 * @param {type} myJson
 * @param {type} PreCurr
 * @returns {undefined}
 */
function PutValNumeroVentas(myJson, PreCurr)
{
    

    //var obj = JSON.parse(myJson);
    //alert(myJson);
    document.getElementById(PreCurr).value=myJson;
    

    /*
   for (j = 0; j <= (obj.length - 1); j++)
    {
        
        $('#listaCias').append($('<option>', { 
            value: obj[j].code,
            text : obj[j].nombre
    }));
    }*/
    
    /*
    var xCliente = document.getElementById('xIDCliente').value;
    if( xCliente.length>0 )
        setClienteIndex(xCliente); */
    
}

/**
 * 
 * @param {type} mes
 * @returns {Number}
 */
function DatosCurrentYear(mes)
{


    if (document.getElementById("Recibos").checked)
        {
        // por recibos
        //alert("Recibos");
        var myJson = document.getElementById("CurrPolizas").value;
        }
    else
        {
        // por importes
        //alert("Importes");
        if (document.getElementById("Total").checked)
            {
            var myJson = document.getElementById("CurrTotal").value;
            //alert(myJson);
            }
        else
            {
            var myJson = document.getElementById("CurrComision").value;
            }
            
        }

    
    //alert(myJson);
    var obj = JSON.parse(myJson);

    if (obj.length < mes)
        return 0;
    else    
        return obj[mes-1].unidades;

}
 
/**
 * 
 * @param {type} mes
 * @returns {Number}
 */
function DatosPreviousYear(mes)
{

    if (document.getElementById("Recibos").checked)
        {
        // por recibos
        //alert("Recibos");
        var myJson = document.getElementById("PrePolizas").value;
        }
    else
        {
        // por importes
        //alert("Importes");
        if (document.getElementById("Total").checked)
            {
            var myJson = document.getElementById("PreTotal").value;
            //alert(myJson);
            }
        else
            {
            var myJson = document.getElementById("PreComision").value;
            }
            
        }
        
    //alert(myJson);
    var obj = JSON.parse(myJson);

    if (obj.length < mes)
        return 0;
    else    
        return obj[mes-1].unidades;

}

/**
 * 
 * @returns {undefined}
 */
function ReadValuesGrafico()
{
    
    //alert("ReadValuesGrafico");
    
    if (document.getElementById("xYear").value==='')
        {
        document.getElementById("xYear").value='2016';
        }
    else
        {
            var WhatYear=parseInt(document.getElementById("xYear").value,10);
            if (WhatYear===NaN)
                document.getElementById("xYear").value='2016';
        }
        
   var current = document.getElementById("xYear").value;
   ProduccionAll(current);
}

/**
 * 
 * @returns {undefined}
 */
function ReadValuesGraficoOld()
{
    
    //alert("ReadValuesGrafico");
    
    if (document.getElementById("xYear").value==='')
        {
        document.getElementById("xYear").value='2016';
        }
    else
        {
            var WhatYear=parseInt(document.getElementById("xYear").value,10);
            if (WhatYear===NaN)
                document.getElementById("xYear").value='2016';
        }
        
    var prev = document.getElementById("xYear").value - 1;
    var current = document.getElementById("xYear").value;
    
    ProduccionByNumeroVentas(prev,"PrePolizas");
    ProduccionByNumeroVentas(current,"CurrPolizas");
    ProduccionByTotal(prev,"PreTotal");
    ProduccionByTotal(current,"CurrTotal");
    ProduccionByComision(prev,"PreComision");
    ProduccionByComision(current,"CurrComision");
    
    // 'visibility:hidden'
    var botonOculto = document.getElementById("VerGrafico");
    botonOculto.disabled=false;
    botonOculto.style.visibility="visible";
    botonOculto.style.display='';
            
    //alert("Salir de ReadValuesGrafico");
}

/**
 * 
 * @returns {undefined}
 */
function MakeGraph(){
    
    
    if (document.getElementById("xYear").value==='')
        {
        document.getElementById("xYear").value='2016';
        }
    else
        {
            var WhatYear=parseInt(document.getElementById("xYear").value,10);
            if (WhatYear===NaN)
                document.getElementById("xYear").value='2016';
        }
    
    var barChartData = {
    labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
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
    
    barChartData.datasets[0].label=document.getElementById("xYear").value;
    barChartData.datasets[1].label=document.getElementById("xYear").value - 1;
    
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