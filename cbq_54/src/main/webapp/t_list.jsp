<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	List<DTO>list=dao.t_list();
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
	.content table .btn_group{text-align:center;}
	.footer{color:white; text-align:center; padding:22px 0; background-color:skyblue;}
	

</style>

</head>
<body>
		<div class="header">
			<header>
				<h1 class="logo">골프연습장 프로그램</h1>
				<div class="nav">
					<ul class="navi">
						<li><a href="t_list.jsp">강사정보조회</a></li>
						<li><a href="insert.jsp">수강신청</a></li>
						<li><a href="p_list.jsp">회원정보 조회</a></li>
						<li><a href="tm_list.jsp">강사별 매출통계</a></li>
						<li><a href="index.jsp">홈으로</a></li>
						
					
					</ul>
				
				</div>
			</header>
			
		</div>
		<div class="section">
			<section>
			<div class="content">
				<h2 class="title">수강신청</h2>
					<table>
						<tr>
							<th>강사코드</th>
							<th>강의명</th>
							<th>강사명</th>
							<th>수강료</th>
							<th>강사자격획득일</th>
						</tr>
					<% for(DTO dto:list){ %>
						<tr>
							<th><%=dto.getTeacher_code() %></th>
							<th><%=dto.getClass_name() %></th>
							<th><%=dto.getTeacher_name() %></th>
							<th><%="￦"+String.format("%,d", (int)dto.getClass_price()) %></th>
							<th><%=dto.getTeacher_regist_date().substring(0,4)+"년"+dto.getTeacher_regist_date().substring(4,6)+"월"+dto.getTeacher_regist_date().substring(6,8)+"일" %></th>
						
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