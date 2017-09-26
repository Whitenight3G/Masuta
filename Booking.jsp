<%-- 
    Document   : Booking
    Created on : 26-Sep-2017, 11:26:22
    Author     : ASUS
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    <h1 align="center" style="font-size:185px; background-color:white"><img src="Images/uts.jpg" alt="uts">Tutor</h1>
</head>
<%if (session.getAttribute("user") != null) {
        String filePath = application.getRealPath("WEB-INF/tutors.xml");
        String filePathB = application.getRealPath("WEB-INF/bookings.xml");%>
<jsp:useBean id="bookingApp" class="uts.wsd.BookingApp" scope="application">
    <jsp:setProperty name="bokingApp" property="filePath" value="<%=filePathB%>"/>
</jsp:useBean>
<jsp:useBean id="tutorApp" class="uts.wsd.TutorApp" scope="application">
    <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%
    Tutors tutors = tutorApp.getTutors();
    if (session.getAttribute("user").getClass().toString().equals("class uts.wsd.Student")) {
        //check if the "user" is a student
        Student student = (Student) session.getAttribute("user");
        String stuEmail = student.getEmail();
        String stuName = student.getName();

%>

<body>
    <table>
        <form action="Booking.jsp">
            <input type="submit" value="Create a booking" name="Book"><input type="submit" value="View a booking" name="Book"><input type="submit" value="Cancel booking" name="Book"><input type="submit" value="View all bookings" name="Book">
        </form>
    </table>
    <%        if (request.getParameter("bookedTut") != null) {
            Tutor tutor = tutorApp.getTutors().getTutor(request.getParameter("bookedTut"));
            int newID = bookingApp.getBookings().getLastBooking();
            Booking booking = new Booking(newID, tutor.getEmail(), tutor.getName(), tutor.getSubject(), stuName, stuEmail, "active");
            bookingApp.getBookings().addBooking(booking);
            tutorApp.getTutors().getTutor(request.getParameter("bookedTut")).setStatus("unavailable");%>
    <p>Booking successful! Click <a href="Main.jsp"><u>here</u></a> to go back to the main menu.</p>
                <%
                    }

                %>
</body> 
<%} else if (session.getAttribute("user").getClass().toString().equals("class uts.wsd.Tutor")) {
    //if the "user" is a tutor
    Tutor tutor = (Tutor) session.getAttribute("user");
    String tutEmail = tutor.getEmail();
    String tutName = tutor.getName();
%>
<body>
    <table>
        <form action="Booking.jsp">
            <input type="submit" value="View a booking" name="Book"><input type="submit" value="Cancel booking" name="Book"><input type="submit" value="View all bookings" name="Book"><input type="submit" value="Complete a booking" name="Book">

        </form>
    </table>

    <% if (request.getParameter("Book") != null) {
            if (request.getParameter("Book").equals("Complete a booking")) {
                //code to complete the available booking
    %>
    <form action="BookingConfirmation.jsp">
        <table>
            <thead
                <tr><td>select</td><td>ID</td><td>Student Email</td><td>Student Name</td></tr>
            </thead>
            <tbody>
                <%
                    for (Booking booking : bookingApp.getBookings().getList()) {
                        if (booking.getTutEmail().equals(tutEmail)) {%>
                <tr><td><input type="radio" name="completeBooking" value="<%=booking.getStuEmail()%>"</td><td><%=booking.getStuEmail()%></td><td><%=booking.getStuName()%></td></tr>
                        <%}
                            }
                        %>
            </tbody>
        </table>
    </form>
    <%
            }
        }
    %>
</body>    
<%}
                }%>
</html>
