<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: atomosphere
  Date: 2/12/24
  Time: 6:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, viewport-fit=cover"
    />
    <title>자주하는 질문 - 브로컬리</title>
    <link
            rel="stylesheet"
            href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css"
            data-n-g=""
    />
    <style data-emotion="css 2b29tl" data-s="">
        .css-2b29tl {
            position: relative;
            min-width: 1050px;
        }
    </style>
    <style data-emotion="css luwwab" data-s="">
        .css-luwwab {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            width: 1050px;
            padding: 50px 0 80px 0;
            margin: 0 auto;
            -webkit-flex-direction: row;
            -ms-flex-direction: row;
            flex-direction: row;
            -webkit-box-pack: justify;
            -webkit-justify-content: space-between;
            justify-content: space-between;
        }
    </style>
    <style data-emotion="css 833hqy" data-s="">
        .css-833hqy {
            width: 200px;
        }
    </style>
    <style data-emotion="css 1v4whg" data-s="">
        .css-1v4whg {
            height: 75px;
            padding: 5px 0 35px 1px;
            font-weight: 500;
            font-size: 28px;
            line-height: 35px;
            color: #333;
            letter-spacing: -1px;
        }
    </style>
    <style data-emotion="css 1x9bshx" data-s="">
        .css-1x9bshx {
            border: 1px solid #f2f2f2;
        }
    </style>
    <style data-emotion="css g4g0eu" data-s="">
        .css-g4g0eu {
            cursor: pointer;
            border-bottom: 1px solid #f2f2f2;
            padding: 15px 13px 15px 20px;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: justify;
            -webkit-justify-content: space-between;
            justify-content: space-between;
            -webkit-align-items: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            line-height: 19px;
            letter-spacing: -0.3px;
            font-size: 14px;
            color: #666;
        }

        .css-g4g0eu.active,
        .css-g4g0eu:hover {
            background-color: #fafafa;
            color: #11967f;
            font-weight: 500;
        }

        .css-g4g0eu:hover use {
            stroke: #11967f;
        }
    </style>
    <style data-emotion="css 196gwz9" data-s="">
        .css-196gwz9 {
            width: 100%;
            height: 60px;
            padding: 0 14px 0 20px;
            margin-top: 36px;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: justify;
            -webkit-justify-content: space-between;
            justify-content: space-between;
            -webkit-align-items: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            background-color: #fafafa;
            line-height: 20px;
        }
    </style>
    <style data-emotion="css rmee6s" data-s="">
        .css-rmee6s {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            color: #333;
        }
    </style>
    <style data-emotion="css 1sdidca" data-s="">
        .css-1sdidca {
            font-size: 14px;
            font-weight: 500;
        }
    </style>
    <style data-emotion="css rnnx2x" data-s="">
        .css-rnnx2x {
            font-size: 12px;
        }
    </style>
    <style data-emotion="css 171zbec" data-s="">
        .css-171zbec {
            width: 820px;
        }
    </style>
    <style data-emotion="css j0lifa" data-s="">
        .css-j0lifa {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-flex-direction: row;
            -ms-flex-direction: row;
            flex-direction: row;
            width: 100%;
            padding-bottom: 27px;
            -webkit-box-pack: justify;
            -webkit-justify-content: space-between;
            justify-content: space-between;
        }
    </style>
    <style data-emotion="css fhxb3m" data-s="">
        .css-fhxb3m {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-flex-direction: row;
            -ms-flex-direction: row;
            flex-direction: row;
            -webkit-align-items: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }
    </style>
    <style data-emotion="css 1268zpe" data-s="">
        .css-1268zpe {
            font-weight: 500;
            font-size: 24px;
            color: #333;
            letter-spacing: -0.5px;
            line-height: 48px;
        }
    </style>
    <style data-emotion="css a3vgo2" data-s="">
        .css-a3vgo2 {
            padding-left: 11px;
            font-size: 14px;
            letter-spacing: -0.3px;
            color: #999;
            line-height: 20px;
        }
    </style>
    <style data-emotion="css e23nfx" data-s="">
        .css-e23nfx {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            width: 100%;
            padding: 20px 0;
            border-bottom: 1px solid #333;
            border-top: 2px solid #333;
        }
    </style>
    <style data-emotion="css mbsaqp" data-s="">
        .css-mbsaqp {
            -webkit-flex-basis: 50px;
            -ms-flex-preferred-size: 50px;
            flex-basis: 50px;
            text-align: center;
            line-height: 20px;
            font-weight: 400;
            color: #333;
        }
    </style>
    <style data-emotion="css 1ym8aqm" data-s="">
        .css-1ym8aqm {
            -webkit-box-flex: 1;
            -webkit-flex-grow: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
            text-align: center;
            line-height: 20px;
            font-weight: 400;
            color: #333;
        }
    </style>
    <style data-emotion="css 16tcewl" data-s="">
        .css-16tcewl {
            -webkit-flex-basis: 100px;
            -ms-flex-preferred-size: 100px;
            flex-basis: 100px;
            text-align: center;
            line-height: 20px;
            font-weight: 400;
            color: #333;
        }
    </style>
    <style data-emotion="css oo7gp2" data-s="">
        .css-oo7gp2 {
            width: 100%;
            padding: 10px 0;
        }
    </style>
    <style data-emotion="css cvd8qc" data-s="">
        .css-cvd8qc {
            position: absolute;
            top: 70px;
            right: 20px;
            bottom: -93px;
            z-index: 1;
            margin-top: 93px;
        }
    </style>

    <link rel="stylesheet" href="/resources/css/board/faq.css"/>
