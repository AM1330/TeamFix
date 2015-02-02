<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
    <link href="/style.css" rel="stylesheet" type="text/css"/>

    
<title>TeamFix</title>
<body>
 <div class="wrapper">   
 <%@ include file="header.html" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
     
    <div class="content">
        <div id="login">
        <form method="POST" action="log_in.do">
            <center><b>Sign in</b><br><br>
                <input type="text" placeholder="example@example.com" name="email"><br><br>
                <input type="password" placeholder="password" name="password"><br><br>
            <input type="submit" value="OK" id="but">
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

            <pre><b>
<h3>What is TeamFix?</h3>
                TeamFix is a web application where students can find partners<br>
                in order to make school or university projects. The problem that<br> 
                makes teamFix necessary is that students tend to form teams with<br>
                main and only criterion their friendships and then they fail.<br>
                </b>
            </pre>
<br><br><br><br>
<h3>How to use it?</h3>
            <pre>
<b>
                1)You have to sign up providing us some information.<br>
                2)You have to sign in.<br>
                3)You can start putting on your profile some courses and grades.<br>
                4)You can create a projects.<br>
                5)You can search a project to participate in.<br>
</b>
            </pre>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>
