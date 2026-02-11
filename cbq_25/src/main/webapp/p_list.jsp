<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%DAO dao=new DAO();
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
	ul,li{list-style:none;}
	a{text-decoration:none; color:white;}
	.logo{background-color:skyblue; padding:22px 0; color:white; text-align:center;}
	.nav{overflow:hidden; background-color:#BCA9F5; padding:18px 0;}
	.nav ul,li{float:left; padding:0 22px; text-align:center;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{text-align:Center; padding:22px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{background-color:skyblue; padding:22px 0; color:white; text-align:center;}
	
	
</style>

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">대기오염관측프로그램</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="c_list.jsp">관측지점조회</a></li>
						<li><a href="insert.jsp">대기오염측정등록</a></li>
						<li><a href="p_list.jsp">측정이력조회</a></li>
						<li><a href="a_list.jsp">지역별관측조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
					
					</ul>
				</nav>
			
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">과정평가형 cbq</h2>
				<table>
					<tr>
						<th>관측일자</th>
						<th>측정시기</th>
						<th>대기오염코드</th>
						<th>관측지점번호</th>
						<th>관측지점명</th>
						<th>권역지역명</th>
						<th>측정값</th>
					
					</tr>
					<%
						for(DTO dto:list){
					%>
						<tr>
							<th><%=dto.getTest_date().substring(0,4)+"년"+dto.getTest_date().substring(4,6)+"월"+dto.getTest_date().substring(6,8)+"일" %></th>
							<th><%="AM".equals(dto.getTest_ampm())?"오전":
									"PM".equals(dto.getTest_ampm())?"오후":"~"
								%></th>
							<th><%=dto.getPollution() %></th>
							<th><%=dto.getCity_code()%></th>
							<th><%=dto.getCity_name() %></th>
							<th><%=dto.getArea_name()%></th>
							<th><%=dto.getTest_value()
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