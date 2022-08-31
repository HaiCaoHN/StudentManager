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
        <link href="css/view_all_template.css" rel="stylesheet" type="text/css"/>
        <link href="css/nav_template.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="hero">
            <nav>
                <ul>
                    <li><a href="schedule">Home</a></li>
                    <li><a href="list_group">View Classes</a></li>
                    <li>
                        <c:if test="${sessionScope.account ne null}">
                            <a href="logout">Logout</a>
                        </c:if>
                        <c:if test="${sessionScope.account eq null}">
                            <a href="login">Login</a>
                        </c:if>
                    </li>
                </ul>
            </nav> 
        </div>
        <br/>
        <table>
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
                for (var i = 1; i <= ${group.subject.totalSlot}; i++) {
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
                <td>${group.id}</td>
                <td>${s.code}</td>
                <td>${s.name}</td>
                <td>${s.getAbsent()}/${group.subject.totalSlot}</td>

                <c:if test="${s.attends.size() eq 0}"> 
                    <c:forEach begin="0" end="${group.subject.totalSlot-1}" step="1" var="i">
                        <td>
                            --
                        </td>
                    </c:forEach>
                </c:if>

                <c:if test="${s.attends.size() ne 0}">
                    <c:forEach begin="0" end="${s.attends.size()-1}" step="1" var="i">
                        <td>
                            <c:if test="${!s.attends.get(i).attend}">
                                <img src="img/delete-icon.png" alt=""/>
                            </c:if>

                            <c:if test="${s.attends.get(i).attend}">
                                <img src="img/Check-icon.png" alt=""/>
                            </c:if>
                        </td>
                    </c:forEach>
                    <c:forEach begin="0" end="${group.subject.totalSlot-s.attends.size()-1}" step="1" var="i">
                        <td>
                            --
                        </td>
                    </c:forEach>
                </c:if>

            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
