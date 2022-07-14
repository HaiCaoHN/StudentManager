<%-- 
    Document   : view_attendance
    Created on : Jul 14, 2022, 6:36:48 PM
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
            <c:if test="${sessionScope.account ne null}">
                <a href="logout">Logout</a>
            </c:if>
            <c:if test="${sessionScope.account eq null}">
                <a href="login">Login</a>
            </c:if>    
        </nav>
        <table border="1">
            <thead>
                <tr id="head">
                    <td>No</td>
                    <td>Group</td>
                    <td>Code</td>
                    <td>Name</td>
                    <td>Absent</td>
            <script>
                var content = document.getElementById("head");
                var html = "";
                for (var i = 1; i <= 15; i++) {
                    html += "<td>Slot " + i + " </td>";
                }
                content.innerHTML += html;
            </script>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${sessionScope.enrolls}" var="e">
            <tr>
                <td>${enrolls.indexOf(e)}</td>
                <td>${e.group.id}</td>
                <td>${e.student.code}</td>
                <td>${e.student.name}</td>
                <td>${e.student.getAbsent()}/15</td>
            </tr>

        </c:forEach>
    </tbody>
</table>
</body>
</html>
