
package com.mycompany.ecommerce.website.servlets;

import com.mycompany.ecommerce.website.dao.CategoryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.Annotation;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mycompany.ecommerce.website.entities.category;
import com.mycompany.ecommerce.website.helper.FactoryProvider;
import javax.servlet.http.HttpSession;

public class ProductOperationServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
            String op = request.getParameter("operation");
            
            if(op.trim().equals("addcategory")){
                
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                category category1 = new category(); 
                category1.setCategoryTitle(title);
                category1.setCategoryDescription(description);
                    

                 CategoryDao categoryDao1 = new CategoryDao(FactoryProvider.getFactory());
                 int catId = categoryDao1.saveCategory(category1);
                 
                 HttpSession httpSession = request.getSession();
                 httpSession.setAttribute("message","New Category has been added successfully!");
                 response.sendRedirect("admin.jsp");
                 return;
               
            }
            
            else if(op.trim().equals("addproduct")){
                
            }
            
            
            
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
