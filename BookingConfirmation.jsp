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
        <%  int totalID = 0;
            if (request.getParameter("bookedTut") != null) {
                String filePath = application.getRealPath("WEB-INF/students.xml");
                String filePatht = application.getRealPath("WEB-INF/tutors.xml");
                String filePathb = application.getRealPath("WEB-INF/Bookings.xml");
        %>
                
        <jsp:useBean id="studentApp" class="uts.wsd.StudentApp" scope="application">
            <jsp:setProperty name="studentApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <jsp:useBean id="tutorApp" class="uts.wsd.TutorApp" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePatht%>"/>
        </jsp:useBean>
        <jsp:useBean id="BookingApp" class="uts.wsd.BookingApp" scope="application">
            <jsp:setProperty name="BookingApp" property="filePath" value="<%=filePathb%>"/>
        </jsp:useBean>
        <% Tutors tutors = tutorApp.getTutors();
            for (Tutor tutor : tutors.getList()) {
                if (tutor.getName().equals(request.getParameter("bookedTut")) && tutor.getStatus().equals("available")) {
                    Bookings bookings = new Bookings();
                    for(Booking booking: bookings.getList()){
                        totalID += 1;
                    }
                    Student student = (Student)session.getAttribute("user");
                    Booking booking = new Booking(totalID,tutor.getName(),tutor.getEmail(),tutor.getSubject(),student.getName(),student.getEmail(),"active");
                    bookings.addListing(booking);
                    BookingApp.updateXML(bookings, filePathb);
                }
            }
        } else if (request.getParameter("bookedTut") == null) {%>
        <p>You haven't choose any Tutor to book.
            <%}%>
        <p id="success"></p>
        <hr>
        Click <a href="StudentMain.jsp"><u>here</u></a> to go back.</p>
</body>
</html>