</head>
<body class="vsc-initialized">
<div class="css-2b29tl eug5r8l2">
    <div class="css-luwwab eug5r8l1">
        <div class="css-833hqy ecbxmj3">
            <div class="css-1v4whg ecbxmj2">고객센터</div>
            <ul class="css-1x9bshx ecbxmj1">
                <li>
                    <a class="css-g4g0eu ecbxmj0" href="/board/notice"
                    >공지사항
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
                                                        stroke="#999"
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
                </li>
                <li>
                    <a class="active css-g4g0eu ecbxmj0"
                    >자주하는 질문
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
                                                        stroke="#11967f"
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
                </li>
                <li>
                    <a class="css-g4g0eu ecbxmj0" href="/board/inquiry"
                    >1:1 문의
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
                                                        stroke="#999"
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
                </li>
            </ul>
            <a href="/board/inquiry" class="css-196gwz9 e19l01ug3"
            >
                <div class="css-rmee6s e19l01ug2">
                <span class="css-1sdidca e19l01ug1">도움이 필요하신가요 ?</span
                ><span class="css-rnnx2x e19l01ug0">1:1 문의하기</span>
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
        <div class="css-171zbec eug5r8l0">
            <div class="css-j0lifa ed9qr673">
                <div class="css-fhxb3m ed9qr672">
                    <h2 class="css-1268zpe ed9qr671">자주하는 질문</h2>
                    <span class="css-a3vgo2 ed9qr670"
                    >고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span
                    >
                </div>
                <div class="css-fhxb3m ed9qr672">
                    <div class="css-14dor01 e1xhuuuq0">
                        <div>
                            <div class="MuiFormControl-root css-tzsjye" onclick="popup()">
                                <div
                                        variant="outlined"
                                        class="MuiOutlinedInput-root MuiInputBase-root MuiInputBase-colorPrimary MuiInputBase-formControl jss1 css-eg1co4"
                                >
                                    <div
                                            tabindex="0"
                                            role="button"
                                            aria-expanded="false"
                                            aria-haspopup="listbox"
                                            aria-label="Without label"
                                            class="MuiSelect-select MuiSelect-outlined MuiOutlinedInput-input MuiInputBase-input css-qiwgdb"
                                    >
                                        전체
                                    </div>
                                    <input
                                            aria-hidden="true"
                                            tabindex="-1"
                                            class="MuiSelect-nativeInput css-1k3x8v3"
                                            value="ALL"
                                    />
                                    <svg
                                            class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium MuiSelect-icon MuiSelect-iconOutlined css-1636szt"
                                            focusable="false"
                                            aria-hidden="true"
       0                                     viewBox="0 0 24 24"
                                            data-testid="ArrowDropDownIcon"
                                    >
                                        <path d="M7 10l5 5 5-5z"></path>
                                    </svg>
                                    <fieldset
                                            aria-hidden="true"
                                            class="MuiOutlinedInput-notchedOutline css-igs3ac"
                                    >
                                        <legend class="css-nnbavb">
                                            <span class="notranslate">​</span>
                                        </legend>
                                    </fieldset>
                                </div>
                            </div>
                            <div role="presentation" id="menu" class="MuiModal-root MuiPopover-root MuiMenu-root css-1sucic7" onclick="popup()">
                                <div aria-hidden="true" class="MuiBackdrop-root MuiBackdrop-invisible css-esi9ax" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
                                <div tabindex="0" data-test="sentinelStart"></div>
                                <div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiMenu-paper MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation8 MuiPopover-paper css-1g99zn8" tabindex="-1" style="opacity: 1; transform: none; min-width: 170px; height: fit-content; padding: 0px; box-shadow: none; border-radius: 0px; border: 1px solid rgb(221, 221, 221); font-family: &quot;Noto Sans&quot;; transition: opacity 395ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, transform 263ms cubic-bezier(0.4, 0, 0.2, 1) 0ms; top: 112px; left: 1038px; transform-origin: 85px 0px;">
                                    <ul class="MuiList-root MuiList-padding MuiMenu-list css-r8u8y9" role="listbox" tabindex="-1">
                                        <li class="MuiMenuItem-root MuiMenuItem-gutters Mui-selected MuiButtonBase-root css-1n71h99" tabindex="0" role="option" aria-selected="true" data-value="ALL">
                                            <p class="css-u6h51f e1tpwzmg0">전체</p>
                                            <span class="MuiTouchRipple-root css-w0pj6f"></span>
                                        </li>
                                        <li class="MuiMenuItem-root MuiMenuItem-gutters MuiButtonBase-root css-1n71h99" tabindex="-1" role="option" aria-selected="false" data-value="TOP">
                                            <a href="/board/faqboard?page=0&catecode=101" class="css-u6h51f e1tpwzmg0">취소/교환/환불</a>
                                            <span class="MuiTouchRipple-root css-w0pj6f"></span>
                                        </li>
                                        <li class="MuiMenuItem-root MuiMenuItem-gutters MuiButtonBase-root css-1n71h99" tabindex="-1" role="option" aria-selected="false" data-value="TOP">
                                            <a href="/board/faqboard?page=0&catecode=102" class="css-u6h51f e1tpwzmg0">선물하기</a>
                                            <span class="MuiTouchRipple-root css-w0pj6f"></span>
                                        </li>
                                        <li class="MuiMenuItem-root MuiMenuItem-gutters MuiButtonBase-root css-1n71h99" tabindex="-1" role="option" aria-selected="false" data-value="TOP">
                                            <a href="/board/faqboard?page=0&catecode=103" class="css-u6h51f e1tpwzmg0">포장</a>
                                            <span class="MuiTouchRipple-root css-w0pj6f"></span>
                                        </li>
                                        <li class="MuiMenuItem-root MuiMenuItem-gutters MuiButtonBase-root css-1n71h99" tabindex="-1" role="option" aria-selected="false" data-value="TOP">
                                            <a href="/board/faqboard?page=0&catecode=104" class="css-u6h51f e1tpwzmg0">회원</a>
                                            <span class="MuiTouchRipple-root css-w0pj6f"></span>
                                        </li>
                                        <li class="MuiMenuItem-root MuiMenuItem-gutters MuiButtonBase-root css-1n71h99" tabindex="-1" role="option" aria-selected="false" data-value="TOP">
                                            <a href="/board/faqboard?page=0&catecode=105" class="css-u6h51f e1tpwzmg0">이벤트/쿠폰/적립금</a>
                                            <span class="MuiTouchRipple-root css-w0pj6f"></span>
                                        </li>
                                        <li class="MuiMenuItem-root MuiMenuItem-gutters MuiButtonBase-root css-1n71h99" tabindex="-1" role="option" aria-selected="false" data-value="TOP">
                                            <a href="/board/faqboard?page=0&catecode=106" class="css-u6h51f e1tpwzmg0">시스템 오류</a>
                                            <span class="MuiTouchRipple-root css-w0pj6f"></span>
                                        </li>
                                    </ul>
                                </div>
                                <div tabindex="0" data-test="sentinelEnd"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="css-e23nfx e16adls21">
                <div width="70" class="css-hyfxhw e16adls20">번호</div>
                <div width="135" class="css-1cn1979 e16adls20">카테고리</div>
                <div class="css-1ym8aqm e16adls20">제목</div>
            </div>
            <ul class="css-1fttcpj e1cfowvj5">
                <c:forEach var="faqListDto" items="${FAQListDtoList}">
                    <li class="css-e0dnmk e1cfowvj3">
                        <div class="css-14yglsw e1cfowvj4">
                            <div class="css-dx3647 e1cfowvj2">${faqListDto.bno}</div>
                            <div class="css-1tixomb e1cfowvj2">${faqListDto.name}</div>
                            <div class="css-fzefrb e1cfowvj2">
                                <div>${faqListDto.title}</div>
                            </div>
                        </div>
                    </li>
                    <li class="css-d3v9zr e1cfowvj0">
                        <div class="css-1kj0ddz eec36oi0">
                            <div>
                                ${faqListDto.content}
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="css-1kbzkwh e14yho7m0">
                <div class="css-sxxs1g eytury60">
                    <button type="button" class="css-rzcdhr e1hbwyso0" onclick="location.href='${pageContext.request.contextPath}/board/faqboard?page=${pageNo - 1}&catecode=${catecode}'">
                        <div class="css-7qb0sc e1ilyb3p0">이전</div>
                    </button>
                    <button type="button" class="css-1jwilit e1pk9060" onclick="location.href='${pageContext.request.contextPath}/board/faqboard?page=${pageNo + 1}&catecode=${catecode}'">
                        <div class="css-7qb0sc e1ilyb3p0">다음</div>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
