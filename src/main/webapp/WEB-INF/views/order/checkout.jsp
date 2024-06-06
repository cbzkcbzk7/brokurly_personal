<%@ page import="com.brokurly.dto.member.MemberAndLoginDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <script>
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/order/checkout.css'/>"/>
    <script type="text/javascript" src="<c:url value='/resources/js/order/checkout.js'/>"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <title>브로컬리</title>
</head>
<body>
<section>
    <h1>주문서</h1>
    <div class="info-type1-title" id="no-margin-top">
        <h3>주문 상품</h3>
        <button id="order-goods-change">
            <img src="<c:url value='/resources/image/down-arrow.png'/>" alt="">
        </button>
    </div>
    <hr/>
    <div class="info-type1">
        <c:set var="customerCart" value="${checkout.customerCart}"/>
        <c:set var="numOfItemType" value="${fn:length(customerCart)}"/>
        <div id="order-goods">
            <span>${customerCart[0].name}<c:if test="${numOfItemType >= 2}"> 외 ${numOfItemType - 1}개</c:if></span>
            상품을 주문합니다.
        </div>
        <div id="order-goods-list" style="display: none">
            <c:forEach items="${customerCart}" var="item" varStatus="status">
                <div class="item-list">
                    <div class="item-img">
                        <img src="<c:url value='/resources/image/goodsImage/${checkout.imgList[status.index]}'/>">
                    </div>
                    <div class="item-id" style="display: none">${item.itemId}</div>
                    <div class="item-name"><span>${item.name}</span></div>
                    <div class="item-cnt">${item.itemCnt}개</div>
                    <div class="item-price-info">
                        <span class="item-dc-price">
                            <fmt:formatNumber value="${item.price - item.itemDcAmt}" pattern="#,##0"/>원
                        </span>

                        <span class="item-price" <c:if test="${item.itemDcAmt != 0}">style="display: none;"</c:if>>
                            <fmt:formatNumber value="${item.price}" pattern="#,##0"/>원
                        </span>
                    </div>
                </div>
