<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
    List<DTO>list=dao.b_list();
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
			<h1 class="logo">차량주행관리프로그램</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
								<li><a href="c_list.jsp">차량조회</a></li>
							<li><a href="insert.jsp">주행내역등록</a></li>
							<li><a href="j_list.jsp">주행내역조회</a></li>
							<li><a href="b_list.jsp">부서별주행통계</a></li>
							<li><a href="index.jsp">홈으로</a></li>
						
						</ul>
					
					</nav>
				
				</div>
		</header>
	
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">(부서별)주행통계</h2>
					<table>
						<tr>
							<th>부서코드</th>
							<th>부서명</th>
							<th>모델</th>
							<th>출발km</th>
							
						</tr>
				<%
				for(DTO dto:list){
				%>	
					<tr>
						<th><%=dto.getDept_code() %></th>
						<th><%=dto.getDept_name() %></th>
						<th style="text-align:right"><%=dto.getT_drv()%></th>
						<th style="text-align:right">\<%=String.format("%,d", dto.getT_money()) %></th>
						
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