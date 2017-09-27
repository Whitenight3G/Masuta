<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.invalidate();
        %>
        <p>You have been logged out. Click <a href="index.jsp">here</a> to return to the welcome page.</p>
    </body>
</html>
