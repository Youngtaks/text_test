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
		.logo{text-align:center; padding:22px 0; color:white; background-color:skyblue;}
		.nav{overflow:hidden; background-color:#BCA9F5; padding:18px 0;}
		.nav ul li{float:left; padding:0 22px; text-align:center;}
		.content{padding:0 18px; background-color:#E6E6E6;}
		.title{padding:22px; text-align:center;}
		.content table{width:650px; margin:0 auto;}
		.content table th,td{border:1px solid #bbb;}
		.content table .btn_group{text-align:center;}
		.footer{text-align:center; padding:22px 0; color:white; background-color:skyblue;}
</style>
<script>
	function send(){
		if(!frm.w_workno.value){
			alert("작업지시번호가 입력되지 않았습니다");
			frm.w_workno.focus();
			return;
		}
		if(!frm.p_p1[0].checked && !frm.p_p1[1].checked){
			alert(" 재료준비항목이 선택되지 않았습니다");
			frm.p_p1.focus();
			return;
		}
		if(!frm.p_p2[0].checked && !frm.p_p2[1].checked){
			alert(" 인쇄공정 항목이 선택되지 않았습니다!");
			frm.p_p2.focus();
			return;
		}
		if(!frm.p_p3[0].checked && !frm.p_p3[1].checked){
			alert(" 코팅공정 항목이 선택되지 않았습니다!");
			frm.p_p3.focus();
			return;
	}
		if(!frm. w_lastdate.value){
			alert("최종작업일자을 입력하지 않았습니다");
			frm.w_lastdate.focus();
			return;
		}
		if(!frm. w_lasttime.value){
			alert("최종작업시간을 입력하지 않았습니다");
			frm.w_lasttime.focus();
			return;
		}
		alert("정상적으로 등록되었습니다.")
		frm.submit();
	}
	function cancel(){
		alert("정보를 지우고 다시 입력합니다");
		frm.reset();
	}
	function update(){
		alert("작업공정 상태가 정상적으로 수정되었습니다");
	}

</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">스마트공정 공정관리프로그램</h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="s_list.jsp">제품조회</a></li>
						<li><a href="w_list.jsp">작업지시조회</a></li>
						<li><a href="w_insert.jsp">작업지시등록</a></li>
						<li><a href="p_insert.jsp">작업공정등록</a></li>
						<li><a href="p_list.jsp">작업공정조회</a></li>
						<li><a href="index.jsp">홈으로</a></li>
					</ul>
				</nav>
			</div>
		</header>
	</div>
		<div class="section">
			<section>
				<div class="content">
					<h2 class="title">작업지시등록</h2>
					<form name="frm" method="post" action="p_insert_pro.jsp">
						<table>
							<tr>
								<th>작업지시번호</th>
								<td>
								<input type="text" name="w_workno">
								</td>
							</tr>
						<tr>
							<th>재료준비</th>
							<td  style="text-align:center">
								<input type="radio" name="p_p1"value="Y">완료
								<input type="radio" name="p_p1"value="N">작업중
							</td>
						</tr>
						<tr>
							<th>인쇄공정</th>
							<td  style="text-align:center">
								<input type="radio" name="p_p2"value="Y">완료
								<input type="radio" name="p_p2"value="N">작업중
							</td>
						</tr>
						<tr>
							<th>코팅공정</th>
							<td style="text-align:center">
								<input type="radio" name="p_p3"value="Y">완료
								<input type="radio" name="p_p3"value="N">작업중
							</td>
						</tr>
						
						
						<tr>
								<th>작업작업일자</th>
								<td>
								<input type="text" name="w_lastdate">
								</td>
							</tr>
							<tr>
								<th>작업작업시간</th>
								<td>
								<input type="text" name="w_lasttime">
								</td>
							</tr>
							<tr>
							<th colspan=2 class="btn_group">
							<input type="button" value="공정등록" onclick="send()">
							<input type="button" value="공정수정" onclick="frm.action='update_pro.jsp'">
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