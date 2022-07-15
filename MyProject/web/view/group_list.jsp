<%-- 
    Document   : session_list
    Created on : Jul 14, 2022, 10:19:30 PM
    Author     : HAICAO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav>
            <a href="schedule">Home</a>
            <a href="list_group">View Classes</a>
            <c:if test="${sessionScope.account ne null}">
                <a href="logout">Logout</a>
            </c:if>
            <c:if test="${sessionScope.account eq null}">
                <a href="login">Login</a>
            </c:if>
        </nav>
        
        <table border="1">
            <tr>
                <td>No</td>
                <td>Group</td>
                <td>Lecture</td>
                <td>Subject</td>
                <td>View Attendance</td>
            </tr>
            
            <c:forEach items="${requestScope.groups}" var="g">
                <tr>
                    <td>${groups.indexOf(g)+1}</td>
                    <td>${g.id}</td>
                    <td>${g.lecture}</td>
                    <td>${g.subject}</td>
                    <td> <a href="view_all?gid=${g.id}">View</a> </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
