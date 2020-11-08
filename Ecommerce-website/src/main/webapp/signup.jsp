

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <%@include file="components/base.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/basic.css">
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/message.jsp" %>
        <div class="inner">
            
            <div class="photo">
                <img src="img/signup2.svg">
            </div>
            <div class="user-form">
                
                <h1>Welcome! To Apna Bazzar</h1>
                <h2 style="color:white;font-weight:bold;"> Sign Up Here !</h2>
                <form action="SignupServlet" method="post">
                    <i class="fa fa-user icon fa-lg"></i>
                    <input type="text" placeholder="Your name" name="user_name" required>
                    <i class="fa fa-envelope icon fa-lg"></i>  
                    <input type="email" placeholder="Your e-mail" name="user_email" required>
                    <i class="fa fa-phone icon fa-lg"></i> 
                    <input type="tel" id="phone" name="user_phone" placeholder="Your phone number"  required>
                    <i class="fa fa-lock icon fa-lg "></i>  
                    <input type="password" name="user_password" placeholder="Your password" required>
                    <i class="fa fa-home icon fa-lg "></i>  
                    <input type="text" name="user_address" placeholder="Your Address" required>
                    
                    <div class="action-btn">
                        <button class="btn btn-outline-danger primary">Create Account</button>
                        <button class="btn btn-outline-danger" disabled><a href="login.jsp">Log In</a></button>
                    </div>
                </form>
               
            </div>
        </div>
</body>
</html>
