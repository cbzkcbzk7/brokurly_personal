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
    <title>컬리 - 마켓컬리/뷰티컬리</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    window.onload = () => {
        const receiverDetails = document.querySelector(".add-new-deli");
        receiverDetails.addEventListener("click", () => {
            const left = screen.width / 2 - 300;
            const top = screen.height / 2 - 350;
            window.open(
                "/mypage/address/shipping-address",
                "_blank",
                "width=600, height=700, left=" + left + ", top=" + top
            );
        });

        $(".checkbox").on("click", function (e) {
            e.preventDefault();

            const shipLocaId = $(this).children().val();

            fetch("/mypage/address/shipping-address/update-curraddr/" + shipLocaId, {
                method: "PATCH",
            })
                .then(response => {
                    window.location.reload();
                })
                .catch(error => {
                    console.log(error);
                })

            /*$.ajax({
                url: "mypage/address/shipping-address/update/" + shipLocaId,
                method: "POST",
                success: function (response) {
                    window.location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error(textStatus, errorThrown);
                }
            })*/
        });
    };

    function modifyShippingLocation(shipLocaId) {
        console.log("modifyShippingLocation(shipLocaId)");

        const left = screen.width / 2 - 300;
        const top = screen.height / 2 - 350;
        window.open(
            "/mypage/address/shipping-address/update/" + shipLocaId,
            "_blank",
            "width=600, height=700, left=" + left + ", top=" + top
        );
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
                <h2>배송지 관리</h2>
                <span class="desc"
                >배송지에 따라 상품정보 및 배송유형이 달라질 수 있습니다.</span
                >
            </div>
            <button class="add-new-deli">+ 새 배송지 추가</button>
        </div>
        <div class="sub-header">
            <div class="column" style="flex-basis: 60px">선택</div>
            <div class="column" style="flex: 1 1 0%">주소</div>
            <div class="column" style="flex-basis: 120px">받으실 분</div>
            <div class="column" style="flex-basis: 100px">연락처</div>
            <div class="column" style="flex-basis: 100px">배송유형</div>
            <div class="column" style="flex-basis: 60px">수정</div>
        </div>
        <div class="deli-list">
            <ul>
                <c:forEach var="shippingLocation" items="${shippingLocationList}">
                    <li>
                        <div style="display: flex">
                            <div class="column default">
                                <c:if test="${shippingLocation.currAddrFl eq 'N'}">
                                    <%--<form class="checkbox" method="post">
                                        <input type="hidden" name="_method" value="patch"/>
                                        <input type="hidden" name="shipLocaId" value="${shippingLocation.shipLocaId}"/>
                                    </form>--%>
                                    <div class="checkbox">
                                        <input type="hidden" name="shipLocaId" value="${shippingLocation.shipLocaId}"/>
                                    </div>
                                </c:if>
                                <c:if test="${shippingLocation.currAddrFl eq 'Y'}">
                                    <div class="checkbox-checked"></div>
                                </c:if>
                            </div>
                            <div class="column address">
                                <div>
                                    <c:if test="${shippingLocation.defAddrFl eq 'Y'}">
                                        <div class="default-addr-icon">기본 배송지</div>
                                    </c:if>
                                        ${shippingLocation.addr} ${shippingLocation.specAddr}
                                </div>
                            </div>
                            <div class="column deli-to">${shippingLocation.recName}</div>
                            <div class="column tel-no">${shippingLocation.telNo}</div>
                            <div class="column deli-type">
                                <span type="direct">샛별배송</span>
                            </div>
                            <div class="column fix" onclick="modifyShippingLocation('${shippingLocation.shipLocaId}')">
                                <button>
                                    <img src="/resources/image/modify.png" width="24px" height="24px">
                                </button>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
