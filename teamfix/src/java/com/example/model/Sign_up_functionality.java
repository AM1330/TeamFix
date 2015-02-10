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
public class Sign_up_functionality {
       public int DB_store(String firstname,String lastname,String pass ,String email){
    
           
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
   "INSERT INTO db_student (`firstname`, `lastname`, `email`,`password`) VALUES (?,?,?, AES_ENCRYPT(?,'usetheforce'))");

pstmt.setString(1, firstname); // set parameter 1 (FIRST_NAME)
pstmt.setString(2, lastname); // set parameter 2 (ID)
pstmt.setString(4, pass);
pstmt.setString(3, email);
int rows = pstmt.executeUpdate(); // "rows" save the affected rows
        
        
    }
    catch ( SQLException ex ) {
               Logger.getLogger(Sign_up_functionality.class.getName()).log(Level.SEVERE, null, ex);
    }
    return(1);
   }
    
}
