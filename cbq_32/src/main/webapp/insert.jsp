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
		if(!frm.t_no.value){
			alert("입출고번호가 입력되지 않았습니다");
			frm.t_no.focus();
			return;
		}
		if(!frm.p_code.value){
			alert("제품코드가 입력되지 않았습니다");
			frm.p_code.focus();
			return;
		}
		if(!frm.t_type[0].checked&& !frm.t_type[1].checked){
			alert("입출고구분이 선택되지 않았습니다.");
			frm.t_type[0],focus();
			return;
			}
		if(!frm.t_cnt.value){
			alert("수량이 입력되지 않았습니다.");
			frm.t_cnt.focus();
			return;
		}
		if(!frm.t_date.value){
			alert("거래일자가 입력되지 않았습니다.");
			frm.t_date.focus();
			return;
		}
		if(frm.c_code.value==="0"){
			alert("거래처가 선택되지 않았습니다.");
			frm.c_code.focus();
			return;
		}
		alert("정상적으로 등록되었습니다.");
		frm.submit();
	}
	function cancel(){
		alert("처음부터 다시 입력합니다.");
		frm.reset();
		frm.t_no.focus();
	}
		

</script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo">물류창고 입출고 프로그램</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="p_list.jsp">제품조회</a></li>
							<li><a href="insert.jsp">입출고등록</a></li>
							<li><a href="n_list.jsp">입출고내역조회</a></li>
							<li><a href="m_list.jsp">출고매출이익</a></li>
							<li><a href="index.jsp">홈으로</a></li>
						
						</ul>
					
					</nav>
				
				</div>
		</header>
	
	</div>
	<div class="section">
		<section>
			<div class="content">
				<h2 class="title">입출고등록</h2>
				<form name="frm" method="post" action="insert_pro.jsp" >
					<table>
						<tr>
							<th>입출고번호</th>
						<td>
							<input type="text" name="t_no">예)20200006
						</td>
						</tr>
						<tr>
							<th>제품코드</th>
						<td>
							<input type="text" name="p_code">
						</td>
						</tr>					
						<tr>
							<th>입출고구분</th>
							<td>
								<input type="radio" value="I" name="t_type" checked>입고
								<input type="radio" value="O" name="t_type"  >출고
							</td>
						</tr>
						<tr>
							<th>수량</th>
						<td>
							<input type="text" name="t_cnt">
						</td>
						</tr>
						<tr>
							<th>거래일처</th>
						<td>
							<input type="text" name="t_date">
						</td>
						</tr>
						<tr>
							<th>거래처</th>
							<td>
								<select name="c_code">
									<option value="0">거래처명</option>
									<option value="10">[10]서울공장</option>
									<option value="20">[20]울산공장</option>
									<option value="30">[30]부산상사</option>
									<option value="40">[40]광주상사</option>
									<option value="50">[50]대전상사</option>
								
								</select>
							</td>
						</tr>
						<tr>
							<th colspan=2 class="btn_group">
								<input type="button" value="입출고등록" onclick="send()">
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