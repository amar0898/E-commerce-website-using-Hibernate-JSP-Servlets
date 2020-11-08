


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
    <%@include file="components/base.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/basic.css">
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/warningMessage.jsp" %>
        <div class="inner">
            <div class="photo">
                <img src="img/login1.svg">
            </div>
            <div class="user-form">
                <h1>Log In Here !</h1>
                <form action="LoginServlet" method="post">
                    <i class="fa fa-envelope icon fa-lg"></i> 
                    <input type="email" name="user_email" placeholder="Email address" required>
                    
                    <i class="fa fa-lock icon"></i> 
                    <input type="password" name="user_password" placeholder="password" required>
                    
                    <div class="action-btn">
                        <button class="btn btn-outline-danger" disabled><a href="signup.jsp">Create Account</a></button>
                        <button class="btn btn-outline-danger primary">Log In</button>
                    </div>
                </form>
            </div>
        </div>
</body>
</html>
