<%@page import="java.awt.print.Printable"%>
<%@ page language="java" import="uts.wsd.*" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Verify login</title>
</head>
<body>
	<% String filePath = application.getRealPath("WEB-INF/students.xml"); %>
        <% String filePatht = application.getRealPath("WEB-INF/tutors.xml"); %>
    <jsp:useBean id="studentApp" class="uts.wsd.StudentApp" scope="application">
    		<jsp:setProperty name="studentApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <jsp:useBean id="tutorApp" class="uts.wsd.TutorApp" scope="application">
    		<jsp:setProperty name="tutorApp" property="filePath" value="<%=filePatht%>"/>
    </jsp:useBean>
    
    
    <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Students students = studentApp.getStudents();
            Student student = students.login(email, password);
           if (student != null) {
            session.setAttribute("user", student);
    %>	
        <p>Login successful. Click <a href="StudentMain.jsp">here</a> to return to the main page.</p>
    <%      }else {
            Tutors tutors = tutorApp.getTutors();
            Tutor tutor = tutors.login(email, password);
            if (tutor != null) {
                session.setAttribute("user", tutor);
                
    %>
        <p>Login successful. Click <a href="TutorMain.jsp">here</a> to return to the main page.</p>
    <%      }else {     %>
        <p>Password incorrect. Click <a href="Login.html">here</a> to try again.</p>
    <%       }}         %>
</body>
</html>