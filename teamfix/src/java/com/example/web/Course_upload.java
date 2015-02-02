/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.web;

import com.example.model.ModelClass;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class Course_upload extends HttpServlet{
    
    
    public void doPost( HttpServletRequest request, 
                      HttpServletResponse response) 
                      throws IOException, ServletException {
  
  

          String    name=null,grade=null,id=null,date=null,max=null,interest=null,project_id=null,email=null;
          String    action = request.getParameter("action");
          
          


          String result="",db_string=null;
          int db_success=0;
          ResultSet db_res=null;
          // Now use our  Model above
         ModelClass li = new ModelClass();
          
         if(action.equals("course_upload")){
            name = request.getParameter("course_name");
            grade = request.getParameter("grade");
            id = request.getParameter("student_id");
            db_success = li.DB_store_course(name,grade,id);
         }
           if(action.equals("project_search")){
            name = request.getParameter("project_name");  
            id = request.getParameter("student_id");
              try {
                  db_string = li.DB_project_search(name,id);
              } catch (SQLException | NamingException ex) {
                  Logger.getLogger(Course_upload.class.getName()).log(Level.SEVERE, null, ex);
              }
              request.setAttribute("search_res", db_string);
              
               request.setAttribute("search_res_bin", true);
         }
         
          if(action.equals("project_upload")){
              try {
                  id = (String) request.getParameter("student_id");
                  email = (String) request.getParameter("student_email");
                  name = (String) request.getParameter("project_name");
                  date = (String) request.getParameter("exp_date");
                  max = (String) request.getParameter("maxmembers");
                  interest =  (String) request.getParameter("interest");
                  db_success = li.DB_project_upload(id,name,date,max,interest,email);
              } catch (SQLException ex) {
                  Logger.getLogger(Course_upload.class.getName()).log(Level.SEVERE, null, ex);
              } catch (NamingException ex) {
                  Logger.getLogger(Course_upload.class.getName()).log(Level.SEVERE, null, ex);
              }
         }
          
          
          if(action.equals("join_project")){
              try {
                  id = (String) request.getParameter("student_id");
                  project_id = (String) request.getParameter("project_id");
                  email = (String) request.getParameter("student_email");
                  interest =  (String) request.getParameter("interest");
                  db_string = li.DB_join_project(id,project_id,interest,email);
                  request.setAttribute("join_res", db_string);
               request.setAttribute("join_res_bin", true);
              } catch (SQLException ex) {
                  Logger.getLogger(Course_upload.class.getName()).log(Level.SEVERE, null, ex);
              } catch (NamingException ex) {
                  Logger.getLogger(Course_upload.class.getName()).log(Level.SEVERE, null, ex);
              }
              
         }
          
          
          
         
          response.setContentType("text/html;charset=UTF-8");
          
          result=name;
          
          request.setAttribute("styles", result);
          
          RequestDispatcher view = request.getRequestDispatcher("student_home.jsp");
          view.forward(request, response);

  }
    
    
}
