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
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/order-list.css'/>"/>
    <title>컬리 - 마켓컬리/뷰티컬리</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    window.onload = () => {
    }
</script>
<body>
<div class="top">
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
</div>
<div class="bottom">
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
    <div class="content">
        <div class="header">
            <div class="title">
                <h2>주문 내역</h2>
                <span class="desc">최대 지난 3년간의 주문 내역까지 확인할 수 있어요</span>
            </div>
            <div class="period">
                <select name="period">
                    <option value="0.25">3개월</option>
                    <option value="0.5">6개월</option>
                    <option value="1">1년</option>
                    <option value="3">3년</option>
                </select>
            </div>
        </div>
        <div class="order-list">
            <c:if test="${orderLogCnt ne 0}">
                <c:forEach var="orderLog" items="${orderLogList}">
                    <div class="order">
                        <div class="title">
                            <span><fmt:formatDate value="${orderLog.order.orderDt}"
                                                  pattern="yyyy.MM.dd (HH'시' mm'분')"/></span>
                            <a href="/mypage/order/${orderLog.order.orderId}">주문내역 상세보기</a>
                        </div>
                        <div class="desc">
                            <div class="desc1">
                                <img
                                        src="https://img-cf.kurly.com/cdn-cgi/image/width=120,height=156,fit=crop,quality=85/shop/data/goods/1657530497306l0.jpg"
                                        alt="[조선호텔김치] 갓김치 상품 이미지"
                                />
                                <div class="details">
                                    <dl class="css-1ccl3pq e1437c646">
                                        <dt class="css-dzjp62 e1437c645">상품명</dt>
                                        <dd class="css-1o8e829 e1437c643">
                                                ${orderLog.itemName}
                                        </dd>
                                    </dl>
                                    <dl class="css-1ccl3pq e1437c646">
                                        <dt class="css-dzjp62 e1437c645">주문번호</dt>
                                        <dd class="css-1i58pf4 e1437c644">${orderLog.order.orderId}</dd>
                                    </dl>
                                    <dl class="css-1ccl3pq e1437c646">
                                        <dt class="css-dzjp62 e1437c645">결제방법</dt>
                                        <dd class="css-1i58pf4 e1437c644">${orderLog.payMthd}</dd>
                                    </dl>
                                    <dl class="css-1ccl3pq e1437c646">
                                        <dt class="css-dzjp62 e1437c645">결제금액</dt>
                                        <dd class="css-1i58pf4 e1437c644"><fmt:formatNumber
                                                value="${orderLog.order.totalPrice}" pattern="#,###원"/></dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="desc2">
                                <span class="deli-stat">${orderLog.order.orderStat}</span>
                                <div style="width: 96px">
                                    <button>
                                        <span>1:1 문의</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${orderLogCnt eq 0}">
                <div class="warning-orders">
                    <div class="wrapper">
                        <p>3개월 간의 주문내역이 없습니다.</p>
                        <button>
                            <span>베스트 상품 보기</span>
                        </button>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
