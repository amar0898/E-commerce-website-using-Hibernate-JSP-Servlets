
package com.mycompany.ecommerce.website.servlets;

import com.mycompany.ecommerce.website.dao.UserDao;
import com.mycompany.ecommerce.website.entities.User;
import com.mycompany.ecommerce.website.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(userEmail, userPassword);
            
            HttpSession httpSession = request.getSession();
            
            if(user==null){
                httpSession.setAttribute("message","Invalid Credentials! Please check correctly before logging in.");
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                out.println("<h1> Welcome back "+ user.getUserName() + " </h1>");
                
                httpSession.setAttribute("current-user", user);
                if(user.getUserType().equals("admin")){
                    response.sendRedirect("admin.jsp");
                }
                
                else if(user.getUserType().equals("normal")){
                    response.sendRedirect("normal.jsp");
                }
                
                else{
                    out.println("Not Valid");
                }
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
