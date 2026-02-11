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
	.logo{color:white; padding:16px 0; text-align:center; background-color:skyblue;}
	.nav{padding:22px 0; background-color:#BCA9F5; overflow:hidden;}
	.nav ul,li{float:left; text-align:center; padding:0 18px;}
	.content{background-color:#E6E6E6; padding:0 22px;}
	.title{text-align:center; padding:18px}
	.content table{border:650px; margin: 0 auto;}
	.content table th,td{width:1px solid #bbb;}
	.content table .btn_group{text-align:center;}
	.footer{color:white; padding:16px 0; text-align:center; background-color:skyblue;}	

</style>
<script>
	function send(){
		if(!frm.artist_id.value){
			alert("참가번호가 입력되지 않았습니다.");
			frm.artist_id.focus();
			return;
		}
		if(!frm.artist_name.value){
			alert("참가자명이 입력되지 않았습니다.");
			frm.artist_name.focus();
			return;
		}
		if(!frm.artist_year.value ||!frm.artist_month.value||!frm.artist_day.value){
			alert("생년월일이 입력되지 않았습니다.");
			frm.artist_year.focus();
			return;
		}
		if(!frm.artist_gender[0].checked &&!frm.artist_gender[1].checked ){
			alert("성별 선택되지 않았습니다.");
			frm.artist_gender[0].focus();
			return;
		}
		if(frm.talent.value==="0"){
			alert("특기가 선택되지 않았습니다");
			frm.talent.focus();
			return;
		}
		if(!frm.agency.value){
			alert("소속사가 입력되지 않았습니다.");
			frm.agency.focus();
			return;
		}
		alert("정상적으로 등록되었습니다.");
		frm.submit();
		
	}
	function cancel(){
		alert("정보를 지우고 다시 입력합니다");
		frm.reset();
		frm.artist_id.focus();
	}
</script>
</head>
<body>
		<div class="header">
			<header>
				<h1 class="logo">(과정평가형 정보처리산업기사)오디션 관리프로</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="insert.jsp">오디션등록</a></li>
							<li><a href="p_list.jsp">참가자목록조회</a></li>
							<li><a href="m_list.jsp">멘토점수조회</a></li>
							<li><a href="g_list.jsp">참가자등수조회</a></li>
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
									<th>참가번호</th>
									<td><input type="text" name="artist_id">*참가번호는(A000)4자리입니다</td>
								</tr>
								<tr>
									<th>참가자명</th>
								<td><input type="text" name="artist_name"></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
									<input type="text" name="artist_year" size=4>년
									<input type="text" name="artist_month" size=3>월
									<input type="text" name="artist_day" size=3>일
									</td>
									
								</tr>
								<tr>
									<th>성별</th>
									<td>
									<input type="radio" value="M" name="artist_gender">남성
									<input type="radio" value="F" name="artist_gender">여성
									
									</td>
								
								</tr>
								<tr>
									<th>특기</th>
									<td>
									<select name="talent">
									<option value="0">특기</option>
									<option value="1">댄스</option>
									<option value="2">랩</option>
									<option value="3">노래</option>
									
									
									</select>
									</td>
								</tr>
								<tr>
								<th>소속사</th>
								<td>
								<input type="text" name="agency">
								</td>
								</tr>
								<tr>
									<th colspan=2 class="btn_group">
										<input type="button" value="오디션등록" onclick="send()">
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