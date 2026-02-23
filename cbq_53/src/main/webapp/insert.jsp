<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
    	DTO dto=new DTO();
    	int update=dao.update(dto);
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
	.logo{color:white; text-align:center; padding:22px 0; background-color:skyblue;}
	.nav{padding:18px 0; overflow:hidden; background-color:#BCA9F5;}
	.nav ul,li{float:left; padding:0 22px; text-align:center;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{padding: 22px; text-align:center;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table btn_group{text-align:center;}
	.footer{color:white; text-align:center; padding:22px 0; background-color:skyblue;}
	

</style>
<script>
	function send(){
		if(!frm.player_no.value){
			alert(" 선수번호가 입력되지 않았습니다");
			frm.player_no.focus();
			return;
		}
		if(!frm.point_1.value){
			alert(" 심사위원 점수1이 입력되지 않았습니다");
			frm.point_1.focus();
			return;
		}
		if(!frm.point_2.value){
			alert(" 심사위원 점수2이 입력되지 않았습니다");
			frm.point_2.focus();
			return;
		}
		if(!frm.point_3.value){
			alert(" 심사위원 점수3이 입력되지 않았습니다");
			frm.point_3.focus();
			return;
		}
		if(!frm.point_4.value){
			alert(" 심사위원 점수4가 입력되지 않았습니다");
			frm.point_4.focus();
			return;
		}
		alert("정상적으로 등록되었습니다.")
		frm.submit();
	}
	function cancel(){
		alert("정보를 지우고 다시 입력합니다");
		frm.reset();
		frm.player_no.focus();
	}
	function update(){
		alert("정상적으로 수정되었습니다.");
		
	}

</script>
</head>
<body>
		<div class="header">
			<header>
				<h1 class="logo">올림픽 체조경기 프로그램</h1>
				<div class="nav">
					<ul class="navi">
						<li><a href="p_list.jsp">참가자 목록조회</a></li>
						<li><a href="insert.jsp">심사점수등록</a></li>
						<li><a href="s_list.jsp">심사점수 조회</a></li>
						<li><a href="ps_list.jsp">참가자등수 조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
						
					
					</ul>
				
				</div>
			</header>
			
		</div>
		<div class="section">
			<section>
			<div class="content">
				<h2 class="title">심사점수 등록</h2>
				<form name="frm" method="post" action="insert_pro.jsp">
					<table>
						<tr>
							<th>선수번호</th>
							<td>
								<input type="text" name="player_no">
							</td>
						</tr>
						<tr>
							<th>심사원1</th>
							<td>
								<input type="text" name="point_1">
							</td>
						</tr>
						<tr>
							<th>심사원2</th>
							<td>
								<input type="text" name="point_2">
							</td>
						</tr>
						<tr>
							<th>심사원3</th>
							<td>
								<input type="text" name="point_3">
							</td>
						</tr>
						<tr>
							<th>심사원4</th>
							<td>
								<input type="text" name="point_4">
							</td>
						</tr>
						<tr>
							<th colspan=2 class="btn_group">
								<input type="button" value="등록하기" onclick="send()">
								<input type="button" value="수정하기"  onclick="frm.action='update_pro.jsp'; frm.submit()">
								<input type="button" value="취소하기" onclick="cancel();">
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