<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin:0; padding:0;}
	ul li{list-style:none;}
	a{text-decoration:none; color:white;}
	.logo{background-color:skyblue; color:white; padding:22px 0; text-align:center;}
	.nav{padding:18px 0; overflow:hidden; background-color:#BCA9F5;}
	.nav ul,li{float:left; text-align:center; padding:0 22px;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{padding:22px; text-align:center;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text_align:center;}
	.footer{background-color:skyblue; color:white; padding:22px 0; text-align:center;}

</style>
<script>
	function send(){
		if(!frm.regist_month.value){
			alert("수강월일 입력되지 않았습니다");
			frm.regist_month.focus();
			return;
		}
		if(frm.c_name.value==="0"){
			alert("회원명이 선택되지 않았습니다.");
			frm.c_name.focus();
			return;
		}
		if(!frm.c_no.value){
			alert("회원번호가 입력되지 않았습니다.");
			frm.c_no.focus();
			return;
		}
		if(!frm.class_area.value){
			alert("강의장소가 입력되지 않았습니다");
			frm.class_area.focus();
			return;
		}
		if(frm.class_name.value==="0"){
			alert("강의가 선택되지 않았습니다.");
			frm.class_name.focus();
			return;
		}
		if(!frm.tuition.value){
			alert("수강료가 입력되지 않았습니다");
			frm.tution.focus();
			return;
		}
		alert("정상적으로 등록되었습니다");
		frm.submit();
	}
	function cancel(){
		alert("정보를 지우고 처음부터 다시 입력합니다.");
		frm.reset();
		frm.regist_month.focus();
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">골프연습장 회원관리프로그램</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="t_list.jsp">강사정보조회</a></li>
							<li><a href="insert.jsp">수강신청</a></li>
							<li><a href="c_list.jsp">회원정보조회</a></li>
							<li><a href="tc_list.jsp">강사별매출통계</a></li>
							<li><a href="index.jsp">홈으로</a></li>
						
						</ul>
					
					</nav>
				
				</div>
		</header>
	
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">수강신청</h2>
					<form name="frm" method="post" action="insert_pro.jsp">
						<table>
							<tr>
								<th>수강월</th>
								<td>
									<input type="text" name="regist_month">2022년3월 예)202203
								</td>
								
							
							</tr>
						<tr>
							<th>회원명</th>
							<td>
							<select name="c_name" onchange="this.form.c_no.value=this.value">
								<option value="0">회원명</option>
								<option value="10001">[10001]이혜정</option>
								<option value="10002">[10002]조아라</option>
								<option value="10003">[10003]유현주</option>
								<option value="20001">[20001]김미현</option>
								<option value="20002">[20002]박세리</option>
							
							
							</select>
							</td>
						
						</tr>
						<tr>
							<th>회원번호</th>
							<td>
							<input type="text" name="c_no">예)10001
							</td>
						</tr>
						<tr>
							<th>강의장소</th>
							<td>
							<input type="text" name="class_area">
							</td>
						</tr>
						<tr>
							<th>강의선택</th>
							<td>
							<select name="class_name" onchange="this.form.tuition.value=this.value" >
								<option value="0">강의선택</option>
								<option value="100">[100]초급반</option>
								<option value="200">[200]중급반</option>
								<option value="300">[300]고급반</option>
								<option value="400">[400]심화반</option>
							
							
							
							</select>
							</td>
						
						</tr>
						<tr>
							<th>수강료</th>
							<td>
							<input type="text" name="tuition">원
							</td>
						</tr>
						<tr>
							<th colspan=2 class="btn_group">
							<input type="button" value="수강신청" onclick="send()">
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