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
	.logo{color:white; background-color:skyblue; text-align:center; padding:16px 0;}
	.nav{overflow:hidden; padding:22px 0; background-color:#BCA9F5;}
	.nav ul,li{padding:0 18px; text-align:center; float:left;}
	.content{background-color:#E6E6E6; padding:0 16px;}
	.title{text-align:center; padding:22px;}
	.content table{width:650px; margin:0 auto;}
	.content table th,td{border:1px solid #bbb;}
	.content btn_group{text-align:center;}
	.footer{color:white; background-color:skyblue; text-align:center; padding:16px 0;}
	

</style>
<script>
	function send(){
		if(!frm.v_jumin.value){
			alert("주민번호가 입력되지 않았습니다.");
			frm.v_jumin.focus();
			return;
		}
		if(!frm.v_name.value){
			alert("이름이 입력되지 않았습니다");
			frm.v_name.focus();
			return;
		}
		if(frm.m_no.value==="0"){
			alert("후보번호가 선택되지 않았습니다.")
			frm.m_no.focus();
			return;
		}
		if(!frm.v_time.value){
			alert("투표시간이 입력되지 않았습니다.");
			frm.v_time.focus();
			return;
		}
		if(!frm.v_area.value){
			alert("투표장소가 입력되지 않았습니다.")
			frm.v_area.focus();
			return;
		}
		if(frm.v_confirm.value==="0"){
			alert("유권자 확인이 선택되지 않았습니다.")
			frm.v_vonfirm.focus();
			return;
	}
		alert("정상적으로 등록되었습니다.")
		frm.submit();
	}
	function cancel(){
	alert("정보를 지우고 처음부터 다시 입력 합니다")
	frm.reset();
	frm.v_jumin.focus();
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">과정평가형 정보처리산업기사 지역구의원 </h1>
			<div class="nav">
					<ul class="navi">
						<li><a href="c_list.jsp">후보조회</a></li>
						<li><a href="insert.jsp">투표하기</a></li>
						<li><a href="v_list.jsp">투표검수조회</a></li>
						<li><a href="s_list.jsp">후보자등수</a></li>
						<li><a href="index.jsp">홈으로</a></li>
					
					</ul>
				
				
			</div>
		</header>
		
	</div>
	<div class="section">
		<section>
			<div class="content">
			<h2 class="title">투표하기</h2>
				<form name="frm" method="post" action="insert_pro.jsp">
				<table>
					<tr>
						<th>주민번호</th>
						<td>
						<input type="text"  name="v_jumin" >예)990101100001
						</td>
					</tr>
					<tr>
						<th>성명</th>
						<td>
						<input type="text"  name="v_name" >예)김유권
						</td>
					</tr>
					<tr>
						<th>후보번호</th>
						<td>
							<select name="m_no">
							<option value="0">후보번호</option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]홍후보</option>
							<option value="5">[5]조후보</option>
							
							
							</select>예)최후보
						</td>
					</tr>
				<tr>
						<th>투표시간</th>
						<td>
						<input type="text"  name="v_time" >예)09:30
						</td>
					</tr>
					<tr>
						<th>투표장소</th>
						<td>
						<input type="text"  name="v_area" >예)제1투표장
						</td>
					</tr>
					<tr>
						<th>유권자확인</th>
						<td>
							<select name="v_confirm">
							<option value="0">유권자확인</option>
							<option value="1">[N]미확인</option>
							<option value="2">[Y]확인</option>
							
							</select>[N]미확인
						</td>
					
					</tr>
					<tr>
						<th colspan=2 class="btn_group">
						<input type="button" value="투표하기" onclick="send()" >
						<input type="button" value="취소하기" onclick="cancel()" >
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