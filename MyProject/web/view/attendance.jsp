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
    </head>
    <body>
        Attendance for with lecture ${session.taker.id} at slot ${session.slot.slot} on ${session.date} <br>
        <form action="attend" method="POST">
            <table border="1" style=" margin-top: 20px; width: 70%;">
                <thead>
                    <tr>
                        <td>Group</td>
                        <td>Code</td>
                        <td>Name</td>
                        <td>Status</td>
                        <td>Comment</td>
                        <td>Taker</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.list}" var="e">
                        <tr>
                            <td>${e.group.id}</td>
                            <td>${e.student.code}</td>
                            <td>${e.student.name}</td>
                            <td>
                                <input type="radio" name="check_${e.student.id}" checked="checked" /> absent
                                <input type="radio" name="check_${e.student.id}" /> present
                            </td>
                            <td><input type="text" name="comment"></td>
                            <td>${e.group.lecture}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table> <br>
            <input type="submit" value="Save">

        </form>

    </body>
</html>
