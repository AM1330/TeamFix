package com.example.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class log_in_functionality{
   public List getStudent(String email,String pass) {

       
     String userid = null;
     String firstname = null;
     String lastname = null;
     String email_taken = null;
     List types = new ArrayList();
     Connection result;
     ConnectionManager cm= new ConnectionManager();
     
    try  {      
        
result=ConnectionManager.getConnection();
      

    PreparedStatement pstmt = result.prepareStatement(
   "select * from db_student where email=? and AES_DECRYPT(password, 'usetheforce')=?");

pstmt.setString(1, email); // set parameter 1 (FIRST_NAME)
pstmt.setString(2, pass); // set parameter 2 (ID)

ResultSet rows = pstmt.executeQuery(); // "rows" save the affected rows
        while (rows.next()) {
            userid = rows.getString(1);
            firstname = rows.getString(2);
            lastname = rows.getString(3);
            email_taken=rows.getString(4);
        }

        if("".equals(userid) || userid==null){
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