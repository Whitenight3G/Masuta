<%-- 
    Document   : TutorMain
    Created on : 11/09/2017, 3:22:57 PM
    Author     : erena
--%>

<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    <h1 align="center" style="font-size:185px; background-color:white"><img src="Images/uts.jpg" alt="uts">Tutor</h1>

</head>
<%
    Tutor tutor = (Tutor) session.getAttribute("user");
    if (tutor != null) {
        String filePathT = application.getRealPath("WEB-INF/tutors.xml");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String subject = request.getParameter("subject");
        String status = request.getParameter("status");
%>
<%--
if the user is a tutor.
--%>

<body background="Images/wool.jpg">
    you're A tutor!
</body>
<%} else {%>
<head>
<h1 align="center" style="font-size:185px">
    Session expired
</h1>
<head>
<body background="Images/wool.jpg">
    <p align="center" style="font-size:100px">Click <a href="index.jsp"><u>here</u></a> to go back.</p>

<body>
    <%}%>
</html>
