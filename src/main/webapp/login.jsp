<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 50px;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .message {
            color: green;
            font-size: 14px;
        }
        .error {
            color: red;
            font-size: 14px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Login</h2>

    <!-- Display success message -->
    <p class="message">
        <% String success = (String) request.getAttribute("successMessage");
        if (success != null) { out.print(success); } %>
    </p>

    <!-- Show error message if exists -->
    <p class="error">
        <% String error = (String) request.getAttribute("errorMessage");
        if (error != null) { out.print(error); } %>
    </p>

    <form action="LoginServlet" method="post">
        <label>Username:</label>
        <input type="text" name="user" required>

        <label>Password:</label>
        <input type="password" name="pwd" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
