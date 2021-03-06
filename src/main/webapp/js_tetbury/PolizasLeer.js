/**
 * 
 * @returns {Conectar}
 */
function LeerUnContratoPoliza()
{

    var pag=window.pagina;
    var tama=window.pagsize;
    var xIDPoliza = document.getElementById('xIDPoliza').value;
    
    
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=IDFromMVpolizas_asegurado&xIDPoliza='+xIDPoliza;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { UnContratoPoliza(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @returns {unresolved}
 */
function UnContratoPoliza(pageRequest) {


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
                FillContrato(pageRequest.responseText);
                //return pageRequest.responseText;

            }


        }
    }
    else
        return;
}

/**
 * Rellenar los datos del contrato desde una variable json
 * @param {type} myJson
 * @returns {undefined}
 */
function FillContrato(myJson)
{
    //alert(myJson);
    var obj = JSON.parse(myJson);
    //alert(obj.nif);
    document.getElementById('xRiesgo').value=obj.riesgo_asegurado;
    document.getElementById('CiaName').value=obj.cia_name;
    document.getElementById('Poliza').value=obj.poliza;
    document.getElementById('xNIF').value=obj.nif;
    document.getElementById('xNombre').value=obj.nombre;
    document.getElementById('xMovil').value=obj.tlf1;
    document.getElementById('xMail').value=obj.email;
    document.getElementById('xIBAN').value=obj.iban;
    
    
}

/**
 * Lista de polizas
 * @returns {Conectar}
 */

function LeerPolizas()
{

    var pag=window.pagina;
    var tama=window.pagsize;
    
    
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=PolizasByID&pagina='+pag +'&size='+tama;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaPolizas(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @returns {unresolved}
 */
function ListaPolizas(pageRequest) {


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
                CrearTablaPolizas(pageRequest.responseText);
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
function CrearTablaPolizas(myJson)
{

    var tabla = new grid("oTablaPolizas","oFilaPolizas");
    var j = 0;
    var myfila=window.fila;

    var obj = JSON.parse(myJson);

    // borrar las tuplas de consultas anteriores
    deleteLastRow("oTablaPolizas");
    
    //alert(myJson);
    //alert(obj.length - 1);
    
    for (j = 0; j <= (obj.length - 1); j++)
    {
        //alert(obj[j].Descripcion);
        var row = tabla.AddRowTable(j + 1);

        //tabla.AddRowCellText(row, 0, obj[j].id);
        var celda = tabla.AddRowCellText(row, 0, obj[j].id);
        celda.setAttribute('hidden', 'true'); // ocultar la columna ID
        tabla.AddRowCellText(row, 1, obj[j].nif );
        tabla.AddRowCellText(row, 2, obj[j].nombre );
        tabla.AddRowCellText(row, 3, obj[j].poliza );
        tabla.AddRowCellText(row, 4, obj[j].efecto );
        tabla.AddRowCellText(row, 5, obj[j].riesgo_asegurado );
        
        tabla.AddRowCellText(row, 6,
        '<ul class="nav nav-pills nav-justified">'+
        '<li><button type="button" onclick="GetDatosContrato('+(j+1)+');" class="btn btn-default btn-xs fa fa-eye" data-toggle="modal" data-target="#ContratoModal"></button></li>'+
        '<li><a onclick="ShowListaRecibos('+(j+1)+');" class="fa fa-money" title="Ver Recibos"></a> </li>'+
        '<li><a onclick="ShowListaSiniestros('+(j+1)+');" class="fa fa-bell" title="Ver Siniestros"></a> </li>'+
        '</ul>');
    
        window.fila++;
        myfila=window.fila;
    }
    obj=null;


}

/*
 * Leer lista de polizas por riesgo
 * 
 */
function LeerPolizasByRiesgo()
{
    var pag=window.pagina;
    var tama=window.pagsize;
    var xRiesgo=document.getElementById("xRiesgo").value;
    
    
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=PolizasByRiesgo&pagina='+pag +'&size='+tama+'&xRiesgo='+xRiesgo;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaPolizas(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

/*
 * Leer lista de polizas por riesgo
 * 
 */
function LeerPolizasByBuscar()
{
    var pag=window.pagina;
    var tama=window.pagsize;
    var xBuscar=document.getElementById("xBuscar").value;
    
    
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=PolizasByBuscar&pagina='+pag +'&size='+tama+'&xBuscar='+xBuscar;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaPolizas(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}

//
// Mostrar los datos de una póliza
//
function GetDatosContrato(numFila)
{
    var xID='oFilaPolizas'+numFila;
    var oCelda = document.getElementById(xID).cells[0];
    document.getElementById('xIDPoliza').value=oCelda.innerHTML;
    
    LeerUnContratoPoliza();
    //window.location.href = 'ShowPoliza.jsp?xIDPoliza='+oCelda.innerHTML;
    
}

/**
 * Sincronizo la rejilla de recibos y siniestros
 * @param {type} numFila
 * @returns {undefined}
 */
function ShowListaSiniestros(numFila)
{
    var xID='oFilaPolizas'+numFila;
    var oCelda = document.getElementById(xID).cells[0];
    document.getElementById('xIDPoliza').value=oCelda.innerHTML;
    document.getElementById('xBuscarSini').value='';
    LeerRecibos();
    LeerSiniestros();
    
    //window.location.href = 'BrowseSiniestrosPoliza.jsp?xIDPoliza='+oCelda.innerHTML;
    window.location.href ='#section_sini';
}

/**
 * Sincronizo la rejilla de recibos y siniestros
 * @param {type} numFila
 * @returns {undefined}
 */
function ShowListaRecibos(numFila)
{
    var xID='oFilaPolizas'+numFila;
    var oCelda = document.getElementById(xID).cells[0];
    document.getElementById('xIDPoliza').value=oCelda.innerHTML;
    document.getElementById('xBuscarSini').value='';
    
    //window.location.href = 'BrowseRecibosClientes.jsp?xIDPoliza='+oCelda.innerHTML;
    LeerSiniestros();
    LeerRecibos();
    window.location.href = '#section_recibos';
}

/*
 * Leer lista de polizas de un NIF
 * 
 */
function LeerPolizasByNIF()
{
    var pag=window.pagina;
    var tama=window.pagsize;
    
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=PolizasByNIF&pagina='+pag +'&size='+tama;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaPolizas(conn.pageRequest); };

    conn.Enviar();
    
    return conn;
}