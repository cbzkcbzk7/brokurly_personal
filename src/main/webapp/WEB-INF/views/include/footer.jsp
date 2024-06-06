<%-- Created by IntelliJ IDEA. User: Sora Date: 2024-03-06 Time: 오후 2:27 To
change this template use File | Settings | File Templates. --%> <%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    :root {
        --swiper-theme-color: #007aff;
    }
    a { /*하이퍼 링크 줄 제거 */
        text-decoration: none !important; /* 밑줄 제거 */
        color: black !important; /* 텍스트 색상을 검은색으로 설정 */
    }
    .css-17cdx60 {
        padding-top: 30px;
        border-top: 1px solid #f7f7f7;
    }
    .css-1i60c0e {
        width: 1050px;
        margin: 0 auto;
    }
    .css-j6zuv6 {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -webkit-justify-content: space-between;
        justify-content: space-between;
        overflow: hidden;
        padding-bottom: 30px;
    }
    .css-4iyald {
        padding-bottom: 17px;
        font-weight: 500;
        font-size: 20px;
        line-height: 29px;
    }
    .css-9jqcug {
        display: block;
        padding-bottom: 20px;
        font-size: 28px;
        line-height: 40px;
    }
    .css-1uz1ro8 {
        margin-left: 8px;
        font-weight: normal;
        font-size: 16px;
    }
    .css-1fttcpj {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
    }
    .css-ho1qnd {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-direction: row;
        -ms-flex-direction: row;
        flex-direction: row;
    }

    .css-hupzfj {
        display: block;
        width: 140px;
        height: 40px;
        border: 1px solid #e2e2e2;
        border-radius: 3px;
        line-height: 39px;
        text-align: center;
        margin-right: 16px;
        margin-bottom: 16px;
    }

    .css-1lxmeik {
        margin-top: 2px;
        color: #999;
        letter-spacing: -0.5px;
        line-height: 16.8px;
    }

    .css-ho1qnd {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-direction: row;
        -ms-flex-direction: row;
        flex-direction: row;
    }

    .css-nyq565 {
        display: block;
        width: 140px;
        height: 40px;
        margin-bottom: 16px;
        margin-right: 16px;
        border: 1px solid #e2e2e2;
        border-radius: 3px;
        line-height: 39px;
        text-align: center;
    }

    .css-1lxmeik {
        margin-top: 2px;
        color: #999;
        letter-spacing: -0.5px;
        line-height: 16.8px;
    }

    .css-ho1qnd {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-direction: row;
        -ms-flex-direction: row;
        flex-direction: row;
    }

    .css-1lxmeik {
        margin-top: 2px;
        color: #999;
        letter-spacing: -0.5px;
        line-height: 16.8px;
    }

    .css-vtjvf {
        font-size: 12px;
        line-height: 18px;
        color: #999;
    }

    .css-1fttcpj {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
    }

    .css-17hse91 {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        width: 100%;
        padding-bottom: 29px;
    }

    .css-slkv2p:first-of-type {
        margin-left: 0;
    }
    .css-slkv2p {
        margin-left: 14px;
    }

    .css-1tfhwyj {
        font-size: 12px;
        line-height: 18px;
    }

    .css-bz7mfs {
        font-weight: 400;
        font-size: 12px;
        line-height: 18px;
        color: #999;
        margin-bottom: 40px;
        margin-left : 40px;
    }

    .css-1ekjygq {
        padding-left: 4px;
    }
    .css-1ekjygq:after {
        content: "|";
        padding-right: 4px;
        font-size: 10px;
        vertical-align: top;
    }

    .css-1tby8gd {
        margin-left: 3px;
        color: #11967f;
    }

    .css-zjik7 {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
    }
    .css-81eeg3 {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -webkit-justify-content: space-between;
        justify-content: space-evenly;
        padding: 26px 0 33px;
        border-top: 1px solid #eee;
    }

    .css-12t5wjq {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        text-align: left;
    }

    .css-bft4sh {
        font-size: 10px;
        line-height: 14.5px;
        color: #999;
        word-break: break-word;
    }

    .css-1262i6n {
        width: 34px;
        margin-right: 10px;
    }

    .ss-175n8cp {
        padding: 20px 0 30px;
        font-size: 10px;
        line-height: 15px;
        text-align: center;
        background-color: #f7f7f7;
        color: #999;
    }

    .css-1vhhy2d {
        display: block;
        padding-top: 7px;
        font-style: normal;
    }

    .css-175n8cp {
        padding: 20px 0 30px;
        font-size: 10px;
        line-height: 15px;
        text-align: center;
        background-color: #f7f7f7;
        color: #999;
    }

    img, legend {
        border: 0;
        vertical-align: top;
    }
    canvas, img, video {
        max-width: 100%;
    }

    img {
        overflow-clip-margin: content-box;
        overflow: clip;
    }

    .css-9ipg3 {
        display: block;
        width: 30px;
        height: 30px;
        margin-right: 10px;
    }

    .css-as7ifw {
        width: 102px;
        margin-right: 10px;
    }

    .css-w0fx7a {
        margin: 0 6px;
    }
