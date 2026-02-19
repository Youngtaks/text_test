<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	List<DTO>list=dao.y_list();
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
<script>
	function send(){
		if(!frm.syear.value){
			alert("학년 정보가 입력되지 않았습니다");
			frm.syear.focus();
			return;
		
		}
		if(frm.sno.value==="0"){
			alert("번호를 선택하세요");
			frm.sno.focus();
			return;
		}
		if(!frm.kor.value){
			alert("국어성적이 입력되지 않았습니다");
			frm.kor.focus();
			return;
		
		}
		if(!frm.eng.value){
			alert("영어성적이 입력되지 않았습니다");
			frm.eng.focus();
			return;
		
		}
		if(!frm.mat.value){
			alert("수학성적이 입력되지 않았습니다");
			frm.mat.focus();
			return;
		
		}
		alert("정상적으로 등록되었습니다.");
		frm.submit();
	}
		function cancel(){
			alert("정보를 지우고 다시 입력합니다.");
			frm.reset();
			
		}
</script>
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
				<h2 class="title">과정평가형 자격CBQ</h2>
				<form name="frm" method="post" action="p_insert_pro.jsp">
					<table>
					<tr>
							<th>학년</th>
							<td>
								<input type="text" name="syear">
							</td>
						</tr>
					<tr>
						<th> 반,번호</th>
						<td>
							<select name="sno">
								<option value="0"> 반,번호를 선택하시오</option>
								<%for(DTO dto:list){ %>
								<option value="<%=dto.getSclass()%>">반
								[<%=dto.getSclass() %>]번호<%=dto.getSno() %></option>
								<%} %>
							</select>
						</td>
					</tr>
						<tr>
							<th>국어</th>
							<td>
								<input type="text" name="kor">
							</td>
						</tr>
						<tr>
							<th>영어</th>
							<td>
								<input type="text" name="eng">
							</td>
						</tr>
						<tr>
							<th>수학</th>
							<td>
								<input type="text" name="mat">
							</td>
						</tr>
						<tr>
							<th colspan=2 class="btn_group">
								<input type="button" value="등록하기" onclick="send()">
								<input type="button" value="취소하기" onclick="cancel()">
							</th>
						</tr>
					</table>
				
				</form>
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