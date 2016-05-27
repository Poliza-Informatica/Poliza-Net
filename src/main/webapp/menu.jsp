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
    
/*
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
  */     
    
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
   
    if ( sesion.getAttribute("UserTipo").equals("administrador") )
       {
    %>
    
    <li class="active"><a href="PanelPolizas.jsp" title="Panel de Control" ><i class="icon-bar-chart"></i>Panel de Control</a>
       <!-- <ul>
            <li><a href="PanelObligaciones.jsp" title="">Panel obligaciones</a></li>
        </ul>-->
    </li>
    <%
       }
    %>
    

    
    <li id="itemClientes" ><a  title="Clientes" href="BrowsePolizasClientes.jsp"><i class="icon-user"></i><%= clientes %></a>
       <!-- <ul>
            <li><a href="BrowseClientes.jsp" title="">Ver lista de Clientes</a></li>
            <li><a href="newCliente.jsp" title="">Nuevo Cliente</a></li>
        </ul>-->
    </li>
    
    
    <%
        
        if (sesion.getAttribute("UserTipo").equals("administrador") || true )
        {
            
    %>
    <li id="SetUpListados"><a class="expand"  title="Listados" href="SetUpListados.jsp" ><i class="icon-building"></i>Listados</a>
        
    </li>
    <%
        }
    %>
    
    
</ul>