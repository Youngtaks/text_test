<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin:0; padding:0;}
	ul li{list-style:none;}
	a{text-decoration:none; color:white;}
	.logo{text-align:center; color:white; background-color:skyblue; padding:22px 0;}
	.nav{padding:18px 0; background-color:#BCA9F5; overflow:hidden;}
	.nav ul,li{text-align:center; float:left; padding:0 22px;}
	.content{padding:0 18px; background-color:#E6E6E6;}
	.title{padding:22px; text-align:center;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{text-align:center; color:white; background-color:skyblue; padding:22px 0;}
</style>
<script>
	function send(){
		if(!frm.code.value){
			alert("고객코드가 입력되지 않았습니다!");
			frm.code.focus();
			return;
		}
		if(!frm.name.value){
			alert("이름이 입력되지 않았습니다!");
			frm.name.focus();
			return;
		}
		if(!frm.birth.value){
			alert("생년월일이 입력되지 않았습니다!");
			frm.birth.focus();
			return;
		}
		if(!frm.company.value){
			alert("직장명이 입력되지 않았습니다!");
			frm.company.focus();
			return;
		}
		alert("고객등록이 완료되었습니다!");
		frm.submit();
	}
	function cancel(){
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		frm.reset();
		frm.code.focus();
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">보험고객관리프로그램 Ver 1.0</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="c_insert.jsp">고객등록</a></li>
						<li><a href="p_insert.jsp">보험계약</a></li>
						<li><a href="b_list.jsp">보험조회</a></li>
						<li><a href="t_list.jsp">보험통계</a></li>
						<li><a href="index.jsp">홈으로</a></li>
					
					</ul>
				</nav>
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">고객등록</h2>
					<form name="frm" method="post" action="c_insert_pro.jsp">
						<table>
							<tr>
								<th>고객코드</th>
								<td>
									<input type="text" name="code">예)S202501
								</td>
							</tr>
							<tr>
								<th>고객성명</th>
								<td>
									<input type="text" name="name">
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="text" name="birth">2009년6월28일 예)20090628
								</td>
							</tr>
							<tr>
								<th>직장명</th>
								<td>
									<input type="text" name="company">
								</td>
							</tr>
							<tr>
								<th colspan=2 class="btn_group">
								<input type="button" value="등록" onclick="send()">
								<input type="button" value="다시쓰기" onclick="cancel()">
								</th>
							</tr>
						</table>
					</form>
			</div>
		</section>
	</div>
	<div class="footer">
		<footer>
			<p>HRDKOREA Copyright@2025 All Right reserved.Humen Resources Development of Korea</p>
		</footer>
	</div>
</body>
</html>