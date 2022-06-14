<%-- 
    Document   : login
    Created on : Jun 14, 2022, 10:29:45 PM
    Author     : HAICAO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="login" method="POST">
            <input type="text" placeholder="Username" name="user"/> <br/>
            <input type="password" placeholder="Password" name="pass"/> <br/>
            <input type="submit" value="Login" class="login"/>
        </form>
    </body>
</html>
