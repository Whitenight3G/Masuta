<%@page import="uts.wsd.*" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Confirmation</title>
</head>

<% String email = request.getParameter("email");%>
<% String name = request.getParameter("name");%>
<% String password = request.getParameter("password");%>
<% String dob = request.getParameter("dob");%>
<% String user = request.getParameter("user");%>
<% String subject = request.getParameter("subject");%>
<% String status = request.getParameter("statust");%>

<%
    if (request.getParameter("user").equals("student")) {
%> 
<h1>Welcome, <%=name%>!</h1>
<p>Your email is <%=email%></p>
<p>Your password is <%=password%></p>
<p>Your DOB is <%=dob%></p>
<p>Your user type is <%=user%></p>

<%
    Student student = new Student(name, email, password, dob);
    session.setAttribute("user", student);
%>

<%
} else {
%>
<h1>Welcome, <%=name%>!</h1>
<p>Your email is <%=email%></p>
<p>Your password is <%=password%></p>
<p>Your DOB is <%=dob%></p>
<p>Your user type is <%=user%></p>
<p>Your chosen subject is <%=subject%></p>

<%
    Tutor tutor = new Tutor(name, email, password, dob, subject, status);
    session.setAttribute("user", tutor);
%>

<%
    }
%>
<p>Click <a href="Main.jsp">here</a> to proceed to the main page.</p>



