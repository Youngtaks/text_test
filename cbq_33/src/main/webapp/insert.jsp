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
		if(!frm.drv_date.value){
			alert("주행일자가 입력되지 않았습니다");
			frm.drv_date.focus();
			return;
		}
		if(!frm.car_no.value){
			alert("차량번호가 입력되지 않았습니다");
			frm.car_no.focus();
			return;
			
		}
		if(!frm.drv_start.value){
			alert("출발km가 입력되지 않았습니다");
			frm.drv_start.focus();
			return;
		}
		if(!frm.drv_end.value){
			alert("도착km가 입력되지 않았습니다");
			frm.drv_end.focus();
			return;
		}
		if(frm.dept_code.value==="0"){
			alert("부서코드가 선택되지 않았습니다.");
			frm.dept_code.focus();
			return;
			
		}
		if(!frm.drv_money.value){
			alert("주유금액이 입력되지 않았습니다");
			frm.drv_money.focus();
			return;
		}
		alert("정상적으로 등록되었습니다");
		frm.submit();
	}
	function cancel(){
		alert("처음부터 다시 입력합니다");
		frm.reset();
		frm.drv_date.focus();
	}

</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">차량주행관리프로그램</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
								<li><a href="c_list.jsp">차량조회</a></li>
							<li><a href="insert.jsp">주행내역등록</a></li>
							<li><a href="j_list.jsp">주행내역조회</a></li>
							<li><a href="b_list.jsp">부서별주행통계</a></li>
							<li><a href="index.jsp">홈으로</a></li>
						
						</ul>
					
					</nav>
				
				</div>
		</header>
	
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">주행내역조회</h2>
				<form name="frm" method="post" action="insert_pro.jsp">
					<table>
						<tr>
							<th>주행일자</th>
							<td>
								<input type="text" name="drv_date">2023년01월01일 예)20230101
							</td>
						</tr>
					<tr>
							<th>차량번호</th>
							<td>
								<input type="text" name="car_no">예)10가0001
							</td>
						</tr>
						<tr>
							<th>출발km</th>
							<td>
								<input type="text" name="drv_start">km
							</td>
						</tr>
						<tr>
							<th>도착km</th>
							<td>
								<input type="text" name="drv_end">km
							</td>
						</tr>
						<tr>
							<th>부서코드</th>
							<td>
								<select name="dept_code">
									<option value="0">부서</option>
									<option value="10">[10]부서</option>
									<option value="20">[20]총무부</option>
									<option value="30">[30]구매부</option>
									<option value="40">[400]개발부</option>
								
								</select>
							</td>
						</tr>
						<tr>
							<th>주유금액</th>
							<td>
								<input type="text" name="drv_money">원
							</td>
						</tr>
						<tr>
							<th colspan=2 class="btn_group">
							<input type="button" value="주행내역등록" onclick="send()">
							<input type="button" value="다시쓰기" onclick="cancel()">
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