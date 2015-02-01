package com.example.model;

import static java.rmi.server.LogStream.log;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.*;
import javax.sql.*;

public class log_in_functionality{
   public List getStudent(String email,String pass) {

       
     String userid = null;
     String firstname = null;
     String lastname = null;
     String email_taken = null;
     List types = new ArrayList();

        
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
      
        /*Statement stmt = null;
        String query = "INSERT INTO `db_student`(`firstname`, `lastname`, `password`) VALUES ('"+firstname+"','"+lastname+"','"+pass+"')";
        
        stmt = result.createStatement();
        int rs = stmt.executeUpdate(query);
        */
    PreparedStatement pstmt = result.prepareStatement(
   "select * from db_student where email=? and password=?");

pstmt.setString(1, email); // set parameter 1 (FIRST_NAME)
pstmt.setString(2, pass); // set parameter 2 (ID)

ResultSet rows = pstmt.executeQuery(); // "rows" save the affected rows
        while (rows.next()) {
            userid = rows.getString(1);
            firstname = rows.getString(2);
            lastname = rows.getString(3);
            email_taken=rows.getString(4);
        }

        if("".equals(userid)){
        userid="-1";
        firstname="-1";
        lastname="-1";
        }
        
        
    }
    catch ( SQLException ex ) {
               Logger.getLogger(Sign_up_functionality.class.getName()).log(Level.SEVERE, null, ex);
    }  
       
     
       types.add(userid);
       types.add(firstname);
       types.add(lastname);
       types.add(email_taken);
     return(types);
   }
}