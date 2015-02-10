<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<body>
<div class="wrapper">   

  <jsp:include page="header.html"/>


  
  
  
 
     
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
        
        <div id="main_content">
        <%      boolean from =  (boolean) request.getAttribute("from_search");// pairnw to attribute apo ton controller
                request.setAttribute("from", from);                 //8etw to attribute from gia thn expression language pou xrhsimopoiw parakatw
                String searched_name =  (String) request.getAttribute("searched_name");
                request.setAttribute("name", searched_name);
%>


                            <c:if test='${from==true}'>
                            <br>
                        

        <sql:setDataSource var="ds" dataSource="jdbc/teamfix" />
    <sql:query dataSource="${ds}" sql="select * from project where(name like ?)" var="results">
                    <sql:param value="%${name}%" />
    </sql:query>

        <table>
            <th>ID </th><th style="padding-left:20px;"> Project Name </th><th style="padding-left:20px;"> Expiration </th><th style="padding-left:20px;"> Members(max)</th>
        <c:forEach var="res" items="${results.rows}" varStatus="row">
            <c:set scope="page" var="projectID" value="${res.project_id}"></c:set>
            <c:set scope="page" var="projectName" value="${res.name}"></c:set>
            <c:set scope="page" var="exp" value="${res.expiration}"></c:set>
            <c:set scope="page" var="max" value="${res.max_members}"></c:set>
    
            <tr>
            <div style=" width:200px; display:inline;"><td style="text-align:center;">${projectID} </td> <td style="text-align:center; padding-left:20px;"> ${projectName} </td> <td style="text-align:center; padding-left:20px;"> ${exp} </td><td style="text-align:center; padding-left:20px;"> ${max} </td></div></tr>
        </c:forEach>
        </table>

                            
                            
                            
                            
                        </c:if>    


        </div>
    </div>
 
 <%@ include file="footer.html" %>
 
 </div>
</body>
</html>