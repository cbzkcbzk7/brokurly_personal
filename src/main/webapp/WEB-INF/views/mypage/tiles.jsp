<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>
<c:set var="loginName" value="${pageContext.request.session.getAttribute('loginName') += '님'}"/>
<html>
<head>
    <meta charset="UTF-8"/>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/address.css'/>"/>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    window.onload = () => {
    }
</script>
<body>
    <div class="tiles">
        <div class="tile1">
            <div class="member">
                <div class="grade">일반</div>
                <div class="info">
                    <strong class="name">${loginName}</strong>
                    <div class="grade-check">
                        <button class="next-month">다음 달 등급 확인</button>
                        <span>·</span>
                        <button class="all">전체 등급 확인</button>
                    </div>
                </div>
            </div>
            <div class="membership">
                <a href="">
              <span class="kurly-members">
                <span class="new">NEW</span>
                <span class="name">컬리멤버스</span>
                <span class="benefit">월 1,900원으로 10배 쿠폰 받기</span>
                <span>></span>
              </span>
                </a>
            </div>
        </div>
        <div class="tile2">
            <div class="box1">
                <button onclick="location.href='<c:out value="/mypage/point/usage"/>'">
                    <div class="title">적립금 · 컬리캐시<span>></span></div>
                    <div class="desc">바로가기<span></span></div>
                </button>
            </div>
            <div class="box2">
                <button>
                    <div class="title">쿠폰<span>></span></div>
                    <div class="desc">1<span>개</span></div>
                </button>
            </div>
            <div class="box3">
                <button>
                    <div class="title">나의 컬리 스타일<span>></span></div>
                    <div class="desc">등록하기</div>
                </button>
            </div>
        </div>
        <div class="tile3">
            <div>
                <button>
                    <div class="title">컬리퍼플박스<span>></span></div>
                    <div class="desc">알아보기</div>
                </button>
            </div>
            <div>
                <button>
                    <div class="title">컬리멤버스<span>></span></div>
                    <div class="desc">혜택받기</div>
                </button>
            </div>
        </div>
    </div>
    <div class="event">
        <a>
            <img
                    src="https://product-image.kurly.com/cdn-cgi/image/width=1150,quality=85,format=auto/banner/da-banner/e2b2bea9-934b-4ad2-8629-1c4999e5fac4.jpg"
                    alt="240126 [뷰티][MA] 1월 행운래플"
            />
        </a>
    </div>
</body>
</html>
