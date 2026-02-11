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
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">쇼핑몰회원관리프로그램</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="insert.jsp">회원등록</a></li>
						<li><a href="c_list.jsp">회원목록조회/수정</a></li>
						<li><a href="b_list.jsp">회원매출조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
						
						
					
					</ul>
				
				</nav>
			
			</div>
		</header>
	</div>
		<div class="section">
			<section>
				<div class="content">
					<h2 class="title">과정평가형 cbq</h2>
					<form name="frm" method="post" action="insert_pro.jsp">
						<table>
							<tr>
								<th>회원번호(자동발생)</th>
								<td>
								<input type="text" name="custno">
								</td>
							
							</tr>
							<tr>
								<th>회원성명</th>
								<td>
								<input type="text" name="custname">
								</td>
							
							</tr>
							<tr>
								<th>회원전화</th>
								<td>
								<input type="text" name="phone">
								</td>
							
							</tr>
							<tr>
								<th>회원주소</th>
								<td>
								<input type="text" name="address">
								</td>
							
							</tr>
							<tr>
								<th>가입일자</th>
								<td>
								<input type="text" name="joindate">
								</td>
							
							</tr>
							<tr>
								<th>고객등급[A:vip,B:일반,C:직원])</th>
								<td>
								<input type="text" name="grade">
								</td>
							
							</tr>
							<tr>
								<th>도시코드</th>
								<td>
								<input type="text" name="city">
								</td>
							
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