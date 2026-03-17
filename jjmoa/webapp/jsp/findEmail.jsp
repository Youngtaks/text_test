<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이메일(아이디) 찾기</title>
    <link rel="stylesheet" type="text/css" href="../css/findEmail_style.css">
</head>
<body>
    <div class="find-email-container">
        <h1>이메일(아이디) 찾기</h1>
        <form action="findEmail" method="post">
            <div class="input-group">
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <input type="submit" value="찾기">
        </form>
        
        <%
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
            <p id="error-message"><%= error %></p>
        <%
            }
        %>
    </div>
</body>
</html>
