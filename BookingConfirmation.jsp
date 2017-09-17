<%-- 
    Document   : BookingConfirmation
    Created on : 17/09/2017, 4:08:34 PM
    Author     : erena
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Confirmation</title>
    </head>

    <body>
        <% if (request.getParameter("bookedTut") != null) {
                String filePath = application.getRealPath("WEB-INF/students.xml");
                String filePatht = application.getRealPath("WEB-INF/tutors.xml");%>
        <jsp:useBean id="studentApp" class="uts.wsd.StudentApp" scope="application">
            <jsp:setProperty name="studentApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="tutorApp" class="uts.wsd.TutorApp" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePatht%>"/>
        </jsp:useBean>
        <% Tutors tutors = tutorApp.getTutors();
            for (Tutor tutor : tutors.getList()) {
                if (tutor.getName().equals(request.getParameter("bookedTut")) && tutor.getStatus().equals("available")) {
        %>
        <p>Are you sure you want to book: <%=tutor.getName()%> for subject <%=tutor.getSubject()%>?</p>
        <%
                }
            }
        %>
        <button onclick="execute()">confirm</button><button onclick="goBack()">go back</button>
        <script>
            function execute() {
                location.href = "StudentMain.jsp";
                alert("The booking was a success!");
            }
            function goBack() {
                window.history.back();
            }
        </script>
        <%
        } else if (request.getParameter("bookedTut") == null) {%>
        <p>You haven't choose any Tutor to book.
            <%}%>
        <p id="success"></p>
        <hr>
        Click <a href="StudentMain.jsp"><u>here</u></a> to go back.</p>
</body>
</html>
