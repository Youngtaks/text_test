<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" type="text/css" href="../css/UpdatePass.css">
    <script>
        function checkPassword() {
            var password = document.getElementById("password").value;
            var errorMessage = document.getElementById("passwordError");
            var specialChar = /[!@#$%^&*(),.?":{}|<>]/;

            errorMessage.innerText = ""; 
            if (password === "") {
                return;
            }

            if (!specialChar.test(password)) {
                errorMessage.innerText = "비밀번호는 최소 하나의 특수문자를 포함해야 합니다.";
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "check_current_password", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var response = xhr.responseText;
                    if (response === "invalid") {
                        errorMessage.innerText = "비밀번호가 올바르지 않습니다.";
                    } else {
                        errorMessage.innerText = ""; 
                    }
                }
            };
            xhr.send("password=" + encodeURIComponent(password));
        }

        function updatePassword() {
            var newpass = document.getElementsByName("newpassword")[0].value; // name 속성 변경
            var checknewpass = document.getElementsByName("checknewpass")[0].value;
            var errorMessage = document.getElementById("passwordError");

            if (newpass !== checknewpass) {
                alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }
            
            alert("비밀번호가 성공적으로 변경되었습니다.");
            return true; // 폼 제출 허용
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>비밀번호 변경</h2>
        <form action="/updatepass" method="post" onsubmit="return updatePassword();">
            <div class="input-group">
                <label for="password">현재 비밀번호:</label>
                <input type="password" id="password" name="password" onkeyup="checkPassword()" required>
                <div id="passwordError" class="error-message"></div>
            </div>
            <div class="input-group">
                <label for="newpass">새 비밀번호:</label>
                <input type="password" name="newpassword" required> 
            </div>
            <div class="input-group">
                <label for="checknewpass">비밀번호 확인:</label>
                <input type="password" name="checknewpass" required>
            </div>
            <input type="submit" value="비밀번호 변경">
        </form>
    </div>
</body>
</html>
