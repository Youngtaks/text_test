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
			<h1 class="logo">야구선수 성적관리 프로그램</h1>
			<div class="nav">
				<ul class="navi">
				<li><a href="s_insert.jsp">선수성적등록</a></li>
				<li><a href="p_insert.jsp">선수개인조회</a></li>
				<li><a href="m_list.jsp">선수단체조회</a></li>
				<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
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
					rank++;
					double score=dto.getGrade();
					
					String grade="";
					if(score>=90){
						grade="A";
					}else if(score>=80){
						grade="B";
					}else if(score>=70){
						grade="C";
					}else if(score>=60){
						grade="D";
					}else{
						grade="F";
					}
					%>
					<tr>
						<th><%=dto.getRegistration_code() %></th>
						<th><%=dto.getName() %></th>
						<th><%=dto.getBirth_day().substring(0,4)+"년"+dto.getBirth_day().substring(4,6)+"월"+dto.getBirth_day().substring(6,8)+"일" %></th>
						<th><%=dto.getHeight() %></th>
						<th><%=dto.getWeight() %></th>
						<th><%=dto.getRegistration_code().startsWith("A")?"1군":
							dto.getRegistration_code().startsWith("B")?"2군":""
							%></th>
						<th><%=grade %></th>
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