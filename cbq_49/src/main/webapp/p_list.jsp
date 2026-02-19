<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	List<DTO>list=dao.p_list();
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
	a{text-decoration:none;color:white;}
	.logo{color:white; background-color:skyblue; text-align:center; padding:18px 0;}
	.nav{padding:16px; overflow:hidden; background-color:#BCA9F5;}
	.nav ul,li{float:left; padding:0 22px; text-align:center;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{text-align:center; padding:22px;}
	.content table{width:650px; margin: 0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{color:white; background-color:skyblue; text-align:center; padding:18px 0;}
</style>

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">고교성적등록 프로그램</h1>
			<div class="nav">
				<ul class="navi">
				<li><a href="s_insert.jsp">학생등록</a></li>
				<li><a href="p_insert.jsp">성적등록</a></li>
				<li><a href="s_list.jsp">성적조회</a></li>
				<li><a href="c_list.jsp">반별통계</a></li>
				<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">학생성적조회</h2>
					<table>
						<tr>
							<th>학년</th>
							<th>반</th>
							<th>교사명</th>
							<th>국어총점</th>
							<th>영어총점</th>
							<th>수학총점</th>
							<th>국어평균</th>
							<th>영어평균</th>
							<th>수학평균</th>
						</tr>
					<% 
					
					for(DTO dto:list){ 
						
					%>
						<tr>
						<th><%=dto.getSyear() %></th>	
						<th><%=dto.getSclass() %></th>	
						<th><%=dto.getTname() %></th>	
						<th><%=dto.getTkor() %></th>	
						<th><%=dto.getTeng() %></th>	
						<th><%=dto.getTmat() %></th>	
						<th><%=String.format("%.1f", dto.getAkor()) %></th>	
						<th><%=String.format("%.1f", dto.getAeng()) %></th>	
						<th><%=String.format("%.1f", dto.getAmat()) %></th>	
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