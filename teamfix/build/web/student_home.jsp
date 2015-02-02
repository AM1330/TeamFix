<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<html>
    

<body>

<div class="wrapper">   
 
  <jsp:include page="header2.html"/>
  <link href="style.css" rel="stylesheet" type="text/css"/>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

  
  
  
 
     
    <div class="content">
        <div id="main_content">
       <% 
        
           //(List) request.getAttribute("styles");
           String id =null; //(String) request.getAttribute("id_student");
           String firstname =null; //(String) request.getAttribute("firstname");
           String lastname = null; //(String) request.getAttribute("lastname");
           String email = null;
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
             if (cookie1.getName().equals("email")) {
               // out.print("Welcome cookie:"+cookie1.getName()+"<br>");
                //out.print(" " + cookie1.getValue( )+" <br/>");
                email=cookie1.getValue( );
                foundCookie = true;
            }
        }
        
        request.setAttribute("foundCookie", foundCookie);
        request.setAttribute("id", id);
        if(foundCookie){
            out.print("Welcome, " + firstname );
        }
        else{
            response.sendRedirect(response.encodeRedirectURL("temp_page?action=result"));
        }
%>



<c:if test='${foundCookie==true}'>
    <br><br>
    
        <div style="background-color: #F7F8F7; width:220px; height:200px; overflow-y: scroll; overflow-x: hidden; display: inline-block; ">
        <sql:setDataSource var="ds" dataSource="jdbc/teamfix" />
    <sql:query dataSource="${ds}" sql="select * from db_courses" var="results" />
        <table>
            <th>Courses</th><th>Grades</th>
        <c:forEach var="res" items="${results.rows}" varStatus="row">
            <c:set scope="page" var="courseName" value="${res.name}"></c:set>
            <c:set scope="page" var="courseGrade" value="${res.grade}"></c:set><tr>
            <div style=" width:200px; display:inline;"><td>${courseName}</td> <td>${courseGrade}</td></div></tr>
        </c:forEach>
        </table>
    </div>
        
                <form method="post" action="cupload.do" id="new_project">
        New project<br>
        <input type="hidden" name="action" value="project_upload">
        <input type="hidden" name="student_id" value="${id}">
        <input type="text" name="project_name" placeholder="Enter project name" size="16" required><br>
        <input type="date" name="exp_date" placeholder="Enter expiration date" required ><br>
        <input type="number" placeholder="Max members number" name="maxmembers"  maxlength="3" size="16" required><br>
        <input type="number" placeholder="I'll work for ... days" name="interest"  maxlength="3" size="16" required><br><br>
        <input type="submit" value="OK">
            </form>

    <form method="post" action="cupload.do" id="new_project">
        New course<br>
        <input type="hidden" name="action" value="course_upload">
        <input type="hidden" name="student_id" value="${id}">
        <input type="text" name="course_name" placeholder="Enter course name" size="16" required><br>
        <input type="number" placeholder="Grade" name="grade" size="16" maxlength="3" required><br><br><br>
        <input type="submit" value="OK">
    </form>
        

    

   <% /*</form>
    
    <br><br>
        <sql:setDataSource var="ds" dataSource="jdbc/teamfix" />
    <sql:query dataSource="${ds}" sql="select * from db_courses" var="results" /><!--Vriskw ola ta ma8hmata ths vashs dedomenwn gia na epileksei o foithths poia exei perasei -->
    
    <c:set scope="page" var="colorStyleVar" value="true"></c:set><!--Metavlhth gia na allazei xrwma h emfanish twn ma8hmatwn -->
    
   <!-- <div id="student_home_courses" > -->
        <form method="post" action="cupload.do" id="student_home_courses">
            
            <input type="hidden" name="action" value="passed_courses_upload">
            Tell us your passed exams...<br><br>
        <c:forEach var="res" items="${results.rows}" varStatus="row"> <!-- the results is from sql var="results", varStatus gives you a lot of info about what is happening in the loop -->
    <!-- with var="image" we can gain access to every image attribute we have in the database  -->
    
            <c:set scope="page" var="courseName" value="${res.name}"></c:set>
            <c:set scope="page" var="courseId" value="${res.courses_id}"></c:set>
            <!-- set a variable name imgname a value of an image name and .extension of the pics folder we got from the query in the database -->

            <c:if test="${colorStyleVar}">   
            <div style="background-color: #F7F8F7; width:200px; display:inline;" >${courseName}<br><input type="text" placeholder="Grade" name="grade" size="3" maxlength="3"><br><br></div> 
            </c:if>
            <c:if test="${!colorStyleVar}">    
            <div style="width:200px;" >${courseName}<br><input type="text" placeholder="Grade" name="Grade" size="3" maxlength="3"><br><br></div> 
            </c:if>
                
        <c:set scope="page" var="colorStyleVar" value="${!colorStyleVar}"></c:set>
        </c:forEach>
            <input type="submit" value="OK">
                
        </form>
<!--    </div> -->
*/%>
  
</c:if>
    
    
        </div>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>