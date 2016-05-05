
/**
 * Lista de siniestros de una póliza
 * @returns {Conectar}
 */

function LeerSiniestros()
{

    var pag=window.pagina;
    var tama=window.pagsize;
    var xIDPoliza=document.getElementById("xIDPoliza").value;
    
    
    var url='AjaxRecibos.servlet';
    var dataToSend='accion=SiniestrosByPoliza&pagina='+pag +'&size='+tama+'&xIDPoliza='+xIDPoliza;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaSiniestros(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @returns {unresolved}
 */
function ListaSiniestros(pageRequest) {


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
                CrearTablaSiniestros(pageRequest.responseText);
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
function CrearTablaSiniestros(myJson)
{

    var tabla = new grid("oTabla");
    var j = 0;
    var myfila=window.fila;

    var obj = JSON.parse(myJson);

    // borrar las tuplas de consultas anteriores
    deleteLastRow("oTabla");
    
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
        '<ul class="table-controls">'+
        '<li><a onclick="ShowSiniestro('+(j+1)+');" class="btn tip" title="Ver Siniestro"><i class="icon-eye-open"></i></a> </li>'+
        '</ul>');
    
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
function ShowSiniestro(numFila)
{
    var xID='ofila'+numFila;
    var oCelda = document.getElementById(xID).cells[0];
    
    window.location.href = 'ShowSiniestroCliente.jsp?xIDSini='+oCelda.innerHTML;
}

