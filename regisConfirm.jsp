<%@page import="java.awt.print.Printable"%>
<%@ page language="java" import="uts.wsd.*" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Confirmation</title>
    </head>
    <body>
        <% if (request.getParameter("status").equals("available")) {
                String filePath = application.getRealPath("WEB-INF/students.xml");
                String filePatht = application.getRealPath("WEB-INF/tutors.xml");%>
        <jsp:useBean id="studentApp" class="uts.wsd.StudentApp" scope="application">
            <jsp:setProperty name="studentApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="tutorApp" class="uts.wsd.TutorApp" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePatht%>"/>
        </jsp:useBean>

        <%
                Students students = studentApp.getStudents();
                Tutors tutors = tutorApp.getTutors();
                String email = request.getParameter("email");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                String user = request.getParameter("user");
                if (students.getStudent(email) == null && tutors.getTutor(email) == null) {
                    if (user.equals("Tutor")) {
                        Tutor tutor = new Tutor(name, email, password, dob, request.getParameter("subject"), request.getParameter("status"));
                        tutors.addTutor(tutor);%>
                        <p>New tutor has been added. click <a href="Main.jsp"><u>here</u></a> to go to your main page.</p>
                        <%
                        session.setAttribute("user", tutor);
                    } else if (user.equals("Student")) {
                        Student student = new Student(name, email, password, dob);
                        students.addStudent(student);%>
                        <p>New student has been added. click <a href="Main.jsp"><u>here</u></a> to go to your main page.</p>
                        <%
                        session.setAttribute("user", student);
                    } else {
                        out.print("Error. Breach detected!");
                    }
                } else {
                    %>
                    <p>Email is already taken. Click <a href="register.jsp"><u>here</u></a> to try again.</p>
                    <%
                }
            }%>
    </body>
</html>  
