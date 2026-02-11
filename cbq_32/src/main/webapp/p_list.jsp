<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*"
    
    %>
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
			<h1 class="logo">물류창고 입출고 프로그램</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="p_list.jsp">제품조회</a></li>
							<li><a href="insert.jsp">입출고등록</a></li>
							<li><a href="n_list.jsp">입출고내역조회</a></li>
							<li><a href="m_list.jsp">출고매출이익</a></li>
							<li><a href="index.jsp">홈으로</a></li>
						
						</ul>
					
					</nav>
				
				</div>
		</header>
	
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">제품조회</h2>
				<table>
					<tr>
						<th>제품코드</th>
						<th>제품명</th>
						<th>사이즈</th>
						<th>매입단가</th>
						<th>출고단가</th>
					</tr>
					<%
						for(DTO dto:list){
							
					%>
					<tr>
						<th><%=dto.getP_code() %></th>
						<th><%=dto.getP_name() %></th>
						<th><%=dto.getP_size()+"mm" %></th>
						<th style="text-align:right"><%="￦"+String.format("%,d", dto.getP_incost()) %></th>
						<th style="text-align:right"><%="￦"+String.format("%,d", dto.getP_outcost()) %></th>
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