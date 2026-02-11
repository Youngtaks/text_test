<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% 
    	request.setCharacterEncoding("utf-8");
    DAO dao=new DAO();
    List<DTO>list=dao.a_list();
    
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
	.logo{color:white; background-color:skyblue; text-align:center; padding:22px 0;}
	.nav{padding:18px 0; background-color:#BCA9F5; overflow:hidden; }
	.nav ul,li{text-align:center; float:left; padding:0 22px;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{text-align:center; padding:22px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{color:white; background-color:skyblue; text-align:center; padding:0 22px;}	

</style>

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">대기오염관측 프로그램</h1>
			<div class="nav">
				<ul class="navi">
					<li><a href="v_list.jsp">관측지점조회</a></li>
					<li><a href="insert.jsp">대기오염측정등록</a></li>
					<li><a href="c_list.jsp">측정이력조회</a></li>
					<li><a href="a_list.jsp">지역별관측조회</a></li>
					<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
			
			</div>
		
		</header>
	
	</div>
		<div class="section">
			<section>
				<div class="content">
					<h2 class="title">관측지점조회</h2>
					<table>
						<tr>
							<th>관측일자</th>
							<th>관측지점명</th>
							<th>일평균수치</th>
							<th>상태</th>
							
						
						
						</tr>
					<%
					for(DTO dto:list){
						int avg=dto.getTot_test_value();
					
					%>
					<tr>
						<th><%=dto.getTest_date() %></th>
						<th><%=dto.getCity_name() %></th>
						<th><%=dto.getTot_test_value() %></th>
						<th><% if(avg>150){
							out.print("매우나쁨");
						}else if(avg>=81){
							out.print("나쁨");
						}else if(avg>=31){
							out.print("보통");
						}else if(avg>=0){
							out.print("좋음");
						}
						%></th>
						
					
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
			<p>HDSK 한국산업인력공단 Copylight@2020 All right reserved Human Resource Development Service of korea</p>
			</footer>
		</div>
</body>
</html>