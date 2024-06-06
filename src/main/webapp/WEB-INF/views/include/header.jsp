<%@ page import="com.brokurly.dto.member.MemberAndLoginDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: munnahye
  Date: 2/9/24
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.brokurly.dto.member.MemberAndLoginDto" %>

<%@ page session="false" %>
<c:set var="loginSession"
       value="${pageContext.request.session.getAttribute('loginName')==null ? '로그인' : pageContext.request.session.getAttribute('loginName')+='님'}"/>
<c:set var="signup" value="${loginSession =='로그인' ? '회원가입' : ''}"/>


<html>
<head>
  <title>브로컬리</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/include/header.css'/>"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"
          integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <style>
      a { /*하이퍼 링크 줄 제거 */
          text-decoration: none !important; /* 밑줄 제거 */
          color: black !important; /* 텍스트 색상을 검은색으로 설정 */
      }

      .css-taug43 {
          max-height: calc(95vh - 55px);
          min-height: 200px;
          position: absolute;
          display: flex;
          top: 46px;
          padding-top: 10px;
      }

      .css-9d3cf6 {
          position: relative;
          z-index: 321;
          /* width: 249px;
      border: 1px solid rgb(221, 221, 221);
      background-color: rgb(255, 255, 255); */
          /* animation: 0s linear 0s 1 normal none running animation-w43n76; */
      }

      .css-13ct7qm {
          overflow-y: auto;
          width: 247px;
          height: 100%;
          background-color: rgb(255, 255, 255);
          cursor: pointer;
          width: 249px;
          border: 1px solid rgb(221, 221, 221);
          background-color: rgb(255, 255, 255);
          padding: 0;
      }

      ul {
          display: block;
          list-style-type: none;
          /* margin-block-start: 1em; */
          margin-block-end: 1em;
          margin-inline-start: 0px;
          margin-inline-end: 0px;
          padding-inline-start: 40px;
      }

      li {
          text-align: -webkit-match-parent;
      }

      .css-you2kh {
          padding: 7px 0px 9px 14px;
      }

      .css-11n7bn4 {
          display: flex;
          flex-wrap: wrap;
          align-items: flex-start;
      }

      .css-ar6ptu {
          flex: 0 1 0%;
          width: 24px;
          height: 24px;
      }

      .css-mhaka4 {
          flex: 1 1 0%;
          padding: 1px 20px 0px 10px;
          color: rgb(51, 51, 51);
          font-size: 14px;
          font-weight: 400;
          line-height: 22px;
      }

      /* .dropdown-content{
    display: none;
}

#category:hover .dropdown-content{
    display: block;

} */

      #category {
          display: inline-block;
          position: relative;
      }

      #category ul {
          display: none;
      }

      .css-1cbaoeg {
          width: 266px;
          height: 100%;
          position: absolute;
          overflow-y: scroll;
          top: -1px;
          left: 249px;
          z-index: 320;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-delay: 0s;
          animation-iteration-count: 1;
          animation-direction: normal;
          animation-fill-mode: none;
          animation-play-state: running;
          animation-name: animation-plwpox;
          animation-timeline: auto;
          animation-range-start: normal;
          animation-range-end: normal;
      }

      .css-e0dnmk {
          cursor: pointer;
      }

      .css-o2oaem {
          padding: 11px 20px 11px 18px;
          display: flex;
          width: 100%;
          -webkit-box-align: center;
          align-items: center;
          font-weight: 400;
          font-size: 14px;
          color: rgb(51, 51, 51);
          line-height: 22px;
      }
  </style>

</head>
<body>
<%
  HttpSession session = request.getSession();
  String custId = "";
  if (session.getAttribute("loginMember") != null)
    custId = ((MemberAndLoginDto) request.getSession().getAttribute("loginMember")).getCustId();
