<%-- 
    Document   : view_sessison_attendance
    Created on : Jul 14, 2022, 8:47:26 PM
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
        <link href="css/button_template.css" rel="stylesheet" type="text/css"/>
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

        <form action="view" method="POST">
            <div class="table-users">
                <div class="header">Attendance for ${session.group.id} with lecture ${session.taker.id} at slot ${session.slot.slot} on ${session.date}</div>
                <table cellspacing="0">
                    <tr>
                        <td>No</td>
                        <td>Group</td>
                        <td>Code</td>
                        <td>Name</td>
                        <td>Status</td>
                        <td>Comment</td>
                        <td>Taker</td>
                    </tr>


                    <c:forEach items="${requestScope.enrolls}" var="e">
                        <tr>
                            <td>${enrolls.indexOf(e)+1}</td>
                            <td>${e.group.id}</td>
                            <td>${e.student.code}</td>
                            <td>${e.student.name}</td>
                            <td>
                                <c:if test="${!e.student.isAttend(session)}">
                                    <img src="img/delete-icon.png" alt=""/>
                                </c:if>

                                <c:if test="${e.student.isAttend(session)}">
                                    <img src="img/Check-icon.png" alt=""/>
                                </c:if>
                            </td>
                            <td>${e.student.getComment(session)}</td>
                            <td>${e.group.lecture}</td>
                        </tr>
                    </c:forEach>

                </table> 
            </div>
            <br>
            <button type="submit" class="button-1" role="button">Edit</button>
        </form>
    </body>
</html>
