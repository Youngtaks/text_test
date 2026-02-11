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
	.logo{background-color:skyblue; color:white; padding:22px 0; text-align:center;}
	.nav{padding:18px 0; overflow:hidden; background-color:#BCA9F5;}
	.nav ul,li{float:left; text-align:center; padding:0 22px;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{padding:22px; text-align:center;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text_align:center;}
	.footer{background-color:skyblue; color:white; padding:22px 0; text-align:center;}

</style>
<script>

	function cancel(){
	history.back();
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">배드민터 코트예약 관리프로그램</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="insert.jsp">코트예약</a></li>
							<li><a href="cote.jsp">코트예약조회</a></li>
							<li><a href="d_list.jsp">사용일수조회</a></li>
							<li><a href="index.jsp">홈으로</a></li>
						
						</ul>
					
					</nav>
				
				</div>
		</header>
	
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">코트예약정보가 존재하지 않습니다</h2>
				<form name="frm" method="post" action="cote_pro.jsp">
						<table>
							
					
							<tr>
								<th colspan=1 class="btn_group">
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