<%@ page import="java.util.*" %>

<html>
<body>
<div class="wrapper">   

  <jsp:include page="header2.html"/>


  
  
  
 
     
    <div class="content">
        <div id="main_content">
       <% 
        
           List styles = (List) request.getAttribute("styles");

    if(styles!=null){/*When we are logging in for the forst time we read attibutes*/
        out.print("<br>Welcome, "+styles.get(0));
    }  
           
        Cookie[] cookies = request.getCookies();
        boolean foundCookie = false;

        for(int i = 0; i < cookies.length; i++) { /*when we are logging in again without pass we are reading our name from cookies*/
            Cookie cookie1 = cookies[i];
            if (cookie1.getName().equals("log")) {
                out.print("Welcome cookie:"+cookie1.getName()+"<br>");
                out.print("Your value: " + cookie1.getValue( )+" <br/>");
                foundCookie = true;
            }
        }  
           
           
           
           
%>
        </div>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>