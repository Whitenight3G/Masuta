<%-- 
    Document   : Main
    Created on : 09/09/2017, 10:34:39 PM
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
    Student student = (Student) session.getAttribute("user");
    if (student != null) {
        String filePathS = application.getRealPath("WEB-INF/students.xml");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");

%>
<%--
if the user is a student.
--%>
<body background="Images/wool.jpg">
    <form action="StudentMain.jsp">
        <table>
            <tr><td>Search by:</td><td><select name="search">
                        <option value="subject">By subject</option>
                        <option value="name">By name</option>
                        <option value="status">By status</option>
                    </select></td><td><input type="submit" value="Apply"></td></tr>
        </table></form>
    <%if (request.getParameter("search") != null && request.getParameter("search").equals("subject")) {%>
    <form action="Booking.jsp">
        <table>
            <tr><td>Subject:</td><td><input list="subjects" name="subject">
                    <datalist id="subjects">
                        <option value="WSD"></option>
                        <option value="USP"></option>
                        <option value="AppProg"></option>
                        <option value="SEP"></option>
                        <option value="MobileApp"></option>
                    </datalist></td></tr>
        </table>
        <input type="submit" value="Book!" name="subjectBook">
    </form>
</body>
<%} else if (request.getParameter("search") != null && request.getParameter("search").equals("name")) {%>
<form action="Booking.jsp">
        <table>
            <tr><td>Tutor's Name:</td><td><input type="text" name="name"></td></tr>
        </table>
    <input type="submit" value="Book!" name="nameBook">
    </form>
<%} else if (request.getParameter("search") != null && request.getParameter("search").equals("status")) {%>
<form action="Booking.jsp">
        <table>
            <tr><td>Status:</td><td><input type="radio" name="status" value="availaible">availaible</td></tr>
            <tr><td></td><td><input type="radio" name="status" value="unavailaible">unavailable</td></tr>
        </table>
    <input type="submit" value="Book!" name="statusBook">
    </form>
<%}} else {%>
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
