<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- CSS 파일 불러오기 (경로 수정) -->
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <!-- <link rel="stylesheet" type="text/css" href="/css/index.css"> -->
</head>
<body>
    <div class="header">
        <header> <!-- 여기에 header 태그를 열어줌 -->
            <h1 class="logo">쇼핑몰 매출 현황관리 Ver 1.0</h1>
            <div class="nav">
                <nav>
                    <ul class="navi">
                        <li><a href="/Shop?cmd=mInsert">회원등록</a></li>
                        <li><a href="/Shop?cmd=mList">회원전체목록</a></li>
                        <li><a href="/Shop?cmd=mSearch">회원정보조회</a></li>
                        <li><a href="/Shop?cmd=mSale">회원매출현황</a></li>
                        <li><a href="/index">홈으로</a></li>
                    </ul>
                </nav>
            </div>
        </header> <!-- header 태그 닫기 위치 수정 -->
    </div>
    
    <div class="section">
        <section>
            <div class="content">
                <h2 class="title">과정평가형 자격 CBQ</h2>
                <p>국가직무능력표준(NCS:National Competency Standards)으로 설계된 교육*훈련과정을 체계적으로 이수하고 내외부 평가를 거쳐 취득하는 국가기술자격입니다.</p>
                <p>산업현장 중심의 교육평가로 더 커지는 능력!</p>
                <p>알고 있는 것에 할 수 있는 것을 더하는 과정평가형 자격은 현장 중심형 인재육성을 지원합니다.</p>
            </div>
        </section>
    </div>
    
    <div class="footer">
        <footer>
            <p>HRDKOREA Copyright@2016 All rights reserve. Human Resources 
            Development Service of Korea</p>
        </footer>
    </div>
    
 	<script src="/js/index.js"></script>
 	<script>
 		alert("asdasd");
 		
 		
 		
 	</script>
</body>
</html>

<jsp:include page="footer.jsp" />
