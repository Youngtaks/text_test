<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% 
 	DAO dao=new DAO();
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
	ul,li{list-style:none;}
	a{text-decoration:none; color:white;}
	.logo{color:white; background-color:skyblue; padding:22px 0; text-align:center;}
	.nav{padding:18px 0; background-color:#BCA9F5; overflow:hidden;}
	.nav ul,li{float:left; text-align:center; padding:0 22px;}
	.content{padding:0 18px; background-color:#E6E6E6;}
	.title{text-align:center; padding:18px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center; }
	.footer{color:white; background-color:skyblue; padding:22px 0; text-align:center;}
	

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
						<li><a href="code.jsp">선수개인조회</a></li>
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
					<h2 class="title">선수개인조회</h2>
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
						<% for(DTO dto:list){ 
							int point=dto.getGrade();
							
							String grade="";
							if(point>=90){
								grade="A";
							}else if(point>=80){
								grade="B";
							}else if(point>=70){
								grade="C";
							}else if(point>=60){
								grade="D";
							}else{
								grade="F";
							}
							char first=dto.getRegistration_code().charAt(0);
							String team="";
							if (first=='A'){
								team="1군";
							}else if(first=='B'){
								team="2군";
							}
							
						%>
						<tr>
							<th><%=dto.getRegistration_code() %></th>
							<th><%=dto.getName() %></th>
							<th><%=dto.getBirth_day().substring(0,4)+"년"+dto.getBirth_day().substring(4,6)+"월"+dto.getBirth_day().substring(6,8)+"일" %></th>
							<th><%=dto.getHeight() %></th>
							<th><%=dto.getWeight() %></th>
							<th><%=team%></th>
							<th><%=grade %></th>
							<th><%=dto.getRank() %></th>
						
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