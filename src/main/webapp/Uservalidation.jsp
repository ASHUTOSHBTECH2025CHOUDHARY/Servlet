<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.regex.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Validation</title>
</head>
<body>
    <form method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Validate">
    </form>

    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null) {
            // Username validation rule: Starts with an uppercase letter, contains only letters and numbers
            String USERNAME_REGEX = "^[A-Z][a-zA-Z0-9]*$";
            boolean isValidUsername = Pattern.matches(USERNAME_REGEX, username);

            // Password validation rule: At least 8 characters, one uppercase letter, one number, and exactly one special character
            String PASSWORD_REGEX = "^(?=.*[A-Z])(?=.*\\d)(?=(?:[^!@#$%^&*()_+\-=\[\]{};':\"\\|,.<>/?]*[!@#$%^&*()_+\-=\[\]{};':\"\\|,.<>/?]){1}[^!@#$%^&*()_+\-=\[\]{};':\"\\|,.<>/?]*$).{8,}$";
            boolean isValidPassword = Pattern.matches(PASSWORD_REGEX, password);

            if (isValidUsername) {
    %>
                <p style="color: green;">Valid Username!</p>
    <%
            } else {
    %>
                <p style="color: red;">Invalid Username! It must start with a capital letter and contain only letters or numbers.</p>
    <%
            }

            if (isValidPassword) {
    %>
                <p style="color: green;">Valid Password!</p>
    <%
            } else {
    %>
                <p style="color: red;">Invalid Password! It must be at least 8 characters long, contain one uppercase letter, one number, and exactly one special character.</p>
    <%
            }
        }
    %>
</body>
</html>