<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.jjm.jjmoa.model.MemberDTO"%>
<%@ include file="/jsp/header.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="../css/mypage_modify.css">
    <script>
     // 비밀번호 유효성 검사 함수
       	function validateForm() {
   	 	const nickname = document.querySelector("input[name='nickname']").value;
   	 	const password = document.querySelector("input[name='passwd']").value;
    	const confirmPassword = document.querySelector("input[name='confirm_passwd']").value;

    // 닉네임 확인
  		if (nickname == "") {
       		alert("닉네임을 입력하세요.");
        	return false;
   		 }

    // 비밀번호 형식 확인 (8자 이상, 특수문자 포함)
   		 const passwordPattern = /^(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
   		 if (!passwordPattern.test(password)) {
       		 alert("비밀번호는 8자 이상이며, 특수문자를 포함해야 합니다.");
       		 return false;
   		 }

    // 비밀번호와 비밀번호 확인 필드 비교
  		  if (password !== confirmPassword) {
      		  alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
      		  return false;
 		 }	

    // 폼 제출 허용
   		 return true;
	}

   // 닉네임 중복 오류 팝업
       window.onload = function() {
   		 const errorMsg = '<%= request.getAttribute("errorMsg") %>';
   			 if (errorMsg && errorMsg !== "null") { // errorMsg가 null이 아니고 값이 있을 때만 팝업을 띄움
      		  	alert(errorMsg);  // 에러 메시지가 있으면 팝업으로 출력
   		 }
	}
        
    </script>
</head>
<body>
    <div class="container">
        <h2 class="title">회원 정보 수정</h2>
        <hr>
        <div class="frm">
            <% MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO"); %>
            <form method="post" action="/mypagemodify" onsubmit="return validateForm();">
                <table>
                    <tr>
                        <th>이메일(아이디)</th>
                        <td><p><%= session_memberDTO.getEmail() %></p></td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>
                            <div class="input_group">
                                <input type="text" name="nickname" value="<%= session_memberDTO.getNickname()%>" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <div class="input_group">
                                <input type="password" name="passwd" placeholder="비밀번호 입력" required>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호 재확인</th>
                        <td>
                            <input type="password" name="confirm_passwd" placeholder="비밀번호 재입력" required>
                        </td>
                    </tr>
                </table>
                <div class="btn_container">
                    <button type="submit" class="btn_blue">수정하기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
