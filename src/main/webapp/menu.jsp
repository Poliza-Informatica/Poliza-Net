<%-- 
    Document   : conta-menu
    Created on : 02-sep-2013, 3:26:50
    Author     : antonio
--%>

<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%
    // crear variables con los títulos de los menús
    String clientes="Clientes";
    String ventas="Ventas";
    String listados="Libro de ventas";
    String verPlantilla = "display:none;";
    String vJson =(String) sesion.getAttribute("permisos");
    
    JSONObject jsonObject = null;
                    
    // 
    try {
     jsonObject = (JSONObject) new JSONParser().parse(vJson);
    } catch (ParseException e) {
     throw new RuntimeException("Unable to parse json " + vJson);
    }
    
    String panel = (String) jsonObject.get("panel");
    String clientesp = (String) jsonObject.get("clientes");
    String ventasp = (String) jsonObject.get("ventas");
    String proveedores = (String) jsonObject.get("proveedores");
    String compras = (String) jsonObject.get("compras");
    String nominas = (String) jsonObject.get("nominas");
    String sbancos = (String) jsonObject.get("bancos");
    String contabilidad = (String) jsonObject.get("contabilidad");
        
    if (sesion.getAttribute("FormaJuridica").equals("Comunidades de propietarios"))
    {
        ventas="Cuotas/Recibos";
        clientes="Propietarios/Comuneros";
        listados="listados de recibos";
        verPlantilla = "";
    }
    //else if ()
    
    
%>

<script>
    function selectItemMenu(id){
        
        $( "#navMenu li" ).each(function( index ) {
            $(this).removeClass('active');
        });
        
        $('#'+id).addClass('active');
    }
</script>

