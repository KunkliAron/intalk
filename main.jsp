<%-- 
    Document   : main
    Created on : Nov 22, 2020, 2:33:38 PM
    Author     : aronk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="check.jsp" method="post">
            <table>
                <tr>
                    <td>Email </td> 
                    <td> <input name="userEmail" value="" size="20" pattern=".{1,}@.{1,}" required="required" title="Example: aaaa@aaa.aaa"> </td>
                </tr>
                <tr>
                    <td>Password </td> 
                    <td> <input type="password" name="password" value="" size="20" pattern=".{6,}" required="required" title="Atleast 6 characters"> </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="action" value="Registration"> 
                        <input type="submit" name="action" value="Login"> </td>
                </tr>
            </table>
            <br>
            <br>
            <p>Admin user:</p>
            Email: aaa@gmail.com 
            <br>
            Password: asdasd123 
            <br>
            <br>
            <c:if test="${!empty param.errorMsg}">
                <hr>
                ${param.errorMsg}
            </c:if>
        </form>
    </body>
</html>
