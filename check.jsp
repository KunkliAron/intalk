<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page session="true" %>
<%-- 
    Document   : check
    Created on : Nov 22, 2020, 2:36:03 PM
    Author     : aronk
--%>

<sql:setDataSource var="users" 
                   driver="org.apache.derby.jdbc.ClientDriver" 
                   url="jdbc:derby://localhost:1527/project" 
                   user="adminadmin" 
                   password="adminadmin" 
                   scope="application" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

        <c:choose>
            <c:when test="${(empty param.password) || (empty param.userEmail)}">
                <jsp:forward page="main.jsp">
                    <jsp:param name="errorMsg" value="Email and password can't be blank" />
                </jsp:forward>
            </c:when>
            <c:otherwise>
                <sql:query var="result" dataSource="${users}">
                    SELECT * FROM users where useremail='${param.userEmail}' and password='${param.password}'
                </sql:query>
                <sql:query var="exists" dataSource="${users}">
                    SELECT * FROM users where useremail='${param.userEmail}'
                </sql:query>
                <c:choose>
                    <c:when test="${param.action.equals('Registration')}">
                        <c:if test="${exists.rowCount ne 0}">
                            <jsp:forward page="main.jsp">
                                <jsp:param name="errorMsg" value="This email has been already used by another user" />
                            </jsp:forward>
                        </c:if>
                        <c:if test="${exists.rowCount == 0}">
                            <sql:update var="register" dataSource="${users}">
                                INSERT INTO users (userEmail, password)
                                VALUES ('${param.userEmail}','${param.password}')
                            </sql:update>
                                <% session.setAttribute("userEmail", request.getParameter("userEmail")); %>
                            <jsp:forward page="navigation.jsp">
                                <jsp:param name="registrationMsg" value="Registration succesful" />
                            </jsp:forward>    
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${param.action.equals('Login') && result.rowCount ne 0}">
                                <% session.setAttribute("userEmail", request.getParameter("userEmail")); %>
                                <% response.sendRedirect("http://localhost:8080/project/navigation.jsp");%>
                            </c:when>
                            <c:when test="${param.action.equals('Login') && result.rowCount == 0}">
                                <jsp:forward page="main.jsp">
                                    <jsp:param name="errorMsg" value="Wrong email or password" />
                                </jsp:forward>
                            </c:when>
                            <c:when test="${param.action.equals('Login') && exist.rowCount ne 0}">
                                <jsp:forward page="main.jsp">
                                    <jsp:param name="errorMsg" value="User not found" />
                                </jsp:forward>
                            </c:when>
                            <c:otherwise>
                                <jsp:forward page="main.jsp">
                                    <jsp:param name="errorMsg" value="User not found" />
                                </jsp:forward>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </body>
</html>