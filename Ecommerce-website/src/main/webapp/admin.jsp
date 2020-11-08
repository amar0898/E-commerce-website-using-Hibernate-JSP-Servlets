<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerce.website.entities.category"%>
<%@page import="com.mycompany.ecommerce.website.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerce.website.helper.FactoryProvider"%>
<%@page import="com.mycompany.ecommerce.website.entities.User"%>
<%
    
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not Logged in ! Login to your account to proceed further");
        response.sendRedirect("index.jsp");
        return;
    }
    else{
        if(user.getUserType().equals("normal")){
            
            session.setAttribute("message","You are not Admin. You have not priviledge to access this page");
            response.sendRedirect("login.jsp");
            return;
        }
        
    }
    
    
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/base.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/basic.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/message.jsp" %>
        <%@include file="components/warningMessage.jsp" %>
        
        
        <div class="container admin">
            <div class="row mt-5">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/users.png" alt="user-icon" class="img-fluid rounded-circle" style="max-width:150px;">
                            </div>
                            
                            <h1>234</h1>
                            <h1>Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/categories.png" alt="user-icon" class="img-fluid rounded-circle" style="max-width:150px;">
                            </div>
                            <h1>234</h1>
                            <h1>Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/products.png" alt="user-icon" class="img-fluid rounded-circle" style="max-width:150px;">
                            </div>
                            <h1>234</h1>
                            <h1>Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/keys.png" alt="user-icon" class="img-fluid rounded-circle" style="max-width:150px;">
                            </div>
                            
                            <h1 class="mt-2">Add New Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="img/add.png" alt="user-icon" class="img-fluid rounded-circle" style="max-width:150px;">
                            </div>
                            
                            <h1 class="mt-2">Add New Product</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
    

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header text-white" style="background-color: #6C63FF;">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post">
                      <input type="hidden" name="operation" value="addcategory"/>
                      <div class="form-group">
                          <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
                      </div>
                      
                      <div class="form-group">
                          <textarea style="height:200px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                      </div>
                      <div class="container text-center">
                          <button class="btn btn-outline-primary mr-2">Add Category</button>
                          <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                      </div>
                      
                  </form>
              </div>
              
            </div>
          </div>
        </div>
        
        
             <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog modal-lg">
                 <div class="modal-content">
                   <div class="modal-header text-white" style="background-color: #6C63FF;">
                     <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                       <span aria-hidden="true">&times;</span>
                     </button>
                   </div>
                   <div class="modal-body">
                       <form>
                           <input type="hidden" name="operation" value="addproduct"/>
                           <div class="form-group">
                               <input type="text" class="form-control" name="pTitle" placeholder="Enter product title" required/>
                           </div>

                           <div class="form-group">
                               <textarea style="height:100px;" class="form-control" placeholder="Enter product description" name="pDescription" required></textarea>
                           </div>
                           <div class="form-group">
                               <input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required/>
                           </div>
                           <div class="form-group">
                               <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>
                           </div>
                           <div class="form-group">
                               <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required/>
                           </div>
                           
                     
                           <div class="form-group">
                               <label for="pPic">Select product photo</label>
                               <input type="file" id="pPic" class="form-control" name="pPic" required/>
                           </div>
                           <div class="container text-center">
                               <button class="btn btn-outline-primary mr-2">Add Product</button>
                               <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                           </div>

                       </form>
                   </div>

                 </div>
                </div>
             </div>

        
        
        
        
    </body>
</html>
