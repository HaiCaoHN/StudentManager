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
        <link href="css/viewTemplate.css" rel="stylesheet" type="text/css"/>
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

        <div class="table-users">
            <div class="header">List classes of lecture ${sessionScope.lecture.id} </div>
            <table cellspacing="0">
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
        </div>


    </body>
</html>
