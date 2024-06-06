<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sookyung
  Date: 2024/02/21
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/seller/productsOriginList.css'/>"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>
<div class="productsOriginListMain" style="margin-left:20%;padding:1px 16px;height:1000px;">

    <div style="margin-top: 55px">

    <div id="seller-content" class="seller-sub-frame" >
    <!----><!----><!---->
    <ui-view>
        <div class="seller-sub-title">
            <div class="pull-left">
                <h2 class="title">
                    상품 조회/수정
                </h2>
            </div>
            <!----><!---->
        </div>
        <div class="seller-sub-content">
            <!---->
            <ui-view name="search"><!---->
                <div
                        class="form-section seller-status"
                >
                    <ul class="seller-status-list">
                        <!---->
                        <li class="show_li">
                            <a
                                    href=""
                                    class="status-link-area"
                            ><span class="status-icon"
                            ><i
                                    class="seller-icon icon-all"
                            ></i
                            ></span>
                                <div class="text">
                                    <p>전체</p>
                                    <strong>${goodsByBsnsNo.size()}</strong><em>건</em>
                                </div>
                            </a
                            >
                        </li>
                        <!---->
                        <li
                                class="show_li"
                                style=""
                        >
                            <a
                                    href=""
                                    class="status-link-area"
                            ><span class="status-icon"
                            ><i
                                    class="seller-icon icon-wait"
                            ></i
                            ></span>
                                <div class="text">
                                    <p>판매대기</p>
                                    <strong>0</strong><em>건</em>
                                </div>
                            </a
                            >
                        </li>
                        <!---->
                        <li
                                aria-selected="false"
                                class="show_li"                        >
                            <a
                                    href=""
                                    class="status-link-area"
                            ><span class="status-icon"
                            ><i
                                    class="seller-icon icon-sale"
                            ></i
                            ></span>
                                <div class="text">
                                    <p>판매중</p>
                                    <strong>0</strong><em>건</em>
                                </div>
                            </a
                            >
                        </li>
                        <!---->
                        <li
                                aria-selected="false"
                                class="show_li"                        >
                            <a
                                    href=""
                                    class="status-link-area"
                            ><span class="status-icon"
                            ><i
                                    class="seller-icon icon-outofstock"
                                    aria-hidden="true"
                            ></i
                            ></span>
                                <div class="text">
                                    <p>품절</p>
                                    <strong>0</strong><em>건</em>
                                </div>
                            </a
                            >
                        </li>
                        <!---->
                        <li
                                aria-selected="false"
                                class="show_li"                        >
                            <a
                                    href=""
                                    class="status-link-area"
                            ><span class="status-icon"
                            ><i
                                    class="seller-icon icon-unadmission"
                                    aria-hidden="true"
                            ></i
                            ></span>
                                <div class="text">
                                    <p>승인대기</p>
                                    <strong>0</strong><em>건</em>
                                </div>
                            </a
                            >
                        </li>
                        <!---->
                        <li
                                class="show_li"                        >
                            <a
                                    href=""
                                    class="status-link-area"
                                    data-nclicks-code="stu.stop"
                            ><span class="status-icon"
                            ><i
                                    class="seller-icon icon-suspension"
                                    aria-hidden="true"
                            ></i
                            ></span>
                                <div class="text">
                                    <p>판매중지</p>
                                    <strong>0</strong><em>건</em>
                                </div>
                            </a
                            >
                        </li>
                        <!---->
                        <li
                                aria-selected="false"
                                class="show_li"                        >
                            <a
                                    href=""
                                    class="status-link-area"
                            ><span class="status-icon"
                            ><i
                                    class="seller-icon icon-close"
                            ></i
                            ></span>
                                <div class="text">
                                    <p>판매종료</p>
                                    <strong>0</strong><em>건</em>
                                </div>
                            </a
                            >
                        </li>
                        <!---->
                        <li
                                aria-selected="false"
                                class="show_li"                        >
                            <a
                                    href=""
                                    class="status-link-area"
                            ><span class="status-icon"
                            ><i
                                    class="seller-icon icon-prohibition"
                            ></i
                            ></span>
                                <div class="text">
                                    <p>판매금지</p>
                                    <strong>0</strong><em>건</em>
                                </div>
                            </a
                            >
                        </li>
                        <!---->
                    </ul>
                </div>
                <!---->
            </ui-view><!---->

            <!-- 상품 목록 -->
            <ui-view name="list"
            >
                <div class="panel panel-seller">
                    <div class="panel-heading">
                        <div class="pull-left">
                            <h3 class="panel-title">
                                상품목록 (총 <span class="text-primary">${goodsByBsnsNo.size()}</span>개)
                            </h3>
                        </div>
                    </div>
                    <div class="panel-body">
                        <!---->
                        <div
                                class="seller-btn-group"
                        >
                            <!----><!----><!---->

                            <!---->
                        </div>

                        <!-- 상품목록리스트  -->

                        <div class="seller-grid-area">
                            <div class="css-e23nfx e16adls21">
                                <div width="50" class="css-mbsaqp e16adls20">번호</div>
                                <div class="css-1ym8aqm e16adls20">상품명</div>
                                <div width="100" class="css-16tcewl e16adls20">상품아이디</div>
                                <div width="100" class="css-16tcewl e16adls20">원가</div>
                                <div width="100" class="css-16tcewl e16adls20">할인율</div>
                                <div width="100" class="css-16tcewl e16adls20">판매가격</div>
                                <div width="100" class="css-16tcewl e16adls20"></div>
                            </div>

                            <!-- 목록 -->

                            <c:forEach var="goodsByB" items="${goodsByBsnsNo}" varStatus="status">
                                <form action="" id="form">

                                <div class="css-e23nfx2 e16adls21">
                                    <div width="50" class="css-mbsaqp e16adls20">${status.count}</div>
                                    <div class="css-1ym8aqm e16adls20">
                                        <a href="<c:url value='/seller/productsCreate/read?itemId=${goodsByB.itemId}'/>">${goodsByB.name}</a>
                                    </div>
                                    <div width="100" class="css-16tcewl e16adls20">${goodsByB.itemId}</div>
                                    <div width="100" class="css-16tcewl e16adls20">${goodsByB.price}</div>
                                    <div width="100" class="css-16tcewl e16adls20">${goodsByB.dcRt}%</div>

                                        <%--  jstl 계산식--%>
                                    <fmt:parseNumber value="${goodsByB.price}" var="price"/>
                                    <fmt:parseNumber value="${goodsByB.itemDcAmt}" var="dcAmt"/>
                                    <div width="100" id="resultprice"
                                         class="css-16tcewl e16adls20"> ${price - dcAmt}</div>

                                    <div width="100" class="css-16tcewl e16adls20">
                                        <button type="button" id="modifyBtn" onclick="modify(${goodsByB.itemId})">
