<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% 
    DAO dao=new DAO();
    List<DTO>list=dao.use_list();
    	
    %>
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
					<h2 class="title">사용일수집계</h2>
						
							<table>
								<tr>
									<th>고객번호</th>
									<th>이름</th>
									<th>사용일수</th>
									
									
								</tr>
								<%for (DTO dto:list){ 
								
								%>
								<tr>
									<th><%=dto.getCust_no() %></th>
									<th><%=dto.getCust_name() %></th>
									<th><%=dto.getUse_days() %></th>
								
								
								</tr>
								
								
								
								<%} 
								
								%>
							</table>
						
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