<ul class="navigation widget" id="navMenu">

    <%
   
    if ( sesion.getAttribute("UserTipo").equals("administrador") || panel.equals("yes") )
       {
    %>
    
    <li class="active"><a href="PanelFacturacion.jsp" title="Panel de Control" ><i class="icon-bar-chart"></i>Panel de Control</a>
       <!-- <ul>
            <li><a href="PanelObligaciones.jsp" title="">Panel obligaciones</a></li>
        </ul>-->
    </li>
    <%
       }
    %>
    
    <li id="itemEscritorio" ><a class="expand" href="inicio.jsp" title=""><i class="icon-home"></i>Escritorio</a>
        <ul>
            <li><a href="ListaTareas.jsp" title="">Lista de Tareas</a></li>
            <%
                // es un asesor no pide asesoría solo el resto de tipos de cuentas
                if ( !sesion.getAttribute("TipoCuenta").equals(4) )
                    {
            %>
            <li><a href="ListaAsesores.jsp" title="">Contactar con un Asesor</a></li>
            <%
                    }
            %>
        </ul>
    
    </li>

    <%
        
        if (clientesp.equals("yes") )
        {
            
    %>
    
    <li id="itemClientes" ><a  title="Clientes" href="BrowseClientes.jsp"><i class="icon-user"></i><%= clientes %></a>
       <!-- <ul>
            <li><a href="BrowseClientes.jsp" title="">Ver lista de Clientes</a></li>
            <li><a href="newCliente.jsp" title="">Nuevo Cliente</a></li>
        </ul>-->
    </li>
    <%
        }
    %>
    
    
    <%
        
        if (sesion.getAttribute("EmiteRemesas").equals("SI") )
        {
            
    %>
    <li id="BrowseAllRemesas"><a class="expand"  title="Remesas" ><i class="icon-tasks"></i>Remesas</a>
        <ul>
            <li><a href="BrowseAllRemesas.jsp" title="">Gestión de Remesas</a></li>
        </ul>
    </li>
    <%
        }
    %>
    <%
        
        if (sesion.getAttribute("Presupuestos").equals("SI") )
        {
            
    %>
    <li id="BrowseAllPresupuestos"><a class="expand"  title="Presupuestos" ><i class="icon-building"></i>Presupuestos</a>
        <ul>
            <li><a href="BrowseAllPresupuestos.jsp" title="">Gestión de presupuestos</a></li>
        </ul>
    </li>
    <%
        }
    %>
    
    <%
        
        if (ventasp.equals("yes") )
        {
            
    %>
    <li id="itemFacturas"><a  title="Ventas" href="BrowseFacturasEmitidas.jsp"><i class="icon-inbox"></i><%= ventas %> </a>
       <!-- <ul>
            <li><a href="BrowseFacturasEmitidas.jsp" title="">Ver Facturas ventas</a></li>
            <li><a href="newFactura.jsp" title="">Nueva Factura</a></li>
            <li><a href="ListadosVentas.jsp" title="">Listados de ventas</a></li>
        </ul>-->
    </li>
    <%
        }
    %>
    
    <%
        
        if (proveedores.equals("yes") )
        {
            
    %>
    <li id="itemProveedores"><a title="Proveedores" href="BrowseProveedores.jsp" ><i class="icon-group"></i>Proveedores y Terceros</a>
        <!--<ul>
            <li><a href="BrowseProveedores.jsp" title="">Lista de Proveedores</a></li>
            <li><a href="newProveedor.jsp" title="">Nuevo Proveedor</a></li>
        </ul>-->
    </li>
    <%
        }
    %>
    
    <%
        
        if (compras.equals("yes") )
        {
            
    %>
    <li id="itemGastos"><a   title="Compras y Gastos" href="BrowseFacturasRecibidas.jsp" ><i class="icon-credit-card"></i>Compras y Gastos</a>
       <!-- <ul>
            <li><a href="BrowseFacturasRecibidas.jsp" title="">Ver Compras y Gastos</a></li>
            <li><a href="newGasto.jsp" title="">Nuevo Gasto/Suministro</a></li>
            <li><a href="ListadosCompras.jsp" title="">Listados de compras</a></li>
        </ul> -->
    </li>
    <%
        }
    %>

    <%
        // sesion.getAttribute("Nominas") hace referencia al servicio y nominas.equals al permiso de usuario
        if (sesion.getAttribute("Nominas").equals("yes") && nominas.equals("yes") )
        {
    %>
    <li id="itemNominas"><a  title="Nóminas" href="BrowseNominas.jsp" ><i class="icon-time"></i>N&oacute;minas</a>
        <!--<ul>
            <li><a href="BrowseNominas.jsp" title="">Vista de nóminas</a></li>
            <li><a href="CargoNominas.jsp" title="">Cargo de Nóminas</a></li>
        </ul>-->
    </li>
    <%
        }
    %>
    
    <%
        
        if ( sbancos.equals("yes") )
        {
            
    %>
    <li id="itemBancos"><a  href="BrowseBancosMovimientos.jsp"  title="" ><i class="icon-money"></i>Bancos</a>
       <!-- <ul>
            <li><a href="BrowseBancosMovimientos.jsp" title="">Consulta de movimientos</a></li>
            <li><a href="ReintegrosIngresos.jsp" title="">Ingresos y reintegros</a></li>
        </ul -->
    </li>
    <%
        }
    %>
    
    <%
        if (sesion.getAttribute("Contabilidad").equals("yes") && contabilidad.equals("yes"))
        {
    %>
    <li id="itemPlanContable"><a class="expand" href="#" title="Plan Contable" ><i class="icon-book"></i>Contabilidad</a>
        <ul>
            <li><a href="conta-BrowseAsientos.jsp" title="">Diario de Asientos</a></li>
            <li><a href="conta-BrowseCuentasContables.jsp" title="">Plan Contable</a></li>
        </ul>
    </li>
    <%
        }
    %>
    
    <%
        if (sesion.getAttribute("myHD").equals("yes") )
        {
    %>
    <li id="itemDocu"><a title="Mis Documentos" href="misDocs.jsp" ><i class="icon-folder-open"></i>Mis Documentos</a>
        <!--<ul>
            <li><a href="#" title="">Bandeja del eMail</a></li>
            <li><a href="#" title="">Registro</a></li>
        </ul>-->
    </li>
    <%
        }
    %>
    
    <%
        if (sesion.getAttribute("Burofax").equals("yes") )
        {
    %>
    <li id="itemMail"><a class="expand"  title="eMail & Burofax" ><i class="icon-envelope"></i>eMail & Burofax</a>
        <ul>
            <li><a href="#" title="">Bandeja del eMail</a></li>
            <li><a href="#" title="">Registro</a></li>
        </ul>
    </li>
    <%
        }
    %>
    
    <%
        if ( sesion.getAttribute("TipoCuenta").equals(4) )
        {
    %>
    <li id="itemAsesoria"><a  class="expand" title="Servicios de Asesoría"><i class="icon-bell-alt"></i>Servicios de Asesoría</a>
       <ul>
            <li><a href="#" title="">Gestión de clientes</a></li>
            <li><a href="#" title="">Registro de Actividad</a></li>
       </ul>
    </li>
    <%
        }
    %>
    
    <%
        if ( sesion.getAttribute("UserTipo").equals("administrador") )
        {
    %>
    <li id="itemConfig"><a class="expand"  title="" ><i class="icon-cog"></i>Configuración</a>
        <ul>
            <li><a href="DatosFacturacion.jsp" title="">Datos de Configuración</a></li>
            <li><a href="DatosCargaImpositiva.jsp" title="">Datos Tributarios</a></li>
            <li><a href="DatosSepa.jsp" title="">Domiciliaciones Mandatos SEPA</a></li>
            <li><a href="DatosYearTrabajo.jsp" title="">Fechas</a></li>
            <li><a href="DatosSocios.jsp" title="">Datos Socios</a></li>
            <li><a href="DatosSeguridad.jsp" title="">Seguridad de Acceso</a></li>
            <li><a href="TSAparametros.jsp" title="">Notario electrónico</a></li>
            <li><a href="PermisosUsuarios.jsp" title="">Permisos de los usuarios</a></li>
            <li><a href="PlantillasRecibo.jsp" title="" style="<%= verPlantilla %>">Plantilla del Recibo</a></li>
        </ul>
    </li>
    <%
        }
    %>
</ul>