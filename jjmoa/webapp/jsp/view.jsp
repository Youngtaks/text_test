<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.jjm.jjmoa.model.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/view.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<title>View Page</title>
</head>

<jsp:include page="header.jsp"></jsp:include>

<body>
	<div class="content-box">
		<div class="content">
			<div class="content-title">
				<h1>${ publish.publish_name }</h1>
				<input type="hidden" id="publish_idx" value="${ publish.publish_idx }" >
				<div class="bookmarkDiv">
				<svg class="bookmarkSvg" xmlns="http://www.w3.org/2000/svg" width="30px" height="30px" viewBox="0 -960 960 960" fill="white">
				    <path d="m389-400 91-55 91 55-24-104 80-69-105-9-42-98-42 98-105 9 80 69-24 104ZM200-120v-640q0-33 23.5-56.5T280-840h400q33 0 56.5 23.5T760-760v640L480-240 200-120Zm80-122 200-86 200 86v-518H280v518Zm0-518h400-400Z" fill="${ publish.isScrap ? '#06f' : 'grey' }"/>
				</svg>
				</div>
			</div>
			<div class="content-header">
				<!-- 테이블을 만들어서 핵심 정보 출력  -->
				<div class="summary-box">
					<div class="table-box">
						<table class="summary-tbl">
							
							<tr>
								<th colspan="2" style="text-align : center;" class="tbl-title">자격요건</th>
							</tr>
							<tr><th> <br> </th></tr>
							<tr>
								<th>직무</th>
								<td>${ publish.jobcategory_name }</td>
							</tr>
							
							<tr>
								<th>경력</th>
								<td>${ publish.career }</td>
							</tr>
							
							<tr>
								<th>교육</th>
								<td>${ publish.education }</td>
							</tr>
							<% PublishDTO publish = (PublishDTO) request.getAttribute("publish");
								if(publish.getEmployment_type() != null){ %>
							<tr>
								<th>고용형태 </th>
								<td>${ publish.employment_type }</td>
							</tr>
							<% } %>
						</table>
						<table class="summary-tbl summary-tbl2" >
							
							<tr>
								<th colspan="2" style="text-align : center;" class="tbl-title">근무조건</th>
							</tr>
							<tr><th> <br> </th></tr>
							<tr>
							<tr>
								<th>언어</th>
								<td>${ publish.language_skill }</td>
							</tr>
							<tr>
								<th>급여 </th>
								<td>${ publish.salary }</td>
							</tr>
							<tr>
								<th>근무시간 </th>
								<td>${ publish.working_hours }</td>
							</tr>
						</table>
						<table class="summary-tbl summary-tbl3" >
							
							<tr>
								<th colspan="2" style="text-align : center;" class="tbl-title">공고관련</th>
							</tr>
							<tr><th> <br> </th></tr>
							<tr>
							<tr>
								<th>공고 시작일 </th>
								<td>${ publish.start_date }</td>
							</tr>
							<tr>
								<th>공고 마감일 </th>
								<td>${ publish.end_date }</td>
							</tr>
							<tr>
								<th>Powered By </th>
								<td>${ publish.publish_source }</td>
							</tr>
						</table>
					</div>
					<%-- <div class="end-date-box">
						<p>공고 시작일 ${ publish.start_date }<br>
							공고 마감일 ${ publish.end_date }</p>
						<a href="${ publish_source_link }">
						<img src="/image/${ publish.publish_source }.png" class="publish_logo"></a>
					</div> 
					--%>
				</div><!-- summary-box -->
			</div><!-- content-header -->
			<div class="content-main">
				<p>${ publish.content }</p>
				<!-- <button type="button" class="btn-detailpage" onClick="javascript:detailPage()">상세페이지</button> -->
				<a href="${ publish.url }"><p style="font-size : 12px;">url ${ publish.url }</p></a>
			</div>
					
			<div class="content-footer">
				<p>등록 날짜 : ${ publish.regdate.split(" ")[0] }</p>
			</div>
			
		</div><!-- content -->
	</div><!-- content-box -->


<script src="../js/view.js"></script>
<script>
	function detailPage(){
		var url = "${ publish.url }"
		window.location.href = url;
	}
</script>
<jsp:include page="footer.jsp"></jsp:include>
<!-- 
</body>
</html>

 -->