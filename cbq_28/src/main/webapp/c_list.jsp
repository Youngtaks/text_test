<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
	List<DTO>list=dao.c_list();
    	
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
	.logo{color:white; background-color:skyblue; text-align:center; padding:16px 0;}
	.nav{overflow:hidden; padding:22px 0; background-color:#BCA9F5;}
	.nav ul,li{padding:0 18px; text-align:center; float:left;}
	.content{background-color:#E6E6E6; padding:0 16px;}
	.title{text-align:center; padding:22px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content btn_group{text-align:center;}
	.footer{color:white; background-color:skyblue; text-align:center; padding:16px 0;}
	

</style>

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">과정평가형 정보처리산업기사 지역구의원 </h1>
			<div class="nav">
					<ul class="navi">
						<li><a href="c_list.jsp">후보조회</a></li>
						<li><a href="insert.jsp">투표하기</a></li>
						<li><a href="v_list.jsp">투표검수조회</a></li>
						<li><a href="s_list.jsp">후보자등수</a></li>
						<li><a href="index.jsp">홈으로</a></li>
					
					</ul>
				
				
			</div>
		</header>
		
	</div>
	<div class="section">
		<section>
			<div class="content">
			<h2 class="title">후보조회</h2>
			<table>
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>소속정당</th>
					<th>학력</th>
					<th>주민번호</th>
					<th>지역구</th>
					<th>대표전화</th>
				
				
				</tr>
				<%
					for(DTO dto:list){
				
				%>
					<tr>
						<th><%=dto.getM_no() %></th>
						<th><%=dto.getM_name() %></th>
						<th><%=dto.getP_name() %></th>
						<th><%="1".equals(dto.getP_school())?"고졸":
								"2".equals(dto.getP_school())?"학사":
								"3".equals(dto.getP_school())?"석사":
								"4".equals(dto.getP_school())?"박사":";"
							%></th>
						<th><%=dto.getM_jumin().substring(0,6)+"-"+dto.getM_jumin().substring(6,13) %></th>
						<th><%=dto.getM_city() %></th>
						<th><%=dto.getP_tel() %></th>
					
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