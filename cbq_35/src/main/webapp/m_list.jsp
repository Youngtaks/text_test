<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	List<DTO>list=dao.m_list();
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
				<h2 class="title">선수단체조회</h2>
				<table>
					<tr>
							<th>선수코드</th>
							<th>선수이름</th>
							<th>생년월일</th>
							<th>키</th>
							<th>몸무게</th>
							<th>소속</th>
							<th>등급</th>
							<th>순위</th>
							
							
					</tr>
					<%
					int rank=0;
					for(DTO dto:list){
						rank ++;
						int grade=dto.getGrade();
						String t_grade="";
						if(grade>=90){
							t_grade="A";
						}else if(grade>=80){
							t_grade="B";
						}else if(grade>=70){
							t_grade="C";
						}else if(grade>=60){
							t_grade="D";
						}else{
							t_grade="F";
						}
					%>
					<tr>
						<th><%=dto.getRegistration_code() %></th>
						<th><%=dto.getName() %></th>
						<th><%=dto.getBirth_day().substring(0,4)+"년"+dto.getBirth_day().substring(4,6)+"년"+dto.getBirth_day().substring(6,8)+"일" %></th>
						<th><%=dto.getHeight() %></th>
						<th><%=dto.getWeight() %></th>
						<th><%=dto.getRegistration_code().startsWith("A")?"1군":
								dto.getRegistration_code().startsWith("B")?"2군":""
							%></th>
						<th><%=t_grade%></th>
						<th><%=rank %></th>
						

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