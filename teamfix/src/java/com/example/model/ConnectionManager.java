/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author user
 */
public class ConnectionManager {
    
    static Connection con;
    static String url;
    
     public static Connection getConnection(){
         try{
             url = "jdbc:mysql://localhost:3306/teamfix"; 
             Class.forName("com.mysql.jdbc.Driver");
             
              try{
                con = DriverManager.getConnection(url,"root2","alexsyna19921924"); 
              }
              catch (SQLException ex){
              }            
         }
         
         catch(ClassNotFoundException e){
             System.out.println(e);
         }
         return con;
     }
     
    
}
