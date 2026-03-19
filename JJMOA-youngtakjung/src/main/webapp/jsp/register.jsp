<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="../css/register.css">
    <script>
        function checkNickname() {
            var nickname = document.getElementById("nickname").value;
            var errorMessage = document.getElementById("nicknameError");
            if (nickname === "") {
                errorMessage.innerText = ""; 
                return;
            }
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "check_nickname?nickname=" + nickname, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var response = xhr.responseText;
                    if (response === "taken") {
                        errorMessage.innerText = "닉네임이 중복되었습니다.";
                    } else {
                        errorMessage.innerText = "닉네임 사용 가능합니다.";
                    }
                }
            };
            xhr.send();
        }

        function checkEmail() {
            var email = document.getElementsByName("email")[0].value;
            var errorMessage = document.getElementById("emailError");
            if (email === "") {
                errorMessage.innerText = ""; 
                return;
            }
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "register?action=checkEmail&email=" + encodeURIComponent(email), true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var response = xhr.responseText;
                    if (response === "taken") {
                        errorMessage.innerText = "이메일이 이미 사용 중입니다.";
                    } else {
                        errorMessage.innerText = "이메일 사용 가능합니다.";
                    }
                }
            };
            xhr.send();
        }

        function PassLength() {
            var password = document.getElementById("password").value;
            var errorMessage = document.getElementById("passError");
            if (password.length < 8) {
                errorMessage.innerText = "비밀번호는 8글자 이상이어야 합니다.";
            } else {
                errorMessage.innerText = ""; 
            }
        }

        function send() {
            if (frm.email.value === "") {
                alert("이메일을 입력하세요");
                frm.email.focus();
                return false;
            }
            if (frm.nickname.value === "") {
                alert("닉네임을 입력하세요");
                frm.nickname.focus();
                return false;
            }
            if (frm.password.value === "") {
                alert("비밀번호를 입력하세요");
                frm.password.focus();
                return false;
            }
            if (frm.passcheck.value === "") {
                alert("비밀번호 확인을 입력하세요");
                frm.passcheck.focus();
                return false;
            }
            if (frm.password.value !== frm.passcheck.value) {
                alert("비밀번호가 일치하지 않습니다.");
                frm.passcheck.focus();
                return false;
            }
            if (frm.password.value.length < 8) {
                alert("비밀번호는 8글자 이상이어야 합니다.");
                frm.password.focus();
                return false;
            }
            alert("정상적으로 등록되었습니다.");
            return true; 
        }

        function rewrite() {
            alert("취소합니다.");
            frm.reset();  
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form name="frm" method="post" action="register" onsubmit="return send()">
            이메일: <input type="email" name="email" onkeyup="checkEmail()" required>
            <div id="emailError"></div><br>
            닉네임: <input type="text" id="nickname" name="nickname" onkeyup="checkNickname()" required>
            <div id="nicknameError"></div><br> 
            비밀번호: <input type="password" id="password" name="password" onkeyup="PassLength()" required>
            <div id="passError"></div><br> 
            비밀번호 확인: <input type="password" name="passcheck" required><br>
            <input type="submit" value="가입하기" onClick="send()">
            <input type="button" value="취소하기" onClick="rewrite()">
        </form>
    </div>
</body>
</html>