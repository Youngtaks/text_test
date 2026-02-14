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
 var c_no2=0;
	function send(){
		if(!frm.c_no.value){
			alert("회원번호가 입력되지 않았습니다");
			frm.c_no.focus();
			return;
		}
		if(frm.class_area.value==="00"){
			alert("강의장소가 선택되지 않았습니다.");
			frm.class_area.focus();
			return;
		}
		if(frm.class_name.value==="0"){
			alert("강의선택이 선택되지 않았습니다 ");
			frm.class_name.focus();
			return;
		}
		alert("정상적으로 등록되었습니다")
		frm.submit();
	}
	function cancel(){
		alert("정보를 지우고 다시입력합니다");
		frm.reset();
		frm.c_no.focus();
	}
	//function getvalue(c_no){//select에서 선택된 value값을 가져옴
	//	document.getElementById("c_no").value=c_no;
	//c_no2=c_no;
	//}
	//function getvalue2(tuition){//select에서 value값을 tuition으로 가져옴
		//var t=parseInt(tuition);
		//if(c_no2>=20000)
			//document.getElementById("tuition").value=t/2;
		//else
			//document.getElementById("tuition").value=t;
	//}
	//
	function getvalue(c_no){
		document.getElementById("c_no").value=c_no;
		c_no2=c_no;
	}
	function getvalue2(tuition){
		var t=parseInt(tuition);
		if(c_no2>=20000)
			document.getElementById("tuition").value=t/2;
		else
			document.getElementById("tuition").value=t;
	}
</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">골프 연습장 회원관리 프로그램</h1>
			<div class="nav">
				<ul class="navi">
				<li><a href="t_list.jsp">강사정보조회</a></li>
				<li><a href="insert.jsp">수강신청</a></li>
				<li><a href="c_list.jsp">회원정보조회</a></li>
				<li><a href="p_list.jsp">강사별매출통계</a></li>
				<li><a href="index.jsp">홈으로</a></li>
				
				</ul>
			</div>
		</header>
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">과정평가형 자격CBQ</h2>
					<form name="frm" method="post" action="insert_pro.jsp">
						<table>
							<tr>
								<th>수강월</th>
								<td>
									<input type="text" name="regist_month" value="<%=nvl %>" >2023년03월 예)202303
								</td>
							</tr>
							<tr>
								<th>회원명</th>
								<td>
									<select name="c_name" onchange="getvalue(this.value)">
										<option value="00">회원명</option>
										<option value="10001">[10001]홍길동</option>
										<option value="10002">[10002]장발장</option>
										<option value="10003">[10003]임꺽정</option>
										<option value="20001">[20001]성춘향</option>
										<option value="20002">[20002]이몽룡</option>
									
									</select>
								</td>
							</tr>
							<tr>
								<th>회원번호</th>
								<td>
									<input id="c_no" name="c_no" readonly >예)10001
								</td>
							</tr>
							<tr>
								<th>강의장소</th>
								<td>
									<select name="class_area">
										<option value="00">강의장소</option>
										<option value="서울본원">서울본원</option>
										<option value="성남본원">성남본원</option>
										<option value="대전본원">대전본원</option>
										<option value="부산본원">부산본원</option>
										<option value="대구본원">대구본원</option>
									
									</select>
								</td>
							</tr>
							<tr>
								<th>강의선택</th>
								<td>
									<select name="class_name"  onchange="getvalue2(this.value)" >
										<option value="0">강의선택</option>
										<option value="100000" >[100]초급반</option>
										<option value="200000" >[200]중급반</option>
										<option value="300000" >[300]고급반</option>
										<option value="400000" >[400]심화반</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>수강료</th>
								<td>
									<input id="tuition" name="tuition" readonly >
									
								</td>
							</tr>
							
							<tr>
								<th colspan=2 class="btn_group">
									<input type="button" value="수강신청" onclick="send()">
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