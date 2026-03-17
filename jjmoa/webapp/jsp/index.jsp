<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.jjm.jjmoa.model.PublishDTO"%>

<jsp:include page="header.jsp" />

<head>
<link rel="stylesheet" type="text/css" href="../css/index.css">
<!-- Swiper CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>

<main>
<%
    List<PublishDTO> displayPublishList = (List<PublishDTO>) request.getAttribute("recentPublishList");
%>

<section class="displayBoard">
    <div class="displayBoard_inner">
        <% if (displayPublishList != null) { %>
            <% for (PublishDTO publish : displayPublishList) { %>
                <div class="displayBoard_publish">
                    <div class="displayBoard_mode">최근 공고</div>
                    <div class="displayBoard_publishName"><%= publish.getPublish_name() %></div>
                    <div class="displayBoard_date">
                        <%= publish.getRegdate().substring(0, 10) %>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <p>No job postings available.</p>
        <% } %>
    </div>
</section>

	<section class="ad">
		<div class="swiper adSwiper">
			<div class="swiper-wrapper">

				<div class="swiper-slide">
					<img src="../image/banner_1.png">
				</div>
				<div class="swiper-slide">
					<img src="../image/banner_2.jpg">
				</div>
				<div class="swiper-slide">
					<img src="../image/banner_3.jpg">
				</div>

			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination ad-pagination"></div>
			<!-- Add Navigation -->
			<div class="swiper-button-next ad-button-next"></div>
			<div class="swiper-button-prev ad-button-prev"></div>
		</div>
	</section>

	<!-- 최근 공고 -->
	<section class="recent_publish section_publish">
		<div class="publish_header">
			<h2>최근 공고</h2>
			<button id="recentMoreBtn">더보기</button>
		</div>
		<div class="swiper recentPublishSwiper">
			<div class="swiper-wrapper">
				<%
				// 최근 공고 리스트 가져오기
				List<PublishDTO> recentPublishList = (List<PublishDTO>) request.getAttribute("recentPublishList");
				if (recentPublishList != null && !recentPublishList.isEmpty()) {
					int count = 0; // 슬라이드당 3개의 공고를 나누기 위한 카운터
					for (int i = 0; i < recentPublishList.size(); i++) {
						// 새로운 슬라이드를 열기
						if (count % 3 == 0) {
				%>
				<div class="swiper-slide">
					<div class="publish_cardList publish_cardList_<%=(count / 3) + 1%>">
						<%
						}
						%>
						<a
							href="/view?publish_idx=<%=recentPublishList.get(i).getPublish_idx()%>">
							<div class="publish_card">
								<div class="card_img">
									<img
										src="/image/job/<%=recentPublishList.get(i).getJobcategory_idx()%>.webp">
								</div>
								<div class="card_name"><%=recentPublishList.get(i).getPublish_name()%></div>
								<div class="card_etc"><%=recentPublishList.get(i).getJobcategory_name()%></div>
							</div>
						</a>
						<%
						count++;
						// 3개의 공고를 처리했거나 마지막 공고인 경우 슬라이드를 닫음
						if (count % 3 == 0 || i == recentPublishList.size() - 1) {
						%>
					</div>
				</div>
				<%
				}
				}
				} else {
				%>
				<p>No recent job postings found.</p>
				<%
				}
				%>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination recent-pagination"></div>
			<!-- Add Navigation -->
			<div class="swiper-button-next recent-button-next"></div>
			<div class="swiper-button-prev recent-button-prev"></div>
		</div>
	</section>

	<!-- 요즘 뜨는 공고 (스크랩 순) -->
	<section class="hot_publish section_publish">
		<div class="publish_header">
			<h2>요즘 뜨는 공고</h2>
			<button id="hotMoreBtn">더보기</button>
		</div>
		<div class="swiper hotPublishSwiper">
			<div class="swiper-wrapper">
				<%
				// 최근 공고 리스트 가져오기
				List<PublishDTO> hotPublishList = (List<PublishDTO>) request.getAttribute("hotPublishList");
				if (hotPublishList != null && !hotPublishList.isEmpty()) {
					int count = 0; // 슬라이드당 3개의 공고를 나누기 위한 카운터
					for (int i = 0; i < recentPublishList.size(); i++) {
						// 새로운 슬라이드를 열기
						if (count % 3 == 0) {
				%>
				<div class="swiper-slide">
					<div class="publish_cardList publish_cardList_<%=(count / 3) + 1%>">
						<%
						}
						%>
						<a
							href="/view?publish_idx=<%=hotPublishList.get(i).getPublish_idx()%>">
							<div class="publish_card">
								<div class="card_img">
									<img
										src="/image/job/<%=hotPublishList.get(i).getJobcategory_idx()%>.webp">
								</div>
								<div class="card_name"><%=hotPublishList.get(i).getPublish_name()%></div>
								<div class="card_etc"><%=hotPublishList.get(i).getJobcategory_name()%></div>
							</div>
						</a>
						<%
						count++;
						// 3개의 공고를 처리했거나 마지막 공고인 경우 슬라이드를 닫음
						if (count % 3 == 0 || i == hotPublishList.size() - 1) {
						%>
					</div>
				</div>
				<%
				}
				}
				} else {
				%>
				<p>No recent job postings found.</p>
				<%
				}
				%>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination hot-pagination"></div>
			<!-- Add Navigation -->
			<div class="swiper-button-next hot-button-next"></div>
			<div class="swiper-button-prev hot-button-prev"></div>
		</div>
	</section>

	<!-- 오늘 마감 공고 -->
	<section class="dday_publish section_publish">
		<div class="publish_header">
			<h2>오늘 마감 공고</h2>
			<button id="ddayMoreBtn">더보기</button>
		</div>
		<div class="swiper dDayPublishSwiper">
			<div class="swiper-wrapper">
				<%
				// 곧 마감되는 공고 리스트 가져오기
				List<PublishDTO> dDayPublishList = (List<PublishDTO>) request.getAttribute("dDayPublishList");
				if (dDayPublishList != null && !dDayPublishList.isEmpty()) {
					int count = 0; // 슬라이드당 3개의 공고를 나누기 위한 카운터
					for (int i = 0; i < dDayPublishList.size(); i++) {
						// 새로운 슬라이드를 열기
						if (count % 3 == 0) {
				%>
				<div class="swiper-slide">
					<div class="publish_cardList publish_cardList_<%=(count / 3) + 1%>">
						<%
						}
						%>
						<a
							href="/view?publish_idx=<%=dDayPublishList.get(i).getPublish_idx()%>">
							<div class="publish_card">
								<div class="card_img">
									<img
										src="/image/job/<%=dDayPublishList.get(i).getJobcategory_idx()%>.webp">
								</div>
								<div class="card_name"><%=dDayPublishList.get(i).getPublish_name()%></div>
								<div class="card_etc"><%=dDayPublishList.get(i).getJobcategory_name()%></div>
							</div>
						</a>
						<%
						count++;
						// 3개의 공고를 처리했거나 마지막 공고인 경우 슬라이드를 닫음
						if (count % 3 == 0 || i == dDayPublishList.size() - 1) {
						%>
					</div>
				</div>
				<%
				}
				}
				} else {
				%>
				<p>No job postings ending soon found.</p>
				<%
				}
				%>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination dday-pagination"></div>
			<!-- Add Navigation -->
			<div class="swiper-button-next dday-button-next"></div>
			<div class="swiper-button-prev dday-button-prev"></div>
		</div>
	</section>

</main>
<script src="../js/index.js"></script>

<jsp:include page="footer.jsp" />
