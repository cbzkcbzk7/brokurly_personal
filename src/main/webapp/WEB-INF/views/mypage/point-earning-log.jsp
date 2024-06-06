<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/point-log.css'/>"/>
    <title>적립금 내역</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    window.onload = function () {
        const buttonWrappers = document.querySelectorAll('.row1 .button-wrapper');

        buttonWrappers.forEach((wrapper) => {
            if (wrapper.textContent.includes("${type}")) {
                wrapper.style.setProperty('border-color', '#5f0080');
                wrapper.querySelector('span').style.setProperty('color', '#5f0080');
            }
        });


        if ('${type}' === '적립') {
            const backgrounds = document.querySelectorAll('.icon .background');
            backgrounds.forEach((iconBackground) => {
                iconBackground.style.setProperty('background-color', '#efe5f2');
            })

            const iconStatus = document.querySelectorAll('.icon .icon-status');
            iconStatus.forEach((iconStatus) => {
                iconStatus.querySelector('span').style.setProperty('color', '#5f0080')
            })

            const rights = document.querySelectorAll('.right');
            rights.forEach((right) => {
                right.style.setProperty('color', '#5f0080')
            })
        }
    }

    <%--Ajax--%>
    /*$(document).ready(function() {
        $(".period").change(() => {
            const period = $(".period").val();

            $.ajax({
                url: "/mypage/point/earning/" + period,
                type: "get",
                dataType: "json",
                data: {
                    "period": period
                },
                success: function(result) {
                    console.log(result);
                },
                error: function (request, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            })
        })

        $(".row1 .button-wrapper:contains('적립')").on('click', () => {
            console.log('적립 버튼 클릭')

            const period = $(".period").json();
            console.log(period);

            $.ajax({
                url: "earning",
                type: "get",
                data: {
                    "type": "적립"
                },
                success: function() {

                }
            })
        });
    });*/
