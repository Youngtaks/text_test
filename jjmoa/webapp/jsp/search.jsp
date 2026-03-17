<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.jjm.jjmoa.model.PublishDTO"%>
<%@ page import="com.jjm.jjmoa.util.CommonUtils"%>

<jsp:include page="header.jsp" />

<head>
<link rel="stylesheet" type="text/css" href="../css/search.css">


</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<main id="searchMain">

	<section class="control">
		<div class="control_left">
			<select class="select_job" onchange="categoryOnChange()">
				<option value="">직종</option>
				<c:forEach var="jobCategory" items="${jobCategoryList}">
					<option value="${jobCategory.jobcategory_idx}">${jobCategory.jobcategory_name}</option>
				</c:forEach>
			</select>
			<select class="select_platform" onchange="categoryOnChange()">
				<option value="">플랫폼</option>
				<c:forEach var="platform" items="${publishSourceList}">
					<option value="${platform}">
						<c:choose>
							<c:when test="${platform == 'worldjob'}">월드잡</c:when>
							<c:when test="${platform == 'saramin'}">사람인</c:when>
							<c:otherwise>${platform}</c:otherwise>
						</c:choose>
					</option>
				</c:forEach>
			</select>
		</div>
		<div class="control_right">
			<select class="select_sort" onchange="categoryOnChange()">
				<option value="latest">최신순</option>
				<option value="popular">스크랩순</option>
				<option value="end_date">마감순</option>
			</select>
		</div>
	</section>

	<section class="search">
		<!--  <p class="searchContent">검색어</p> -->
		<p class="searchNum">
			총<span id="spanSearchNum">0</span>건
		</p>
	</section>

	<section class="card_list result_card_list"></section>

</main>
<script src="../js/search.js"></script>

