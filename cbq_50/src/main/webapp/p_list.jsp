<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
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
			<h1 class="logo">대기오염관측 프로그램</h1>
			<div class="nav">
				<ul class="navi">
				<li><a href="a_list.jsp">관측지점조회</a></li>
				<li><a href="insert.jsp">대기오염측정등록</a></li>
				<li><a href="s_list.jsp">측정이력조회</a></li>
				<li><a href="p_list.jsp">지역별관측조회</a></li>
				<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">대기오염측정등록</h2>
				<table>
					<tr>
						<th>관측일자</th>
						<th>관측지점명</th>
						<th>일평균수치</th>
						<th>상태</th>
						
						
					</tr>
					<%for(DTO dto:list){
							int ave=dto.getAve();	
						String condition="";
							if(ave>150){
								condition="매우나쁨";
							}else if(ave>=81){
								condition="나쁨";
							}else if(ave>30){
								condition="보통";
							}else if(ave>=0){
								condition="좋음";
							}
						%>
						<tr>
							<th><%=dto.getTest_date().substring(0,4)+"년"+dto.getTest_date().substring(4,6)+"월"+dto.getTest_date().substring(6,8)+"일" %></th>
							<th><%=dto.getCity_name() %></th>
							<th><%=dto.getAve() %></th>
							<th><%=condition %></th>
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