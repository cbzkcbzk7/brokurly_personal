<%--
  Created by IntelliJ IDEA.
  User: Sora
  Date: 2024-02-05
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
            rel="stylesheet"
    />
    <title>회원가입</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/member/signupForm.css'/>"/>
</head>
<style>
    /*장바구니 담기 모달 시작*/
    /*컬리상품 클릭시 모달창*/
    .css-98q5jm {
        position: fixed;
        z-index: 1300;
        inset: 0px;
    }

    .css-919eu4 {
        position: fixed;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        inset: 0px;
        background-color: rgba(0, 0, 0, 0.5);
        -webkit-tap-highlight-color: transparent;
        /* z-index: -1; */
    }

    .css-98q5jm .MuiDialog-container {
        -webkit-box-align: center;
        align-items: center;
    }
    .css-ekeie0 {
        height: 100%;
        outline: 0px;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
    }

    .css-98q5jm .MuiDialog-paper {
        height: auto;
        width: 440px;
        overflow-x: hidden;
        padding: 30px;
        border-radius: 12px;
        box-shadow: none;
    }

    .css-uhb5lp {
        background-color: rgb(255, 255, 255);
        color: rgba(0, 0, 0, 0.87);
        transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
        border-radius: 4px;
        box-shadow: rgba(0, 0, 0, 0.2) 0px 11px 15px -7px, rgba(0, 0, 0, 0.14) 0px 24px 38px 3px, rgba(0, 0, 0, 0.12) 0px 9px 46px 8px;
        margin: 32px;
        position: relative;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        max-height: calc(100% - 64px);
        max-width: 600px;
    }

    .css-qfuix0 {
        display: flex;
        padding: 5px 0px 12px;
        font-size: 16px;
        font-weight: 600;
        border-bottom: 1px solid rgb(244, 244, 244);
    }

    .css-96wx9m {
        flex: 0 0 50px;
        overflow: hidden;
        position: relative;
        height: 50px;
        margin-right: 14px;
        border-radius: 3px;
    }

    .css-1p7augg {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        height: 50px;
        margin-top: 2px;
        word-break: break-all;
    }

    .css-1n9elca {
        font-weight: 500;
        font-size: 15px;
        line-height: 20px;
        display: -webkit-box;
        overflow: hidden;
        word-break: break-all;
        white-space: normal;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
    }

    .css-hjdyv5 {
        overflow: hidden auto;
        max-height: 355px;
    }

    .css-kiebmq {
        padding: 12px 0px;
        border-radius: 3px;
        border-bottom: 1px solid rgb(244, 244, 244);
    }

    .css-1066lcq {
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
    }

    .css-rsi182 {
        font-size: 14px;
        line-height: 19px;
        color: rgb(51, 51, 51);
        display: -webkit-box;
        overflow: hidden;
        word-break: break-all;
        white-space: normal;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }

    .css-e7dd1m {
        font-size: 12px;
        line-height: 1.33;
        margin-top: 2px;
        color: rgb(102, 102, 102);
    }

    .css-2fwlel {
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
        padding-top: 5px;
    }

    .css-23v5d0 {
        padding-top: 3px;
    }

    .css-1kl4at5 {
        font-weight: bold;
        font-size: 14px;
        color: rgb(51, 51, 51);
        line-height: 19px;
    }

    .css-pblsth {
        margin-left: 4px;
        font-weight: normal;
        font-size: 12px;
        color: rgb(181, 181, 181);
        text-decoration: line-through;
        line-height: 16px;
        letter-spacing: -0.5px;
    }

    .css-2q9wxp {
        flex-direction: row;
        -webkit-box-align: center;
        align-items: center;
        border: 1px solid rgb(221, 223, 225);
        border-radius: 3px;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        width: 88px;
        height: 30px;
    }

    .css-1e90glc {
        display: inline-flex;
        width: 28px;
        height: 28px;
        border: none;
        font-size: 1px;
        color: transparent;
        background-size: cover;
        background-color: transparent;
        background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yMCAxNHYySDEwdi0yeiIgZmlsbD0iI0RERCIgZmlsbC1ydWxlPSJub256ZXJvIi8+Cjwvc3ZnPgo=);
        vertical-align: top;
    }

    .css-6m57y0 {
        display: inline-flex;
        overflow: hidden;
        white-space: nowrap;
        -webkit-box-pack: center;
        justify-content: center;
        font-size: 14px;
        font-weight: 600;
        color: rgb(51, 51, 51);
        text-align: center;
        width: 31px;
        height: 28px;
        line-height: 28px;
    }

    .css-18y6jr4 {
        display: inline-flex;
        width: 28px;
        height: 28px;
        border: none;
        font-size: 1px;
        color: transparent;
        background-size: cover;
        background-color: transparent;
        background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0xNiAxMHY0aDR2MmgtNHY0aC0ydi00aC00di0yaDR2LTRoMnoiIGZpbGw9IiMzMzMiIGZpbGwtcnVsZT0ibm9uemVybyIvPgo8L3N2Zz4K);
        vertical-align: top;
    }

    .css-1ovj4tx {
        padding: 14px 0px 20px;
    }

    .css-1fttcpj {
        display: flex;
        flex-direction: column;
    }

    .css-1066lcq {
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
    }

    .css-1sl7ome {
        font-size: 16px;
        line-height: 22px;
        font-weight: 500;
    }

    .css-1qdap1a {
        font-size: 24px;
        font-weight: 500;
        line-height: 24px;
    }

    .css-xq0an6 {
        margin-left: 3px;
        font-size: 16px;
        font-weight: 500;
        line-height: 24px;
        vertical-align: 3px;
    }

    .css-1toes8l {
        display: flex;
        flex-direction: row;
    }

    .css-1toes8l button:first-of-type {
        margin-left: 0px;
    }

    .css-1toes8l button {
        width: 50%;
        margin: 0px 4px;
    }

    .css-1w3nh5f {
        display: block;
        padding: 0px 10px;
        text-align: center;
        overflow: hidden;
        width: 100%;
        height: 56px;
        border-radius: 3px;
        color: rgb(51, 51, 51);
        background-color: rgb(255, 255, 255);
        border: 1px solid rgb(221, 221, 221);
    }

    .css-nytqmg {
        display: inline-block;
        font-size: 16px;
        font-weight: 500;
    }

    .css-1toes8l button:last-of-type {
        margin-right: 0px;
    }

    .css-1toes8l button {
        width: 50%;
        margin: 0px 4px;
    }

    .css-ahkst0 {
        display: block;
        padding: 0px 10px;
        text-align: center;
        overflow: hidden;
        width: 100%;
        height: 56px;
        border-radius: 3px;
        color: rgb(255, 255, 255);
        background-color: #11967f;
        border: 0px none;
    }

    .css-nytqmg {
        display: inline-block;
        font-size: 16px;
        font-weight: 500;
    }

    /*바뀐 -버튼*/
    .css-8azp8 {
        display: inline-flex;
        width: 28px;
        height: 28px;
        border: none;
        font-size: 1px;
        color: transparent;
        background-size: cover;
        background-color: transparent;
        background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yMCAxNHYySDEwdi0yeiIgZmlsbD0iIzMzMyIgZmlsbC1ydWxlPSJub256ZXJvIi8+Cjwvc3ZnPgo=);
        vertical-align: top;
    }
    /*장바구니 모달 끝*/
