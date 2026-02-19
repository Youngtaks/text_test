<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,model.*" %>
    <%
    	DAO dao=new DAO();
    String nvl=dao.nvl();
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
		if(!frm.test_ampm[0].checked && !frm.test_ampm[1].checked){
			alert("측정시기가 선택되지 않았습니다");
			frm.test_ampm[0].focus();
			return;
		}
		if(!frm.pollution.value){
			alert("대기오염코드가 입력되지 않았습니다");
			frm.pollution.focus();
			return;
		}
		if(frm.city_code.value==="00"){
			alert("관측지점번호를 선택하세요");
			frm.city_code.focus();
			return;
		}
		if(!frm.test_value.value){
			alert("측정값을 입력되지 않았습니다");
			frm.test_value.focus();
			return;
		}
		alert("정상적으로 등록되었습니다.");
		frm.submit();
			
	}
	function cancel(){
		alert("정보를 지우고 다시 입력합니다");
		frm.reset();
		frm.test_ampm[0].focus();
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">대기오염관측 프로그램</h1>
			<div class="nav">
				<ul class="navi">
				<li><a href="a_list.jsp">관측지점조회</a></li>
				<li><a href="insert.jsp">대기오염측정등록</a></li>
				<li><a href="s_list.jsp">측정이력조회</a></li>
				<li><a href="p_list.jsp">지역별관측조회</a></li>
				<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">대기오염측정등록</h2>
				<form name="frm" method="post" action="insert_pro.jsp">
					<table>
						<tr>
							<th>관측일자</th>
							<td>
								<input type="text" name="test_date" value="<%=nvl %>">
							</td>
						</tr>
						<tr>
							<th>측정시기</th>
							<td>
								<input type="radio" name="test_ampm" value="AM">오전(AM)
								<input type="radio" name="test_ampm" value="PM">오후(PM)
							</td>
						</tr>
						<tr>
							<th>대기오염코드</th>
							<td>
								<input type="text" name="pollution">(P1:미세먼지,P2:오존,P3:자외선,P4:황사)
							</td>
						</tr>
						<tr>
							<th>관측지점번호</th>
							<td>
								<select name="city_code">
									<option value="00">관측지점</option>
									<option value="01">[01]서울</option>
									<option value="02">[02]경기</option>
									<option value="03">[03]인천</option>
									<option value="04">[04]세종</option>
									<option value="05">[05]대전</option>
									<option value="06">[06]대구</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>측정값</th>
							<td>
								<input type="text" name="test_value">
							</td>
						</tr>
						<tr>
							<th colspan=2 class="btn_group">
							<input type="button" value="측정값등록" onclick="send()">
							<input type="button" value="다시쓰기" onclick="cancel()">
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