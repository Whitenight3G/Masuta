<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    <h1 align="center" style="font-size:185px; background-color:white"><img src="Images/uts.jpg" alt="uts">Tutor</h1>
</head>

You are logged in as  ${user.name} - ${user.email}
<p>Click <a href="logout.jsp">here</a> to log out your account</p>
<p>Click <a href="account.jsp">here</a> to view your account</p>
<%if (session.getAttribute("user") != null){
    if (session.getAttribute("user").getClass().toString().equals("class uts.wsd.Tutor")) {
        //check if the "user" is a tutor
        Tutor tutor = (Tutor) session.getAttribute("user");

        if (tutor != null) {
            String filePathT = application.getRealPath("WEB-INF/tutors.xml");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            String subject = request.getParameter("subject");
            String status = request.getParameter("status");%>
<body background="Images/wool.jpg">
    You're a tutor!
</body>
<%}} else if (session.getAttribute("user").getClass().toString().equals("class uts.wsd.Student")) {
    //check if the "user" is a student

    Student student = (Student) session.getAttribute("user");
    if (student != null) {
        String filePathS = application.getRealPath("WEB-INF/students.xml");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");%>

<body background="Images/wool.jpg">
    <form action="StudentMain.jsp">
        <table>
            <tr><td>Search by:</td><td><select name="search">
                        <option value="subject">By subject</option>
                        <option value="name">By name</option>
                        <option value="status">By status</option>
                    </select></td><td><input type="submit" value="Apply"></td></tr>
        </table>
    </form>
    <%}
        if (request.getParameter("search") != null && request.getParameter("search").equals("subject")) {%>
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
    <%} else if (request.getParameter("search") != null && request.getParameter("search").equals("name")) {%>
    <form action="Booking.jsp">
        <table>
            <tr><td>Tutor's Name:</td><td><input type="text" name="TutName"></td></tr>
        </table>
        <input type="submit" value="Book!" name="nameBook">
    </form>
    <%} else if (request.getParameter("search") != null && request.getParameter("search").equals("status")) {%>
    <form action="Booking.jsp">
        <table>
            <tr><td>Status:</td><td><input type="radio" name="status" value="available">available</td></tr>
            <tr><td></td><td><input type="radio" name="status" value="unavailable">unavailable</td></tr>
        </table>
        <input type="submit" value="Proceed" name="statusBook">
    </form>
</body>

<%}
    }} else if (session.getAttribute("user") == null){
        //check if the "user" is neither
    %>
<head>
<h1 align="center" style="font-size:185px">
    Session expired
</h1>
</head>
<body background="Images/wool.jpg">
    <p align="center" style="font-size:100px">Click <a href="index.jsp"><u>here</u></a> to go back.</p>

</body>
<%}%>
</html>
