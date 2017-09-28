<%-- 
    Document   : TutorMain
    Created on : 11/09/2017, 3:22:57 PM
    Author     : erena
--%>

<%@page import="uts.wsd.Tutors"%>
<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    <h1 align="center" style="font-size:185px; background-color:white"><img src="Images/uts.jpg" alt="uts">Tutor</h1>
</head>
<%if (session.getAttribute("user") != null) {
        if (session.getAttribute("user").getClass().toString().equals("class uts.wsd.Tutor")) {
            //check if the "user" is a tutor
            Tutor tutor = (Tutor) session.getAttribute("user");
            if (tutor != null) {
                String filePathT = application.getRealPath("WEB-INF/tutors.xml");
                String email = request.getParameter("email");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                String subject = request.getParameter("subject");
                String status = request.getParameter("status");%>
<body background="Images/wool.jpg">
    you're A tutor!
</body>
<%}
}//end of tutor user
else if (session.getAttribute("user").getClass().toString().equals("class uts.wsd.Student")) {
    //check if the "user" is a student
    Student student = (Student) session.getAttribute("user");
    if (student != null) {
        String filePath = application.getRealPath("WEB-INF/tutors.xml");
        String filePathS = application.getRealPath("WEB-INF/students.xml");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");%>
<jsp:useBean id="tutorApp" class="uts.wsd.TutorApp" scope="application">
    <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<body background="Images/wool.jpg">
    <form action="Main.jsp">
        <table>
            <tr><td>Search by:</td><td><select name="search">
                        <option value="subject">By subject</option>
                        <option value="name">By name</option>
                        <option value="status">By status</option>
                    </select></td><td><input type="submit" value="Apply"></td></tr>
        </table>
    </form>
    <%
        if (request.getParameter("search") != null && request.getParameter("search").equals("subject")) {
            //if the search by has been applied%>
    <form action="Main.jsp">
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
    <form action="Main.jsp">
        <table>
            <tr><td>Tutor's Name:</td><td><input type="text" name="TutName"></td></tr>
        </table>
        <input type="submit" value="Book!" name="nameBook">
    </form>
    <%} else if (request.getParameter("search") != null && request.getParameter("search").equals("status")) {%>
    <form action="Main.jsp">
        <table>
            <tr><td>Status:</td><td><input type="radio" name="status" value="available">available</td></tr>
            <tr><td></td><td><input type="radio" name="status" value="unavailable">unavailable</td></tr>
        </table>
        <input type="submit" value="Proceed" name="statusBook">
    </form>
</body>

<%} if(request.getParameter("subjectBook") != null || request.getParameter("nameBook") != null || request.getParameter("statusBook") != null){
    //show result of the search bar%>
<form action="BookingConfirmation.jsp" method="POST">
    <table class="middle">
        <thead>
            <tr><td></td><td>Tutor's name</td><td>Tutor's email</td><td>Subject</td><td>Status</td></tr>
        </thead>
        <tbody>
            <%
                boolean show = false;
                boolean match = false;
                Tutors tutors = tutorApp.getTutors();
                if (request.getParameter("subjectBook") != null) {
                    out.println("Filtered by SUBJECT");
                    String chosenSubject = request.getParameter("subject");
                    for (Tutor tutor : tutors.getList()) {
                        if (tutor.getSubject().equals(chosenSubject) && tutor.getStatus().equals("available")) {
                            match = true;
                            show = true;
            %>
            <tr><td><input type="radio" name="bookedTut" value="<%= tutor.getName()%>"></td><td><%= tutor.getName()%></td><td><%= tutor.getEmail()%></td><td><%= tutor.getSubject()%></td><td><%= tutor.getStatus()%></td></tr>
                    <%
                            }
                        }
                    } else if (request.getParameter("nameBook") != null) {
                        out.println("Filtered by NAME");
                        String chosenName = request.getParameter("TutName");
                        for (Tutor tutor : tutors.getList()) {
                            if (tutor.getName().contains(chosenName) && tutor.getStatus().equals("available")) {
                                match = true;
                                show = true;
                    %>
            <tr><td><input type="radio" name="bookedTut" value="<%= tutor.getName()%>"></td><td><%= tutor.getName()%></td><td><%= tutor.getEmail()%></td><td><%= tutor.getSubject()%></td><td><%= tutor.getStatus()%></td></tr>
                    <%
                            }
                        }
                    } else if (request.getParameter("statusBook") != null) {
                        if (request.getParameter("status").equals("available")) {
                            out.println("Filtered by STATUS");
                            String chosenStatus = request.getParameter("status");
                            for (Tutor tutor : tutors.getList()) {
                                if (tutor.getStatus().equals("available")) {
                                    String tutName = tutor.getName();
                                    match = true;
                                    show = true;
                    %>
            <tr><td><input type="radio" name="bookedTut" value="<%= tutor.getName()%>"></td><td><%= tutor.getName()%></td><td><%= tutor.getEmail()%></td><td><%= tutor.getSubject()%></td><td><%= tutor.getStatus()%></td></tr>
                    <%
                            }
                        }
                    } else if (request.getParameter("status").equals("unavailable")) {
                        out.println("Filtered by STATUS");
                        show = false;
                        for (Tutor tutor : tutors.getList()) {
                            if (tutor.getStatus().equals("unavailable")) {
                                match = true;
                    %>
            <tr><td><td><%= tutor.getName()%></td><td><%= tutor.getEmail()%></td><td><%= tutor.getSubject()%></td><td><%= tutor.getStatus()%></td></td></tr>
            <%
                            }
                        }
                    }
                }%>
        </tbody>
    </table>
    <% if (show == true) {%><input type="submit" value="Book!">
</form>
<%}
                if (match == false) {
                    out.print("No user found.");
                }
            }
        }
    }//end of student user
} else if (session.getAttribute("user") == null) {
    //check if the "user" is neither
%>
<head>
<h1 align="center" style="font-size:185px">
    Session expired
</h1>
</head>
<body background="Images/wool.jpg">
    <p align="center" style="font-size:70px">Click <a href="index.jsp"><u>here</u></a> to go login or sign up now.</p>

</body>
<%}//end of neither user%>
</html>