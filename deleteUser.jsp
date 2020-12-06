<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page session="true" %>
<%-- 
    Document   : deleteUser
    Created on : Nov 30, 2020, 1:23:19 PM
    Author     : aronk
--%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${!empty(param.userEmail) && param.userEmail ne 'aaa@gmail.com' }">
                <sql:query var="exists" dataSource="${users}">
                    SELECT * FROM users WHERE USEREMAIL = '${param.userEmail}'
                </sql:query>
                <c:if test="${exists.rowCount ne 0}">
                    <sql:update var="delete" dataSource="${users}">
                        DELETE FROM users 
                        WHERE USEREMAIL = '${param.userEmail}'
                    </sql:update>
                    <jsp:forward page="users.jsp">
                        <jsp:param name="deleteMsg" value="${param.userEmail} was deleted" />
                    </jsp:forward>
                </c:if>
            </c:when>
            <c:otherwise>
                <c:if test="${param.goBack eq 'goBack'}">
                    <% response.sendRedirect("http://localhost:8080/project/navigation.jsp");%>   
                </c:if>
                <c:if test="${param.goBack ne 'goBack'}">
                    <jsp:forward page="users.jsp">
                        <jsp:param name="deleteMsg" value="No user were selected / aaa@gmail.com can't be deleted" />
                    </jsp:forward>
                </c:if>
            </c:otherwise>
        </c:choose>

    </body>
</html>
