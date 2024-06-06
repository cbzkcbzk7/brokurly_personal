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
<div class="sidebar">
    <div class="name">마이컬리</div>
    <ul>
        <li>
            <a href="<c:out value='/mypage/order/list'/>">주문내역 ></a>
        </li>
        <li>
            <a>선물내역 ></a>
        </li>
        <li>
            <a>자주 사는 상품 ></a>
        </li>
        <li>
            <a href="<c:out value='/mypage/pick/list'/>">찜한상품 ></a>
        </li>
        <li>
            <a href="<c:out value='/mypage/address'/>">배송지 관리 ></a>
        </li>
        <li>
            <a>상품후기 ></a>
        </li>
        <li>
            <a>결제수단 · 컬리페이 ></a>
        </li>
        <li>
            <a>상품 문의 ></a>
        </li>
        <li>
            <a href="<c:out value='/mypage/point/usage'/>">적립금 · 컬리캐시 ></a>
        </li>
        <li>
            <a>쿠폰 ></a>
        </li>
        <li>
            <a>개인 정보 수정 ></a>
        </li>
    </ul>
    <a href="<c:out value='/board/inquiry'/>" class="inquiry">
        <div class="wrapper">
            <span class="title">도움이 필요하신가요 ?</span>
            <span class="desc">1:1 문의하기</span>
        </div>
        <svg
                xmlns="http://www.w3.org/2000/svg"
                width="19"
                height="19"
                viewBox="0 0 24 24"
        >
            <defs>
                <path
                        id="gfk9q0rhta"
                        d="M1.657 1.657L9.657 1.657 9.657 9.657"
                ></path>
            </defs>
            <g fill="none" fill-rule="evenodd">
                <g>
                    <g>
                        <g>
                            <g
                                    transform="translate(-339 -398) translate(0 386) translate(339 12) translate(4.69 6.343)"
                            >
                                <use
                                        stroke="#333"
                                        stroke-linecap="round"
                                        stroke-width="1.8"
                                        stroke-linejoin="round"
                                        transform="rotate(45 5.657 5.657)"
                                        xlink:href="#gfk9q0rhta"
                                ></use>
                            </g>
                        </g>
                    </g>
                </g>
            </g>
        </svg>
    </a>
</div>
</body>
</html>
