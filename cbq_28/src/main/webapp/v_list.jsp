<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
	List<DTO>list=dao.v_list();
    	
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
			<h2 class="title">투표검수조회</h2>
			<table>
				<tr>
					
					<th>성명</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>후보번호</th>
					<th>투표시간</th>
					<th>유권자확인</th>
				
				
				</tr>
				<%
					for(DTO dto:list){
					String v_jumin=dto.getV_jumin();
					String year=v_jumin.substring(0,2);
					String month=v_jumin.substring(2,4);
					String day=v_jumin.substring(4,6);
					 String gender=
								(dto.getV_jumin().charAt(6)=='1'||dto.getV_jumin().charAt(6)=='2')?"남자":"여자";
					 char code=v_jumin.charAt(6);
						String gendercode="";
						if(code=='1'){
							gendercode="남성";
						}else if(code=='2'){
							gendercode="여성";
						}
				%>
					<tr>
						<th><%=dto.getV_name() %></th>
						<th><%="19"+year+"년"+month+"월"+day+"일"%></th>
						<th><%=gendercode %></th>
						<th><%=dto.getM_no()	%></th>
						<th><%=dto.getV_time().substring(0,2)+":"+dto.getV_time().substring(2,4) %></th>
						<th><%="y".equals(dto.getV_confirm())?"확인":
							"n".equals(dto.getV_confirm())?"미확인":";" %></th>
						
					
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