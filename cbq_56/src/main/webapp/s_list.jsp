<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
   
    	List<DTO>list=dao.s_list();
    
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
		.logo{text-align:center; padding:22px 0; color:white; background-color:skyblue;}
		.nav{overflow:hidden; background-color:#BCA9F5; padding:18px 0;}
		.nav ul li{float:left; padding:0 22px; text-align:center;}
		.content{padding:0 18px; background-color:#E6E6E6;}
		.title{padding:22px; text-align:center;}
		.content table{width:650px; margin:0 auto;}
		.content table th,td{border:1px solid #bbb;}
		.content table .btn_group{text-align:center;}
		.footer{text-align:center; padding:22px 0; color:white; background-color:skyblue;}
</style>

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">스마트공정 공정관리프로그램</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="s_list.jsp">제품조회</a></li>
						<li><a href="w_list.jsp">작업지시조회</a></li>
						<li><a href="w_insert.jsp">작업지시등록</a></li>
						<li><a href="p_insert.jsp">작업공정등록</a></li>
						<li><a href="p_list.jsp">작업공정조회</a></li>
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
								<th>제품규격</th>
								<th>제품구분</th>
								<th>제품단가</th>
							</tr>
						<%for(DTO dto:list){ %>
						<tr>
							<th><%=dto.getP_code() %></th>
							<th><%=dto.getP_name() %></th>
							<th><%=dto.getP_size() %></th>
							<th><%=dto.getP_type() %></th>
							<th><%="￦"+String.format("%,d", (int)dto.getP_price()) %></th>
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