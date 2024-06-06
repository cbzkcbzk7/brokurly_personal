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
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/pick-list.css'/>"/>
    <title>컬리 - 마켓컬리/뷰티컬리</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    window.onload = () => {
        // 장바구니 담기 모달창
        $(".MuiModal-root").hide();

        $('.css-x0zbdy.e4nu7ef3').on("click", function (event) {
            event.preventDefault();
            const wishItemClicked = $(this).closest('.css-1pj4itr.e1jp10d17');
            console.dir(wishItemClicked);

            //상품 태그에서 정보 가지고오기
            const itemId = $(this).find('#itemId').val();
            const itemName = wishItemClicked.find('.css-4ejps8.e1jp10d13').text();
            const itemDisPrice = $(this).find('#itemDisPrice').val();
            const itemPrice = wishItemClicked.find('.css-1h2g4dm.e1alt0er0').text();

            //모달창 태그로 상품 정보 넣기
            $(".modal-item-name").text(itemName);
            $(".modal-item-disprice-hidden").text(itemDisPrice);
            $(".modal-item-disprice").text(fmtPrice(itemDisPrice));
            $(".modal-item-price").text(itemPrice);
            $(".modal-item-disprice-final").text(fmtPrice(itemDisPrice));
            $(".item-id").text(itemId);

            $(".MuiModal-root").show();
        });

        // 모달창 끄기
        $(".exist-modal").click(function () {
            $('.modal-item-cnt').text("1");
            $(".MuiModal-root").fadeOut();
        });

        // 상품 수량 올림 버튼
        $(".add-item-cnt").click(function () {

            let itemCntNumber = parseInt($('.modal-item-cnt').text());
            itemCntNumber++;
            let disprice = $(".modal-item-disprice-hidden").text();
            $('.modal-item-cnt').text(itemCntNumber);
            let totalPrice = parseInt(disprice) * itemCntNumber;
            $(".modal-item-disprice-final").text(fmtPrice(totalPrice));
        });

        // 상품 수량 내림 버튼
        $(".subtract-item-cnt").click(function () {

            let itemCntNumber = parseInt($('.modal-item-cnt').text());
            if (itemCntNumber !== 1) {
                itemCntNumber--;
                let disprice = $(".modal-item-disprice-hidden").text();
                $('.modal-item-cnt').text(itemCntNumber);
                let totalPrice = parseInt(disprice) * itemCntNumber;
                $(".modal-item-disprice-final").text(fmtPrice(totalPrice));
            }
        });

        //모달창 장바구니 담기 눌렀을때 보낼 데이터
        const form = {
            itemId: '',
            custId: 'hakie2kim',
            itemCnt: '',
            itemCk: 'N'
        }

        // 모달창 장바구니 담기 클릭했을 때
        $(".put-in-cart-2").click(function () {
            form.itemCnt = parseInt($('.modal-item-cnt').text());
            form.itemId = $(".item-id").text();
            $.ajax({
                url: '/cart/add',
                type: 'POST',
                data: form,
                dataType: "text",
                success: function (result) {
                    cartAlert(result);
                    $(".MuiModal-root").hide();
                }
            })
        });

        // 찜 목록에서 상품 삭제
        $('.css-17giheb.e4nu7ef3').on('click', (event) => {
            const itemId = $(event.currentTarget).find('input[type=hidden]').val();

            fetch("/mypage/pick/remove/" + itemId, {
                method: "DELETE"
            })
                .then(response => {
                    window.location.reload();
                })
                .catch(error => {
                    console.log(error);
                })
        })
    }

    function fmtPrice(price) {
        return new Intl.NumberFormat('ko-KR').format(price) + '원';
    }

    function cartAlert(result) {
        if (result == '0') {
            alert("장바구니에 추가를 하지 못하였습니다.");
        } else if (result == '1') {
            alert("장바구니에 추가되었습니다.");
        } else if (result == '2') {
            alert("장바구니에 이미 추가되어져 있습니다.");
        } else if (result == '5') {
            alert("로그인이 필요합니다.");
        }
    }
