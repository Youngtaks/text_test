<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <% DAO dao=new DAO();
    	String nvl=dao.nvl();
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
<script>
	function send(){
		if(!frm.subjectcode.value){
			alert("수강코드가 입력되지 않았습니다");
			frm.subjectcode.focus();
			return;
		}
		if(!frm.mid.value){
			alert("중간점수가 입력되지 않았습니다");
			frm.mid.focus();
			return;
		}
		if(!frm.final_exam.value){
			alert("기말이 입력되지 않았습니다");
			frm.final_exam.focus();
			return;
		}
		if(!frm.report.value){
			alert("레포트가 입력되지 않았습니다");
			frm.report.focus();
			return;
		}
		if(!frm.attend.value){
			alert("출석이 입력되지 않았습니다");
			frm.attend.focus();
			return;
		}
		if(!frm.etc.value){
			alert("기타가 입력되지 않았습니다");
			frm.etc.focus();
			return;
		}
		alert("정상적으로 등록되었습니다");
		frm.submit();
	}
	function cancel(){
		alert("정보를 지우고 다시입력합니다");
		frm.reset();
		frm.subjectcode.focus();
	}
</script>
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
				<h2 class="title">과정평가형 자격CBQ</h2>
				<form name="frm" method="post" action="insert_pro.jsp">
					<table>
						<tr>
							<th>학번</th>
							<td>
							<input type="text" name="studentid" value="<%=nvl %>" readonly>
							</td>
						</tr>
						<tr>
							<th>수강코드</th>
							<td>
							<input type="text" name="subjectcode">예)S001
							</td>
						</tr>
						<tr>
							<th>중간30%(0~100)</th>
							<td>
							<input type="text" name="mid">
							</td>
						</tr>
						<tr>
							<th>기말30%(0~100)</th>
							<td>
							<input type="text" name="final_exam">
							</td>
						</tr>
						<tr>
							<th>레포트20%(0~100)</th>
							<td>
							<input type="text" name="report">
							</td>
						</tr>
						<tr>
							<th>출석10~(0~100)</th>
							<td>
							<input type="text" name="attend">
							</td>
						</tr>
						<tr>
							<th>기타10%(0~100)</th>
							<td>
							<input type="text" name="etc">
							</td>
						</tr>
						<tr>
							<th colspan=2 class="btn_group">
								<input type="button" value="등록" onclick="send()">
								<input type="button" value="다시등록" onclick="cancel()">
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