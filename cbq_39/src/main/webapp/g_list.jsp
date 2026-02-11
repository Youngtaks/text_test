<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	request.setCharacterEncoding("utf-8");
    DAO dao=new DAO();
    List<DTO>list=dao.g_list();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin:0; padding:0;}
	ul li{list-style:none; }
	a{text-decoration:none;color:white;}
	.logo{text-align:center; color:white; background-color:skyblue; padding:18px 0;}
	.nav{background-color:#BCA9F5; overflow:hidden; padding:16px 0;}
	.nav ul li{text-align:center; float:left; padding:0 22px;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{text-align:center; padding:18px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{text-align:center; color:white; background-color:skyblue; padding:18px 0;}

</style>

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">오디션관리프로그램</h1>
			<div class="nav">
				<ul class="navi">
					<li><a href="insert.jsp">오디션등록</a></li>
						<li><a href="p_list.jsp">참가자목록조회</a></li>
						<li><a href="m_list.jsp">멘토점수조회</a></li>
						<li><a href="g_list.jsp">참가자등수조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
				</ul>
			</div>
			
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">참가자등수조회</h2>
					<table>
						<tr>
							
							<th>참가번호</th>
							<th>참가자명</th>
							<th>성별</th>
							<th>총점</th>
							<th>평균</th>
							<th>등수</th>
						
						</tr>
					<% 
						int rank=0;
					for(DTO dto:list){
						rank++;
						%>
					<tr>
						<th><%=dto.getArtist_id() %></th>
						<th><%=dto.getArtist_name() %></th>
						<th><%="M".equals(dto.getArtist_gender()) ? "남성" :
							"F".equals(dto.getArtist_gender()) ? "여성" : "-"
								
							%></th>
						<th><%=dto.getT_point() %></th>
						<th><%=String.format("%.2f",(double)dto.getAvg() ) %></th>
						<th><%=rank %></th>
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