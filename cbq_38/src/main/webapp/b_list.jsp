<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
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
	.logo{text-align:center; color:white; background-color:skyblue; padding:22px 0;}
	.nav{padding:18px 0; background-color:#BCA9F5; overflow:hidden;}
	.nav ul,li{text-align:center; float:left; padding:0 22px;}
	.content{padding:0 18px; background-color:#E6E6E6;}
	.title{padding:22px; text-align:center;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	,conetnt table .btn_group{text-align:center;}
	.footer{text-align:center; color:white; background-color:skyblue; padding:22px 0;}
</style>

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">보험고객관리프로그램 Ver 1.0</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="c_insert.jsp">고객등록</a></li>
						<li><a href="p_insert.jsp">보험계약</a></li>
						<li><a href="b_list.jsp">보험조회</a></li>
						<li><a href="t_list.jsp">보험통계</a></li>
						<li><a href="index.jsp">홈으로</a></li>
					
					</ul>
				</nav>
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">보험등록리스트조회</h2>
					<table>
						<tr>
							<th>고객코드</th>
							<th>고객성명</th>
							<th>생년월일</th>
							<th>직장명</th>
							<th>계약상품명</th>
							<th>계약담당자</th>
							<th>상품가격</th>
						</tr>
						<% for(DTO dto:list){ %>
						<tr>
							<th><%=dto.getCode() %></th>
							<th><%=dto.getName() %></th>
							<th><%=dto.getBirth().substring(0,4)+"년"+dto.getBirth().substring(4,6)+"월"+dto.getBirth().substring(6,8)+"일" %></th>
							<th><%=dto.getCompany() %></th>
							<th><%=dto.getProduct() %></th>
							<th><%=dto.getManager() %></th>
							<th style="text-align:right">￦<%=String.format("%,d", dto.getPrice()) %></th>
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
			<p>HRDKOREA Copyright@2025 All Right reserved.Humen Resources Development of Korea</p>
		</footer>
	</div>
</body>
</html>