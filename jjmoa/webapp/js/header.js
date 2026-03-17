function moveToSearch() {
    const searchQuery = document.getElementById('searchInput').value;
    window.location.href = '/search?searchContent=' + encodeURIComponent(searchQuery);
 }

 
function checkEnter(event) {
    // keyCode 13은 Enter 키
    if (event.keyCode === 13) {
        moveToSearch(); // 엔터가 눌리면 검색 실행
    }
}