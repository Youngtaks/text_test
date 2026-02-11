<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin:0; padding:0;}
	ul,li{list-style:none;}
	a{text-decoration:none; color:white;}
	.logo{background-color:skyblue; padding:22px 0; color:white; text-align:center;}
	.nav{overflow:hidden; background-color:#BCA9F5; padding:18px 0;}
	.nav ul,li{float:left; padding:0 22px; text-align:center;}
	.content{background-color:#E6E6E6; padding:0 18px;}
	.title{text-align:Center; padding:22px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{background-color:skyblue; padding:22px 0; color:white; text-align:center;}
	
	
</style>
<script>
	function send(){
		if(!frm.test_date.value){
			alert("관측일자 정보를 입력하지 않았습니다");
			frm.test_date.focus();
			return;
		}
		if(!frm.test_ampm[0].checked && !frm.test_ampm[1].checked){
			alert("측정시기를 선택하지 않았습니다");
			frm.test_date.focus();
			return;
		}
		if(!frm.pollution.value){
			alert("대기오염코드를 입력하지 않았습니다");
			frm.pollution.focus();
			return;
		}
		if(frm.city_code.value==="00"){
			alert("관측지점코드를 선택하지 않았습니다");
			frm.city_code.focus();
			return;
		}
		if(!frm.test_value.value){
			alert("측정값을 입력하지 않았습니다");
			frm.test_value.focus();
			return;
		}
		alert("측정값 정보가 정상적으로 등록되었습니다")
		frm.submit();
	}
	function cancel(){
		alert("정보를 지우고 다시 입력합니다");
		frm.reset();
		frm.test_date.focus();
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">대기오염관측프로그램</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="c_list.jsp">관측지점조회</a></li>
						<li><a href="insert.jsp">대기오염측정등록</a></li>
						<li><a href="p_list.jsp">측정이력조회</a></li>
						<li><a href="a_list.jsp">지역별관측조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
					
					</ul>
				</nav>
			
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">과정평가형 cbq</h2>
				<form name="frm" method="post" action="insert_pro.jsp">
					<table>
						<tr>
							<th>관측일자</th>
							<td><input type="text" name="test_date"></td>
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
							<td><input type="text" name="pollution">(p1:미세먼지,p2:오존,p3:자외선,p4:황사)</td>
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
							<option value="06">[60]대구</option>
							</select>
							</td>
						</tr>
						<tr>
							<th>측정값</th>
							<td><input type="text" name="test_value"></td>
						</tr>
						<tr>
						<th colspan=2 class="btn_group">
							<input type="button" value="측정값등록" onclick="send()">
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
		<p>HDSK 한국산업인력공단 Copylight@2020 All right reserved Human Resource Development Service of korea</p>
		</footer>
	</div>
</body>
</html>