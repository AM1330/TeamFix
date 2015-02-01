<%@ page import="java.util.*" %>

<html>
<body>
<div class="wrapper">   

  <jsp:include page="header2.html"/>


  
  
  
 
     
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
                id=cookie1.getValue( )+"apo cookie";
                foundCookie = true;
            }
            if (cookie1.getName().equals("firstname")) {
               // out.print("Welcome cookie:"+cookie1.getName()+"<br>");
                //out.print(" " + cookie1.getValue( )+" <br/>");
                firstname=cookie1.getValue( )+"apo cookie";
                foundCookie = true;
            }
             if (cookie1.getName().equals("lastname")) {
               // out.print("Welcome cookie:"+cookie1.getName()+"<br>");
                //out.print(" " + cookie1.getValue( )+" <br/>");
                lastname=cookie1.getValue( )+"apo cookie";
                foundCookie = true;
            }
        }
        
        
        if(id!=null || !("-1".equals(id)) || foundCookie){
            out.print("<br>Welcome, " +firstname );
            out.print("<br>to deutero= " +lastname );
        }
        else{
            out.print("<br>Please sign in");
        }
%>


        </div>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>