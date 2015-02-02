<html>
    <link href="style.css" rel="stylesheet" type="text/css"/>
<title>TeamFix</title>
<body>
 <div class="wrapper">   
 <%@ include file="header.html" %>
     
    <div class="content">
        <div id="main_content">
            <pre><b>
                        TeamFix is a web application where students can find partners<br>
                         in order to make school or university projects. The problem that<br> 
                        makes teamFix necessary is that students tend to form teams with<br>
                        main and only criterion their friendships and then they fail.<br>
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
