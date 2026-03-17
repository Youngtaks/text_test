// publish_idx 기준 선택값 가져오기
var publishIdx = document.getElementById("publish_idx").value; // 'publish_idx' 값 가져오기
let isFetching = false;

// 페이지 로드 시 실행
fetchPublish();

// 공고 정보 가져오는 함수
function fetchPublish() {
    // 요청 중이면 함수 중단
    if (isFetching) return;

    // 요청 상태로 전환
    isFetching = true;

    // AJAX 요청 - searchResult
    $.ajax({
        url: '/viewResult', // 검색 결과를 처리하는 서버의 URL
        type: 'GET',
        data: {
            publishIdx: publishIdx
        },
        success: function(response) {
            // 성공적으로 데이터를 가져왔을 때 처리할 부분
            renderResults(response);
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
function renderResults(publish) {
    // resultContainer에서 북마크 요소에 대한 참조를 가정합니다
    // 예시로 버튼을 클릭할 때 AJAX 요청 및 색상 변경을 수행합니다
const bookmarkDiv = $('.bookmarkDiv');
const bookmarkSvg = bookmarkDiv.find('.bookmarkSvg path')[0]; // path 요소를 가져오기

bookmarkDiv.on('click', function(e) {
    e.preventDefault();

    // 현재 색상에 따라 스크랩 타입 결정
    const currentColor = bookmarkSvg.getAttribute('fill');
    const grey = "grey";
    const blue = "#06f";
    let scrapType = currentColor === grey ? "insert" : "delete";

    // AJAX 요청으로 스크랩 상태 업데이트
    $.ajax({
        type: 'GET',
        url: '/scrap', // ScrapController의 서블릿 URL
        data: {
            scrapType: scrapType,
            publish_idx: publishIdx
        },
        success: function(response) {
            if (response === "notMember") {
                alert("회원가입이 필요합니다");
            } else {
                // publish.isScrap 값을 전환
                const isScrap = (scrapType === "insert");
                
                // SVG 색상을 업데이트
                bookmarkSvg.setAttribute('fill', isScrap ? blue : grey);
            }
        },
        error: function(xhr, status, error) {
            console.error('스크랩 처리 실패:', error);
        }
    });
});
}