<%--    메뉴 토글 버든 함수--%>
    function popup() {
        const menuDiv = document.getElementById('menu');

        if (menuDiv.style.display === 'none' || menuDiv.style.display === '') {
            menuDiv.style.display = 'block';
        } else {
            menuDiv.style.display = 'none';
        }
    }

    // 페이징 버튼

    window.onload = function () {
        let prevBtn = document.querySelector(".css-rzcdhr.e1hbwyso0");
        let nextBtn = document.querySelector(".css-1jwilit.e1pk9060");

        if (${faqPageHandler.firstPage}) {
            prevBtn.setAttribute('disabled', 'true');
        } else {
            prevBtn.removeAttribute('disabled')
        }

        if (${faqPageHandler.lastPage}) {
            nextBtn.setAttribute('disabled', 'true');
        } else {
            nextBtn.removeAttribute('disabled')
        }
    };

        // 내용 보여주기

        let acc = document.getElementsByClassName("css-e0dnmk e1cfowvj3");
        let i;

        for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            // 현재 클릭된 요소를 제외하고 모든 "notice" 요소에서 "act" 클래스를 제거
            for (let j = 0; j < acc.length; j++) {
                if (acc[j] !== this) {
                    // acc[j].classList.remove("act");
                    // 다음 형제 요소의 최대 높이를 null로 설정하여 접히도록
                    let panel = acc[j].nextElementSibling;
                    panel.style.maxHeight = null;
                    panel.style.animation = "fadeOut ease-out 0.4s"
                }
            }
            // 현재 클릭된 곳에 "act" 클래스를 추가또는 제거
            // this.classList.toggle("act");
            let panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
                panel.style.animation = "fadeOut ease-out 0.4s"
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
                panel.style.animation = "fadeIn ease-out 0.4s"
            }
        });
    }


</script>
</body>

</html>