</style>
<body>
<%--장바구니 담기 모달창 시작--%>
<%--<div role="presentation" class="MuiModal-root MuiDialog-root css-98q5jm">--%>
<%--    <div aria-hidden="true" class="MuiBackdrop-root css-919eu4"--%>
<%--         style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>--%>
<%--    <div tabindex="0" data-test="sentinelStart"></div>--%>
<%--    <div class="MuiDialog-container MuiDialog-scrollPaper css-ekeie0" role="presentation" tabindex="-1"--%>
<%--         style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">--%>
<%--        <div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation24 MuiDialog-paper MuiDialog-paperScrollPaper MuiDialog-paperWidthSm css-uhb5lp"--%>
<%--             role="dialog" aria-labelledby="customized-dialog-title">--%>
<%--            <div class="css-qfuix0 e1xnucib5">--%>
<%--                <div class="css-96wx9m e1xnucib4"><span--%>
<%--                        style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img--%>
<%--                        alt="상품 이미지" sizes="100vw"--%>
<%--                        srcset="https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 640w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 750w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 828w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 1080w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 1200w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 1920w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 2048w, https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg 3840w"--%>
<%--                        src="https://img-cf.kurly.com/shop/data/goods/1637154387515l0.jpg"--%>
<%--                        decoding="async" data-nimg="fill" class="css-0"--%>
<%--                        style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;"></span>--%>
<%--                </div>--%>
<%--                <div class="css-1p7augg e1xnucib3"><span--%>
<%--                        class="css-1n9elca e1xnucib2 modal-item-name">[KF365] 햇감자 1kg</span></div>--%>
<%--            </div>--%>
<%--            <div class="css-hjdyv5 e1xnucib1">--%>
<%--                <div class="css-kiebmq e1b27mtb8">--%>
<%--                    <div class="css-1066lcq e1b27mtb7"><span--%>
<%--                            class="css-rsi182 e1b27mtb6 modal-item-name">[KF365] 감자 1kg</span></div>--%>
<%--                    <div class="css-e7dd1m e1b27mtb5 modal-item-disprice-hidden" style="display: none"></div>--%>
<%--                    <div class="css-2fwlel e1b27mtb4">--%>
<%--                        <div class="css-23v5d0 e1b27mtb3"><span--%>
<%--                                class="css-1kl4at5 e1b27mtb2 modal-item-disprice">6,120원</span><span--%>
<%--                                class="css-pblsth e1b27mtb1 modal-item-price">6,590원</span></div>--%>
<%--                        <div class="e1b27mtb0 css-2q9wxp e1cqr3m40">--%>
<%--                            <button type="button" aria-label="수량내리기"--%>
<%--                                    class="css-8azp8 e1hx75jb0 subtract-item-cnt"></button>--%>
<%--                            <div class="count css-6m57y0 e1cqr3m41 modal-item-cnt">1</div>--%>
<%--                            <button type="button" aria-label="수량올리기"--%>
<%--                                    class="css-18y6jr4 e1hx75jb0 add-item-cnt"></button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="css-1ovj4tx e1xnucib0">--%>
<%--                <div class="css-1fttcpj e9qarb89">--%>
<%--                    <div class="css-1066lcq e9qarb88"><p class="css-1sl7ome e9qarb87">합계</p>--%>
<%--                        <div><span class="css-1qdap1a e9qarb86 modal-item-disprice-final">6,120</span></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="css-1toes8l e1vslu8h0">--%>
<%--                <button class="exist-modal css-1w3nh5f e4nu7ef3" type="button" height="56"><span--%>
<%--                        class="css-nytqmg e4nu7ef1">취소</span></button>--%>
<%--                <button class="put-in-cart-2 css-ahkst0 e4nu7ef3" type="button" height="56"><span--%>
<%--                        class="css-nytqmg e4nu7ef1" style="color: rgb(255, 255, 255);">장바구니 담기</span></button>--%>
<%--                <div class="item-id" style="display: none;"></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div tabindex="0" data-test="sentinelEnd"></div>--%>
<%--</div>--%>
<%--&lt;%&ndash;장바구니 담기 모달창 끝 &ndash;%&gt;--%>
<form id="frm" action="<c:url value="/member/signup"/>" method="POST">
    <input type="hidden" name="_method" value="POST">
    <section>
        <!-- modal start -->
        <jsp:include page="../include/modal.jsp"/>
        <!-- modal end -->
        <span class="register-header">회원가입</span>
        <div class="Required-entr-div">
            <span class="Required-entr__label">*&nbsp;</span>필수입력사항
        </div>
        <div class="register-div">
            <div class="column-div">
          <span class="register-div__label"
          >이메일<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="예: brokurly@kurly.com"
                        title="이 입력란을 작성하세요"
                        id="email"
                        name="email"
                />
                <button type="button" id="email_btn" class="open-modal-btn btn css-x0zbdy e4nu7ef3">중복확인</button>
            </div>
            <div class="email-info-div">
          <span
          >이메일 형식으로 입력해 주세요</span
          >
            </div>
            <div class="email-infoSec-div">
          <span
          >이메일을 입력해주세요</span
          >
            </div>
