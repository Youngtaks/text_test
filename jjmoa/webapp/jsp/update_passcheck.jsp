<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 확인</title>
    <link rel="stylesheet" type="text/css" href="../css/update_passcheck.css">
</head>
<body>
    <div class="passcheck-container">
        <h2>비밀번호 확인</h2>
        <form action="/update_passcheck" method="post"> 
            <div class="input-group">
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="nickname">닉네임:</label>
                <input type="text" id="nickname" name="nickname" required>
            </div>
            <div class="input-group">
                <input type="submit" value="확인하기">
            </div>
        </form>

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div style="color: red;">
                <%= errorMessage %>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
