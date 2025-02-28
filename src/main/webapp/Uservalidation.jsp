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
        <input type="submit" value="Validate">
    </form>

    <%
        String username = request.getParameter("username");

        if (username != null) {
            // Username validation rule: Starts with an uppercase letter, contains only letters and numbers
            String USERNAME_REGEX = "^[A-Z][a-zA-Z0-9]*$";
            boolean isValidUsername = Pattern.matches(USERNAME_REGEX, username);

            if (isValidUsername) {
    %>
                <p style="color: green;">Valid Username!</p>
    <%
            } else {
    %>
                <p style="color: red;">Invalid Username! It must start with a capital letter and contain only letters or numbers.</p>
    <%
            }
        }
    %>
</body>
</html>