<%--            <div class="column-div">--%>
<%--          <span class="register-div__label"--%>
<%--          >아이디<span class="Required-entr__label">*</span></span--%>
<%--          >--%>
<%--                <input--%>
<%--                        type="text"--%>
<%--                        placeholder="아이디를 입력해 주세요"--%>
<%--                        title="이 입력란을 작성하세요"--%>
<%--                        id="custId"--%>
<%--                        name="custId"--%>
<%--                        maxlength="17"--%>
<%--                />--%>
<%--                <button type="button" id="custId_btn" class="open-modal-btn">중복확인</button>--%>
<%--            </div>--%>
<%--            <div class="id-info-div">--%>
<%--          <span--%>
<%--          >6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합</span--%>
<%--          >--%>
<%--            </div>--%>
            <div class="column-div">
          <span class="register-div__label"
          >비밀번호<span class="Required-entr__label">*</span></span
          >
                <input
                        type="password"
                        placeholder="비밀번호를 입력해 주세요"
                        title="이 입력란을 작성하세요"
                        name="pwd"
                        id="pwd"
                        maxlength="15"

                />
            </div>
            <div class="pwd-info-div">
            </div>
            <div class="column-div">
          <span class="register-div__label"
          >비밀번호확인<span class="Required-entr__label">*</span></span
          >
                <input
                        type="password"
                        placeholder="비밀번호를 한번 더 입력해 주세요"
                        title="이 입력란을 작성하세요"
                        maxlength="15"
                        id="pwdChk"

                />
            </div>
            <div class="pwdChk-info-div">
            </div>
            <div class="column-div">
          <span class="register-div__label"
          >이름<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="이름을 입력해 주세요"
                        title="이 입력란을 작성하세요"
                        id="name"
                        name="name"
                />
            </div>
            <div class="name-info-div">
          <span
          >이름을 입력해 주세요</span
          >
            </div>
