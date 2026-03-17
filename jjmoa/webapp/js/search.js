// 전역 변수 
const limit = 16;
let offset = 0;
let isFetching = false;

// 더보기로 들어왔을 때 -  latest, popular, end_date
const urlParams = new URLSearchParams(window.location.search);
const sortType = urlParams.get('sortType');
const selectElement = document.querySelector('.select_sort');
if (sortType == 'latest') {
	// alert('latest');
	selectElement.value = 'latest';
} else if (sortType == 'popular') {
	// alert('popular');
	selectElement.value = 'popular';
} else if (sortType == 'end_date') {
	// alert('end_date');
	selectElement.value = 'end_date';
}

// 페이질 로드 시 초기 검색결과
fetchSearchResults();
fetchSearchResultNum();

// 검색창에 검색결과값 남겨두기
// 'searchContent'라는 파라미터 값을 가져옴
const searchContent = urlParams.get('searchContent');
var $searchInput = $('#searchInput');
$searchInput.val(searchContent);

// 스크롤 이벤트 리스너 추가
var mainContainer = $('#searchMain');
window.addEventListener('scroll', function() {
	// 현재 스크롤 위치와 문서의 전체 높이를 비교하여 스크롤이 거의 끝에 도달하면 실행
	if ((window.innerHeight + window.scrollY + 100) >= mainContainer.height() && !isFetching) {

		console.log("window.offsetHeight : " + (window.innerHeight + window.scrollY + 100));
		console.log("mainContainer.height() : " + mainContainer.height());

		fetchSearchResults(); // 더 많은 검색결과를 가져옴
	}
});

// 검색결과 가져오는 함수
function fetchSearchResults() {
	// 요청 중이면 함수 중단
	if (isFetching) return;

	// 요청 상태로 전환
	isFetching = true;

	// 직종, 플랫폼, 정렬 기준 선택값 가져오기
	var platform = document.querySelector('.select_platform').value;
	var sortType = document.querySelector('.select_sort').value;
	var jobCategory = document.querySelector('.select_job').value;

	// 검색창에 검색결과값 남겨두기
	const urlParams = new URLSearchParams(window.location.search);
	// 'searchContent'라는 파라미터 값을 가져옴
	const searchContent = urlParams.get('searchContent');

	// AJAX 요청 - searchResult
	$.ajax({
		url: '/searchResult', // 검색 결과를 처리하는 서버의 URL
		type: 'GET',
		data: {
			searchKeyword: searchContent, // 검색어 (input에서 가져옴)
			jobcategoryIdx: jobCategory,
			platform: platform,
			sortType: sortType,
			limit: limit, // 페이지 당 가져올 데이터 개수 (인피니트 스크롤 고려)
			offset: offset // 처음에는 0부터 시작 (다음 페이지에서는 증가)
		},
		success: function(response) {
			// 성공적으로 데이터를 가져왔을 때 처리할 부분
			renderResults(response);
			offset += limit;
		},
		error: function(error) {
			console.error('Error fetching search results:', error);
		},
		complete: function() {
			// 요청 완료 후 다시 요청 가능 상태로 설정
			isFetching = false;
		}
	});
}