</script>
<body>
<div class="top">
    <%--장바구니 담기 모달창 시작--%>
    <div role="presentation" class="MuiModal-root MuiDialog-root css-98q5jm">
        <div aria-hidden="true" class="MuiBackdrop-root css-919eu4"
             style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
        <div tabindex="0" data-test="sentinelStart"></div>
        <div class="MuiDialog-container MuiDialog-scrollPaper css-ekeie0" role="presentation" tabindex="-1"
             style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">
            <div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation24 MuiDialog-paper MuiDialog-paperScrollPaper MuiDialog-paperWidthSm css-uhb5lp"
                 role="dialog" aria-labelledby="customized-dialog-title">
                <div class="css-qfuix0 e1xnucib5">
                    <div class="css-96wx9m e1xnucib4"><span
                            style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img
                            alt="상품 이미지" sizes="100vw"
                            srcset="https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 640w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 750w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 828w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 1080w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 1200w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 1920w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 2048w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 3840w"
                            src="https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg"
                            decoding="async" data-nimg="fill" class="css-0"
                            style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;"></span>
                    </div>
                    <div class="css-1p7augg e1xnucib3"><span
                            class="css-1n9elca e1xnucib2 modal-item-name">[KF365] 햇감자 1kg</span></div>
                </div>
                <div class="css-hjdyv5 e1xnucib1">
                    <div class="css-kiebmq e1b27mtb8">
                        <div class="css-1066lcq e1b27mtb7"><span
                                class="css-rsi182 e1b27mtb6 modal-item-name">[KF365] 감자 1kg</span></div>
                        <div class="css-e7dd1m e1b27mtb5 modal-item-disprice-hidden" style="display: none"></div>
                        <div class="css-2fwlel e1b27mtb4">
                            <div class="css-23v5d0 e1b27mtb3"><span
                                    class="css-1kl4at5 e1b27mtb2 modal-item-disprice">6,120원</span><span
                                    class="css-pblsth e1b27mtb1 modal-item-price">6,590원</span></div>
                            <div class="e1b27mtb0 css-2q9wxp e1cqr3m40">
                                <button type="button" aria-label="수량내리기"
                                        class="css-8azp8 e1hx75jb0 subtract-item-cnt"></button>
                                <div class="count css-6m57y0 e1cqr3m41 modal-item-cnt">1</div>
                                <button type="button" aria-label="수량올리기"
                                        class="css-18y6jr4 e1hx75jb0 add-item-cnt"></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="css-1ovj4tx e1xnucib0">
                    <div class="css-1fttcpj e9qarb89">
                        <div class="css-1066lcq e9qarb88"><p class="css-1sl7ome e9qarb87">합계</p>
                            <div><span class="css-1qdap1a e9qarb86 modal-item-disprice-final">6,120</span></div>
                        </div>
                    </div>
                </div>
                <div class="css-1toes8l e1vslu8h0">
                    <button class="exist-modal css-1w3nh5f e4nu7ef3" type="button" height="56"><span
                            class="css-nytqmg e4nu7ef1">취소</span></button>
                    <button class="put-in-cart-2 css-ahkst0 e4nu7ef3" type="button" height="56"><span
                            class="css-nytqmg e4nu7ef1" style="color: rgb(255, 255, 255);">장바구니 담기</span></button>
                    <div class="item-id" style="display: none;"></div>
                </div>
            </div>
        </div>
        <div tabindex="0" data-test="sentinelEnd"></div>
    </div>
    <%--장바구니 담기 모달창 끝 --%>
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
                <h2>찜한 상품(${wishListItemCounter})</h2>
                <span class="desc">찜한 상품은 최대 200개까지 저장됩니다.</span>
            </div>
        </div>
        <div class="wish-list">
            <c:if test="${wishListItemCounter ne 0}">
                <c:forEach var="wishListItem" items="${wishListItemList}">
                    <div class="css-1pj4itr e1jp10d17" style="width: 100%">
                        <c:set var="wishListItemId" value="${wishListItem.itemId}"/>
                        <a href="/goods/${wishListItemId}" class="css-zw1kn5 e1jp10d16">
                            <span width="60" height="78" class="css-s2pfj eq9umyc2">
                                <span
                                        style="
                        box-sizing: border-box;
                        display: block;
                        overflow: hidden;
                        width: initial;
                        height: initial;
                        background: none;
                        opacity: 1;
                        border: 0px;
                        margin: 0px;
                        padding: 0px;
                        position: absolute;
                        inset: 0px;
                      ">
                                    <img
                                            alt=""
                                            sizes="100vw"
                                            src="https://product-image.kurly.com/cdn-cgi/image/width=120,height=156,fit=crop,quality=85/product/image/4b6bba61-b8a0-49c6-95f2-4c178f13319f.jpg"
                                            decoding="async"
                                            data-nimg="fill"
                                            class="css-0"
                                            style="
                          position: absolute;
                          inset: 0px;
                          box-sizing: border-box;
                          padding: 0px;
                          border: none;
                          margin: auto;
                          display: block;
                          width: 0px;
                          height: 0px;
                          min-width: 100%;
                          max-width: 100%;
                          min-height: 100%;
                          max-height: 100%;
                          object-fit: cover;
                        "/>
                                </span>
                            </span>
                        </a>
                        <div class="css-14z46lg e1jp10d15">
                            <div class="css-a3z6ut e1jp10d14">
                                <div class="css-v2aaoi e1jp10d12">
                                    <a href="/goods/${wishListItemId}" class="css-4ejps8 e1jp10d13">
                                            ${wishListItem.name}
                                    </a>
                                </div>
                                <div class="css-1d6cvj1 e1jp10d11">
                                    <span class="css-x4qt93 e1alt0er2">${wishListItem.dcRt}%</span>
                                    <span class="css-153tu4t e1alt0er1"><fmt:formatNumber pattern="#,###원"
                                                                                          value="${wishListItem.price - wishListItem.itemDcAmt}"/></span>
                                    <span class="css-1h2g4dm e1alt0er0"><fmt:formatNumber pattern="#,###원"
                                                                                          value="${wishListItem.price}"/></span>
                                </div>
                            </div>
                            <div class="css-jx12wb e1jp10d10">
                                <button
                                        class="css-17giheb e4nu7ef3"
                                        type="button"
                                        width="104"
                                        height="36"
                                        radius="4"
                                >
                                    <input type="hidden" value="${wishListItemId}"/>
                                    <span class="css-abcde e4nu7ef1">삭제</span>
                                </button>
                                <button
                                        class="css-x0zbdy e4nu7ef3"
                                        type="button"
                                        width="104"
                                        height="36"
                                        radius="4"
                                >
                                    <input type="hidden" id="itemId" value="${wishListItemId}"/>
                                    <input type="hidden" id="itemDisPrice"
                                           value="${wishListItem.price - wishListItem.itemDcAmt}"/>
                                    <span class="css-nytqmg e4nu7ef1">
                                            <img
                                                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTM2IDM2SDBWMGgzNnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg1LjE2NCA2LjU0NykiIHN0cm9rZT0iIzVmMDA4MCIgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjciPgogICAgICAgICAgICA8cGF0aCBkPSJtMjUuNjggMy42Ni0yLjcyIDExLjU3SDcuMzdMNC42NiAzLjY2eiIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSIyMC41MiIgY3k9IjIwLjc4IiByPSIyLjE0Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjkuODEiIGN5PSIyMC43OCIgcj0iMi4xNCIvPgogICAgICAgICAgICA8cGF0aCBkPSJNMCAwaDMuOGwxLjc2IDcuNSIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg=="
                                                    alt=""
                                                    class="css-1m3kac1 e4nu7ef0"
                                            />담기
                                        </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
