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
            <center><b>Sign in in</b><br><br>
                <input type="text" placeholder="example@example.com" name="email"><br><br>
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

<%
//<sql:setDataSource var="ds" dataSource="jdbc/teamfix" />
//<!-- this is from context.xml and web.xml in Configurations files, we take the code from here: http://tomcat.apache.org/tomcat-7.0-doc/jndi-datasource-examples-howto.html -->

//<sql:query dataSource="${ds}" sql="select * from db_student" var="results" />
%>
<%
//<sql:update dataSource="${ds}" sql="INSERT INTO `db_student`(`firstname`, `lastname`, `password`) VALUES (?,?,?)">
  //  <sql:param>ath</sql:param>
    //    <sql:param>kar</sql:param>
      //      <sql:param>redsdfsdf.jpg</sql:param>
//</sql:update>
%>

<% /*
<c:forEach var="image" items="${results.rows}" varStatus="row"> <!-- the results is from sql var="results", varStatus gives you a lot of info about what is happening in the loop -->
<!-- with var="image" we can gain access to every image attribute we have in the database  -->


	<c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>
        <!-- set a variable name imgname a value of an image name and .extension of the pics folder we got from the query in the database -->
        

		<a href="<c:url value="/gallery?action=image&image=${image.id}" />"><!-- if user clicks on the image go to gallery (Controller) with action=image -->
                        ${image.student_id} kai ${image.firstname}
		</a>

	


</c:forEach>
*/ %>

    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>
