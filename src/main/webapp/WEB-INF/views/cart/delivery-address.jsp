<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- 가격에 ,찍기 기능용--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/cart/delivery-address.css'/>"/>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"
          integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body class="vsc-initialized">
<div id="__next" data-reactroot="">
  <div class="css-1c9gcj2 e17o7yjp8">
    <div class="css-3tv9jr e17o7yjp7">
      <h2 class="css-3ljxig e17o7yjp6">
        배송지<span class="css-1nvqzrc e17o7yjp5"
      >배송지에 따라 상품정보 및 배송유형이 달라질 수 있습니다.</span
      >
      </h2>
      <div class="css-r1km81 e17o7yjp4">
        <span>선택</span><span>배송 정보</span><span>수정</span>
      </div>
    </div>
    <c:forEach items="${shippingLocationList}" var="shippingLocation">
      <div class="css-0">
        <div class="css-c08slb">
          <div class="css-1g6fovq">


<%--                        <label class="css-gi1xdhyk6 e1dcessg3" for="kurly-address-22760216">--%>
<%--                          <input--%>
<%--                            data-testid="address-item"--%>
<%--                            id="kurly-address-22760216"--%>
<%--                            type="checkbox"--%>
<%--                            class="css-agvwxo e1dcessg2"--%>
<%--                            value="경기 용인시 기흥구 동백7로 56 (호수마을서해그랑블)"--%>
<%--                            checked="" />--%>
<%--                          <div class="css-79hxr7 e1dcessg1">--%>
<%--                            <svg--%>
<%--                                width="24"--%>
<%--                                height="24"--%>
<%--                                viewBox="0 0 24 24"--%>
<%--                                fill="none"--%>
<%--                                xmlns="http://www.w3.org/2000/svg"--%>
<%--                            >--%>
<%--                              <path--%>
<%--                                  d="M12 24C18.6274 24 24 18.6274 24 12C24 5.37258 18.6274 0 12 0C5.37258 0 0 5.37258 0 12C0 18.6274 5.37258 24 12 24Z"--%>
<%--                                  fill="#5f0080"--%>
<%--                              ></path>--%>
<%--                              <path--%>
<%--                                  d="M7 12.6667L10.3846 16L18 8.5"--%>
<%--                                  stroke="#fff"--%>
<%--                                  stroke-width="1.5"--%>
<%--                                  stroke-linecap="round"--%>
<%--                                  stroke-linejoin="round"--%>
<%--                              ></path>--%>
<%--                            </svg>--%>
<%--                          </div>--%>
<%--                          <span></span--%>
<%--                          ></label>--%>


            <c:if test="${shippingLocation.currAddrFl eq 'N'}">
<%--              <form class="checkbox" method="post">--%>
<%--                <input type="hidden" name="_method" value="patch"/>--%>
<%--                <input type="hidden" name="shipLocaId" value="${shippingLocation.shipLocaId}"/>--%>
<%--                <input type="hidden" name="currAddrFl" value="Y"/>--%>
<%--              </form>--%>
              <div class="checkbox">
                <input type="hidden" name="shipLocaId" value="${shippingLocation.shipLocaId}"/>
              </div>
            </c:if>
            <c:if test="${shippingLocation.currAddrFl eq 'Y'}">
              <div class="checkbox-checked"></div>
            </c:if>
          </div>
          <div data-testid="address-area" class="css-82a6rk">
            <c:if test="${shippingLocation.defAddrFl eq 'Y'}">
              <span class="css-1pfhx0h egfaucj5">기본 배송지</span>
            </c:if>
            <p class="css-12stxlh">
                ${shippingLocation.addr} ${shippingLocation.specAddr}
            </p>
            <p class="css-185jqch">
                ${shippingLocation.recName}<span class="css-52eudx"></span>${shippingLocation.telNo}
            </p>
            <div class="css-1gcxwpt">
              <span type="direct" class="css-z4mca9">샛별배송</span>
            </div>
          </div>
          <div class="css-1g6fovq">
            <button>
              <img src="/resources/image/modify.png" width="24px" height="24px">
            </button>
          </div>
        </div>
      </div>
    </c:forEach>








    <div class="css-m0h4tf">
      <button class="css-1bqw8am add-new-deli" type="button" height="60">
            <span class="css-nytqmg"
            ><img
                src="https://res.kurly.com/pc/ico/2006/ico_add_16x16.svg"
                alt=""
                class="css-1m3kac1"
            />새 배송지 추가</span
            >
      </button>
    </div>
  </div>
