<%--
  Created by IntelliJ IDEA.
  User: hakjun
  Date: 2024-02-02
  Time: 오후 2:56
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
    <link rel="preconnect" href="https://fonts.googleapis.com%22%3E"/>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
            rel="stylesheet"
    />
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/member/loginForm.css'/>"/>
</head>
<style>
    /* modal css start */
    .modal {
        position: absolute;
        display: none;

        justify-content: center;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        background-color: rgba(0, 0, 0, 0.4);

        padding: 0;
        z-index: 2;
    }

    .modal_content_body {
        position: absolute;

        padding: 40px;

        width: 320px;
        /*height: 66px;*/

        text-align: center;

        border-top-right-radius: 6px;
        border-top-left-radius: 6px;

        top: 50%;

        background-color: white;
        transform: translateY(-50%);
    }

    .modal_alert_body {
        position: absolute;

        background-color: white;
        padding: 0 40px;

        width: 320px;
        height: 56px;

        border-bottom-right-radius: 6px;
        border-bottom-left-radius: 6px;

        top: 60%;

        transform: translateY(-50%);

        display: flex;
        justify-content: center;
    }

    .close-modal-btn {
        width: auto;
        font-size: 16px;
        border: none;
        padding: 5px 0 0 0;
        font-weight: 600;
        color: var(--main-color);
        background: transparent;
        cursor: pointer;
    }

    /* modal css end */

</style>
<body>
<form id="frm" action="<c:url value='/member/login'/>" method="POST">
    <input type="hidden" name="_method" value="POST">
    <section>
        <!-- modal start -->
        <jsp:include page="../include/modal.jsp"/>
        <!-- modal end -->
        <span class="login-header">로그인</span>
        <div class="login-div">
            <input
                    class="login-div__column"
                    type="text"
                    name="custId"
                    id="email"
                    placeholder="아이디를 입력해주세요"
            />
            <input
                    class="login-div__column"
                    type="password"
                    name="pwd"
                    id="pwd"
                    placeholder="비밀번호를 입력해주세요"
                    maxlength="15"
            />
            <input type="hidden" name="reqURI" value="${param.redirectURL}">
            <div class="find-div">
                <a href="<c:url value='/member/find/password'/>"><span>비밀번호 재설정</span></a>
            </div>
            <button type="button" class="login-div__column loginBtn">로그인</button>
            <button type="button" onclick="location.href='/member/signup'" class="login-div__column regBtn">회원가입</button>
            <div class="col-lg-12 text-center mt-3">
                <img alt="카카오로그인" src="<c:url value='/resources/image/kakao_login_large_wide.png'/>" onclick="loginWithKakao()">
            </div>
        </div>
    </section>
</form>
<script>
   $(document).ready(function ()  {
       // modal start
       $(".MuiModal-root").hide();

       function existModal(msg){
           let msgDiv = $(".msg-div");
           msgDiv.text(msg);

           $(".MuiModal-root").show();
       }

       // 모달창 끄기
       $(".exist-modal").click(function () {
           $('.modal-item-cnt').text("1");
           $(".MuiModal-root").fadeOut();
       });


       let msg = "${msg}";

       if(msg != ''){
           existModal(msg);
       }


       function regExp(value){
           const emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i; // 이메일 정규식
           const pwdRegEx = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$/; // 비밀번호 > 영문 특수문자 조합 10자 이상


           let inputed = "";
           let regEx = "";
           //switch : 수정로 수정 > if else는 전부 검사하는데 switch는 바로 찾아감
            if(value === 2){
               inputed = document.querySelector("#email").value.trim();
               regEx = emailRegEx;
           }else if(value === 4){
               inputed = document.querySelector("#pwd").value.trim();
               regEx = pwdRegEx;
           }
           return !regEx.test(inputed) || !inputed;
       }

       let loginBtn = document.querySelector(".loginBtn");

       loginBtn.addEventListener("click", () => {

           let emailVal = document.querySelector("#email").value;
           let pwdVal = document.querySelector("#pwd").value;


           if(emailVal.length === 0 || pwdVal.length === 0){
               existModal("아이디 또는 비빌번호를 확인해주세요.");
               return false;
           }

           if( regExp(2) || regExp(4)){
               existModal("아이디 또는 비밀번호를 확인해주세요");
               return false;
           }

           let loginFrm = document.querySelector("#frm");
           loginFrm.submit();

       });


   });
</script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script>
    window.onload = function(){
        Kakao.init('b99b74015501ea2e7067d2dd45d23223'); // sdk 초기화 및 사용할 앱의 키 설정
        Kakao.isInitialized(); // SDK 초기화 여부를 판단
    };


    function loginWithKakao(){
        Kakao.Auth.authorize({
            redirectUri: 'http://localhost:8080/kakao_callback'
        });
    }
</script>
</body>
</html>