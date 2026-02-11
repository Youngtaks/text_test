<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin:0; padding:0;}
	ul,li{list-style:none;}
	a{text-decoration:none; color:white;}
	.logo{color:white; background-color:skyblue; padding:22px 0; text-align:center;}
	.nav{padding:18px 0; background-color:#BCA9F5; overflow:hidden;}
	.nav ul,li{float:left; text-align:center; padding:0 22px;}
	.content{padding:0 18px; background-color:#E6E6E6;}
	.title{text-align:center; padding:18px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center; }
	.footer{color:white; background-color:skyblue; padding:22px 0; text-align:center;}
	

</style>
<script>
	function send(){
		if(!frm.registration_code.value){
			alert("선수코드가 입력되지 않았습니다");
			frm.registration_code.focus();
			return;
		}
		
		
		frm.submit();
		
	}
		function cancel(){
			alert("정보를 지우고 다시 입력합니다.");
			frm.reset();
			frm.registration_code.focus();
		}

</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">야구선수성적관리프로그램</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="insert.jsp">선수성적등록</a></li>
						<li><a href="p_list.jsp">선수개인조회</a></li>
						<li><a href="m_list.jsp">선수단체조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
						
					
					</ul>
				
				</nav>
			
			</div>
		</header>
	</div>
		<div class="section">
			<section>
				<div class="content">
					<h2 class="title">선수개인조회</h2>
					<form name="frm" method="post" action="code_pro.jsp">
					<table>
						<tr>
							<th>선수코드</th>
							<td><input type="text" name="registration_code"></td>
						</tr>
						
						<tr>
							<th colspan=2 class="btn_group">
								<input type="button" value="선수등록" onclick="send()">
								<input type="button" value="다시등록" onclick="cancel()">
							</th>
						</tr>
					</table>
						</form>
				</div>
			
			</section>
		
		</div>
		<div class="footer">
			<footer>
				<p>HRDKOREA Copyright@2016 All rights reserve. Human Resources 
			Development Serivce of Korea</p>
				</footer>
		</div>
</body>
</html>