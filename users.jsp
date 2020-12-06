<%-- 
    Document   : users
    Created on : Nov 30, 2020, 12:42:40 PM
    Author     : aronk
--%>
<%@ page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <title>Users</title>
    </head>
    <body>
        <h1>Only the admin can see this site</h1>

        <sql:query dataSource = "${users}" var = "result">
            SELECT * from users
        </sql:query>               

        <form action="deleteUser.jsp" method="post">
            <table border="1" width = "50%">
                <tr>
                    <td>Useremail</td>
                    <td>Password</td>

                </tr>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.useremail}"/></td>
                        <td><c:out value = "${row.password}"/></td>


                    </tr>
                </c:forEach>

            </table>

            
            <input type="submit" name="deleteUser" value="Delete">
            <select name='userEmail'>
                <c:forEach var = "row" items = "${result.rows}">
                    <option>${row.useremail}</option>
                </c:forEach>
            </select>
            this useremail
            <br>
            <br>
            <button name="goBack" value="goBack">Go to Navigation</button>
        </form>

        <c:if test="${!empty param.deleteMsg}">
            <hr>
            ${param.deleteMsg}
        </c:if>

    </body>
</html>
