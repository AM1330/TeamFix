package com.example.web;

import com.example.model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class student_log_in extends HttpServlet {

  public void doPost( HttpServletRequest request, 
                      HttpServletResponse response) 
                      throws IOException, ServletException {

    String id_student= null;
    String firstname= null;
    String lastname= null;
      String email_taken=null;
      boolean foundCookie = false;
      boolean cookie_test_var=false;
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    // Now use our Coffee Model above 
    log_in_functionality li = new log_in_functionality();

    List result = li.getStudent(email,password);

    
     id_student= (String)result.get(0);
     firstname= (String)result.get(1);
     lastname= (String)result.get(2);
    email_taken=(String)result.get(3);
    response.setContentType("text/html;charset=UTF-8");

    /*
                Cookie[] cookies = request.getCookies();
                
                 for(int i = 0; i < cookies.length; i++) {
                     Cookie cookie_test = cookies[i];
                       if (cookie_test.getName().equals("email")) {
                            email_taken=cookie_test.getValue( );                      
                            foundCookie = true;
                         }
                       
                 }
               */  
                
    if (email_taken==null || email==null){
        cookie_test_var=false;
    }
    else if(!email_taken.equals(email)){
        cookie_test_var=false;
    }
    else{cookie_test_var=true;}
    
    
    
        if ("-1".equals(id_student)) {
            
        }
        else { 
            if (!foundCookie && cookie_test_var) { //an exei vrei cookie dhladh foundCookie=true tote den ftiaxnei kainourio, 8eloume na ftiaxnei Cookie mono an den exei vrei allo kai mono an exei vrei kataxwrish sthn vash
                Cookie cookie1 = new Cookie("id_student", id_student);
                cookie1.setMaxAge(600);
                response.addCookie(cookie1); 
                 Cookie cookie2 = new Cookie("firstname", firstname);
                cookie2.setMaxAge(600);
                response.addCookie(cookie2); 
                 Cookie cookie3 = new Cookie("lastname", lastname);
                cookie3.setMaxAge(600);
                response.addCookie(cookie3); 
                 Cookie cookie4 = new Cookie("email", email_taken);
                cookie4.setMaxAge(600);
                response.addCookie(cookie4); 
            }
        }
        
    // The results will be passed back (as an attribute) to the JSP view
    // The attribute will be a name/value pair, the value in this case will be a List object 
    request.setAttribute("styles", result);
    request.setAttribute("id_student", id_student);
    request.setAttribute("firstname", firstname);
    request.setAttribute("lastname", lastname);
    RequestDispatcher view = request.getRequestDispatcher("result.jsp");
    view.forward(request, response); 
  }
}