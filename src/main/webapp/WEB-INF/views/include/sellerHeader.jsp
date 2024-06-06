<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by
IntelliJ IDEA. User: sookyung Date: 2024/03/11 Time: 5:43 PM To change this
template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>
<c:set var="loginSession" value="${pageContext.request.session.getAttribute('sellerName')==null ? '로그인' : pageContext.request.session.getAttribute('sellerName')+='님'}"/>
<c:set var="signup" value="${loginSession =='로그인' ? '' : '로그아웃'}"/>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link rel="preconnect" href="https://fonts.googleapis.com%22%3E/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
            rel="stylesheet"
    />

    <title>Title</title>
    <style>
        body {
            font-family: "Noto Sans KR", sans-serif;
            font-size: 13px;
            margin: 0;
        }

        .header-detail__column a,.submenu-detail__column a {
            text-decoration: none;
            color: white;
        }

        .header-detail__column a:hover, .submenu-detail__column a:hover{
            background-color : transparent;
        }
        .header-detail__column a:active, .submenu-detail__column a:active {
            color: white;
        }
        .header-detail__column a:visited, .submenu-detail__column a:visited {
            color: white;
        }

        /* 헤더 */

        .main-header{
            width: 100%;
            height: 55px;
            background-color: #003103;
            display: flex;
            justify-content: space-between;
            position: fixed;
            overflow: auto;
            z-index: 3;

        }

        .header-div__column{
            margin: 15px;
            color: white;
            display: flex;
            z-index: 2;

        }

        .header-detail__column{
            margin: 0 5px 0 5px;
        }

        /* 네비 */
        .submenu{
            width: 15%;
            height: 100%;
            background-color: #034007;
            color : white;
            position: fixed;
            overflow: auto;
            top:50px;
        }

        .submenu-div__column{
            position: relative;
            top: 10%;
            left: 10%;
        }

        .submenu-detail__column{
            margin-bottom: 20px;
        }

        img{
            width: 100px;
            margin : -5px 0 0 -15px;
            z-index: 4;
        }
    </style>
</head>
<body>
<div class="whole">
    <!-- 상단네비 -->
    <div class="main-header">
        <div class="header-div__column">
            <div class="header-detail__column">
                <a href="/market-newproduct"
                ><img src="/resources/image/brokurlyAdmin.png"
                /></a>
            </div>
            <div class="header-detail__column">
                <a href="/market-newproduct">브로컬리</a>
            </div>
            |
            <div class="header-detail__column"><a href="#">관리자센터</a></div>
        </div>
        <div class="header-div__column">
            <c:if test="${loginSession ne '로그인'}">
                <div class="header-detail__column">${loginSession}</div>
            </c:if>
            <c:if test="${loginSession ne '로그인'}">
                <div class="header-detail__column"><a href="<c:url value='/seller/logout'/>">${signup}</a></div>
            </c:if>
<%--            <div class="header-detail__column">판매자</div>--%>
<%--            <div class="header-detail__column">로그아웃</div>--%>
        </div>
    </div>
    <!-- 왼쪽 네비 -->

    <div class="submenu">
        <div class="submenu-div__column">
            <div
                    class="submenu-detail__column"
                    style="font-weight: 600; font-size: 16px"
            >
                상품관리
            </div>
            <div class="submenu-detail__column">
                <a href="/seller/productsOriginList">상품 조회/수정</a>
            </div>
            <div class="submenu-detail__column">
                <a href="/seller/productsCreate">상품 등록</a>
            </div>
            <div class="submenu-detail__column">
                <a href="#/products/delivery/bundle">배송정보 관리</a>
            </div>
            <div class="submenu-detail__column">
                <a href="#/notice/search" class="submenu_a">공지사항 관리</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
