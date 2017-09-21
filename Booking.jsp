<%-- 
    Document   : Booking
    Created on : 12/09/2017, 10:33:49 PM
    Author     : erena
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book a human!</title>
    </head>

    <body>
        <% String filePath = application.getRealPath("WEB-INF/tutors.xml");
        boolean show = true;
        %>
        <jsp:useBean id="tutorApp" class="uts.wsd.TutorApp" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <h1>Book A Human Now!</h1>
        <form action="BookingConfirmation.jsp" method="POST">
            <table><thead><tr><td></td><td>Tutor's name</td><td>Tutor's email</td><td>Subject</td></tr></thead>
                <tbody>
                    <%
                        Tutors tutors = tutorApp.getTutors();
                        if (request.getParameter("subjectBook") != null) {
                            out.println("Filtered by SUBJECT");
                            String chosenSubject = request.getParameter("subject");
                            for (Tutor tutor : tutors.getList()) {
                                if (tutor.getSubject().equals(chosenSubject) && tutor.getStatus().equals("available")) {
                    %>
                    <tr><td><input type="radio" name="bookedTut" value="<%= tutor.getName()%>"></td><%out.print(tutor.showCredential());%></tr>
                            <%
                                    }
                                }
                            } else if (request.getParameter("nameBook") != null) {
                                out.println("Filtered by NAME");
                                String chosenName = request.getParameter("TutName");
                                for (Tutor tutor : tutors.getList()) {
                                    if (tutor.getName().contains(chosenName) && tutor.getStatus().equals("available")) {
                            %>
                    <tr><td><input type="radio" name="bookedTut" value="<%= tutor.getName()%>"></td><%out.print(tutor.showCredential());%></tr>
                            <%
                                    }
                                }
                            } else if (request.getParameter("statusBook") != null && request.getParameter("status").equals("available")) {
                                out.println("Filtered by STATUS");
                                String chosenStatus = request.getParameter("status");
                                for (Tutor tutor : tutors.getList()) {
                                    if (tutor.getStatus().equals("available")) {
                                    String tutName = tutor.getName();
                            %>
                    <tr><td><input type="radio" name="bookedTut" value="<%= tutor.getName()%>"></td><%out.print(tutor.showCredential());%></tr>
                            <%
                                    }
                                }
                            } else if (request.getParameter("statusBook") != null && request.getParameter("status").equals("unavailable")) {
                                out.println("list of unavailable teachers:");
                                show = false;
                                for (Tutor tutor : tutors.getList()) {
                                    if (tutor.getStatus().equals("unavailable")) {
                            %>
                    <tr><td><%out.print(tutor.showCredential());%></td></tr>
                        <%
                                }
                            }

                        } else {
                        %>
                    <tr><td></td><td>null</td><td>null</td><td>null</td></tr>
                    <%
                        }


                    %>
                </tbody>
            </table>
            <% if(show==true){%><input type="submit" value="Book!"></form><%}%><button onclick="location.href = 'StudentMain.jsp';">cancel</button>
    </body>
</html>
