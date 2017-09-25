<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>

    <body>
        <h1>Register</h1>


        <form action="regisConfirm.jsp" method="post">
            <table align="center">

                <tr><td>Full name</td> <td><input type="text" name="name" required></td></tr>
                <tr><td>Email</td> <td><input type="text" name="email" required></td></tr>
                <tr><td>Password</td> <td><input type="password" name="password" required></td></tr>
                <tr><td>Date of birth</td> <td><input type="text" name="dob" placeholder="dd/mm/yyyy" required></td></tr>
                <tr><td>User</td> <td> <select name="user" onchange="if (this.value === 'tutor') {
                            this.form['subject'].style.visibility = 'visible';
                        } else {
                            this.form['subject'].style.visibility = 'hidden';
                        }
                        ;">
                            <option value="">- Select User Type -</option>
                            <option value="student">Student</option>
                            <option value="tutor">Tutor</option>
                        </select></td></tr>
                    
                <tr><td>Subject</td> <td> <select name="subject" style="visibility:hidden;">
                            <option value="">- Select Your Subject -</option>
                            <option value="wsd">WSD</option>
                            <option value="usp">USP</option>
                            <option value="sep">SEP</option>
                            <option value="appProg">Applications Programming</option>
                            <option value="mobileApp">Mobile Applications</option>
                        </select></td></tr>

                <tr><td></td> <td><input type="submit" value="Register"></td></tr>
            </table>
        </form>
    </body>
</html>
