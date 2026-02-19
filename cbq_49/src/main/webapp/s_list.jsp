<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	List<DTO>list=dao.s_list();
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
			<h1 class="logo">고교성적등록 프로그램</h1>
			<div class="nav">
				<ul class="navi">
				<li><a href="s_insert.jsp">학생등록</a></li>
				<li><a href="p_insert.jsp">성적등록</a></li>
				<li><a href="s_list.jsp">성적조회</a></li>
				<li><a href="c_list.jsp">반별통계</a></li>
				<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">학생성적조회</h2>
					<table>
						<tr>
							<th>학년-반-번호</th>
							<th>이름</th>
							<th>성별</th>
							<th>국어</th>
							<th>영어</th>
							<th>수학</th>
							<th>총점</th>
							<th>평균</th>
						</tr>
					<% 
					
					for(DTO dto:list){ 
						
					%>
						<tr>
							<th><%=dto.getSyear()+"-"+dto.getSclass()+"-"+dto.getSno()%></th>
							<th><%=dto.getSname() %></th>
							<th><%="M".equals(dto.getGender())?"남자":
									"F".equals(dto.getGender())?"여자":""
								%></th>
							<th><%=dto.getKor() %></th>
							<th><%=dto.getEng() %></th>
							<th><%=dto.getMat() %></th>
							<th><%=dto.getTot() %></th>
							<th><%=String.format("%.1f", dto.getAve()) %></th>
						</tr>
						
						<%
						}
						%>
						<%
						int tkor=0;
						int teng=0;
						int tmat=0;
						for(DTO dto:list){ 
							
							tkor+=dto.getKor();
							teng+=dto.getEng();
							tmat+=dto.getMat();}
						
						double akor=0;
						double aeng=0;
						double amat=0;
						if(list.size()>0){
							akor=(double)tkor/list.size();
							aeng=(double)teng/list.size();
							amat=(double)tmat/list.size();
						}
						%>
						
						
							<tr>
						
							<th></th>
							<th></th>
							<th>전체총점</th>
							<th><%=tkor %></th>
							<th><%=teng %></th>
							<th><%=tmat %></th>
							<th></th>
							<th></th>
						</tr>
						<tr>
   					 		<th></th>
    						<th></th>
   							 <th>학년평균</th>
   							 <th><%=String.format("%.1f", akor)%></th>
   							 <th><%=String.format("%.1f", aeng)%></th>
   							 <th><%=String.format("%.1f", amat)%></th>
   							 <th></th>
    						<th></th>
						</tr>
						
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