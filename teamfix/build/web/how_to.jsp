<html>
    <link href="style.css" rel="stylesheet" type="text/css"/>
<title>TeamFix</title>
<body>
 <div class="wrapper">   
 <%@ include file="header.html" %>
     
    <div class="content">
        
        <div id="main_content">
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
          <div id="login">
        <form method="POST" action="log_in.do">
            <center><b>Sign in</b><br><br>
                <input type="text" placeholder="example@example.com" name="email"><br><br>
                <input type="password" placeholder="password" name="password"><br><br>
            <input type="submit" value="OK" id="but">
            </center>
        </form>
        </div>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>
