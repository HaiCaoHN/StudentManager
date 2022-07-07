<%-- 
    Document   : schedule
    Created on : Jun 30, 2022, 9:27:33 PM
    Author     : HAICAO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Schedule</title>
    </head>

    <body>
        <form action="schedule" method="POST">
            <div style="text-align:center;">
                Campus: <select>
                    <option> FU-HL</option>
                </select>  </div>
            <div style="text-align: center;">Lecture: <input type="text" name="lecture" value="sonnt"> 
                <input type="submit" value="View"> </div>
        </form>

        <form action="schedule" method="POST" id="week">
            <table border="1" id="schedule">
                <tr>
                    <td>
                        Year: 2022 <br/>
                        Week:
                        <select id="week" >
                            <c:forEach items="${requestScope.weeks}" var="w">
                                <option value="${w.startDate}"
                                        <c:forEach var="i" begin="0" end="6">
                                            <c:if test="${requestScope.today eq w.startDate.plusDays(i)}">
                                                selected = "selected";
                                            </c:if>
                                        </c:forEach> >
                                    ${w.startDate.getDayOfMonth()}/${w.startDate.getMonthValue()} To ${w.endDate.getDayOfMonth()}/${w.endDate.getMonthValue()}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>Mon</td>
                    <td>Tue</td>
                    <td>Wed</td>
                    <td>Thu</td>
                    <td>Fri</td>
                    <td>Sat</td>
                    <td>Sun</td>
                </tr>
                <tr>
                    <td></td>
                    <c:forEach var="i" begin="0" end="6">
                        
                    </c:forEach>
                </tr>
            </table>

        </form>
    </body>

</html>
