<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%DAO dao=new DAO();
    	List<DTO>list=dao.g_list();
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
	.logo{padding:22px 0; background-color:skyblue; color:white; text-align:center;}
	.nav{padding:18px 0; overflow:hidden; background-color:#BCA9F5;}
	.nav ul,li{text-align:Center; padding:0 22px; float:left;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{text-align:center; padding:18px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{padding:22px 0; background-color:skyblue; color:white; text-align:center;}

</style>

</head>
<body>
		<div class="header">
			<header>
				<h1 class="logo">(과정평가형 정보처리산업기사)오디션 관리프로</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="insert.jsp">오디션등록</a></li>
							<li><a href="p_list.jsp">참가자목록조회</a></li>
							<li><a href="m_list.jsp">멘토점수조회</a></li>
							<li><a href="g_list.jsp">참가자등수조회</a></li>
							<li><a href="index.jsp">홈으로</a></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<div class="section">
			<section>
				<div class="content">
					<h2 class="title">참가자등수조회</h2>
					<table>
						<tr>
							
							<th>참가번호</th>
							<th>참가자명</th>
							<th>성별</th>
							<th>총점</th>
							<th>평군</th>
							<th>등수</th>
						
						</tr>
						<%
						int rank=0;
						for(DTO dto:list){ 
							
							rank++;
						%>
						<tr>
						
							<th><%=dto.getArtist_id() %></th>
							<th><%=dto.getArtist_name() %></th>
							<th><%="M".equals(dto.getArtist_gender().trim())?"남자":
								"F".equals(dto.getArtist_gender().trim())?"여자":"~"
								%></th>
							<th><%=dto.getTot() %></th>
							<th><%=String.format("%.2f",(double)dto.getAve()) %></th>
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