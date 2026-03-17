<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="../css/register.css">
     <link rel="icon" href="<%=request.getContextPath()%>/image/favicon.ico" type="image/x-icon">
    <script>
        let emailTimeout; 
        let nicknameTimeout; 

        function checkNickname() {
            clearTimeout(nicknameTimeout); 
            var nickname = document.getElementById("nickname").value;
            var errorMessage = document.getElementById("nicknameError");
            var nicknameSuccess = document.getElementById("nicknameSuccess"); 

            errorMessage.innerText = ""; 
            nicknameSuccess.innerText = ""; 
            
            if (nickname === "") {
                errorMessage.innerText = ""; 
                return;
            }
            
            // debounce: 500ms 후에 닉네임 체크
            nicknameTimeout = setTimeout(function() {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "check_nickname?nickname=" + nickname, true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        var response = xhr.responseText;
                        if (response === "taken") {
                            nicknameSuccess.innerText = "";
                            errorMessage.innerText = "닉네임이 중복되었습니다.";
                        } else {
                            errorMessage.innerText = ""; 
                            nicknameSuccess.innerText = "닉네임 사용 가능합니다.";
                        }
                    }
                };
                xhr.send();
            }, 500); 
        }

        function checkEmail() {
            clearTimeout(emailTimeout); 
            var email = document.getElementsByName("email")[0].value;
            var errorMessage = document.getElementById("emailError");
            var emailSuccess = document.getElementById("emailSuccess"); 

            errorMessage.innerText = ""; 
            emailSuccess.innerText = ""; 
            if (email === "") {
                errorMessage.innerText = ""; 
                return;
            }

            // debounce: 500ms 후에 이메일 체크
            emailTimeout = setTimeout(function() {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "register?action=checkEmail&email=" + encodeURIComponent(email), true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        var response = xhr.responseText;
                        if (response === "taken") {
                            emailSuccess.innerText = "";
                            errorMessage.innerText = "이메일이 중복되었습니다.";
                        } else {
                            errorMessage.innerText = "";
                            emailSuccess.innerText = "이메일 사용 가능합니다.";
                        }
                    }
                };
                xhr.send();
            }, 500); 
        }

        function PassLength() {
            var password = document.getElementById("password").value;
            var errorMessage = document.getElementById("passError");
            var passSuccess = document.getElementById("passSuccess"); 

            errorMessage.innerText = ""; 
            passSuccess.innerText = ""; 
            
            var special = /[!@#$%^&*(),.?":{}|<>]/; 
            
            if (password.length < 8) {
                passSuccess.innerText = "";
                errorMessage.innerText = "비밀번호는 8글자 이상이어야 합니다.";
            } else if (!special.test(password)) {
                passSuccess.innerText = "";
                errorMessage.innerText = "비밀번호는 최소 하나의 특수문자를 포함해야 합니다.";
            } else {
                errorMessage.innerText = ""; 
                passSuccess.innerText = "비밀번호 사용가능합니다";
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
                var mismatchError = document.getElementById("mismatchError");
                mismatchError.innerText = "비밀번호가 일치하지 않습니다."; 
                mismatchError.classList.add("error-message"); 
                frm.passcheck.focus(); 
                return false; 
            } else {
                document.getElementById("mismatchError").innerText = "";
            }
            if (frm.password.value.length < 8) {
                alert("비밀번호는 8글자 이상이어야 합니다.");
                frm.password.focus();
                return false;
            }
            alert("정상적으로 등록되었습니다.");
            return true; 
        }
        
        // 비밀번호 입력란에 이벤트 리스너 추가
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("password").addEventListener("input", function() {
                document.getElementById("mismatchError").innerText = ""; 
            });

            document.getElementsByName("passcheck")[0].addEventListener("input", function() {
                document.getElementById("mismatchError").innerText = ""; 
            });
        });
    </script>
   
</head>
<body>
    <div class="container">
        <div class="logo">
            <a href="/index">
                <img src="/image/logo_1.png" alt="Logo" class="main_logo">
            </a>
        </div>
        <form name="frm" method="post" action="/register" onsubmit="return send()">
            이메일(아이디) <input type="email" name="email" onkeyup="checkEmail()" required>
            <div id="emailError" class="error-message"></div>
            <div id="emailSuccess"></div>
            <br>
            닉네임 <input type="text" id="nickname" name="nickname" onkeyup="checkNickname()" required>
            <div id="nicknameError" class="error-message"></div>
            <div id="nicknameSuccess"></div>
            <br> 
            
            비밀번호 <input type="password" id="password" name="password" onkeyup="PassLength()" required>
            <div id="passError" class="error-message"></div>
            <div id="passSuccess"></div>
            <br> 
            비밀번호 확인 <input type="password" name="passcheck" required>
            <div id="mismatchError" class="error-message"></div> 
            <br>
            <input type="submit" value="가입하기">
        </form>
    </div>
</body>
</html>