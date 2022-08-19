<%-- 
    Document   : attendance
    Created on : Jun 30, 2022, 9:27:45 PM
    Author     : HAICAO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Page</title>
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
            <div class="header">Take attendance for ${session.group.id} at slot ${session.slot.slot} on ${session.date}</div>
        </div>
        <form action="attend" method="POST">
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


                <c:forEach items="${sessionScope.enrolls}" var="e">
                    <tr>
                        <td>${enrolls.indexOf(e)+1}</td>
                        <td>${e.group.id}</td>
                        <td>${e.student.code}</td>
                        <td>${e.student.name}</td>
                        <td>
                            <input type="radio" value="false" 
                                   <c:if test="${!e.student.isAttend(session)}">
                                       checked ="checked"
                                   </c:if>
                                   name="check_${e.student.id}">absent

                            <input type="radio" value="true" 
                                   <c:if test="${e.student.isAttend(session)}">
                                       checked="checked"
                                   </c:if>
                                   name="check_${e.student.id}">present

                        </td>
                        <td><input type="text" name="comment_${e.student.id}"></td>
                        <td>${e.group.lecture}</td>
                    </tr>
                </c:forEach>

            </table> <br>
            <input type="submit" value="Save">
        </form>
    </body>
</html>
