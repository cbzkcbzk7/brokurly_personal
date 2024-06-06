<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: munnahye
  Date: 2/10/24
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="loginName" value="${loginName}"/>
<c:set var="loginSession" value="${pageContext.request.getSession(false)==null ? '' : loginName}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/categories/best-page.css'/>"/>


</head>
<body>
<%--<%@ include file="header.jsp" %>--%>
<%--<c:import url="header.jsp" />--%>
<%--<jsp:include page="../include/header.jsp">--%>
<%--    <jsp:param name="selectMain" value="${selectMain}"/>--%>
<%--</jsp:include>--%>

<div class="best-page">
    <div class="best-menu-wrap1">
        <h3 class="best-name">베스트</h3>
        <ul class="best-menu-wrap2">
            <li class="best-list">
                <a class="best-menu-name">TOP300</a>
            </li>
            <li class="best-list">
                <a class="best-menu-name">인기급상승</a>
            </li>
            <li class="best-list">
                <a class="best-menu-name">컬리에만있는</a>
            </li>
            <li class="best-list">
                <a class="best-menu-name">제철신선</a>
            </li>
            <li class="best-list">
                <a class="best-menu-name">직원추천상품</a>
            </li>
            <li class="best-list">
                <a class="best-menu-name">찜이많은</a>
            </li>
        </ul>
    </div>

    <div class="container">
        <div class="best-content-wrap">
            <div class="side-menu">
                <div class="side-menu-filter">
                    <span class="side-filter-font">필터</span>
                    <button class="filter-re-btn">
                        <svg
                                width="12"
                                height="12"
                                viewBox="0 0 16 16"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                    d="M13.78 3.96303C12.504 2.16973 10.4086 1 8.04 1C4.15192 1 1 4.15192 1 8.04C1 11.9281 4.15192 15.08 8.04 15.08C11.9281 15.08 15.08 11.9281 15.08 8.04"
                                    stroke="#ddd"
                                    stroke-width="1.6"
                                    stroke-linecap="square"
                                    stroke-linejoin="round"
                            ></path>
                            <path
                                    d="M14.4933 1L14.4933 4.52H10.9733"
                                    stroke="#ddd"
                                    stroke-width="1.6"
                                    stroke-linecap="square"
                                    stroke-linejoin="round"
                            ></path>
                        </svg>
                        <span class="filter-re-txt">초기화</span>
                    </button>
                </div>

                <div class="side-category-wrap">
                    <div class="side-category1">
                        <button class="side-cate-btn">
                            <div class="side-cate-txt">카테고리</div>
                            <svg
                                    width="18"
                                    height="18"
                                    viewBox="0 0 18 18"
                                    fill="none"
                                    stroke="#999"
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="css-innaj4"
                                    style="transform: rotate(0deg)"
                            >
                                <path
                                        d="M5 11L9 7L13 11"
                                        stroke="#999"
                                        stroke-width="1.2"
                                ></path>
                            </svg>
                        </button>

                        <nav
                                class="side-cate-menu"
                                style="max-height: 100vh; opacity: 1"
                        >
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A912"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">간편식·밀키트·샐러드</span
                                    ><span class="css-cate-cnt">75</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A910"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">정육·가공육·계란</span
                                    ><span class="css-cate-cnt">50</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A911"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">국·반찬·메인요리</span
                                    ><span class="css-cate-cnt">50</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A908"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">과일·견과·쌀</span
                                    ><span class="css-cate-cnt">35</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A914"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">생수·음료·커피</span
                                    ><span class="css-cate-cnt">19</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A909"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">수산·해산·건어물</span
                                    ><span class="css-cate-cnt">18</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A915"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">베이커리</span
                                    ><span class="css-cate-cnt">17</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A597"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">2024 설 선물세트</span
                                    ><span class="css-cate-cnt">16</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A913"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">면·양념·오일</span
                                    ><span class="css-cate-cnt">16</span></a
                                >
                            </li>
                            <li class="css-cate-list-1">
                                <a
                                        href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=category%3A249"
                                        class="css-cate-list-2"
                                >
                                    <button class="css-cate-btn">
                                        <svg
                                                width="18"
                                                height="18"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                    d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                                    stroke="#ddd"
                                                    fill="none"
                                            ></path>
                                            <path
                                                    d="M7 12.6667L10.3846 16L18 8.5"
                                                    stroke="#ddd"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                            ></path>
                                        </svg>
                                    </button
                                    >
                                    <span class="css-cate-txt">간식·과자·떡</span
                                    ><span class="css-cate-cnt">12</span></a
                                >
                            </li>
                            <button class="css-more-btn">
                                카테고리 더보기
                                <svg
                                        width="18"
                                        height="18"
                                        viewBox="0 0 18 18"
                                        fill="none"
                                        stroke="#999"
                                        xmlns="http://www.w3.org/2000/svg"
                                        class="css-jbgpyq e1frj59j0"
                                >
                                    <path
                                            d="M5 11L9 7L13 11"
                                            stroke="#999"
                                            stroke-width="1.2"
                                    ></path>
                                </svg>
                            </button>
                        </nav>
                    </div>

                    <%--                    브랜드--%>
                    <div class="css-146937 e1frj59j10">
                        <button class="css-16ixplb e1frj59j9">
                            <div class="css-1iwixyn e1frj59j8">브랜드</div>
                            <svg width="18" height="18" viewBox="0 0 18 18" fill="none" stroke="#999"
                                 xmlns="http://www.w3.org/2000/svg" class="css-innaj4 e1frj59j6"
                                 style="transform: rotate(0deg);">
                                <path d="M5 11L9 7L13 11" stroke="#999" stroke-width="1.2"></path>
                            </svg>
                        </button>
                        <nav class="css-1kscq9s e1frj59j5" style="max-height: 100vh; opacity: 1;">
                            <menu class="css-1gtroub e1frj59j4">
                                <li class="css-14cvnbg e1frj59j3">
                                    <button class="css-8fr2f6 e1frj59j2">가나다순</button>
                                </li>
                                <li class="css-14cvnbg e1frj59j3">
                                    <button class="css-1vbs14e e1frj59j2">상품 많은순</button>
                                </li>
                            </menu>
                            <menu class="css-3770rk e5tjvqm2">
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="47" class="css-15z0st1 e5tjvqm0">전체</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㄱ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㄴ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㄷ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㅁ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㅅ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㅇ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㅈ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㅍ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="22" class="css-1e7ssny e5tjvqm0">ㅎ</button>
                                </li>
                                <li class="css-ffhm6p e5tjvqm1">
                                    <button type="button" width="47" class="css-d9k3gf e5tjvqm0">A-Z</button>
                                </li>
                            </menu>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3Aumbstj"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">간편 샐러드</span><span
                                    class="css-ryw54y ee933651">2</span></a></li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3Af8ohqx"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">권영원 소담정찬</span><span
                                    class="css-ryw54y ee933651">1</span></a></li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3Aorq3fj"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">그린자이언트</span><span
                                    class="css-ryw54y ee933651">1</span></a></li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3Aot4ds7"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">김구원선생</span><span
                                    class="css-ryw54y ee933651">2</span></a></li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3Atbg2p5"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">네떼</span><span
                                    class="css-ryw54y ee933651">3</span></a></li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3Argpmac"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">담그루</span><span class="css-ryw54y ee933651">1</span></a>
                            </li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3A2kvma8"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">마주</span><span
                                    class="css-ryw54y ee933651">1</span></a></li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3Aswawgz"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">맛꾼푸드</span><span class="css-ryw54y ee933651">1</span></a>
                            </li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3An4ekt9"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">산양산삼</span><span class="css-ryw54y ee933651">1</span></a>
                            </li>
                            <li class="css-x67gaa e1isxf3i1"><a href="/categories/907?page=1&amp;filters=brand%3Auzzflk"
                                                                class="css-s5xdrg e1isxf3i0">
                                <button class="css-17kh8wb ee933650">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
                                              stroke="#ddd" fill="none"></path>
                                        <path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round"></path>
                                    </svg>
                                </button>
                                <span class="css-1buhy1h ee933652">생채움</span><span class="css-ryw54y ee933651">1</span></a>
                            </li>
                            <button class="css-ypdml9 e1frj59j1">브랜드 더보기
                                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" stroke="#999"
                                     xmlns="http://www.w3.org/2000/svg" class="css-jbgpyq e1frj59j0">
                                    <path d="M5 11L9 7L13 11" stroke="#999" stroke-width="1.2"></path>
                                </svg>
                            </button>
                        </nav>
                    </div>


                </div>
            </div>

            <div class="best-content">
                <div class="best-sorted-wrap">
                    <div class="best-m-font">총 300건</div>
                    <ul class="sorted-menu-wrap">
                        <li class="css-sorted-menu">
                            <a
                                    href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=&amp;per_page=96&amp;sorted_type=4"
                                    class="css-126imjl eudxpx30"
                            >추천순</a
                            >
                            <div class="css-f49ql3 e1kpyq4d1">
                                <svg
                                        width="14"
                                        height="20"
                                        viewBox="0 0 14 14"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M6.9932 0.700195C8.73506 0.700195 10.3116 1.40557 11.4528 2.54565C12.5943 3.68594 13.3002 5.26111 13.3002 7.0002C13.3002 8.73928 12.5943 10.3145 11.4528 11.4547C10.3116 12.5948 8.73506 13.3002 6.9932 13.3002C5.25512 13.3002 3.68233 12.595 2.54387 11.4554C1.40457 10.315 0.700195 8.73952 0.700195 7.0002C0.700195 5.26087 1.40457 3.68541 2.54387 2.54497C3.68233 1.40537 5.25512 0.700195 6.9932 0.700195Z"
                                            stroke="#ccc"
                                            stroke-width="1.4"
                                    ></path>
                                    <path
                                            d="M4.5 5.21081H5.77027C5.81351 4.55135 6.26216 4.12973 6.95946 4.12973C7.64054 4.12973 8.09459 4.53514 8.09459 5.0973C8.09459 5.58784 7.90383 5.86944 7.35576 6.22524L7.1973 6.32432C6.45135 6.76216 6.13784 7.24865 6.18649 8.05946L6.19189 8.42703H7.44595V8.11892C7.44595 7.58378 7.64595 7.30811 8.35405 6.89189C9.08919 6.45405 9.5 5.87568 9.5 5.04865C9.5 3.85405 8.51081 3 7.02973 3C5.42432 3 4.54324 3.92973 4.5 5.21081ZM6.87838 11.0054C6.33784 11.0054 5.98108 10.6649 5.98108 10.1459C5.98108 9.62162 6.33784 9.28108 6.87838 9.28108C7.42973 9.28108 7.77568 9.62162 7.77568 10.1459C7.77568 10.6649 7.42973 11.0054 6.87838 11.0054Z"
                                            fill="#ccc"
                                    ></path>
                                </svg>
                                <div class="css-2hay8 e1kpyq4d0">
                                    소비자 인기도(판매량, 판매금액, 조회수 등), 상품 출시일,
                                    수요 적합성, 상품 운영상 필요 등을 종합적으로 고려한
                                    순서입니다.
                                </div>
                            </div>
                        </li>
                        <li class="css-sorted-menu">
                            <a
                                    href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=&amp;per_page=96&amp;sorted_type=0"
                                    class="css-19ce13b eudxpx30"
                            >신상품순</a
                            >
                        </li>
                        <li class="css-sorted-menu">
                            <a
                                    href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=&amp;per_page=96&amp;sorted_type=1"
                                    class="css-19ce13b eudxpx30"
                            >판매량순</a
                            >
                        </li>
                        <li class="css-sorted-menu">
                            <a
                                    href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=&amp;per_page=96&amp;sorted_type=5"
                                    class="css-19ce13b eudxpx30"
                            >혜택순</a
                            >
                        </li>
                        <li class="css-sorted-menu">
                            <a
                                    href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=&amp;per_page=96&amp;sorted_type=2"
                                    class="css-19ce13b eudxpx30"
                            >낮은 가격순</a
                            >
                        </li>
                        <li class="css-sorted-menu">
                            <a
                                    href="/collection-groups/market-best?page=1&amp;collection=market-best&amp;filters=&amp;per_page=96&amp;sorted_type=3"
                                    class="css-19ce13b eudxpx30"
                            >높은 가격순</a
                            >
                        </li>
                    </ul>
                </div>


                <div class="best-itemlist">

                    <a href="/goods/5119903" class="css-9o2zup e1c07x4813">
                        <div class="css-0 e1c07x4811">
                            <div class="e1c07x4812 css-tou8lf e3um3060">
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
                      "
                    ><img
                            alt="상품 이미지"
                            sizes="100vw"
                            srcset="
                          https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg  640w,
                          https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg  750w,
                          https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg  828w,
                          https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 1080w,
                          https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 1200w,
                          https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 1920w,
                          https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 2048w,
                          https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 3840w
                        "
                            src="https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg"
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
                        "
                    /></span>
                            </div>
                        </div>
                        <div class="button-wrapper">
                            <button type="button" class="css-13xu5fn e17x72af0">
                                <svg
                                        width="18"
                                        height="18"
                                        viewBox="0 0 18 18"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            d="M1.53516 2.70001H3.93316L5.76816 10.609H13.6482L15.2992 4.35901H4.86916M12.8582 14.933C13.0098 14.9375 13.1609 14.9115 13.3024 14.8566C13.4438 14.8017 13.5728 14.7189 13.6817 14.6132C13.7906 14.5075 13.8771 14.381 13.9363 14.2412C13.9954 14.1015 14.0258 13.9513 14.0258 13.7995C14.0258 13.6478 13.9954 13.4975 13.9363 13.3578C13.8771 13.218 13.7906 13.0915 13.6817 12.9858C13.5728 12.8801 13.4438 12.7974 13.3024 12.7424C13.1609 12.6875 13.0098 12.6615 12.8582 12.666C12.5634 12.6748 12.2836 12.798 12.0782 13.0096C11.8727 13.2213 11.7578 13.5046 11.7578 13.7995C11.7578 14.0944 11.8727 14.3778 12.0782 14.5894C12.2836 14.801 12.5634 14.9243 12.8582 14.933ZM6.49316 14.933C6.64484 14.9375 6.79589 14.9115 6.93735 14.8566C7.07881 14.8017 7.20781 14.7189 7.31669 14.6132C7.42558 14.5075 7.51214 14.381 7.57126 14.2412C7.63037 14.1015 7.66083 13.9513 7.66083 13.7995C7.66083 13.6478 7.63037 13.4975 7.57126 13.3578C7.51214 13.218 7.42558 13.0915 7.31669 12.9858C7.20781 12.8801 7.07881 12.7974 6.93735 12.7424C6.79589 12.6875 6.64484 12.6615 6.49316 12.666C6.19836 12.6748 5.91858 12.798 5.71315 13.0096C5.50773 13.2213 5.39283 13.5046 5.39283 13.7995C5.39283 14.0944 5.50773 14.3778 5.71315 14.5894C5.91858 14.801 6.19836 14.9243 6.49316 14.933Z"
                                            stroke="#333333"
                                            stroke-linecap="square"
                                            stroke-linejoin="round"
                                    ></path>
                                </svg
                                >
                                담기
                            </button>
                        </div>
                        <div class="css-1kpzrna e1c07x489">
                  <span class="css-1qd61ut e1ms5t9c1"
                  ><span class="css-1vdqr5b e1ms5t9c0">샛별배송</span></span
                  ><span class="css-1dry2r1 e1c07x488"
                        >[KF365] 1+등급 무항생제 대란 20구</span
                        >
                            <p class="css-1wejlc3 e1c07x486">1구 당 판매가 : 360원</p>
                            <div class="e1c07x487 discount-price css-1tl7659 ei5rudb2">
                                <div>
                      <span class="dimmed-price css-18tpqqq ei5rudb1"
                      >7,190<span class="won">원</span></span
                      >
                                </div>
                                <div class="discount">
                      <span class="discount-rate css-19lkxd2 ei5rudb0">15%</span
                      ><span class="sales-price css-18tpqqq ei5rudb1"
                                >6,110<span class="won">원</span></span
                                >
                                </div>
                            </div>
                            <div class="review-count css-xezqwk e1c07x482">
                    <span class="css-mz5g71 e1c07x481"
                    ><svg
                            width="100%"
                            height="100%"
                            viewBox="0 0 14 14"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                    >
                        <mask id="path-1-inside-1_1513_17755" fill="white">
                          <path
                                  fill-rule="evenodd"
                                  clip-rule="evenodd"
                                  d="M3 2C1.89543 2 1 2.89543 1 4V8.67201C1 9.77658 1.89543 10.672 3 10.672H5.11212L6.33682 12.7653C6.5299 13.0954 7.00688 13.0954 7.19995 12.7653L8.42465 10.672H10.5C11.6046 10.672 12.5 9.77658 12.5 8.67201V4C12.5 2.89543 11.6046 2 10.5 2H3Z"
                          ></path>
                        </mask>
                        <path
                                fill="#999"
                                d="M5.11212 10.672L5.97526 10.167L5.68564 9.67201H5.11212V10.672ZM6.33682 12.7653L5.47369 13.2703L5.47369 13.2703L6.33682 12.7653ZM7.19995 12.7653L6.33682 12.2604L6.33682 12.2604L7.19995 12.7653ZM8.42465 10.672V9.67201H7.85113L7.56152 10.167L8.42465 10.672ZM2 4C2 3.44772 2.44772 3 3 3V1C1.34315 1 0 2.34315 0 4H2ZM2 8.67201V4H0V8.67201H2ZM3 9.67201C2.44772 9.67201 2 9.22429 2 8.67201H0C0 10.3289 1.34315 11.672 3 11.672V9.67201ZM5.11212 9.67201H3V11.672H5.11212V9.67201ZM7.19995 12.2604L5.97526 10.167L4.24899 11.177L5.47369 13.2703L7.19995 12.2604ZM6.33682 12.2604C6.5299 11.9304 7.00688 11.9304 7.19995 12.2604L5.47369 13.2703C6.05291 14.2604 7.48386 14.2604 8.06309 13.2703L6.33682 12.2604ZM7.56152 10.167L6.33682 12.2604L8.06309 13.2703L9.28779 11.177L7.56152 10.167ZM10.5 9.67201H8.42465V11.672H10.5V9.67201ZM11.5 8.67201C11.5 9.22429 11.0523 9.67201 10.5 9.67201V11.672C12.1569 11.672 13.5 10.3289 13.5 8.67201H11.5ZM11.5 4V8.67201H13.5V4H11.5ZM10.5 3C11.0523 3 11.5 3.44772 11.5 4H13.5C13.5 2.34315 12.1569 1 10.5 1V3ZM3 3H10.5V1H3V3Z"
                                mask="url(#path-1-inside-1_1513_17755)"
                        ></path>
                        <circle
                                fill="#999"
                                cx="4.34998"
                                cy="6.17871"
                                r="0.75"
                        ></circle>
                        <circle
                                fill="#999"
                                cx="6.75"
                                cy="6.17871"
                                r="0.75"
                        ></circle>
                        <circle
                                fill="#999"
                                cx="9.15002"
                                cy="6.17871"
                                r="0.75"
                        ></circle></svg></span
                    ><span class="review-number css-l610kl e1c07x480"
                            >9,999+</span
                            >
                            </div>
                            <div class="css-1hrnl0u e1cvv2hm1">
                                <span class="css-1e5t2sz e1cvv2hm0">Kurly Only</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="css-rdz8z7 e82lnfz1">
        <a class="css-1d20dg7 e82lnfz0"
        ><img
                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAHUlEQVR42mNgAIPi/8X/kWkwA8SE0UQIMJAsCKMBBzk27fqtkcYAAAAASUVORK5CYII="
                alt="처음 페이지로 이동하기 아이콘"/></a
        ><a class="css-1d20dg7 e82lnfz0"
    ><img
            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC"
            alt="이전 페이지로 이동하기 아이콘"/></a
    ><a class="css-19yo1fh e82lnfz0">1</a
    ><a class="css-1d20dg7 e82lnfz0">2</a
    ><a class="css-1d20dg7 e82lnfz0">3</a
    ><a class="css-1d20dg7 e82lnfz0">4</a
    ><a class="css-1d20dg7 e82lnfz0">5</a
    ><a class="css-1d20dg7 e82lnfz0">6</a
    ><a class="css-1d20dg7 e82lnfz0">7</a
    ><a class="css-1d20dg7 e82lnfz0"
    ><img
            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg=="
            alt="다음 페이지로 이동하기 아이콘"/></a
    ><a class="css-1d20dg7 e82lnfz0"
    ><img
            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAIElEQVR42mMo/l/8n4GBgQFGQ5kgDowmQZCwAMImhDkAb0k27Zcisn8AAAAASUVORK5CYII="
            alt="마지막 페이지로 이동하기 아이콘"
    /></a>
    </div>
</div>


</body>
</html>
