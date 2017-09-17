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
        %>
        <jsp:useBean id="tutorApp" class="uts.wsd.TutorApp" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <h1>Book A Human Now!</h1>
        <%
            Tutors tutors = tutorApp.getTutors();
            if (request.getParameter("subjectBook") != null) {
                out.println("subject book");
                String chosenSubject = request.getParameter("subject");
        %>
        <form action="BookingConfirmation.jsp" method="POST"><table>
                <%
                    for (Tutor tutor : tutors.getList()) {
                        if (tutor.getSubject().equals(chosenSubject) && tutor.getStatus().equals("availaible")) {
                %>
                <tr><td><input type="radio" name=tutor.getName()></td><%out.print(tutor.showCredential());%></tr>

                <%
                        }
                    }

                %>
                <input type="submit" value="Book!">
            </table>
        </form>
        <%  }
            if (request.getParameter("nameBook") != null) {
                out.println("name book");
                String chosenSubject = request.getParameter("subject");
        %>
        <form action="BookingConfirmation.jsp" method="POST"><table>
                <%
                    for (Tutor tutor : tutors.getList()) {
                        if (tutor.getSubject().equals(chosenSubject) && tutor.getStatus().equals("availaible")) {
                %>
                <tr><td><input type="radio" name=tutor.getName()></td><%out.print(tutor.showCredential());%></tr>

                <%
                        }
                    }

                %>
                <input type="submit" value="Book!">
            </table>
        </form>
        <%  }
            if (request.getParameter("statusBook") != null) {
                out.println("status book");
            }
        %>
    </body>
</html>
