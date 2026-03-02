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
		.logo{text-align:center; padding:22px 0; color:white; background-color:skyblue;}
		.nav{overflow:hidden; background-color:#BCA9F5; padding:18px 0;}
		.nav ul li{float:left; padding:0 22px; text-align:center;}
		.content{padding:0 18px; background-color:#E6E6E6;}
		.title{padding:22px; text-align:center;}
		.content table{width:650px; margin:0 auto;}
		.content table th,td{border:1px solid #bbb;}
		.content table .btn_group{text-align:center;}
		.footer{text-align:center; padding:22px 0; color:white; background-color:skyblue;}
</style>
<script>
	function send(){
		if(!frm.resv_no.value){
			alert("예약번호가 일치하지 않습니다.");
			frm.resv_no.focus();
			return;
		}
		if(!frm.cust_no.value){
			alert("고객번호가 일치하지 않습니다.");
			frm.cust_no.focus();
			return;
		}
		if(!frm.resv_date.value){
			alert("예약일자가 일치하지 않습니다.");
			frm.resv_date.focus();
			return;
		}
		if(!frm.court_no.value){
			alert("코트번호가 일치하지 않습니다.");
			frm.court_no.focus();
			return;
		}
		alert("정상적으로 등록되었습니다");
			frm.submit();
			
	}
	function cancel(){
		alert("정보를 지우고 다시입력합니다.");
		frm.reset();
		frm.resv_no.focus();
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">배드민턴코트예약관리프로그램</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="insert.jsp">코트예약</a></li>
						<li><a href="cote.jsp">코트예약조회</a></li>
						<li><a href="u_list.jsp">사용일수조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
					</ul>
				</nav>
			</div>
		</header>
	</div>
		<div class="section">
			<section>
				<div class="content">
					<h2 class="title">코트예약</h2>
					<form name="frm" method="post" action="insert_pro.jsp">
						<table>
							<tr>
								<th>예약번호</th>
								<td>
									<input type="text" name="resv_no">
								</td>
							</tr>
							<tr>
								<th>고객번호</th>
								<td>
									<input type="text" name="cust_no">
								</td>
							</tr>
							<tr>
								<th>예약일자</th>
								<td>
									<input type="text" name="resv_date">
								</td>
							</tr>
							<tr>
								<th>코트번호</th>
								<td>
									<input type="text" name="court_no">
								</td>
							</tr>
							<tr>
								<th	colspan="2" class="btn_group">
									<input type="button" value="코트예약조회" onclick="send()">
									<input type="button" value="홈으로" onclick="cancel()">
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