<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.jjm.jjmoa.model.MemberDTO"%>
<%@ include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재확인</title>
    <link rel="stylesheet" type="text/css" href="../css/mypage_passwd.css">
</head>
<body>

<div class="section">
    <h2 class="logo"> 비밀 번호 재확인 </h2>
    <br>
    <p style="text-align: center;">
        정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 입력해 주세요.
    </p>
    <br>

    <!-- 비밀번호 재확인 폼 -->
    <form name="pass" action="mypagepasswd" method="post">
        <table>
            <tr>
                <th>아이디(이메일)</th>
            </tr>
            <tr>
                <td>
                    <%
                    // 세션에서 MemberDTO 객체를 가져와서 이메일 표시
                    MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
                    if (session_memberDTO != null) {
                    %>
                        <input type="text" name="email" value="<%= session_memberDTO.getEmail() %>" readonly>
                    <%
                    } else {
                        // 세션에 정보가 없으면 로그인 페이지로 리다이렉트
                        response.sendRedirect("login.jsp");
                    }
                    %>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
            </tr>
            <tr>
                <td>
                    <input type="password" name="passwd" placeholder="비밀번호 입력" required>
                    <!-- 서버에서 전송된 에러 메시지 표시 -->
                    <c:if test="${not empty errorMessage}">
                        <div class="error-message">${errorMessage}</div>
                    </c:if>
                </td>
            </tr>
        </table>
        <button type="submit" class="small-button">비밀번호 확인</button>
    </form>
</div>

</body>
</html>
