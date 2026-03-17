<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %> 
<%
    String nickname = request.getParameter("nickname");
    session.setAttribute("nickname", nickname);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>가입 성공</title>
     <link rel="stylesheet" type="text/css" href="../css/success.css">
</head>
<body>
    <div class="container">
        <h2>가입 성공!</h2>
        <p>환영합니다, ${sessionScope.nickname}님!</p>
        <a href="/login">로그인 하러 가기</a>
    </div>
</body>
</html>