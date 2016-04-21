<%-- 
    Document   : sesion
    Created on : 25-sep-2013, 3:02:20
    Author     : antonio
--%>

<%@page session="true" %>
<%
    
    HttpSession sesion = request.getSession(false);
    if (sesion!=null)
        sesion.invalidate();
   
%>
    <jsp:forward page="index.jsp"/>
       
   