%>
<div>
  <input class="cartCnt" type="hidden" value="<%= custId %>">
  <div class="head-1">
    <div class="login-wrap">
      <c:if test="${loginSession eq '로그인'}">
        <a class="lg-text" href="<c:url value='/member/signup'/>">${signup}</a>
        <div class="lg-bar"></div>
      </c:if>
      <c:if test="${loginSession eq '로그인'}">
        <a class="lg-text" href="<c:url value='/member/login'/>">${loginSession}</a>
      </c:if>
      <c:if test="${loginSession ne '로그인'}">
        <div class="lg-text3wrap">${loginSession}<span class="css-1lrerrk eo4j3y50"></span>
          <div class="menu cs-bar-wrap">
            <div class="cscenter-bar"><a href="<c:out value='/mypage/order/list'/>">주문내역</a></div>
            <div class="cscenter-bar">선물내역</div>
            <div class="cscenter-bar">자주 사는 상품</div>
            <div class="cscenter-bar"><a href="<c:out value='/mypage/pick/list'/>">찜한 상품</a></div>
            <div class="cscenter-bar"><a href="<c:out value='/mypage/address'/>">배송지 관리</a></div>
            <div class="cscenter-bar">상품 후기</div>
            <div class="cscenter-bar">결제수단·컬리페이</div>
            <div class="cscenter-bar">상품 문의</div>
            <div class="cscenter-bar"><a href="<c:out value='/mypage/point/usage'/>">적립금·컬리캐시</a></div>
            <div class="cscenter-bar">쿠폰</div>
            <div class="cscenter-bar">개인 정보 수정</div>
            <div class="cscenter-bar"><a href="<c:out value='/member/logout'/>">로그아웃</a></div>
          </div>

        </div>
      </c:if>


      <div class="lg-bar"></div>
      <div class="lg-text3wrap">
        <a class="lg-text"
        >고객센터 <span class="css-1lrerrk eo4j3y50"></span
        ></a>
        <div class="menu cs-bar-wrap">
          <a href="/board/notice" class="cscenter-bar">공지사항</a>
          <a href="/board/faqboard" class="cscenter-bar">자주하는 질문</a>
          <a href="/board/inquiry" class="cscenter-bar">1:1 문의</a>
        </div>
      </div>
    </div>

    <div class="search-bar-wrap">
      <div class="mainlogo">
        <div style="width: 212px; height: 90px; display: flex; align-items: center;">
          <img
              src="/resources/image/brokurly.png"
              alt="브로컬리 로고"
              class="mainlogo-img"
          />
        </div>
        <button class="active css-mxd3pm ekdqe1a0">브로컬리</button>
      </div>

      <div class="searchbox-wrap">
        <div class="searchbox">
          <form id="search_container" method="get" action="/search">
            <input
                id="gnb_search"
                placeholder="검색어를 입력해주세요"
                required=""
                class="searchbox-text"
                name="sword"
                value=""
            />
            <button
                id="submit"
                aria-label="submit"
                class="searchbox-btn"
            ></button>
          </form>
        </div>
      </div>

      <div class="wishlist-wrap1">
        <div class="wishlist-wrap2">
          <div class="location-icon"></div>
          <button
              class="wishlist-icon"
              aria-label="찜하기"
              type="button"
              onclick="location.href='/mypage/pick/list'"
          ></button>
          <div class="cart-icon">
            <button class="cart-icon-btn" onclick="location.href='/cart/cartList'">
              <%--                            <div class="cart-cnt" style="top: 7px; position: absolute; right: 3px;">--%>
              <%--                               <span class="position-absolute start-100 translate-middle badge rounded-pill bg-danger">--%>
              <%--                                1--%>
              <%--&lt;%&ndash;                                <span class="visually-hidden">unread messages</span>&ndash;%&gt;--%>
              <%--                              </span>--%>
              <%--                            </div>--%>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="header">
    <div class="menu-bar-wrap">
      <div id="category">
        <div class="category-1">
              <span class="css-1k5gn9s eqn756m1"></span
              ><span class="category-2">카테고리</span>

          <div class="css-taug43 e7s0tnu0 dropdown-content">
            <div width="0" class="css-9d3cf6 e1vs1ym87">
              <ul class="css-13ct7qm e1vs1ym86">
                <%--                                <li class="css-you2kh e1vs1ym83 menuItem1">--%>


                <%--                                    <c:forEach var="item" items="${selectMain}">--%>

                <%--                                        <li class="css-you2kh e1vs1ym83 menuItem1">--%>
                <%--                                            <div class="css-11n7bn4 e1vs1ym81">--%>
                <%--                                                <img src="/resources/image/icon-.png" alt="채소" class="css-ar6ptu e1vs1ym82" />--%>
                <%--                                                <span class="css-mhaka4 e1vs1ym84">${item.exp}</span>--%>
                <%--                                            </div>--%>
                <%--                                        </li>--%>
                <%--                                    </c:forEach>--%>


                <c:forEach var="item" items="${selectMain}" varStatus="loop">
                  <li class="css-you2kh e1vs1ym83 menuItem1">
                    <div class="css-11n7bn4 e1vs1ym81">
                      <!-- 이미지 파일명 설정 -->
                      <img src="/resources/image/icon-<c:out value="${loop.index + 1}" />.png"
                           alt="${item.exp}"
                           class="css-ar6ptu e1vs1ym82"/>
                      <span class="css-mhaka4 e1vs1ym84"><a
                          href="/categories/${item.codeId}?page=1">${item.exp}</a></span>

                    </div>
                  </li>
                </c:forEach>

                <li width="535" class="css-1jdpv96 e1vs1ym85"></li>
                <li width="0" class="css-1xy9xh5 e1vs1ym85"></li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <ul class="cate-menu-wrap">
        <li class="cate-menu-1">
          <span class="cate-menu-txt"><a href="<c:url value='/market-newproduct'/>">신상품</span>
        </li>
        <li class="cate-menu-1">
          <span class="cate-menu-txt"><a href="<c:url value='/categories/best-page'/>">베스트</a></span>
        </li>
        <li class="cate-menu-1">
          <span class="cate-menu-txt">알뜰쇼핑</span>
        </li>
        <li class="cate-menu-1">
          <span class="cate-menu-txt">특가/혜택</span>
        </li>
      </ul>

      <div class="delivery-nt1">
        <div class="delivery-nt2">
          <span class="delivery-nt-txt">샛별・하루</span>
          배송안내
        </div>
      </div>
    </div>
  </div>