// 검색 결과 렌더링 함수
function renderResults(data) {
	var resultContainer = $('.result_card_list');

	// 데이터가 없을 경우
	if (data.length === 0 && offset === 0) {
		// 검색 결과가 없다는 메시지를 표시
		resultContainer.html(`
            <div class="no_results">
                <p>검색 결과가 없습니다.</p>
                <p>다른 키워드로 검색해보세요.</p>
            </div>
        `);
		return;
	}

	// 새로 가져온 데이터를 리스트에 추가
	data.forEach(function(publish) {
		    var card = `		
    <a href="/view?publish_idx=${publish.publish_idx}">
        <div class="publish_card">
            <div class="bookmarkDiv">
                <svg class="bookmarkSvg" xmlns="http://www.w3.org/2000/svg" width="30px" height="30px" viewBox="0 -960 960 960" fill="${publish.isScrap ? '#06f' : 'white'}">
                    <path d="m389-400 91-55 91 55-24-104 80-69-105-9-42-98-42 98-105 9 80 69-24 104ZM200-120v-640q0-33 23.5-56.5T280-840h400q33 0 56.5 23.5T760-760v640L480-240 200-120Zm80-122 200-86 200 86v-518H280v518Zm0-518h400-400Z" />
                </svg>
            </div>
            <div class="card_img">
                <img src="/image/job/${publish.jobcategory_idx}.webp">
            </div>
            <div class="card_name">${publish.publish_name}</div>
            <div class="card_etc">${publish.jobcategory_name}</div>
        </div>
    </a>
    `;	
		
		resultContainer.append(card);

		// 북마크 클릭 이벤트 추가
		const bookmarkDiv = resultContainer.find('.bookmarkDiv').last(); // 방금 추가한 카드의 북마크 아이콘
		const bookmarkSvg = bookmarkDiv.find('.bookmarkSvg path')[0]; // 해당 SVG 요소

		bookmarkDiv.on('click', function(e) {
			e.preventDefault();
			

			// 클릭할 때 색상 변경: fill 속성을 파란색으로 변경
			const currentCorlor = bookmarkSvg.getAttribute('fill');
			const white = "white";
			const blue = "#06f";
			
			let scrapType = "";
			if(currentCorlor === white || !publish.isScrap) {
				scrapType = "insert";
			} else if(currentCorlor === blue || publish.isScrap) {
				scrapType = "delete";
			}
			
			console.log("currentCorlor : " + currentCorlor)
			console.log("scrapType : " + scrapType)
			console.log("publish_idx : " + publish.publish_idx)

			// db ajax 연동해서 스크랩 insert 및 delete
			$.ajax({
				type: 'GET', // 또는 'POST'로 변경 가능
				url: '/scrap', // ScrapController의 서블릿 URL
				data: {
					scrapType: scrapType,
					publish_idx: publish.publish_idx
				},
				success: function(response) {
					if(response === "notMember") {
						alert("회원가입이 필요한 서비스 입니다");
					} else if(response === "insert") {
						bookmarkSvg.setAttribute('fill', blue);
					} else if(response === "delete") {
						bookmarkSvg.setAttribute('fill', white);
					}
				
				},
				error: function(xhr, status, error) {
					console.error('스크랩 처리 실패:', error); // 에러 처리
				}
			});

		});

	});
}

// 직조 변경 시 실행되는 함수
function categoryOnChange() {
	var resultContainer = $('.result_card_list');
	resultContainer.empty();
	offset = 0;
	fetchSearchResults();
	fetchSearchResultNum();
}

// 검색결과 수 가져오는 함수
function fetchSearchResultNum() {

	// 직종, 플랫폼, 정렬 기준 선택값 가져오기
	var platform = document.querySelector('.select_platform').value;
	var sortType = document.querySelector('.select_sort').value;
	var jobCategory = document.querySelector('.select_job').value;

	// 검색창에 검색결과값 남겨두기
	const urlParams = new URLSearchParams(window.location.search);
	// 'searchContent'라는 파라미터 값을 가져옴
	const searchContent = urlParams.get('searchContent');

	// AJAX 요청 - searchResultNum
	$.ajax({
		url: '/searchResultNum', // 검색 결과를 처리하는 서버의 URL
		type: 'GET',
		data: {
			searchKeyword: searchContent, // 검색어 (input에서 가져옴)
			jobcategoryIdx: jobCategory,
			platform: platform,
		},
		success: function(response) {
			// 성공적으로 데이터를 가져왔을 때 처리할 부분
			let resultNum = response;
			$('#spanSearchNum').text(resultNum);
		},
		error: function(error) {
			console.error('Error fetching search results:', error);
		},
		complete: function() {
		}
	});
}



