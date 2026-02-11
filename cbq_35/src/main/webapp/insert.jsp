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
		if(frm.registration_code.value==="0"){
			alert("선수코드가 선택되지 않았습니다");
			frm.registration_code.focus();
			return;
		}
		if(!frm.game_numbers.value){
			alert("게임 수가 일치가하지 않습니다.");
			frm.game_numbers.focus();
			return;
		}
		if(!frm.appearance.value){
			alert("타석 수가 일치하지 않습니다");
			frm.appearance.focus();
			return;
		}
		if(!frm.hit_numbers.value){
			alert("안타 수가 일치하지 않습니다.");
			frm.hit_numbers.focus();
			return;
		}
		if(!frm.home_runs.value){
			alert("홈런수가 일치하지 않습니다.");
			frm.home_runs.focus();
			return;
		}
		if(!frm.put_out.value){
			alert("아웃 카운트수가 일치하지 않습니다.");
			frm.put_out.focus();
			return;
		}
		if(!frm.double_play.value){
			alert("더블 플레이수가 일치하지 않습니다");
			frm.double_play.focus();
			return;
		}
		if(!frm.error_count.value){
			alert("에러 수가 일치하지 않습니다.");
			frm.error_count.focus();
			return;
		}
		alert("정상적으로 등록되었습니다.");
		frm.submit();
	
	}
	function cancel(){
		alert("처음부터 다시 등록합니다");
		frm.reset();
		frm.registration_code.focus();
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">야구선수성적관리프로그램</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="insert.jsp">선수성적등록</a></li>
							<li><a href="player.jsp">선수개인조회</a></li>
							<li><a href="m_list.jsp">선수단체조회</a></li>
							<li><a href="index.jsp">홈으로</a></li>
						
						</ul>
					
					</nav>
				
				</div>
		</header>
	
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">선수성적등록</h2>
				<form name="frm" method="post" action="insert_pro.jsp">
					<table>
						<tr>
							<th>선수코드</th>
							<td>
							<select name="registration_code">
								<option value="0">선수코드</option>
								<option value="A001">[A001]김길동</option>
								<option value="A005">[A002]이길동</option>
								<option value="B002">[B002]홍길동</option>
								<option value="B006">[B006]조길동</option>
							</select>
							</td>
						</tr>
						<tr>
						<th colspan=2 style="text-align:center; padding:22px;">공격포인트</th>
						</tr>
						<tr>
							<th>게임 수</th>
							<td>
								<input type="text" name="game_numbers">수
							</td>
						</tr>
						<tr>
							<th>타석 수</th>
							<td>
								<input type="text" name="appearance">수
							</td>
						</tr>
						<tr>
							<th>안타 수</th>
							<td>
								<input type="text" name="hit_numbers">수
							</td>
						</tr>
						<tr>
							<th>홈런 수</th>
							<td>
								<input type="text" name="home_runs">수
							</td>
						</tr>
							<tr>
						<th colspan=2 style="text-align:center; padding:22px;">수비포인트</th>
						</tr>
						<tr>
							<th>아웃카운트 수</th>
							<td>
								<input type="text" name="put_out">수
							</td>
						</tr>
						<tr>
							<th>더블플레이 수</th>
							<td>
								<input type="text" name="double_play">수
							</td>
						</tr>
						<tr>
							<th>에러 수</th>
							<td>
								<input type="text" name="error_count">수
							</td>
						</tr>
						<tr>
							<th colspan=2 class="btn_group">
							<input type="button" value="선수등록" onclick="send()">
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