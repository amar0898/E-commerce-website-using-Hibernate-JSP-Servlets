<%-- 
    Document   : index
    Created on : 01-Nov-2020, 2:12:43 PM
    Author     : parveenjat
--%>

<%@page import="com.mycompany.ecommerce.website.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ApnaBazzar - Home</title>
        
        <%@include file="components/base.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/basic.css">

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <h1>Creating Session factory object</h1>
        <%
          out.println(FactoryProvider.getFactory());
        %>
    </body>
</html>
