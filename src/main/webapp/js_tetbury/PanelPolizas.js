/**
 * 
 * @param {type} xYear
 * @returns {Conectar}
 */
function ProduccionByNumeroVentas(xYear)
{

    //var pag=window.pagina;
    //var tama=window.pagsize;
    //alert(xYear);
    var url='AjaxPolizas.servlet';
    var dataToSend='accion=ProduccionByNumeroVentas&xYear='+xYear;
    var conn = new Conectar(url, dataToSend);
       
    conn.pageRequest.onreadystatechange = function() { ListaNumeroVentas(conn.pageRequest, xYear); };

    conn.Enviar();
    
    return conn;
}

/**
 * 
 * @param {type} pageRequest
 * @param {type} xYear
 * @returns {unresolved}
 */
function ListaNumeroVentas(pageRequest, xYear) {


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
                PutValNumeroVentas(pageRequest.responseText, xYear);
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
 * @param {type} xYear
 * @returns {undefined}
 */
function PutValNumeroVentas(myJson, xYear)
{
    

    //var obj = JSON.parse(myJson);
    //alert(myJson);
    document.getElementById(xYear).value=myJson;
    

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