<%--            <div class="column-div">--%>
<%--          <span class="register-div__label"--%>
<%--          >이메일<span class="Required-entr__label">*</span></span--%>
<%--          >--%>
<%--                <input--%>
<%--                        type="text"--%>
<%--                        placeholder="예: brokurly@gmail.com"--%>
<%--                        title="이 입력란을 작성하세요"--%>
<%--                        id="email"--%>
<%--                        name="email"--%>
<%--                />--%>
<%--                <button type="button" id="email_btn" class="open-modal-btn">중복확인</button>--%>
<%--            </div>--%>
<%--            <div class="email-info-div">--%>
<%--          <span--%>
<%--          >이메일 형식으로 입력해 주세요</span--%>
<%--          >--%>
<%--            </div>--%>
<%--            <div class="email-infoSec-div">--%>
<%--          <span--%>
<%--          >이메일을 입력해주세요</span--%>
<%--          >--%>
<%--            </div>--%>
            <div class="column-div">
          <span class="register-div__label"
          >휴대폰<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="숫자만 입력해 주세요"
                        title="이 입력란을 작성하세요"
                        id="telNo"
                        name="telNo"
                />
                <button type="button" class="open-modal-btn btn" id="telNo_btn">인증번호 받기</button>
            </div>
            <div class="telNo-info-div"></div>
            <div class="column-div" id="telNoChk-div">
          <span class="register-div__label"
          >&nbsp;&nbsp;&nbsp;<span class="Required-entr__label"></span></span
          >
                <input
                        type="text"
                        placeholder="인증번호를 입력해주세요"
                        title="이 입력란을 작성하세요"
                        id="telNoChk"

                />
                <button type="button" class="open-modal-btn btn"  id="telNoChk_btn">인증번호 확인</button>
            </div>
            <div class="column-div" style="margin-top:20px;">
                <span class="register-div__label">성별</span>
                <div class="gender-div">
                <div>
                <input type="radio" id="sex-m" name="sex" value="M"/>
                <label for="sex-m">남자</label>
                </div>
                <div>
                <input type="radio" id="sex-f" name="sex" value="F"/>
                <label for="sex-f">여자</label>
                </div>
                <div>
                <input type="radio" id="sex-none" name="sex" value="N" checked/>
                <label for="sex-none">선택안함</label>
                </div>
                    </div>
            </div>


            <div class="birth-div column-div">
                <span class="register-div__label">생년월일</span>
                <div class="birth-div__column">
                    <input type="text" id="yyyy" placeholder="YYYY" maxlength="4"/><span>/</span>
                    <input type="text" id="mm" placeholder="MM" maxlength="2"/><span>/</span>
                    <input type="text" id="dd" placeholder="DD" maxlength="2"/>
                    <input type="hidden" id="yyyymmdd" value="" name="birthDt">
                    <div class="birth-info-div"></div>
                </div>
            </div>
        </div>
        <hr />
        <div class="agreement-div">
        <div class="register-div__label"
        >이용약관동의<span class="Required-entr__label">*</span></div
        >
            <div class="test_div">
            <div class="agreement-div__column">
                <div>
                    <input type="checkbox" id="agreement1" class="chk" /><label for="agreement1" style="font-weight: 500"
                >전체 동의합니다.</label
                >
                    <div class="agreement-label">
                        <label style="font-size: 12px;">
                            선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를
                            이용할 수 있습니다.
                        </label>
                    </div>
                </div>
            </div>
            <div class="agreement-div__column">
                <input type="checkbox" id="agreement2" class="chk" /><label for="agreement2"
            >이용약관 동의<span>(필수)</span></label
            >
                <a href="#"
                ><span><label class="agreement-label__chk" style="left:237px">약관보기></label></span></a
                >
            </div>
            <div class="agreement-div__column">
                <input type="checkbox" id="agreement3" class="chk" /><label for="agreement3"
            >개인정보 수집 이용 동의<span>(필수)</span></label
            >
                <a href="#"
                ><span><label class="agreement-label__chk">약관보기></label></span></a
                >
            </div>
            <div class="agreement-div__column">
                <input type="checkbox" id="agreement4" class="chk" /><label for="agreement4"
            >개인정보 수집 이용 동의<span>(선택)</span></label
            >
                <a href="#"
                ><span><label class="agreement-label__chk">약관보기></label></span></a
                >
            </div>
            <div class="agreement-div__column">
                <input type="checkbox" id="agreement5" class="chk"/><label for="agreement5"
            >무료배송,할인쿠폰 등 혜택/정보 수신 동의<span>(선택)</span></label
            >
            </div>
            <div class="agreement-div__column">
                <input type="checkbox" id="agreement6"class="chk" /><label for="agreement6"
            >본인은 만 14세 이상입니다.<span>(필수)</span></label
            >
            </div>
            </div>
        </div>
        <input type="hidden" name="consent" id="consent"/>
        <div class="line_div"></div>
        <button type="button" class="register-btn btn">가입하기</button>
    </section>
</form>
<%--<script type="text/javascript" src="<c:url value='/resources/js/member/modal.js'/>"></script>--%>
<script type="text/javascript" src="<c:url value='/resources/js/member/member.js'/>"></script>
</body>
</html>