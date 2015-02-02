<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<html>
<body>
<div class="wrapper">   

  <jsp:include page="header.html"/>


  
  
  
 
     
    <div class="content">
        <div id="main_content">
       <% 
        
           List styles = (List) request.getAttribute("styles");
           String id = (String) request.getAttribute("id_student");
           String firstname = (String) request.getAttribute("firstname");
           String lastname = (String) request.getAttribute("lastname");
        Cookie[] cookies = request.getCookies();
        boolean foundCookie = false;

        for(int i = 0; i < cookies.length; i++) { /*when we are logging in again without pass we are reading our name from cookies*/
            Cookie cookie1 = cookies[i];
            if (cookie1.getName().equals("id_student")) {
               // out.print("Welcome cookie:"+cookie1.getName()+"<br>");
                //out.print("Welcome, " + cookie1.getValue( )+" <br/>");
                id=cookie1.getValue( );
                foundCookie = true;
            }
            if (cookie1.getName().equals("firstname")) {
               // out.print("Welcome cookie:"+cookie1.getName()+"<br>");
                //out.print(" " + cookie1.getValue( )+" <br/>");
                firstname=cookie1.getValue( );
                foundCookie = true;
            }
             if (cookie1.getName().equals("lastname")) {
               // out.print("Welcome cookie:"+cookie1.getName()+"<br>");
                //out.print(" " + cookie1.getValue( )+" <br/>");
                lastname=cookie1.getValue( );
                foundCookie = true;
            }
        }
        
        
        if((!("-1".equals(id)) || foundCookie) && firstname!=null){
            response.sendRedirect(response.encodeRedirectURL("temp_page?action=student_home"));
                

        }
        else{
            out.print("<br>Please sign in (invalid e-mail or password)");
            
            out.print("<form method='POST' action='log_in.do'>");
            
            out.print("<center><b>Sign in</b><br><br>");
            out.print("<input type='text' placeholder='example@example.com' name='email'><br><br>");
            out.print("<input type='text' placeholder='password' name='password'><br><br>");
            out.print("<input type='submit' value='OK'>");
            out.print("</center>"); 
            out.print("</form>");
        }
%>


        </div>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>