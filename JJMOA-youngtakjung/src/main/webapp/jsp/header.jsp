<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JJmoa</title>
	<link rel="stylesheet" type="text/css" href="/css/common.css">
	<link rel="stylesheet" type="text/css" href="/css/header.css">
	<link rel="stylesheet" type="text/css" href="/css/footer.css">
	 <link rel="icon" href="<%=request.getContextPath()%>/image/favicon.ico" type="image/x-icon">
</head>
<body>
	<header>
		<div class="header_firstRow">
			<div class="logo">
				<a href="/index"><img src="/image/logo_1.png"></a>
			</div>
			<div class="search">
				<div class="search_content">
					<input text=""  id="searchInput" onkeydown="checkEnter(event)" />
				</div>
				<div class="search_icon" onclick="moveToSearch()"></div>
			</div>
			<div class="myInfo">
				<%-- 로그인 상태 확인 --%>
				<c:choose>
					<c:when test="${session_isMember}">
						<!-- 로그인된 상태 -->
						<p><a href="/mypage">마이페이지</a></p>
						<p><a href="/logout">로그아웃</a></p>
					</c:when>
					<c:otherwise>
						<!-- 로그아웃된 상태 -->
						<p><a href="/login">로그인</a></p>
						<p><a href="/register">회원가입</a></p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- <div class="header_secondRow"></div> -->
	</header>
	<script src="../js/header.js"></script>
	