</script>
<body>
<div class="app">
    <main>
        <header>적립금 내역</header>
        <div class="content">
            <div class="stat">
                <div class="avail">
                    <div class="header">
                        <div class="wrapper">
                            <span>사용 가능 적립금</span>
                            <div class="icon">
                                <svg
                                        width="12"
                                        height="12"
                                        viewBox="0 0 12 12"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            d="M5.39732 7.18162H6.32143V6.91317C6.32143 6.45988 6.48661 6.22664 7.0625 5.89218C7.65179 5.54452 8 5.06483 8 4.3871V4.3783C8 3.44093 7.20536 2.75 6.02679 2.75C4.73214 2.75 4.04018 3.50694 4 4.50152V4.51032L4.91964 4.50592H4.92857C4.96429 3.92502 5.36161 3.55975 5.97768 3.55975C6.58929 3.55975 6.98661 3.92502 6.98661 4.41791V4.42671C6.98661 4.87559 6.79464 5.13084 6.25446 5.4521C5.64286 5.81297 5.37054 6.20904 5.39286 6.82955L5.39732 7.18162ZM5.91518 9.25C6.32589 9.25 6.60268 8.98595 6.60268 8.59428C6.60268 8.19821 6.32589 7.93416 5.91518 7.93416C5.50446 7.93416 5.22321 8.19821 5.22321 8.59428C5.22321 8.98595 5.50446 9.25 5.91518 9.25Z"
                                            fill="#5F0080"
                                    ></path>
                                    <circle cx="6" cy="6" r="5.5" stroke="#5F0080"></circle>
                                </svg>
                            </div>
                        </div>
                        <div class="price">
                            <div class="wrapper">
                                <span class="amount"><fmt:formatNumber pattern="#,###"
                                                                       value="${totalAvailPoints}"/></span><span
                                    class="won">원</span>
                            </div>
                        </div>
                        <div class="details">
                            <div class="row">
                                <span>소멸예정 금액 (30일 이내)</span>
                                <span class="amount">0원</span>
                            </div>
                            <div class="row">
                                <span>총 누적 적립금 (가입일 기준)</span>
                                <span class="amount"><span class="amount"><fmt:formatNumber pattern="#,###원"
                                                                                            value="${totalAccumulPoints}"/></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="blank-line"></div>
            <img
                    alt="컬리상품권 2% 혜택 안내 배너"
                    loading="lazy"
                    width="1125"
                    height="186"
                    decoding="async"
                    data-nimg="1"
                    class="u75ne30 u75ne35 _1siu7xkt"
                    srcset="
                  https://www.kurlypay.co.kr/images/mypage/point/PointPromotionBannerA.png?width=1200 1x,
                  https://www.kurlypay.co.kr/images/mypage/point/PointPromotionBannerA.png?width=3840 2x
                "
                    src="https://www.kurlypay.co.kr/images/mypage/point/PointPromotionBannerA.png?width=3840"
                    style="color: transparent"
            />
            <div class="blank-line"></div>
            <div class="bottom">
                <div class="row1">
                    <div class="button-wrapper"><span>전체</span></div>
                    <div class="button-wrapper"><%--<a href="/mypage/point/earning">--%><span>적립</span><%--</a>--%></div>
                    <div class="button-wrapper"><a href="/mypage/point/usage"><span>사용</span></a></div>
                    <div class="button-wrapper"><a href="/mypage/point/exp"><span>소멸</span></a></div>
                </div>
                <div class="row2">
                    <span>총 ${pointLogEarningCount}건</span>
                    <form action="/mypage/point/earning" method="get">
                        <select name="period" onchange="this.form.submit()">
                        <%--<select name="period" class="period">--%>
                            <option value="3" <c:if test="${period == 3}">selected</c:if>>3개월</option>
                            <option value="6" <c:if test="${period == 6}">selected</c:if>>6개월</option>
                            <option value="12" <c:if test="${period == 12}">selected</c:if>>12개월</option>
                        </select>
                    </form>
                </div>
                <div class="row3">
                    <c:if test="${pointLogEarningCount eq 0}">
                        <div class="no-log">
                            <div class="wrapper">
                                <div class="row">
                                    <svg
                                            width="65"
                                            height="65"
                                            viewBox="0 0 65 64"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <circle
                                                cx="32.5"
                                                cy="32"
                                                r="31"
                                                fill="white"
                                                stroke="#DDDDDD"
                                                stroke-width="2"
                                        ></circle>
                                        <path
                                                d="M38.5001 17.6C36.3485 17.6 34.3985 18.0031 32.8751 18.7625C31.3517 19.5219 30.1001 20.7594 30.1001 22.4V27.2C30.1001 27.3547 30.1517 27.5047 30.1751 27.65C29.0595 27.3594 27.822 27.2 26.5001 27.2C24.3485 27.2 22.3985 27.6031 20.8751 28.3625C19.3517 29.1219 18.1001 30.3594 18.1001 32V41.6C18.1001 43.2406 19.3517 44.4781 20.8751 45.2375C22.3985 45.9969 24.3485 46.4 26.5001 46.4C28.6517 46.4 30.6017 45.9969 32.1251 45.2375C33.6485 44.4781 34.9001 43.2406 34.9001 41.6V41.1125C36.0017 41.4031 37.2064 41.6 38.5001 41.6C40.6517 41.6 42.6017 41.1969 44.1251 40.4375C45.6485 39.6781 46.9001 38.4406 46.9001 36.8V22.4C46.9001 20.7594 45.6485 19.5219 44.1251 18.7625C42.6017 18.0031 40.6517 17.6 38.5001 17.6ZM38.5001 20C40.3282 20 41.9548 20.3937 43.0376 20.9375C44.1204 21.4812 44.5001 22.0531 44.5001 22.4C44.5001 22.7469 44.1204 23.3187 43.0376 23.8625C41.9548 24.4062 40.3282 24.8 38.5001 24.8C36.672 24.8 35.0454 24.4062 33.9626 23.8625C32.8798 23.3187 32.5001 22.7469 32.5001 22.4C32.5001 22.0531 32.8798 21.4812 33.9626 20.9375C35.0454 20.3937 36.672 20 38.5001 20ZM32.5001 25.8125C32.6267 25.8828 32.7438 25.9719 32.8751 26.0375C34.3985 26.7969 36.3485 27.2 38.5001 27.2C40.6517 27.2 42.6017 26.7969 44.1251 26.0375C44.2564 25.9719 44.3735 25.8828 44.5001 25.8125V27.2C44.5001 27.5469 44.1204 28.1187 43.0376 28.6625C41.9548 29.2062 40.3282 29.6 38.5001 29.6C36.672 29.6 35.0454 29.2062 33.9626 28.6625C32.8798 28.1187 32.5001 27.5469 32.5001 27.2V25.8125ZM26.5001 29.6C28.3282 29.6 29.9548 29.9937 31.0376 30.5375C32.1204 31.0812 32.5001 31.6531 32.5001 32C32.5001 32.3469 32.1204 32.9187 31.0376 33.4625C29.9548 34.0062 28.3282 34.4 26.5001 34.4C24.672 34.4 23.0454 34.0062 21.9626 33.4625C20.8798 32.9187 20.5001 32.3469 20.5001 32C20.5001 31.6531 20.8798 31.0812 21.9626 30.5375C23.0454 29.9937 24.672 29.6 26.5001 29.6ZM44.5001 30.6125V32C44.5001 32.3469 44.1204 32.9187 43.0376 33.4625C41.9548 34.0062 40.3282 34.4 38.5001 34.4C37.136 34.4 35.9032 34.175 34.9001 33.8375V32C34.9001 31.8453 34.8485 31.6953 34.8251 31.55C35.9407 31.8406 37.1782 32 38.5001 32C40.6517 32 42.6017 31.5969 44.1251 30.8375C44.2564 30.7719 44.3735 30.6828 44.5001 30.6125ZM20.5001 35.4125C20.6267 35.4828 20.7438 35.5719 20.8751 35.6375C22.3985 36.3969 24.3485 36.8 26.5001 36.8C28.6517 36.8 30.6017 36.3969 32.1251 35.6375C32.2563 35.5719 32.3735 35.4828 32.5001 35.4125V36.8C32.5001 37.1469 32.1204 37.7187 31.0376 38.2625C29.9548 38.8062 28.3282 39.2 26.5001 39.2C24.672 39.2 23.0454 38.8062 21.9626 38.2625C20.8798 37.7187 20.5001 37.1469 20.5001 36.8V35.4125ZM44.5001 35.4125V36.8C44.5001 37.1469 44.1204 37.7187 43.0376 38.2625C41.9548 38.8062 40.3282 39.2 38.5001 39.2C37.136 39.2 35.9032 39.0078 34.9001 38.675V36.35C36.0017 36.6406 37.2017 36.8 38.5001 36.8C40.6517 36.8 42.6017 36.3969 44.1251 35.6375C44.2564 35.5719 44.3735 35.4828 44.5001 35.4125ZM20.5001 40.2125C20.6267 40.2828 20.7438 40.3719 20.8751 40.4375C22.3985 41.1969 24.3485 41.6 26.5001 41.6C28.6517 41.6 30.6017 41.1969 32.1251 40.4375C32.2563 40.3719 32.3735 40.2828 32.5001 40.2125V41.6C32.5001 41.9469 32.1204 42.5187 31.0376 43.0625C29.9548 43.6062 28.3282 44 26.5001 44C24.672 44 23.0454 43.6062 21.9626 43.0625C20.8798 42.5187 20.5001 41.9469 20.5001 41.6V40.2125Z"
                                                fill="#DDDDDD"
                                        ></path>
                                    </svg>
                                </div>
                                <div class="row" style="margin-top: 20px">
                                    <span>적립/사용/소멸 내역이 없습니다.</span>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${pointLogEarningCount ne 0}">
                        <c:forEach var="pointEarningLog" items="${pointLogEarningList}" varStatus="status">
                            <div class="wrapper">
                                <div class="date"><fmt:formatDate pattern="yyyy.MM.dd"
                                                                  value="${pointEarningLog.procDt}"/></div>
                                <div class="details">
                                    <div class="left">
                                        <div class="icon">
                                            <div class="background"></div>
                                            <div class="icon-wrapper">
                                                <div class="icon-status">
                                                    <span>${pointEarningLog.pointStat}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="titles">
                                            <span class="main">${pointEarningLog.pointSpec}</span>
                                            <c:if test="${empty pointEarningLog.orderId}">
                                                <span class="sub"><fmt:formatDate pattern="MM.dd까지 사용가능"
                                                                                  value="${pointEarningLog.procDt}"/></span>
                                            </c:if>
                                            <c:if test="${not empty pointEarningLog.orderId}">
                                                <span class="sub">주문번호 (${pointEarningLog.orderId})</span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="right">
                                        <fmt:formatNumber pattern="+#,###원"
                                                          value="${pointEarningLog.pointAmt}"/>
                                        <span class="exp"><fmt:formatDate pattern="yy.MM.dd 만료"
                                                                          value="${pointEarningLog.procDt}"/></span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>
