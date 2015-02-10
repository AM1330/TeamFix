
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.model;

import static java.lang.Integer.parseInt;
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
    
    
        
              public int DB_project_upload(String id,String name, String date, String max, String interest, String email) throws SQLException, NamingException{


 
        
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

PreparedStatement pstmt2 = result.prepareStatement( "INSERT INTO in_project (`student_id`,`interest`,`project_id`,`email`) VALUES (?,?,?,?)");

pstmt2.setInt(1, id2); // set parameter 1 (FIRST_NAME)
pstmt2.setString(2, interest);
pstmt2.setInt(3, project_id);
pstmt2.setString(4, email);
 int rows2 = pstmt2.executeUpdate(); // "rows" save the affected rows
     




result.close();

        
    

    return(1);
   }        
           
           
              public String DB_project_search(String name, String id) throws SQLException, NamingException{


 
        
        String DATASOURCE_CONTEXT = "java:comp/env/jdbc/teamfix";
        
        Connection result = null;
        Context initialContext = new InitialContext();
DataSource datasource = (DataSource)initialContext.lookup(DATASOURCE_CONTEXT);
            if (datasource != null) {
                result = datasource.getConnection();
            }


    PreparedStatement pstmt = result.prepareStatement("SELECT * FROM project WHERE (name like ?)");

pstmt.setString(1, name+"%");

ResultSet rs =  pstmt.executeQuery(); // "rows" save the affected rows
String ret=null;
ResultSet rs2;

while(rs.next()){
 ret= "<tr><td>"+rs.getInt(1)+"</td> <td style=\"padding-left:20px;\">"+rs.getString(2)+"</td><td style=\"padding-left:20px;\">"+rs.getString(3)+"</td><td style=\"padding-left:20px;\">"+rs.getString(4)+"</td>";

 pstmt = result.prepareStatement("SELECT * FROM in_project WHERE (project_id=?)");

pstmt.setInt(1, rs.getInt(1));

rs2 =  pstmt.executeQuery(); // "rows" save the affected rows
while(rs2.next()){
ret=ret+"<td style=\"padding-left:20px;\">"+rs2.getString(3)+" days</td>";
}

ret=ret+"</tr><br>";
}



result.close();

        
    

    return(ret);
   }               
           
          
              
              
                            public String DB_join_project(String id,String project_id,String interest, String email) throws SQLException, NamingException{


 
        
        String DATASOURCE_CONTEXT = "java:comp/env/jdbc/teamfix";
        String ret=null;
        Connection result = null;
        Context initialContext = new InitialContext();
DataSource datasource = (DataSource)initialContext.lookup(DATASOURCE_CONTEXT);
            if (datasource != null) {
                result = datasource.getConnection();
            }


int id2 = Integer.parseInt(id);
int id3=Integer.parseInt(project_id);
int my_res=0;
int max=0;
int cur_num=0;

    PreparedStatement pstmt1 = result.prepareStatement("SELECT * FROM in_project WHERE (student_id=? and project_id=?)");

pstmt1.setInt(1,id2);
pstmt1.setInt(2,id3);
ResultSet rs =  pstmt1.executeQuery(); // "rows" save the affected rows


if(rs.next()){
 my_res= rs.getInt(1);
}


pstmt1 = result.prepareStatement("SELECT * FROM project WHERE (project_id=?)");


pstmt1.setInt(1,id3);
rs =  pstmt1.executeQuery(); // "rows" save the affected rows


if(rs.next()){
 max= parseInt(rs.getString(4));
}

pstmt1 = result.prepareStatement("SELECT COUNT(*) AS total FROM in_project WHERE (project_id=?)");


pstmt1.setInt(1,id3);
rs =  pstmt1.executeQuery(); // "rows" save the affected rows


if(rs.next()){
 cur_num= rs.getInt("total");
}

if(cur_num>=max){
ret="Sorry, we are full<br><br>";
return(ret);
}

if(my_res!=0){
 ret="You are already registered in this project<br><br>";
}
else{
PreparedStatement pstmt2 = result.prepareStatement( "INSERT INTO in_project (`student_id`,`interest`,`project_id`,`email`) VALUES (?,?,?,?)");

pstmt2.setInt(1, id2); // set parameter 1 (FIRST_NAME)
pstmt2.setString(2, interest);
pstmt2.setInt(3, id3);
pstmt2.setString(4, email);
int rows2 = pstmt2.executeUpdate(); // "rows" save the affected rows
ret="Success!";     
}



result.close();

        
    

    return(ret);
   }      
              
              
              
              
              
              
              
              
           
    
}










