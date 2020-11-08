
package com.mycompany.ecommerce.website.servlets;

import com.mycompany.ecommerce.website.entities.User;
import com.mycompany.ecommerce.website.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
public class SignupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
               String userName = request.getParameter("user_name");
               String userEmail = request.getParameter("user_email");
               String userPassword = request.getParameter("user_password");
               String userPhone = request.getParameter("user_phone");
               String userAddress = request.getParameter("user_address");
               
               User user = new User(userName, userEmail, userPassword, userPhone, "default", userAddress, "normal");
               
               Session hibernateSession = FactoryProvider.getFactory().openSession();
               Transaction tx = hibernateSession.beginTransaction();
               
               int userId = (int) hibernateSession.save(user);
               
               tx.commit();
               hibernateSession.close();
    
               HttpSession httpSession = request.getSession();
               httpSession.setAttribute("message","Your Account has been created successfully ! Your user ID is: "+ userId);
               response.sendRedirect("signup.jsp");
               return;
               
               
            }
            catch(Exception e){
                e.printStackTrace();
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
