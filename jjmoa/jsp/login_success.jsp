<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %> 
<%
    String nickname = (String) session.getAttribute("nickname");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 성공</title>
    <link rel="stylesheet" type="text/css" href="../css/success.css">
</head>
<body>
    <div class="container">
        <h2>로그인 성공!</h2>
        <p>환영합니다, <%= nickname %>님!</p>
        <a href="home.jsp">홈으로 가기</a> 
    </div>
</body>
</html>