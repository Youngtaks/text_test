<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이메일(아이디) 찾기 결과</title>
      <link rel="stylesheet" type="text/css" href="../css/email_style.css">
</head>
<body>
    <h1>닉네임 찾기 결과</h1>
    <p>등록된 이메일(아이디): <%= request.getAttribute("email") %></p>
</body>
</html>
