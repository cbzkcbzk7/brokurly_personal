<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
            rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/order/success.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
        window.onload = () => {
            $(".show-order").on("click", () => {
                window.location.href = "/mypage/order/list";
            });

            $(".go-shopping").on("click", () => {
                window.location.href = "/categories/best-page"
            });

            $(".copy").on("click", () => {
                let $temp = $("<input>");
                $("body").append($temp);
                $temp.val($("#order-id").text()).select();
                document.execCommand("copy");
                $(".small-modal").show();
            });

            $(".small-modal").hide();
            $("#small-modal-ok").on("click", () => {
                $(".small-modal").hide();
            });
        }
    </script>
</head>
<body>
<div class="background">
    <div class="outer">
        <div class="inner">
            <div class="check">
                <img src="<c:url value='/resources/image/check-circle.png'/>" width="80" height="80"/>
            </div>
            <p class="greeting">
                ${name}님의 주문이 완료되었습니다.<br/>
                <span>내일(${dayOfWeek}) 새벽에 만나요!</span>
            </p>
            <div class="info">
                <div class="address">
                    <span>${addr}</span>
                    <span>${specAddr}</span>
                </div>
                <div class="order-number">
                    <span>주문번호 <span id="order-id">${orderId}</span></span>
                    <img src="<c:url value='/resources/image/copy.png'/>" class="copy">
                </div>
            </div>
            <hr/>
            <div class="payment-info">
                <div class="payment">
                    <div>결제금액</div>
                    <div><span class="amount"><fmt:formatNumber value="${amount}" pattern="#,##0"/></span> 원</div>
                </div>
                <div class="payment">
                    <div>적립금</div>
                    <div class="point">
                        <div><span class="amount"><fmt:formatNumber value="${point}" pattern="#,##0"/></span> 원</div>
                        <div>적립금은 배송완료 7일후 적립 (웰컴 5%)</div>
                    </div>
                </div>
            </div>
            <div class="notice">
                <div class="list">
                    <span>&bull;</span>
                    <span>[주문완료] 상태일 경우에만 주문내역 상세페이지에서 주문 취소가 가능합니다.</span>
                </div>
                <div class="list">
                    <span>&bull;</span>
                    <span>
                        엘리베이터 이용이 어려운 경우 6층 이상부터는 공동 현관 앞 또는 경비실로 대응 배송 될 수
                        있습니다.
                    </span>
                </div>
                <div class="list">
                    <span>&bull;</span>
                    <span>
                        실제 출입 정보가 다를 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
                        있습니다.
                    </span>
                </div>
                <div class="list">
                    <span>&bull;</span>
                    <span>
                        주문 / 배송 및 기타 문의가 있을 경우, 1:1 문의에 남겨주시면 신속히 해결해드리겠습니다.
                    </span>
                </div>
            </div>
            <button class="show-order buttons">주문 상세보기</button>
            <button class="go-shopping buttons">쇼핑 계속하기</button>
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

