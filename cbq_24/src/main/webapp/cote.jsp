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
	.content table .btn_group{text-align:center;}
	.footer{color:white; background-color:skyblue; padding:22px 0; text-align:center;}
	

</style>
<script>
		function send(){
		
			if(!frm.cust_no.value){
				alert("고객번호가 입력되지 않았습니다.");
				frm.cust_no.focus();
				return;
			
			}
			
			frm.submit();
			
		}
		function cancel(){
			alert("정보를 지우고 다시입력합니다");
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
						<li><a href="use_list.jsp">사용일수조회</a></li>
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
						<form name="frm" method="post" action="cote_pro.jsp">
							<table>
								
								<tr>
									<th>고객번호</th>
									<td>
									<input type="text" name="cust_no">예)1001
									</td>
								
								</tr>
								
								<tr>
									<th colspan=2 class="btn_group">
										<input type="button" value="코트예약등록" onclick="send()">
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
				<p>HRDKOREA Copyright@2016 All rights reserve. Human Resources 
			Development Serivce of Korea</p>
				</footer>
		</div>
</body>
</html>