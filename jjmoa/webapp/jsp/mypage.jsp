<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.jjm.jjmoa.model.MemberDTO"%>
<%@ include file="/jsp/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<body>

	<div class="container">
		<div class="sidebar">
			<h2>My Page</h2>
			<form action="mypagepasswd" method="get">
				<button class="button">회원정보 수정</button>
			</form>
		</div>

		<div class="content">
			<%
			// 세션에서 MemberDTO 객체 가져오기
			MemberDTO session_memberDTO = (MemberDTO) session.getAttribute("session_memberDTO");
			//날짜만 표시(시간 제외)
			String regdate = session_memberDTO.getRegdate();
			String formatRegdate = regdate.length() >= 10 ? regdate.substring(0, 10) : regdate;
			%>
			<table>
				<tr>
					<th>가입일자</th>
					<td><%=formatRegdate%></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=session_memberDTO.getEmail()%></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><%=session_memberDTO.getNickname()%></td>
				</tr>
			</table>
		</div>

	</div>

<section class="section_myScrap">
    <div class="myScrap_header">
        <h2>나의 스크랩</h2>
    </div>
    <section class="card_list result_card_list">
        <c:choose>
            <c:when test="${empty scrapedPosts}">
                <div class="no-scrap-message">현재 스크랩한 공고가 없습니다.</div>
            </c:when>
            <c:otherwise>
                <c:forEach var="publish" items="${scrapedPosts}">
                    <a href="/view?publish_idx=${publish.publish_idx}">
                        <input id="hidden_publish_id_${publish.publish_idx}" type="hidden" value="${publish.publish_idx}"/> 
                        <div class="publish_card" data-publish-id="${publish.publish_idx}">
                            <div class="bookmarkDiv">
                                <svg class="bookmarkSvg" xmlns="http://www.w3.org/2000/svg"
                                    width="30px" height="30px" viewBox="0 -960 960 960" fill="#06f">
                                    <path
                                        d="m389-400 91-55 91 55-24-104 80-69-105-9-42-98-42 98-105 9 80 69-24 104ZM200-120v-640q0-33 23.5-56.5T280-840h400q33 0 56.5 23.5T760-760v640L480-240 200-120Zm80-122 200-86 200 86v-518H280v518Zm0-518h400-400Z" />
                                </svg>
                            </div>
                            <div class="card_img">
                                <img src="/image/job/${publish.jobcategory_idx}.webp" alt="job image">
                            </div>
                            <div class="card_name">${publish.publish_name}</div>
                            <div class="card_etc">${publish.jobcategory_name}</div>
                        </div>
                    </a>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </section>
</section>

<script>
    document.querySelectorAll('.bookmarkDiv').forEach(bookmarkDiv => {
        bookmarkDiv.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            const publishCard = this.closest('.publish_card'); // 해당 카드 요소 찾기
            const publish_idx = publishCard.getAttribute('data-publish-id'); // publish ID 가져오기
            const bookmarkSvg = this.querySelector('.bookmarkSvg'); // 북마크 SVG의 path 찾기
            
            const currentColor = bookmarkSvg.getAttribute('fill');
            const white = "white";
            const blue = "#06f";
            
            let scrapType = "";
            if (currentColor === white) {
                scrapType = "insert"; // 흰색일 경우 삽입
            } else if (currentColor === blue) {
                scrapType = "delete"; // 파란색일 경우 삭제
            }

            // db ajax 연동해서 스크랩 insert 및 delete
            $.ajax({
                type: 'GET',
                url: '/scrap', // ScrapController의 서블릿 URL
                data: {
                    scrapType: scrapType,
                    publish_idx: publish_idx
                },
                success: function(response) {
                    if (response === "notMember") {
                        alert("회원가입이 필요한 서비스 입니다");
                    } else if (response === "insert") {
                        bookmarkSvg.setAttribute('fill', blue); // 색상 변경
                    } else if (response === "delete") {
                        bookmarkSvg.setAttribute('fill', white); // 색상 변경
                    }
                },
                error: function(xhr, status, error) {
                    console.error('스크랩 처리 실패:', error);
                }
            });
        });
    });
</script>
</body>
</html>
