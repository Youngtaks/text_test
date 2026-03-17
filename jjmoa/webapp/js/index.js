let adSwiper = new Swiper(".adSwiper", {
	spaceBetween: 30,
	pagination: {
		el: ".ad-pagination",
		clickable: true,
	},
	navigation: {
		nextEl: ".ad-button-next",
		prevEl: ".ad-button-prev",
	},
	loop: true,
	loopedSlides: 3, // 복제할 슬라이드 수 설정
	autoplay: {
		delay: 4000, // 1초 (1000 밀리초)마다 슬라이드 이동
		disableOnInteraction: false, // 사용자 상호작용 후에도 자동 재생 유지
	},
});

let recentPublishSwiper = new Swiper(".recentPublishSwiper", {
	spaceBetween: 30,
	navigation: {
		nextEl: ".recent-button-next",
		prevEl: ".recent-button-prev",
	},
	loop: true,
	loopedSlides: 3, // 복제할 슬라이드 수 설정
});

let hotPublishSwiper = new Swiper(".hotPublishSwiper", {
	spaceBetween: 30,
	navigation: {
		nextEl: ".hot-button-next",
		prevEl: ".hot-button-prev",
	},
	loop: true,
	loopedSlides: 3, // 복제할 슬라이드 수 설정
});

let ddayPublishSwiper = new Swiper(".dDayPublishSwiper", {
	spaceBetween: 30,
	navigation: {
		nextEl: ".dday-button-next",
		prevEl: ".dday-button-prev",
	},
	loop: true,
	loopedSlides: 3, // 복제할 슬라이드 수 설정
});


const recentMoreBtn = document.getElementById('recentMoreBtn');
recentMoreBtn.addEventListener('click', function() {
	location.href = "/search?sortType=latest";
});

const hotMoreBtn = document.getElementById('hotMoreBtn');
hotMoreBtn.addEventListener('click', function() {
	location.href = "/search?sortType=popular";
});

const ddayMoreBtn = document.getElementById('ddayMoreBtn');
ddayMoreBtn.addEventListener('click', function() {
	location.href = "/search?sortType=end_date";
});

