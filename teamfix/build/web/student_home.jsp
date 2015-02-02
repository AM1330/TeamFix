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
        request.setAttribute("email", email);
        if(foundCookie){
            out.print("Welcome, <b>" + firstname+"</b>" );
        }
        else{
            response.sendRedirect(response.encodeRedirectURL("temp_page?action=result"));
        }
%>



<c:if test='${foundCookie==true}'>
    <br><br>
    
    
    
    
    
    
    <c:choose> 
        <c:when test='${search_res_bin==true}'>
            <div style="background-color: #F7F8F7; width:220px; height:200px; overflow-y: scroll; overflow-x: hidden; display: inline-block; margin-left: auto; margin-right:auto;">   <table><th>ID</th> <th>Project</th>${search_res}</table></div>
            
         <form method="post" action="cupload.do" id="new_project">
        Join a project<br>
        <input type="hidden" name="action" value="join_project">
        <input type="hidden" name="student_id" value="${id}">
        <input type="text" name="project_id" placeholder="Enter project's ID" size="16" required><br>
        <input type="hidden" name="student_email" value="${email}">
        <input type="number" name="interest" placeholder="I'll work for # days" size="16" maxlength="3" required><br><br>
        <input type="submit" value="OK" id="but">
            </form>
        </c:when>
        <c:otherwise>

            
               <form method="post" action="cupload.do" id="new_project" style="float:right; top:0px;">
        <input type="hidden" name="action" value="project_search">
        <input type="hidden" name="student_id" value="${id}">
        <input type="text" name="project_name" placeholder="Search project by name" size="16" required>        <input type="submit" id="search_button" value=" ">
                        <c:if test='${join_res_bin==true}'>
                        ${join_res}
                        </c:if>
    </form>

        <div style="background-color: #F7F8F7; width:220px; height:200px; overflow-y: scroll; overflow-x: hidden; display: inline-block; ">
        <sql:setDataSource var="ds" dataSource="jdbc/teamfix" />
    <sql:query dataSource="${ds}" sql="select * from db_courses where student_id=${id}" var="results" />
        <table>
            <th>My courses</th><th>Grades</th>
        <c:forEach var="res" items="${results.rows}" varStatus="row">
            <c:set scope="page" var="courseName" value="${res.name}"></c:set>
            <c:set scope="page" var="courseGrade" value="${res.grade}"></c:set><tr>
            <div style=" width:200px; display:inline;"><td>${courseName}</td> <td>${courseGrade}</td></div></tr>
        </c:forEach>
        </table>
    </div>
        
                        <div style="background-color: #F7F8F7; width:320px; height:200px; overflow-y: scroll; overflow-x: hidden; display: inline-block; margin-left:50px; ">
        <sql:setDataSource var="ds" dataSource="jdbc/teamfix" />
    <sql:query dataSource="${ds}" sql="select * from in_project where student_id=${id}" var="results" />
        <table>
            <th>My projects</th><th>Owner Email</th>
        <c:forEach var="res" items="${results.rows}" varStatus="row">
            <c:set scope="page" var="courseName" value="${res.project_id}"></c:set>
            <c:set scope="page" var="courseGrade" value="${res.email}"></c:set><tr>
            <div style=" width:200px; display:inline;"><td>${courseName}</td> <td>${courseGrade}</td></div></tr>
        </c:forEach>
        </table>
    </div>
        
        
                <form method="post" action="cupload.do" id="new_project">
        New project<br>
        <input type="hidden" name="action" value="project_upload">
        <input type="hidden" name="student_id" value="${id}">
                <input type="hidden" name="student_email" value="${email}">
        <input type="text" name="project_name" placeholder="Enter project name" size="16" required><br>
        <input type="date" name="exp_date" placeholder="Enter expiration date" required ><br>
        <input type="number" placeholder="Max members number" name="maxmembers"  maxlength="3" size="16" required><br>
        <input type="number" placeholder="I'll work for # days" name="interest"  maxlength="3" size="16" required><br><br>
        <input type="submit" value="OK" id="but">
            </form>

    <form method="post" action="cupload.do" id="new_project">
        New course<br>
        <input type="hidden" name="action" value="course_upload">
        <input type="hidden" name="student_id" value="${id}">
        <input type="text" name="course_name" placeholder="Enter course name" size="16" required><br>
        <input type="number" placeholder="Grade" name="grade" size="16" maxlength="3" required><br><br><br>
        <input type="submit" value="OK" id="but">
    </form>
        


        
            
        </c:otherwise>
    </c:choose>
    
    
    
    
    
    
    
    
         
        
  
</c:if>
    
    
        </div>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>