<%--                <hr class="list-hr"/>--%>
            </c:forEach>
        </div>
    </div>

    <div class="info-type1-title">
        <h3>주문자 정보</h3>
    </div>
    <hr/>
    <div class="info-type1">
        <div class="info-type2">
            <div>보내는 분</div>
            <div id="rcv-name">${loginMember.name}</div>
        </div>
        <div class="info-type2">
            <div>휴대폰</div>
            <div id="tel-no">${loginMember.telNo}</div>
        </div>
        <div class="info-type2">
            <div>이메일</div>
            <div>
                ${loginMember.email}
                <p style="font-size: 12px">이메일을 통해 주문처리과정을 보내드립니다.</p>
                <p style="font-size: 12px">정보 변경은 마이컬리 > 개인정보 수정 메뉴에서 가능합니다.</p>
            </div>
        </div>
    </div>

    <div class="info-type1-title">
        <h3>배송 정보</h3>
        <a>
            <span>배송지 변경 안내 </span>
            <img src="<c:url value='/resources/image/question-mark.png'/>" class="question-mark">
        </a>
        <div class="chat-box-head"></div>
        <div class="chat-box-body">
            <div>
                <span>장바구니, 홈에서</span>
                <span>배송지를 변경할 수 있어요</span>
            </div>
            <div>
                <img src="<c:url value='/resources/image/x-mark.png'/>" class="x-mark">
            </div>
        </div>
    </div>
    <hr/>
    <div class="info-type1">
        <div class="info-type2">
            <div>배송지</div>
            <div>
                <c:if test="${location.defAddrFl == 'Y'}">
                    <span id="default-delivery">기본 배송지</span>
                </c:if>
                <p>${location.addr}</p>
                <c:if test="${location.specAddr == null}">
                    <p class="caution">상세 주소를 입력해주세요</p>
                </c:if>
                <p>${location.specAddr}</p>
                <button id="location-change" class="ship-button">변경</button>
            </div>
        </div>
        <div class="small-modal shipping-location-modal">
            <div class="cust-id" style="display: none">${loginMember.custId}</div>
            <div class="small-modal-border">
                <div class="small-modal-content">
                    <p>장바구니로 이동하여</p>
                    <p>다른 배송지로 변경하시겠습니까?</p>
                </div>
                <div class="small-modal-buttons">
                    <button id="small-modal-cancel">취소</button>
                    <button id="small-modal-ok">확인</button>
                </div>
            </div>
        </div>

        <div class="info-type2">
            <div id="receiver-details-title">배송 요청사항</div>
            <c:set var="receiverDetails" value="${checkout.receiverDetails}"/>
            <div class="check-receiver-details" style="display: none">${receiverDetails == null}</div>
            <div class="receiver-info">
                <c:if test="${receiverDetails == null}">
                    <div>
                        <!-- 요청사항 저장되어 있으면, 요청사항을 표시하고 버튼은 수정으로-->
                        <!-- 없으면, 아래와 같이 표시하고 버튼을 입력으로 -->
                        <p class="caution">배송 요청사항을 입력해주세요</p>
                        <button class="receiver-details-btn ship-button">입력</button>
                    </div>
                </c:if>
                <div class="small-modal receiver-details-modal">
                    <div class="small-modal-border">
                        <div class="small-modal-content">배송 요청사항을 입력해주세요.</div>
                        <div class="small-modal-buttons">
                            <button id="receiver-details-modal-ok" onclick="redirectReceiverDetails()">확인</button>
                        </div>
                    </div>
                </div>
                <c:if test="${receiverDetails != null}">
                    <div>
                        <div>
                            <span id="checkout-rcv-place">${receiverDetails.rcvPlace}</span> |
                            <span id="checkout-enter-mthd">${receiverDetails.enterMthd}</span>
                        </div>
                        <div class="receiver">
                            <span id="checkout-name">${receiverDetails.rcvName}</span>,
                            <span id="checkout-tel-no">${receiverDetails.telNo}</span>
                        </div>
                        <div id="checkout-place-exp" style="display: none;"></div>
                        <div id="checkout-msg-time" style="display: none;"></div>
                        <button class="receiver-details-btn ship-button">수정</button>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>