<%--                                            <a href="<c:url value='/seller/productsOriginList/read?itemId=${goodsByB.itemId}'/>">수정</a>--%>
                                            수정하기
                                          </button>


                                        <button type="button" id="removeBtn" name="${goodsByB.itemId}" onclick="confirmDelete(${goodsByB.itemId})">
                                        삭제
                                        </button>

                                    </div>

                                </div>
                                </form>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- 상품등록버튼 -->
                <div class="panel-footer">
                    <div
                            class="seller-btn-area"
                    >
                        <button name="productsCreate"
                                type="button"
                                onclick="location.href='/seller/productsCreate'"
                                class="btn btn-primary btn-lg">
                            상품 등록하기
                        </button>
                    </div>
                    <!---->
                </div>
            </ui-view>
        </div>
    </ui-view>
</div>
</div>
</div>
<script>

<%--  삭제버튼  --%>
    function confirmDelete(itemId) {
        // 경고 창 표시
        console.log(itemId);
        if (confirm("삭제하시겠습니까?")) {
            // 확인을 눌렀을 경우, 링크 이동
            window.location.href = '/seller/productsCreate/remove?itemId=' + itemId;
        } else {
            // 취소를 눌렀을 경우, 아무 동작 없음
        }
    }

<%--  수정버튼  --%>
function modify(itemId) {
    // 경고 창 표시
    console.log(itemId);
    if (confirm("수정하시겠습니까?")) {
        // 확인을 눌렀을 경우, 링크 이동
        window.location.href = '/seller/productsCreate/read?itemId=' + itemId;


    } else {
        // 취소를 눌렀을 경우, 아무 동작 없음
    }
}


</script>
</body>
</html>

