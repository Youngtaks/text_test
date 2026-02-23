<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
    	List<DTO>list=dao.s_list();
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
	.logo{color:white; text-align:center; padding:22px 0; background-color:skyblue;}
	.nav{padding:18px 0; overflow:hidden; background-color:#BCA9F5;}
	.nav ul,li{float:left; padding:0 22px; text-align:center;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{padding: 22px; text-align:center;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table btn_group{text-align:center;}
	.footer{color:white; text-align:center; padding:22px 0; background-color:skyblue;}
	

</style>

</head>
<body>
		<div class="header">
			<header>
				<h1 class="logo">올림픽 체조경기 프로그램</h1>
				<div class="nav">
					<ul class="navi">
						<li><a href="p_list.jsp">참가자 목록조회</a></li>
						<li><a href="insert.jsp">심사점수등록</a></li>
						<li><a href="s_list.jsp">심사점수 조회</a></li>
						<li><a href="ps_list.jsp">참가자등수 조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
						
					
					</ul>
				
				</div>
			</header>
			
		</div>
		<div class="section">
			<section>
			<div class="content">
				<h2 class="title">심사점수 조회</h2>
							<table>
								<tr>
									<th>선수번호</th>
									<th>선수명</th>
									<th>심사위원1</th>
									<th>심사위원2</th>
									<th>심사위원3</th>
									<th>심사위원4</th>
									<th>총점</th>
									<th>평균</th>
								</tr>
								<%for(DTO dto:list){ %>
								<tr>
									<th><%=dto.getPlayer_no() %></th>
									<th><%=dto.getName() %></th>
									<th><%=dto.getPoint_1() %></th>
									<th><%=dto.getPoint_2() %></th>
									<th><%=dto.getPoint_3() %></th>
									<th><%=dto.getPoint_4() %></th>
									<th><%=dto.getTot() %></th>
									<th><%=dto.getAve() %></th>
									
								
								</tr>
								
								
								<%} %>
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