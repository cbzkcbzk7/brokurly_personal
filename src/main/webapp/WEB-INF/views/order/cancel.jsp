<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
            rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/resources/css/order/cancel.css'/>"/>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script>
        window.onload = () => {
            $(".go-home").on("click", () => {
                window.location.href = "/";
            });
        };
    </script>
</head>
<body>
<div class="background">
    <div class="title">
        <h2>주문 취소 완료</h2>
    </div>
    <div class="outer">
        <div class="inner">
            <div class="img">
                <img src="<c:url value='/resources/image/cancel.png'/>" width="80" height="80" />
            </div>
            <p class="greeting">주문 취소가 완료되었습니다.</p>
            <div class="info">
                <p>결제수단에 따라 3~7일 후</p>
                <p>취소금액 확인이 가능합니다.</p>
            </div>
            <div class="buttons">
                <button class="restore">취소 상품 다시 담기</button>
                <button class="go-home">홈으로 이동</button>
            </div>
        </div>
    </div>
    <div class="small-modal">
        <div class="small-modal-border">
            <div class="small-modal-content">주문번호가 복사되었습니다.</div>
            <div class="small-modal-buttons">
                <button id="small-modal-ok" class="buttons">확인</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>