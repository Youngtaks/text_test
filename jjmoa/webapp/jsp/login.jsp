<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
  <link rel="icon" href="<%=request.getContextPath()%>/image/favicon.ico" type="image/x-icon">

</head>
<body>
    <div class="login-container">
        <div class="logo">
            <a href="/index">
                <img src="/image/logo_1.png" alt="Logo" class="main_logo">
            </a>
        </div>
        <form method="post" action="login">
            <div class="input-group">
                <label for="email">이메일(아이디)</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div id="error-message"></div>
            <input type="submit" value="로그인">
        </form>
        <div class="register-link">
            <p>아직 계정이 없으신가요? <a href="/register">회원가입하기</a></p>
        </div>
    </div>
</body>
</html>