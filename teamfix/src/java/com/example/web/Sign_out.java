/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.web;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class Sign_out extends HttpServlet  {
    
    public void doPost( HttpServletRequest request, 
                      HttpServletResponse response) 
                      throws IOException, ServletException {
  
  
        Cookie[] cookies = request.getCookies();
                
                 for(int i = 0; i < cookies.length; i++) {
                     Cookie cookie_test = cookies[i];
                       if (cookie_test.getName().equals("id_student")) {
                            cookie_test.setMaxAge(0);
                            response.addCookie(cookie_test);
                            
                         }
                       if (cookie_test.getName().equals("firstname")) {
                            cookie_test.setMaxAge(0);
                            response.addCookie(cookie_test);
                            
                         }
                       if (cookie_test.getName().equals("lastname")) {
                            cookie_test.setMaxAge(0);
                            response.addCookie(cookie_test);
                            
                         }
                       if (cookie_test.getName().equals("email")) {
                            cookie_test.setMaxAge(0);
                            response.addCookie(cookie_test);
                            
                         }
                       
                 }
        
        

          
          response.setContentType("text/html;charset=UTF-8");

          RequestDispatcher view = request.getRequestDispatcher("index.jsp");
          view.forward(request, response);

  }
    
    
}
