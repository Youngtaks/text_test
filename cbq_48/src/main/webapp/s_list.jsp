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
			<h1 class="logo">개인성적등록 프로그램</h1>
			<div class="nav">
				<ul class="navi">
				<li><a href="s_list.jsp">전체점수조회</a></li>
				<li><a href="insert.jsp">개인성적등록</a></li>
				<li><a href="p_list.jsp">개인성적조회</a></li>
				<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">전체점수조회</h2>
				<table>
					<tr>
						<th>학번</th>
						<th>이름</th>
						<th>성별</th>
						<th>과목명</th>
						<th>전공유무</th>
						<th>교수</th>
						<th>중간</th>
						<th>기말</th>
						<th>레포트</th>
						<th>출석</th>
						<th>기타</th>
						<th>총점</th>
						<th>등급</th>
					</tr>
					<%for(DTO dto:list){ 
						String jumin = dto.getJumin();
					    String gend="";
							int gender=jumin.charAt(7);
						if(gender=='1'||gender=='3'){
							gend="남성";
					  
					    }else if(gender=='2'||gender=='4'){
					    	gend="여성";
					    }
							double score=dto.getTot();
							String grade="";
							if(score>=90){
								grade="A";
							}else if(score>=80){
								grade="B";
							}else if(score>=70){
								grade="C";
							}else if(score>=60){
								grade="D";
							}else{
								grade="F";
							}
					%>
					<tr>
						<th><%=dto.getStudentid() %></th>
						<th><%=dto.getStudentname() %></th>
						<th><%=gend %></th>
						<th><%=dto.getSubjectname() %></th>
						<th><%="01".equals(dto.getClassifiaction())?"전공필수":
								"02".equals(dto.getClassifiaction())?"전공선택":
								"03".equals(dto.getClassifiaction())?"교양필수":
								"04".equals(dto.getClassifiaction())?"교양선택":""
								 %></th>
						<th><%=dto.getProfessorname() %></th>
						<th><%=dto.getMid() %></th>
						<th><%=dto.getFinal_exam() %></th>
						<th><%=dto.getReport() %></th>
						<th><%=dto.getAttend() %></th>
						<th><%=dto.getEtc() %></th>
						<th><%=dto.getTot()%></th>
						<th><%=grade %></th>
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