</div>
<%--<script id="__NEXT_DATA__" type="application/json">--%>
<%--  {--%>
<%--    "props": {--%>
<%--      "pageProps": {}--%>
<%--    },--%>
<%--    "page": "/address/shipping-address/list",--%>
<%--    "query": {},--%>
<%--    "buildId": "2-2TW4TLVq2PBlrxeHO63",--%>
<%--    "assetPrefix": "https://res.kurly.com",--%>
<%--    "nextExport": true,--%>
<%--    "autoExport": true,--%>
<%--    "isFallback": false,--%>
<%--    "scriptLoader": []--%>
<%--  }--%>
<%--</script>--%>
<%--<script id="clarity-script" data-nscript="afterInteractive">--%>
<%--    (function (c, l, a, r, i, t, y) {--%>
<%--        c[a] =--%>
<%--            c[a] ||--%>
<%--            function () {--%>
<%--                (c[a].q = c[a].q || []).push(arguments);--%>
<%--            };--%>
<%--        t = l.createElement(r);--%>
<%--        t.async = 1;--%>
<%--        t.src = "https://www.clarity.ms/tag/" + i;--%>
<%--        y = l.getElementsByTagName(r)[0];--%>
<%--        y.parentNode.insertBefore(t, y);--%>
<%--    })(window, document, "clarity", "script", "jbtozksiax");--%>
<%--</script>--%>
<%--<next-route-announcer--%>
<%--><p--%>
<%--    aria-live="assertive"--%>
<%--    id="__next-route-announcer__"--%>
<%--    role="alert"--%>
<%--    style="--%>
<%--          border: 0px;--%>
<%--          clip: rect(0px, 0px, 0px, 0px);--%>
<%--          height: 1px;--%>
<%--          margin: -1px;--%>
<%--          overflow: hidden;--%>
<%--          padding: 0px;--%>
<%--          position: absolute;--%>
<%--          width: 1px;--%>
<%--          white-space: nowrap;--%>
<%--          overflow-wrap: normal;--%>
<%--        "--%>
<%--></p--%>
<%--></next-route-announcer>--%>
<%--<script--%>
<%--    src="https://www.googletagmanager.com/gtag/js?id=G-BJ5N3PD9QG"--%>
<%--    id="google-tag-manager"--%>
<%--    data-nscript="afterInteractive"--%>
<%--></script>--%>
<%--<script id="google-analytics" data-nscript="afterInteractive">--%>
<%--    window.dataLayer = window.dataLayer || [];--%>

<%--    function gtag() {--%>
<%--        window.dataLayer.push(arguments);--%>
<%--    }--%>

<%--    gtag("js", new Date());--%>
<%--    gtag("config", "G-BJ5N3PD9QG", {--%>
<%--        user_id: "3d5c0f3d-4d10-4563-89b4-01ac7beb5bea",--%>
<%--        debug_mode: true,--%>
<%--    });--%>




  <script>
      window.onload = () => {
          console.dir(window.opener);

          const receiverDetails = document.querySelector(".add-new-deli");
          receiverDetails.addEventListener("click", () => {
              const left = screen.width / 2 - 300;
              const top = screen.height / 2 - 350;
              window.opener.open( //window.open 으로하면 부모창값이 바뀌므로 중간에 opener를 넣어 부모창 주소를 보내줌
                  "/mypage/address/shipping-address",
                  "a",
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
                      // window.location.reload();
                      window.opener.location.reload(); //부모창 새로고침
                      window.close(); //창 닫기
                  })
                  .catch(error => {
                      console.log(error);
                  })
          });
      };

</script>

<div id="extension-mmplj"></div>
</body>
</html>
