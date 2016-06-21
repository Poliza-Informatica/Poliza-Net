
function LeerUnRecibo()
{

    var pag=window.pagina;
    var tama=window.pagsize;
    var xIDRecibo = document.getElementById('xIDRecibo').value;
    
    
    var url='AjaxRecibos.servlet';
    var dataToSend='accion=ReciboByID&xIDRecibo='+xIDRecibo;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { UnRecibo(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @returns {unresolved}
 */
function UnRecibo(pageRequest) {


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
                FillRecibo(pageRequest.responseText);
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
function FillRecibo(myJson)
{
    //alert(myJson);
    var obj = JSON.parse(myJson);
    //alert(obj.nif);
    document.getElementById('xRiesgoAsegurado').value=obj.riesgo_asegurado;
    document.getElementById('id_poliza').value=obj.id_poliza;
    document.getElementById('n_recibo').value=obj.n_recibo;
    document.getElementById('xVencimiento').value=obj.vencimiento;
    document.getElementById('xEfecto').value=obj.efecto;
    document.getElementById('xImporte').value=obj.total_recibo;
    
}

/**
 * Lista de recibos de una póliza
 * @returns {Conectar}
 */

function LeerRecibos()
{

    var pag=window.pagina;
    var tama=window.pagsize;
    var xIDPoliza=document.getElementById("xIDPoliza").value;
    
    
    var url='AjaxRecibos.servlet';
    var dataToSend='accion=RecibosByPoliza&pagina='+pag +'&size='+tama+'&xIDPoliza='+xIDPoliza;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaRecibos(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @returns {unresolved}
 */
function ListaRecibos(pageRequest) {


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
                CrearTablaRecibos(pageRequest.responseText);
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
function CrearTablaRecibos(myJson)
{

    var tabla = new grid("oTablaRecibos");
    var j = 0;
    var myfila=window.fila;

    var obj = JSON.parse(myJson);

    // borrar las tuplas de consultas anteriores
    deleteLastRow("oTablaRecibos");
    
    //alert(myJson);
    
    for (j = 0; j <= (obj.length - 1); j++)
    {
        //alert(obj[j].n_recibo);
        var row = tabla.AddRowTable(j + 1);

        //tabla.AddRowCellText(row, 0, obj[j].id);
        var celda = tabla.AddRowCellText(row, 0, obj[j].id);
        celda.setAttribute('hidden', 'true'); // ocultar la columna ID
        tabla.AddRowCellText(row, 1, obj[j].n_recibo );
        tabla.AddRowCellText(row, 2, obj[j].estado_cliente );
        tabla.AddRowCellText(row, 3, obj[j].efecto );
        tabla.AddRowCellText(row, 4, obj[j].total_recibo );
        
        tabla.AddRowCellText(row, 5,
        '<ul class="nav nav-pills nav-justified">'+
        '<li><button type="button" onclick="ShowRecibo('+(j+1)+');" class="btn btn-default btn-xs fa fa-eye" data-toggle="modal" data-target="#RecibosModal"></button></li>'
        +'</ul>');
    
        window.fila++;
        myfila=window.fila;
    }
    obj=null;


}


/**
 * Mostrar los datos de un recibo
 * @param {type} numFila
 * @returns {undefined}
 */
function ShowRecibo(numFila)
{
    var xID='ofila'+numFila;
    var oCelda = document.getElementById(xID).cells[0];
    document.getElementById('xIDRecibo').value=oCelda.innerHTML;
    //alert(document.getElementById('xIDRecibo').value);
    LeerUnRecibo();
    
    //window.location.href = 'ShowReciboCliente.jsp?xIDRecibo='+oCelda.innerHTML;
    
}