<section id="bottom">
    <div id="left">
        <div>
            <div class="info-type1-title">
                <h3>쿠폰</h3>
            </div>
            <hr/>
            <div class="info-type2">
                <div>쿠폰 적용</div>
                <div>
                    <button id="coupon-list">사용가능 쿠폰 0장/전체0장</button>
                    <p>쿠폰 적용 불가 상품입니다</p>
                    <div>
                        <a href="">쿠폰 사용 문의 (카카오톡) &gt;</a>
                    </div>
                    <hr/>
                    <p>
                        <a href=""><span>컬리멤버스</span> 추가 2,000원 즉시 할인 받기 &gt;</a>
                    </p>
                </div>
            </div>
        </div>
        <div>
            <div class="info-type1-title">
                <h3>적립금</h3>
            </div>
            <hr/>
            <div class="info-type2 point-div">
                <div>적립금</div>
                <div>
                    <div id="point">
                        <div>
                            <div>사용가능 잔액</div>
                            <div class="point-amount">0 원</div>
                        </div>
                        <div id="point-input">
                            <input type="text" placeholder="0"
                                   <c:if test="${true}">disabled</c:if> />
                            <button <c:if test="${true}">disabled</c:if>>모두사용</button>
                        </div>
                    </div>
                    <div>사용 시 적립금이 먼저 소진됩니다.</div>
                </div>
            </div>
        </div>
        <div>
            <div class="info-type1-title">
                <h3>결제수단</h3>
            </div>
            <hr/>
            <div class="info-type2">
                <div>결제수단 선택</div>
                <div>
                    <button type="button" id="kakaopay" class="payment-button" value="false"
                            style="margin-bottom: 10px">
                        <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNTAiIGhlaWdodD0iMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSIjMDAwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik03LjUxNSAyLjhDMy4zNjUgMi44IDAgNS40NDUgMCA4LjcwN2MwIDEuOTM4IDEuMTg3IDMuNjU3IDMuMDIxIDQuNzM0LS4xOTEuNzY4LS42ODQgMi43NDItLjc1IDIuOTU3LS4wODMuMjY2LS4xMDMgMS4wNDYuNzAyLjUxMi42MzQtLjQyIDIuNDc5LTEuNyAzLjU3LTIuMzQ4LjMxOC4wMzMuNjQyLjA1MS45NzIuMDUxIDQuMTUgMCA3LjUxNS0yLjY0NCA3LjUxNS01LjkwNiAwLTMuMjYyLTMuMzY1LTUuOTA3LTcuNTE1LTUuOTA3TTIxLjA0OCA0LjExM2MxLjUxNy0xLjMxMyAzLjQ2OC0xLjUwOCA0Ljg5My0uNTg1IDEuNzA3IDEuMTA2IDIuMTY4IDIuNzU0IDIuMTY4IDQuODkyIDAgMi40LTEuMTE1IDMuOTY4LTEuNjQyIDQuNDYtLjUyNi40OTMtMS42NzMgMS4yOTItMi44OCAxLjI5MkgyMS40MnYzLjc4NGgtMi45MTFWMy4yODJoMi4xMDZzLjI2LjU0OC40MzMuODN6bTEuOTUxIDEuMTUzYy0uNjk3IDAtMS4xNTMuMTc3LTEuNTMzLjQ3N3Y2LjMwNmgxLjEzOGMuNTU4IDAgMi41NDctLjUwNyAyLjU0Ny0zLjM4MyAwLS42NzctLjA5LTEuMzg1LS4yNzgtMS45LS4zNTctLjk3Ny0xLjI0Ny0xLjUtMS44NzQtMS41ek0zMy44MTcgMy4wNDZjMi4wODUgMCAyLjk0Mi43MTggMy40NDggMS4zNTQuNDgxLjYwNC44NjIgMS40OTcuODYyIDIuOHY2LjY4aC0yLjI2di0uOTU0cy0uNDQyLjQyLTEuMzc5LjgzMWMtLjk4LjQzLTIuNjUzLjg3Ny00LjA0MS0uMTg0LTEuMzk3LTEuMDY4LTEuMi0zLjQ3MS0uODUyLTQuMTU0LjQ4LS45MzggMS4zNjMtMS45NjggMy43MTYtMS45NjhoMi4wMjl2LS45MDhjMC0uNTU0LS41ODMtMS4xMDctMS43My0xLjEwNy0xLjI4IDAtMS44MzMuMTkyLTIuODE3LjYzNWwtLjk5Ni0xLjk0M3MxLjQ5Ni0xLjA4MiA0LjAyLTEuMDgyem0xLjQ3NyA2LjI1aC0xLjQxNWMtLjU5OSAwLTEuOTYxLjIxNi0xLjk2MSAxLjQ3NyAwIDEuMjgzIDEuMDkgMS4yNiAxLjQ0OCAxLjIzIDEuMDg5LS4wOTEgMS45MzgtLjc5NCAxLjkzOC0uNzk0bC0uMDEtMS45MTN6TTQ3LjA2MSAzLjA0NmwtMi4yOTEgOC4xMTEtMi41NC04LjExLTIuODQ5LjgyczMuNSA5LjM4MyAzLjYyNCA5Ljc4M2MuMTIzLjQtLjAwNS44NTgtLjI4IDEuMzIyLS4zNzEuNjMtMS44MjYgMi4wMy0xLjgyNiAyLjAzbDEuODc4IDEuNjYzcy44NTctLjY4OCAxLjc0NS0xLjc1NWMuNzQzLS44OTIgMS42MzYtMi44MyAxLjkzOC0zLjU3Ny44NTktMi4xMTkgMy40Mi05LjQ2NiAzLjQyLTkuNDY2bC0yLjgxOS0uODJ6Ii8+CiAgICA8L2c+Cjwvc3ZnPgo="
                             alt="카카오페이">
                    </button>
                    <button type="button" id="credit-card" class="payment-button" value="false">신용카드</button>
                </div>
            </div>
        </div>
        <div>
            <div class="info-type1-title">
                <h3>개인정보 수집/제공</h3>
            </div>
            <hr/>
            <div id="personal-info">
                <div>
                    <p>개인정보 수집∙이용 및 처리 동의</p>
                    <button class="personal-info-consent">보기</button>
                </div>
                <div>
                    <p>결제대행 서비스 약관 동의</p>
                    <button class="personal-info-consent">보기</button>
                </div>
                <div>
                    <p>전자지급 결제대행 서비스 이용약관 동의</p>
                    <button class="personal-info-consent">보기</button>
                </div>
                <div class="acceptance">위 내용을 확인하였으며 결제에 동의합니다.</div>
            </div>
            <div class="personal-info-caution">
                <p>
                    주문완료 상태일 경우에만 주문 취소가 가능하며, 상품 미배송 시 결제하신 수단으로 환불됩니다.
                </p>
                <p>
                    컬리 내 개별 판매자가 등록한 오픈마켓 상품의 경우 컬리는 통신판매중개자로서 주문, 품질,
                    교환/환불 등 의무와 책임을 부담하지 않습니다.
                </p>
            </div>
        </div>
        <c:set var="paymentAmount" value="${checkout.paymentAmount}"/>
        <button id="pay-button" onclick="redirectPayment()">
            <fmt:formatNumber value="${paymentAmount.payAmt}" pattern="#,##0"/>원 결제하기
        </button>
    </div>
    <div id="right">
        <h3>결제 금액</h3>
        <div id="right-inner">
            <div>
                <div>주문금액</div>
                <div id="order-amount" class="amount">
                    <fmt:formatNumber value="${paymentAmount.orderAmt}" pattern="#,##0"/> 원
                </div>
            </div>
            <div class="order-detail">
                <div>└ &nbsp;상품금액</div>
                <div id="item-amount"><fmt:formatNumber value="${paymentAmount.itemAmt}" pattern="#,##0"/> 원</div>
            </div>
            <div class="order-detail">
                <div>└ &nbsp;상품할인금액</div>
                <div id="item-dc-amount"><fmt:formatNumber value="${paymentAmount.itemDcAmt}" pattern="#,##0"/> 원</div>
            </div>
            <div class="payment-detail">
                <div>배송비</div>
                <div id="ship-fee" class="amount">
                    <fmt:formatNumber value="${paymentAmount.shipFee}" pattern="#,##0"/> 원
                </div>
            </div>
            <div class="payment-detail">
                <div>쿠폰할인</div>
                <div class="amount">0 원</div>
            </div>
            <div class="payment-detail">
                <div>카드즉시할인</div>
                <div class="amount">0 원</div>
            </div>
            <div id="use-point" class="payment-detail">
                <div>적립금</div>
                <div class="amount">0 원</div>
            </div>
            <div class="final-amount">
                <div id="pay-amount">최종결제금액</div>
                <div><fmt:formatNumber value="${paymentAmount.payAmt}" pattern="#,##0"/> 원</div>
            </div>
            <div>
                <div></div>
                <div class="point-info"><span id="yellow-circle">적립</span> 구매 시 0원(5%)</div>
            </div>
        </div>
    </div>
</section>
<div class="big-modal">
    <div class="big-modal-content">
        <h1>개인정보 수집·이용 및 처리 동의 (필수)</h1>
        <div></div>
        <button>확인</button>
    </div>
</div>
<div class="big-modal">
    <div class="big-modal-content">
        <h1>NHN한국사이버결제 전자결제 서비스 이용약관</h1>
        <div></div>
        <button>확인</button>
    </div>
</div>
<div class="big-modal">
    <div class="big-modal-content">
        <h1>컬리페이 전자지급 결제대행 서비스 이용약관</h1>
        <div></div>
        <button>확인</button>
    </div>
</div>
</body>
</html>