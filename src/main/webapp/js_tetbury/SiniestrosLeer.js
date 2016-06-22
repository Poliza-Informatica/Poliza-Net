/**
 * 
 * @returns {Conectar}
 */
function LeerUnSiniestro()
{

    var pag=window.pagina;
    var tama=window.pagsize;
    var xExpe_Agencia = document.getElementById('xExpe_Agencia').value;

    //alert(xExpe_Agencia);
    
    var url='AjaxSiniestros.servlet';
    var dataToSend='accion=SiniestroByExpeAgencia&xExpe_Agencia='+xExpe_Agencia;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { UnSiniestro(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @returns {unresolved}
 */
function UnSiniestro(pageRequest) {


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
                FillSiniestro(pageRequest.responseText);
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
function FillSiniestro(myJson)
{
    //alert(myJson);
    var obj = JSON.parse(myJson);
    //alert(obj.nif);
    document.getElementById('xExpeCia').value=obj.expe_cia;
    document.getElementById('num_poliza').value=obj.id_poliza;
    document.getElementById('n_recibo').value=obj.n_recibo;
    document.getElementById('fechayhora').value=obj.fecha_hora_sini;
    document.getElementById('lugar').value=obj.lugar;
    
}

/**
 * Busquedas de siniestros
 * @returns {Conectar}
 */
function LeerSiniestrosByBuscar()
{
    var pag=window.pagina;
    var tama=window.pagsize;
    var xBuscar=document.getElementById("xBuscarSini").value;
    
    
    var url='AjaxSiniestros.servlet';
    var dataToSend='accion=SiniestrosByBuscar&pagina='+pag +'&size='+tama+'&xBuscar='+xBuscar;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaSiniestros(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}
/**
 * Lista de siniestros de una póliza
 * @returns {Conectar}
 */

function LeerSiniestros()
{

    var pag=window.pagina;
    var tama=window.pagsize;
    var xIDPoliza=document.getElementById("xIDPoliza").value;
    
    
    var url='AjaxSiniestros.servlet';
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

    var tabla = new grid("oTablaSini","oFilaSini");
    var j = 0;
    var myfila=window.fila;

    var obj = JSON.parse(myJson);

    // borrar las tuplas de consultas anteriores
    deleteLastRow("oTablaSini");
    
    //alert(myJson);
    /*
     [{"expe_agencia":"2015/147","id_poliza":"9867","expe_cia":"965140659","fecha_hora_sini":"07/06/2015","lugar":"hogar"},
     {"expe_agencia":"2015/19","id_poliza":"9867","expe_cia":"5022810","fecha_hora_sini":"27/01/2015","lugar":"HOGAR. MANUEL DE FALLA 10"}]
     */
    
    for (j = 0; j <= (obj.length - 1); j++)
    {
        //alert(obj[j].n_recibo);
        var row = tabla.AddRowTable(j + 1);

        //tabla.AddRowCellText(row, 0, obj[j].id);
        var celda = tabla.AddRowCellText(row, 0, obj[j].expe_agencia);
        //celda.setAttribute('hidden', 'true'); // ocultar la columna ID
        tabla.AddRowCellText(row, 1, obj[j].id_poliza );
        tabla.AddRowCellText(row, 2, obj[j].expe_cia );
        tabla.AddRowCellText(row, 3, obj[j].fecha_hora_sini );
        tabla.AddRowCellText(row, 4, obj[j].lugar );
        
        tabla.AddRowCellText(row, 5,
        '<ul class="nav nav-pills nav-justified">'
        +'<li><button type="button" onclick="ShowSiniestro('+(j+1)+');" title="Ver siniestro" class="btn btn-default btn-xs fa fa-eye" data-toggle="modal" data-target="#SiniestroModal"></button></li>'
        +'<li><button type="button" onclick="ShowSiniestro('+(j+1)+');" title="Ver póliza" class="btn btn-default btn-xs fa fa-list" data-toggle="modal" data-target="#ContratoModal"></button></li>'
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
function ShowSiniestro(numFila)
{
    var xID='oFilaSini'+numFila;
    var oCelda = document.getElementById(xID).cells[0];
    document.getElementById('xExpe_Agencia').value=oCelda.innerHTML;
    //window.location.href = 'ShowSiniestroCliente.jsp?xIDSini='+oCelda.innerHTML;
    LeerUnSiniestro();
    LeerSeguimientoSiniestro();
}


/**
 * 
 * @returns {Conectar}
 */
function LeerSeguimientoSiniestro()
{

    var pag=window.pagina;
    var tama=window.pagsize;
    var xExpe_Agencia=document.getElementById('xExpe_Agencia').value;
    
    //alert(xExpe_Agencia);
    var url='AjaxSiniestros.servlet';
    var dataToSend='accion=SeguimientoByExpeAgencia&xExpe_Agencia='+xExpe_Agencia;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaSeguiSiniestro(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @returns {unresolved}
 */
function ListaSeguiSiniestro(pageRequest) {


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
                CrearTablaSeguiSiniestro(pageRequest.responseText);
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
function CrearTablaSeguiSiniestro(myJson)
{

    //oTablaSeguiSini
    var tabla = new grid("oTablaSeguiSini","oFilaSegui");
    var j = 0;
    var myfila=window.fila;
    var celda;
    var obj = JSON.parse(myJson);

    // borrar las tuplas de consultas anteriores
    deleteLastRow("oTablaSeguiSini");
    
    //alert(myJson);
    
    for (j = 0; j <= (obj.length - 1); j++)
    {
        //alert(obj[j].n_recibo);
        var row = tabla.AddRowTable(j + 1);

        //tabla.AddRowCellText(row, 0, obj[j].id);
        celda = tabla.AddRowCellText(row, 0, obj[j].fecha_hora);
        celda.setAttribute('style', 'color: black;'); // ocultar la columna ID
        celda = tabla.AddRowCellText(row, 1, obj[j].texto );
        celda.setAttribute('style', 'color: black;');
    
        window.fila++;
        myfila=window.fila;
    }
    obj=null;


}
