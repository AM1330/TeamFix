
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.model;

import static java.rmi.server.LogStream.log;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.*;
import javax.sql.*;


/**
 *
 * @author user
 */
public class ModelClass {
    
           public int DB_store_course(String name, String grade, String id){


    try {
        
        
        String DATASOURCE_CONTEXT = "java:comp/env/jdbc/teamfix";
        
        Connection result = null;
        try {
            Context initialContext = new InitialContext();
            if ( initialContext == null){
                log("JNDI problem. Cannot get InitialContext.");
            }
            DataSource datasource = (DataSource)initialContext.lookup(DATASOURCE_CONTEXT);
            if (datasource != null) {
                result = datasource.getConnection();
            }
            else {
                log("Failed to lookup datasource.");
            }
        }
        catch ( NamingException ex ) {
            log("Cannot get connection: " + ex);
        }
        catch(SQLException ex){
            log("Cannot get connection: " + ex);
        }
      

    PreparedStatement pstmt = result.prepareStatement(
   "INSERT INTO db_courses (`name`,`student_id`,grade) VALUES (?,?,?)");

pstmt.setString(1, name); // set parameter 1 (FIRST_NAME)
pstmt.setString(2, id);
pstmt.setString(3, grade);
int rows = pstmt.executeUpdate(); // "rows" save the affected rows
      
 


result.close();
        
    }
    catch ( SQLException ex ) {
               Logger.getLogger(Sign_up_functionality.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    return(1);
   }
    
    
        
              public int DB_project_upload(String id,String name, String date, String max, String interest) throws SQLException, NamingException{


 
        
        String DATASOURCE_CONTEXT = "java:comp/env/jdbc/teamfix";
        
        Connection result = null;
        Context initialContext = new InitialContext();
DataSource datasource = (DataSource)initialContext.lookup(DATASOURCE_CONTEXT);
            if (datasource != null) {
                result = datasource.getConnection();
            }


    PreparedStatement pstmt = result.prepareStatement("INSERT INTO project (name,expiration,max_members) VALUES (?,?,?)", Statement.RETURN_GENERATED_KEYS);

pstmt.setString(1, name);
pstmt.setString(2, date);
pstmt.setString(3, max);
int rows = pstmt.executeUpdate(); // "rows" save the affected rows

int project_id=0;
ResultSet rs=pstmt.getGeneratedKeys();
if(rs.next()){
project_id= rs.getInt(1);
}
int id2 = Integer.parseInt(id);

PreparedStatement pstmt2 = result.prepareStatement( "INSERT INTO in_project (`student_id`,`interest`,`project_id`) VALUES (?,?,?)");

pstmt2.setInt(1, id2); // set parameter 1 (FIRST_NAME)
pstmt2.setString(2, interest);
pstmt2.setInt(3, project_id);
 int rows2 = pstmt2.executeUpdate(); // "rows" save the affected rows
     




result.close();

        
    

    return(1);
   }        
           
           
           
           
           
           
    
}










        
  /*  PreparedStatement pstmt2 = result.prepareStatement( "INSERT INTO in_project (`student_id`,`project_id`,`interest_in_days`) VALUES (?,?,?)");

pstmt2.setString(1, id); // set parameter 1 (FIRST_NAME)
pstmt2.setInt(2, 5);
pstmt2.setString(3, interest);
 int rows2 = pstmt2.executeUpdate(); // "rows" save the affected rows
        */