</style>
<body>
<div class="css-17cdx60 ebj6vxr6">
    <div id="footer" class="css-1i60c0e ebj6vxr5">
        <div class="css-j6zuv6 ebj6vxr4">
            <div class="css-0 eam2qm511">
                <h2 class="css-4iyald eam2qm510">고객행복센터</h2>
                <strong class="css-9jqcug eam2qm58"
                >1644-1107<span class="css-1uz1ro8 eam2qm59"
                >월~토요일 오전 7시 - 오후 6시</span
                ></strong
                >
                <div class="css-1fttcpj eam2qm57">
                    <div class="css-ho1qnd eam2qm53">
                        <button class="eam2qm54 css-hupzfj e19i509p0">
                            카카오톡 문의
                        </button>
                        <div class="css-1lxmeik eam2qm52">
                            월~토요일<svg
                                width="1"
                                height="10"
                                viewBox="0 0 1 10"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                class="css-w0fx7a eam2qm50"
                        >
                            <line
                                    x1="0.5"
                                    y1="2.18557e-08"
                                    x2="0.5"
                                    y2="10"
                                    stroke="#ccc"
                            ></line></svg
                        >오전 7시 - 오후 6시<br />일/공휴일<svg
                                width="1"
                                height="10"
                                viewBox="0 0 1 10"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                class="css-w0fx7a eam2qm50"
                        >
                            <line
                                    x1="0.5"
                                    y1="2.18557e-08"
                                    x2="0.5"
                                    y2="10"
                                    stroke="#ccc"
                            ></line></svg
                        >오전 7시 - 오후 1시
                        </div>
                    </div>
                    <div class="css-ho1qnd eam2qm53">
                        <button class="css-nyq565 eam2qm56">1:1 문의</button>
                        <div class="css-1lxmeik eam2qm52">
                            365일<br />고객센터 운영시간에 순차적으로 답변드리겠습니다.
                        </div>
                    </div>
                    <div class="css-ho1qnd eam2qm53">
                        <a
                                href="https://docs.google.com/forms/d/e/1FAIpQLScWcjRuN6eWJK-G8x3NwBfE8IyKZIOq7jhD3fUXuKSWwPqzJw/viewform"
                                target="_blank"
                                class="css-nyq565 eam2qm55"
                        >대량주문 문의</a
                        >
                        <div class="css-1lxmeik eam2qm52">
                            월~금요일<svg
                                width="1"
                                height="10"
                                viewBox="0 0 1 10"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                class="css-w0fx7a eam2qm50"
                        >
                            <line
                                    x1="0.5"
                                    y1="2.18557e-08"
                                    x2="0.5"
                                    y2="10"
                                    stroke="#ccc"
                            ></line></svg
                        >오전 9시 - 오후 6시<br />점심시간<svg
                                width="1"
                                height="10"
                                viewBox="0 0 1 10"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                class="css-w0fx7a eam2qm50"
                        >
                            <line
                                    x1="0.5"
                                    y1="2.18557e-08"
                                    x2="0.5"
                                    y2="10"
                                    stroke="#ccc"
                            ></line></svg
                        >낮 12시 - 오후 1시
                        </div>
                    </div>
                </div>
                <div class="css-vtjvf eam2qm51">
                    비회원 문의 :
                    <a href="mailto:help@kurlycorp.com">help@kurlycorp.com</a>
                </div>
            </div>
            <div class="css-1fttcpj ebj6vxr3">
                <ul class="css-17hse91 e13nap1l2">
                    <li class="css-slkv2p e13nap1l1">
                        <a
                                href="/introduce"
                                target="_self"
                                class="css-1tfhwyj e13nap1l0"
                        >컬리소개</a
                        >
                    </li>
                    <li class="css-slkv2p e13nap1l1">
                        <a
                                href="https://www.youtube.com/embed/WEep7BcboMQ?rel=0&amp;showinfo=0&amp;wmode=opaque&amp;enablejsapi=1"
                                target="_self"
                                class="css-1tfhwyj e13nap1l0"
                        >컬리소개영상</a
                        >
                    </li>
                    <li class="css-slkv2p e13nap1l1">
                        <a
                                href="https://ir.kurly.com"
                                target="_blank"
                                class="css-1tfhwyj e13nap1l0"
                        >투자정보</a
                        >
                    </li>
                    <li class="css-slkv2p e13nap1l1">
                        <a
                                href="https://kurly.career.greetinghr.com"
                                target="_blank"
                                class="css-1tfhwyj e13nap1l0"
                        >인재채용</a
                        >
                    </li>
                    <li class="css-slkv2p e13nap1l1">
                        <a
                                href="/user-terms/agreement"
                                target="_self"
                                class="css-1tfhwyj e13nap1l0"
                        >이용약관</a
                        >
                    </li>
                    <li class="bold css-slkv2p e13nap1l1">
                        <a
                                href="/user-terms/privacy-policy"
                                target="_self"
                                class="css-1tfhwyj e13nap1l0"
                        >개인정보처리방침</a
                        >
                    </li>
                    <li class="css-slkv2p e13nap1l1">
                        <a
                                href="/user-guide"
                                target="_self"
                                class="css-1tfhwyj e13nap1l0"
                        >이용안내</a
                        >
                    </li>
                </ul>
                <div class="css-bz7mfs ebj6vxr2">
                    법인명 (상호) : 주식회사 컬리
                    <span class="css-1ekjygq ebj6vxr1"></span> 사업자등록번호 :
                    261-81-23567<a
                        href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2618123567&amp;apv_perm_no="
                        target="_blank"
                        rel="noreferrer"
                        class="css-1tby8gd ebj6vxr0"
                >사업자정보 확인</a
                ><br />통신판매업 : 제 2018-서울강남-01646 호<br />주소 :
                    서울특별시 강남구 테헤란로 133, 18층(역삼동)
                    <span class="css-1ekjygq ebj6vxr1"></span> 대표이사 : 김슬아<br />채용문의
                    :<a
                        href="mailto:recruit@kurlycorp.com"
                        class="css-1tby8gd ebj6vxr0"
                >recruit@kurlycorp.com</a
                ><br />팩스: 070 - 7500 - 6098
                </div>
                <ul class="css-zjik7 ek68y4g1">
                    <a
                            href="https://instagram.com/marketkurly"
                            target="_blank"
                            rel="noreferrer"
                            class="css-9ipg3 ek68y4g0"
                    ><img
                            src="https://res.kurly.com/pc/ico/1810/ico_instagram.png"
                            alt="컬리 인스타그램 바로가기" /></a
                    ><a
                        href="https://www.facebook.com/marketkurly"
                        target="_blank"
                        rel="noreferrer"
                        class="css-9ipg3 ek68y4g0"
                ><img
                        src="https://res.kurly.com/pc/ico/1810/ico_fb.png"
                        alt="컬리 페이스북 바로가기" /></a
                ><a
                        href="https://blog.naver.com/marketkurly"
                        target="_blank"
                        rel="noreferrer"
                        class="css-9ipg3 ek68y4g0"
                ><img
                        src="https://res.kurly.com/pc/ico/1810/ico_blog.png"
                        alt="컬리 네이버블로그 바로가기" /></a
                ><a
                        href="https://m.post.naver.com/marketkurly"
                        target="_blank"
                        rel="noreferrer"
                        class="css-9ipg3 ek68y4g0"
                ><img
                        src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png"
                        alt="컬리 네이버포스트 바로가기" /></a
                ><a
                        href="https://www.youtube.com/channel/UCfpdjL5pl-1qKT7Xp4UQzQg"
                        target="_blank"
                        rel="noreferrer"
                        class="css-9ipg3 ek68y4g0"
                ><img
                        src="https://res.kurly.com/pc/ico/1810/ico_youtube.png"
                        alt="컬리 유튜브 바로가기"
                /></a>
                </ul>
            </div>
            </div>
        </div>
        <div class="css-81eeg3 e1t23cq0">
            <button class="css-12t5wjq e57xuci2">
                <img
                        src="https://res.kurly.com/pc/ico/2208/logo_isms.svg"
                        alt="isms 로고"
                        class="css-1262i6n e57xuci1"
                />
                <p class="css-bft4sh e57xuci0">
                    [인증범위] 컬리 쇼핑몰 서비스 개발·운영<br />(심사받지 않은 물리적
                    인프라 제외)<br />[유효기간] 2022.01.19 ~ 2025.01.18
                </p></button
            ><button class="css-12t5wjq e57xuci2">
            <img
                    src="https://res.kurly.com/pc/ico/2208/logo_privacy.svg"
                    alt="eprivacy plus 로고"
                    class="css-1262i6n e57xuci1"
            />
            <p class="css-bft4sh e57xuci0">
                개인정보보호 우수 웹사이트 ·<br />개인정보처리시스템 인증
                (ePRIVACY PLUS)
            </p></button
        ><button class="css-12t5wjq e57xuci2">
            <img
                    src="https://res.kurly.com/pc/ico/2208/logo_tosspayments.svg"
                    alt="payments 로고"
                    class="css-as7ifw e57xuci1"
            />
            <p class="css-bft4sh e57xuci0">
                토스페이먼츠 구매안전(에스크로)<br />서비스를 이용하실 수
                있습니다.
            </p></button
        ><button class="css-12t5wjq e57xuci2">
            <img
                    src="https://res.kurly.com/pc/ico/2208/logo_wooriBank.svg"
                    alt="우리은행 로고"
                    class="css-1262i6n e57xuci1"
            />
            <p class="css-bft4sh e57xuci0">
                고객님이 현금으로 결제한 금액에 대해 우리은행과<br />채무지급보증
                계약을 체결하여 안전거래를 보장하고<br />있습니다.
            </p>
        </button>
        </div>
    </div>
    <div class="css-175n8cp etk3uz81">
        컬리에서 판매되는 상품 중에는 컬리에 입점한 개별 판매자가 판매하는
        마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.<br />마켓플레이스(오픈마켓)
        상품의 경우 컬리는 통신판매중개자로서 통신판매의 당사자가 아닙니다.
        컬리는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지
        않습니다.<em class="css-1vhhy2d etk3uz80"
    >© KURLY CORP. ALL RIGHTS RESERVED</em
    >
    </div>
</div>
</body>
</html>
