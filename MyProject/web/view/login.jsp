<%-- 
    Document   : login
    Created on : Jun 14, 2022, 10:29:45 PM
    Author     : HAICAO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/loginTemplate.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        

        <div class="login-page">
            <div class="form">
                <form class="login-form" method="post" action="login">
                    <p>Welcome</p>
                    <input type="text" placeholder="Username" name="user"/>
                    <input type="password" placeholder="Password" name="pass"/>
                    <button type="submit">login</button>
                </form>
            </div>
        </div>
    </body>
</html>
