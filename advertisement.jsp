<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : advertisement
    Created on : Nov 22, 2020, 4:07:32 PM
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

<sql:setDataSource var="hardware" 
                   driver="org.apache.derby.jdbc.ClientDriver" 
                   url="jdbc:derby://localhost:1527/project" 
                   user="adminadmin" 
                   password="adminadmin" 
                   scope="application" />



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online advertisement</title>
    </head>
    <body>
        <h1>Advertisements</h1>
        <form action="addAdvertisement.jsp" method="post">
            <%!
                String[] hardware = {"motherboard", "GPU", "CPU", "PSU", "RAM", "SSD", "HDD"};
                String[] RGB = {"yes", "no"};
                String[] manufactuer = {"AMD", "INTEL", "NVIDIA", "MSI", "ACER", "ASUS", "GIGABYTE"};
                String[] age = {"<1", "1-2", "2-3", "3+"};
            %>

            <table width="75%" align="center">
                <tr>
                    <td> manufacturer <select name='manufacturer'>
                            <%
                                for (int i = 0; i < manufactuer.length; i++) {
                                    out.println("<option>" + manufactuer[i] + "</option>");
                                }
                            %>        
                        </select>
                    </td>
                    <td><input type=submit name="postAdvertisement" value="Post Advertisement!"> </td>
                </tr>

                <tr>
                    <td> hardware <select name='hardware'>
                            <%
                                for (int i = 0; i < hardware.length; i++) {
                                    out.println("<option>" + hardware[i] + "</option>");
                                }
                            %>        
                        </select>
                    </td>
                    <td><input type=submit name="updateAdvertisement" value="Update Advertisement!"> </td>
                    <td> Hardware ID <input type=number name="updateHardwareID" value=""> </td>
                    <td> You can only modify your advertisements! </td>
                </tr>

                <tr>
                    <td> age <select name='age'>
                            <%
                                for (int i = 0; i < age.length; i++) {
                                    out.println("<option>" + age[i] + "</option>");
                                }
                            %>
                        </select>
                    </td>
                    <td><input type=submit name="deleteAdvertisement" value="Delete Advertisement!"> </td>
                    <td> Hardware ID <input type=number name="deleteHardwareID" value=""> </td>
                    <td> You can only modify your advertisements! </td>
                </tr>

                <tr>
                    <td> RGB <select name='rgb'>
                            <%
                                for (int i = 0; i < RGB.length; i++) {
                                    out.println("<option>" + RGB[i] + "</option>");
                                }
                            %>    
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td>Price: <input type=number name=price value="100"></td>


            </table>
            <br>
            <br>
            <br>
            <button name="goBack" value="goBack">Go Back</button>           
        </form>

        <sql:query dataSource = "${hardware}" var = "result">
            SELECT * from hardware
        </sql:query>               

        <h1>Retrieve data from database in jsp</h1>
        <table border="1" width = "50%">
            <tr>
                <td>Hardware ID</td>
                <td>Manufacturer</td>
                <td>Hardware</td>
                <td>Age</td>
                <td>RGB</td>
                <td>Price</td>

            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td><c:out value = "${row.hardware_id}"/></td>
                    <td><c:out value = "${row.manufacturer}"/></td>
                    <td><c:out value = "${row.hardware}"/></td>
                    <td><c:out value = "${row.rgb}"/></td>
                    <td><c:out value = "${row.age}"/></td>
                    <td><c:out value = "${row.price}"/></td>
                </tr>
            </c:forEach>

        </table>                

<c:if test="${!empty param.errorMsg}">
        <hr>
        ${param.errorMsg}
    </c:if>
    </body>
</html>
