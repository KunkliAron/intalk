<%-- 
    Document   : navigation
    Created on : Nov 22, 2020, 2:54:54 PM
    Author     : aronk
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<sql:setDataSource var="users" 
                   driver="org.apache.derby.jdbc.ClientDriver" 
                   url="jdbc:derby://localhost:1527/project" 
                   user="adminadmin" 
                   password="adminadmin" 
                   scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>

    <body>
        <h1>Choose where to go</h1>
        <a href="http://localhost:8080/project/quotes.jsp">Star Wars Quotes</a>
        <br>
        <a href="http://localhost:8080/project/advertisement.jsp">Post Advertisement</a>
        <br>
        <% if ((session.getAttribute("userEmail").equals("aaa@gmail.com"))) {%>
        <a href="http://localhost:8080/project/deleteUser.jsp">Users</a>
        <% }%>
        <br><br>
        <button onclick="location.href = 'http://localhost:8080/project/main.jsp';" id="myButton" class="float-left submit-button" >Logout</button>
        <br>
        
        <c:if test="${!empty param.registrationMsg}">
            <hr>
            ${param.registrationMsg}
        </c:if>  
        
    </body>
</html>
