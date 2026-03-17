<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이메일 찾기 결과</title>
     <link rel="stylesheet" type="text/css" href="../css/emailResult.css">
</head>
<body>
    <div class="email-result-container">
        <h1>이메일 찾기 결과</h1>

        <%
            String email = (String) request.getAttribute("email");
            String error = (String) request.getAttribute("error");

            if (email != null) {
        %>
            <p> <%= email %>은 가입되어 있습니다.</p>
        <%
            } else if (error != null) {
        %>
            <p style="color:red;"><%= error %></p>
        <%
            }
        %>

        <a href="/findEmail" class="try-again-link">다시 시도</a>
    </div>
</body>
</html>
