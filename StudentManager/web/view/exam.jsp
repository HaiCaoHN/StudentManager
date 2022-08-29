<%-- 
    Document   : exam
    Created on : Aug 26, 2022, 3:46:13 PM
    Author     : mavjp
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
        <form action="exam_manage" method="post">
            <table border="1px">
                <tr>
                    <td></td>
                    <c:forEach items="${requestScope.assessments}" var="a">
                        <td>${a.name}</td>
                    </c:forEach>
                </tr>
                
            </table>
        </form>
    </body>
</html>