</div>
<div hidden="" class="css-1px7x3s e1py5jsz0"></div>

<script>

    //   const mainMenu = document.getElementById("category"); //div id
    //   const menuItem1 = document.getElementsByClassName("menuItem1"); // li ld
    //   const subMenu1 = document.getElementsByClassName("subMenu1");

    //   mainMenu.addEventListener("mouseenter", () => {
    //     mainMenu.querySelector("ul").style.display = "block";
    //   });

    //   mainMenu.addEventListener("mouseleave", () => {
    //     mainMenu.querySelector("ul").style.display = "none";
    //     subMenu1.style.display = "none";
    //   });

    //   menuItem1.addEventListener("mouseenter", () => {
    //     subMenu1.style.display = "block";
    //   });

    // menuItem1.addEventListener("mouseleave", () => {
    //     subMenu1.style.display = "none";
    // });
    // const mainMenu = document.getElementById("category"); // div id
    // const menuItem1 = document.getElementsByClassName("menuItem1"); // li id
    // const subMenu1 = document.getElementsByClassName("subMenu1");

    // mainMenu.addEventListener("mouseenter", () => {
    // mainMenu.querySelector("ul").style.display = "block";
    // });

    // mainMenu.addEventListener("mouseleave", () => {
    // mainMenu.querySelector("ul").style.display = "none";
    // subMenu1.style.display = "none";
    // });

    // menuItem1.addEventListener("mouseenter", () => {
    // subMenu1.style.display = "block";
    // });

    // menuItem1.addEventListener("mouseleave", () => {
    // subMenu1.style.display = "none";
    // });

    const mainMenu = document.getElementById("category"); // div id
    const menuItem1 = document.querySelectorAll(".menuItem1"); // li id
    const subMenu1 = document.querySelectorAll(".subMenu1");

    for (let i = 0; i < subMenu1.length; i++) {
        subMenu1[i].style.display = "none";
    }

    mainMenu.addEventListener("mouseenter", () => {
        mainMenu.querySelector("ul").style.display = "block";
    });

    mainMenu.addEventListener("mouseleave", () => {
        mainMenu.querySelector("ul").style.display = "none";
        for (let i = 0; i < subMenu1.length; i++) {
            subMenu1[i].style.display = "none";
        }
    });

    for (let i = 0; i < menuItem1.length; i++) {
        menuItem1[i].addEventListener("mouseenter", () => {
            for (let j = 0; j < subMenu1.length; j++) {
                subMenu1[j].style.display = "block";
            }
        });

        menuItem1[i].addEventListener("mouseleave", () => {
            for (let j = 0; j < subMenu1.length; j++) {
                subMenu1[j].style.display = "none";
            }
        });
    }

    $(document).ready(function () { //장바구니 개수 로그인 전이면 숨기기
        let cartCNt = $(".cartCnt").val();
        if (cartCNt.trim() === "") {
            $(".position-absolute").hide();
        } else {
            $(".position-absolute").show();
        }
    });

    $(document).ready(function () {  //브로콜리 로고나 브로컬리 글 누르면 베스트 페이지로
        $('.mainlogo-img, .css-mxd3pm').on('click', function () {
            window.location.href = 'http://localhost:8080/market-newproduct';
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
