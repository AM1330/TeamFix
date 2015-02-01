/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.web;

import com.example.model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author user
 */
public class Sign_up extends HttpServlet {

  public void doPost( HttpServletRequest request, 
                      HttpServletResponse response) 
                      throws IOException, ServletException {
  
  

          String firstname = request.getParameter("firstname");
          String lastname = request.getParameter("lastname");
          String password = request.getParameter("password");
          String email = request.getParameter("email");
          String result="";
          int db_success=0; 
          // Now use our  Model above
         Sign_up_functionality li = new Sign_up_functionality();
          
         db_success = li.DB_store(firstname, lastname, password, email);
          
          response.setContentType("text/html;charset=UTF-8");
          
          result=firstname;
          
          request.setAttribute("styles", result);
          RequestDispatcher view = request.getRequestDispatcher("sign_up.jsp");
          view.forward(request, response);

  }
    
}


