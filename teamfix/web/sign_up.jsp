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
            <center><b>log in</b><br><br>
                <input type="text" placeholder="username" name="username"><br><br>
                <input type="password" placeholder="password" name="password"><br><br>
            <input type="submit" value="OK">
            </center>
        </form>
        </div>
        
    <c:choose> 
        <c:when test='${param.action=="sign_up"}'>
            You signed up succesfully. Now feel free to browse projects<br>
            <%
        out.print("<br>Personal information:<br> "+request.getAttribute("styles"));
            %>
        </c:when>
        <c:otherwise>
            <form action='<c:url value="/sign_up.do" />' method="post">
                <b>Sign up</b><br>
                <input type="hidden" name="action" value="sign_up" /><br>
                Enter your firstname<br> <input type="text" name="firstname" placeholder="Firstname" required/><br><br>
                Enter your lastname<br> <input type="text" name="lastname" placeholder="Lastname" required/><br><br>
                Enter your email<br> <input type="text" name="email" placeholder="example@example.com" pattern="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" required/><br><br>
                Enter your password<br> <input type="password" name="password" placeholder="Password" required/><br>
              <input type="submit" value="OK"/>
            </form>
            
        </c:otherwise>
    </c:choose>
            
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>
