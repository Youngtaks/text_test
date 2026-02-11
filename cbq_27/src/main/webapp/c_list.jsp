<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,model.*" %>
   <%	DAO dao=new DAO();
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
	ul,li{list-style:none;}
	a{text-decoration:none; color:white;}
	.logo{color:white; padding:16px 0; text-align:center; background-color:skyblue;}
	.nav{padding:22px 0; background-color:#BCA9F5; overflow:hidden;}
	.nav ul,li{float:left; text-align:center; padding:0 18px;}
	.content{background-color:#E6E6E6; padding:0 22px;}
	.title{text-align:center; padding:18px}
	.content table{width:650px; margin: 0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{color:white; padding:16px 0; text-align:center; background-color:skyblue;}	
	

</style>

</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">(과정평가형 정보처리산업기사)오디션 관리 프로그램ver2009-06</h1>
			<div class="nav">
				<ul class="navi">
					<li><a href="insert.jsp">오디션등록</a></li>
					<li><a href="p_list.jsp">참가자 목록조회</a></li>
					<li><a href="m_list.jsp">멘토점수조회</a></li>
					<li><a href="s_list.jsp">참가자 등수조회</a></li>
					<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
			
			</div>
		
		</header>
	
	</div>
	<div class="section">
	<section>
		<div class="content">
			<h2 class="title">참가자 등수조회</h2>
			<table>
				<tr>
					<th>참가번호</th>
					<th>참가자명</th>
					<th>성별</th>
					<th>총점</th>
					<th>평균</th>
					<th>등급</th>
				
				
				</tr>

				<%
				int rank=0;
				for(DTO dto:list){
							rank++;
						%>
						<tr>
							<th><%=dto.getArtist_id()%></th>
							<th><%=dto.getArtist_name() %></th>
							<th><%="M".equals(dto.getArtist_gender().trim())?"남자":
									"F".equals(dto.getArtist_gender().trim())?"여자":"~"
							%></th>
							<th><%=dto.getTot() %></th>
							<th><%=dto.getAve() %></th>
							<th><%=rank %></th>
						
						
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