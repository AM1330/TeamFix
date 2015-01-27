<html>
    <link href="style.css" rel="stylesheet" type="text/css"/>
<title>TeamFix</title>
<body>
 <div class="wrapper">   
 <%@ include file="header.html" %>
 
    
     
    <div class="content">
        <div id="login">
        <form method="POST" action="log_in.do">
            <center><b>Academic log in</b><br><br>
                <input type="text" placeholder="username" name="username"><br><br>
                <input type="password" placeholder="password" name="password"><br><br>
            <input type="submit" value="OK">
            </center>
        </form>
        </div>
        
            <%        Cookie[] cookies = request.getCookies();
        boolean foundCookie = false;
if(cookies!=null){
        for(int i = 0; i < cookies.length; i++) { 
            Cookie cookie1 = cookies[i];
            if (cookie1.getName().equals("log")) {
                out.print("JUST TESTING");
                out.print("Value: " + cookie1.getValue( )+" <br/>");
                foundCookie = true;
                 String site = new String("result.jsp");
                   response.setStatus(response.SC_MOVED_TEMPORARILY);
                   response.setHeader("Location", site); 
            }
        } 
        
}%>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>
