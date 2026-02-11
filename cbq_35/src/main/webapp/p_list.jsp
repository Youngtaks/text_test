<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    String registration_code=request.getParameter("registration_code");
    	List<DTO>list=dao.p_list(registration_code);
    	request.setCharacterEncoding("utf-8");
    %>
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

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">야구선수성적관리프로그램</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="insert.jsp">선수성적등록</a></li>
							<li><a href="player.jsp">선수개인조회</a></li>
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
				<h2 class="title">선수코드:<%=registration_code %>선수성적 조회입니다.</h2>
				<table>
					<tr>
							<th>선수코드</th>
							<th>선수이름</th>
							<th>게임 수</th>
							<th>타석수</th>
							<th>안타 수</th>
							<th>홈런 수</th>
							<th>공격 포인트</th>
							<th>아웃 카운트 수</th>
							<th>더블 플레이 수</th>
							<th>에러 수</th>
							<th>수비 포인트</th>
					</tr>
					<%
					for(DTO dto:list){
					%>
					<tr>
						<th><%=dto.getRegistration_code() %></th>
						<th><%=dto.getName() %></th>
						<th><%=dto.getGame_numbers() %></th>
						<th><%=dto.getAppearance() %></th>
						<th><%=dto.getHit_numbers() %></th>
						<th><%=dto.getHome_runs() %></th>
						<th><%=String.format("%,d", dto.getA_point()) %></th>
						<th><%=dto.getPut_out() %></th>
						<th><%=dto.getDouble_play() %></th>
						<th><%=dto.getError_count() %></th>
						<th><%=dto.getS_point() %></th>

					</tr>
				<%
					}
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