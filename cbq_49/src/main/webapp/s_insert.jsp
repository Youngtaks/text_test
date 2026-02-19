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
			alert("학년정보가 입력되지 않았습니다");
			frm.syear.focus();
			return;
		}
		if(!frm.sclass.value){
			alert("반정보가 입력되지 않았습니다");
			frm.sclass.focus();
			return;
		}
		if(!frm.sno.value){
			alert("번호가 입력되지 않았습니다");
			frm.sno.focus();
			return;
		}
		if(!frm.sname.value){
			alert("이름이 입력되지 않았습니다");
			frm.sname.focus();
			return;
		}
		if(!frm.birth.value){
			alert("생일이 입력되지 않았습니다");
			frm.birth.focus();
			return;
		}
		if(!frm.gender[0].checked &&!frm.gender[1].checked){
			alert("성별이 선택되지 않았습니다.");
			frm.gender.focus();
			return;
		}
		if(!frm.tel1.value || !frm.tel2.value || !frm.tel3.value){
			alert("전화번호가 입력되지 않았습니다.");
			frm.tel1.focus();
			return;
		}
		alert("정상적으로 등록되었습니다.");
		frm.submit();
	}
		function cancel(){
			alert("정보를 지우고 다시 입력합니다.");
			frm.reset();
			frm.syear.focus();
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
				<form name="frm" method="post" action="s_insert_pro.jsp">
					<table>
						<tr>
							<th>학년</th>
							<td>
								<input type="text" name="syear">예)1
							</td>
						</tr>
						<tr>
							<th>반</th>
							<td>
								<input type="text" name="sclass">예)01
							</td>
						</tr>
						<tr>
							<th>번호</th>
							<td>
								<input type="text" name="sno">예)01
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="sname">
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<input type="text" name="birth">예)20190301
							</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<input type="radio" value="M" name="gender">남자
								<input type="radio" value="F" name="gender">여자
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" name="tel1" size="4">-
								<input type="text" name="tel2" size="4">-
								<input type="text" name="tel3" size="4">
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