<%@page import="com.mycompany.ecommerce.website.entities.User"%>
<%
    
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not Logged in ! Login to your account to proceed further");
        response.sendRedirect("login.jsp");
        return;
    }
    
    
    
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title> 
        <%@include file="components/base.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/basic.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/warningMessage.jsp" %>
        <h1>Hello World!</h1>
    </body>
</html>
