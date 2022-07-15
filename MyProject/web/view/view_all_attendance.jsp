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
        <c:forEach items="${students}" var="s">
            <tr>
                <td>${students.indexOf(s)+1}</td>
                <td>${gid}</td>
                <td>${s.code}</td>
                <td>${s.name}</td>
                <td>${s.getAbsent()}/15</td>
                
                <c:if test="${s.attends.size() eq 0}"> 
                    <c:forEach begin="0" end="14" step="1" var="i">
                        <td>
                            not yet
                        </td>
                    </c:forEach>
                </c:if>
                        
                <c:if test="${s.attends.size() ne 0}">
                    <c:forEach begin="0" end="${s.attends.size()-1}" step="1" var="i">
                        <td>
                            ${s.attends.get(i).attend ? "present":"absent"}
                        </td>
                    </c:forEach>
                    <c:forEach begin="0" end="${15-s.attends.size()-1}" step="1" var="i">
                        <td>
                            not yet
                        </td>
                    </c:forEach>
                </c:if>

            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
