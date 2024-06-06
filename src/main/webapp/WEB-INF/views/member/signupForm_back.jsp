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
    <title>회원가입</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<style>
    :root {
        --main-color: #11967f;
        --main-font: "Noto Sans KR", sans-serif;
        --main-border-radius: 3px;
        --main-border: 1px solid #11967f;
    }
    body {
        margin: 0;
        padding: auto;
    }
    section, form {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    a {
        text-decoration: none;
        color: #333;
    }

    input[type="text"],
    .register-div__btn {
        width: 333px;
        height: 46px;
    }

    input[type="text"] {
        border: 1px solid rgb(221, 221, 221);
        border-radius: var(--main-border-radius);
        font-size: 16px;
        font-weight: 400;
    }

    input:focus {
        outline: 1px solid black;
    }

    button {
        width: 120px;
        height: 44px;
        border: var(--main-border);
        border-radius: var(--main-border-radius);
        background-color: white;
        color: var(--main-color);
        font-size: 14px;
        margin-left: 10px;
    }
    .birth-div {
        display: flex;
    }

    .birth-div__column {
        width: 333px;
        height: 46px;
        border: 1px solid rgb(221, 221, 221);
        border-radius: var(--main-border-radius);
    }

    .birth-div__column > input,
    .birth-div__column > span {
        width: 95px;
        height: 40px;
        border: transparent;
        color: rgb(102, 102, 102);
        text-align: center;
    }

    .register-div__label {
        display: inline-block;
        width: 139px;
        font-size: 14px;
        font-weight: 500;
    }
    .Required-entr-div {
        width: 610px;
        text-align: end;
        color: rgb(102, 102, 102);
        font-size: 12px;
        border-bottom: 2px solid rgb(51, 51, 51);
        padding-top: 40px;
        padding-bottom: 10px;
    }
    .register-btn {
        width: 240px;
        height: 56px;
        background-color: var(--main-color);
        color: white;
        font-size: 16px;

    }
    .agreement-div {
        display: flex;
        flex-direction: column;
        /* background-color: aqua; */
    }

    .register-header {
        font-size: 28px;
        font-weight: 500;
    }

    .Required-entr__label {
        color: red;
    }

    .line-div {
        height: 100px;
        width: 100px;
        border: 2px solid black;
    }

    .column-div {
        margin-top: 10px;
    }

    ::placeholder {
        font-size: 14px;
        padding: 0 11px 1px 15px;
    }
    .order-info__label {
        font-size: 12px;
        margin: 10px 145px 0;
        color: #666666;
    }

    .register-div__btn {
        margin-left: 0;
    }

    .birth-div {
        border-bottom: 1px solid rgb(51, 51, 51);
        padding-top: 20px;
        padding-bottom: 40px;
    }

    label {
        font-size: 14px;
        color: #333333;
    }

    #agreement1 ~ label {
        font-size: 18px;
    }

    .agreement-div__column {
        padding: 8px 0;
    }

    .agreement-label {
        font-size: 4px;
    }

    .birth-div__column > *:focus {
        outline: none;
    }

    .id-info-div {
        display: flex;
        justify-content: center;
        padding-top: 4px;
        font-size: 13px;
        color: #ff0000;
        display: none;
    }

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
    }

    .modal_content_body {
        position: absolute;

        padding: 40px;

        width: 320px;
        height: 66px;

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
<form id="frm" action="<c:url value="/member/signup"/>" method="POST">
    <input type="hidden" name="_method" value="POST">
    <section>

        <!-- modal start -->
        <div class="modal">
            <div class="modal_content_body">
                <span id="modal_content"></span>
                <!-- modalContent -->
            </div>
            <div class="modal_alert_body">
                <button type="button" class="close-modal-btn">확인</button>
            </div>
        </div>
        <!-- modal end -->

        <span class="register-header">회원가입</span>
        <div class="Required-entr-div">
            <span class="Required-entr__label">*&nbsp;</span>필수입력사항
        </div>
        <div class="register-div">
            <div class="column-div">
          <span class="register-div__label"
          >아이디<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="아이디를 입력해주세요"
                        title="이 입력란을 작성하세요"
                        id="custId"
                        name="custId"
                />
                <button type="button" id="custId_btn" class="open-modal-btn" value="1">중복확인</button>
            </div>
            <div class="id-info-div">
          <span
          >6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합</span
          >
            </div>
            <div class="column-div">
          <span class="register-div__label"
          >비밀번호<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="비밀번호를 입력해주세요"
                        title="이 입력란을 작성하세요"
                        name="pwd"

                />
            </div>
            <div class="column-div">
          <span class="register-div__label"
          >비밀번호확인<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="비밀번호를 한번 더 입력해주세요"
                        title="이 입력란을 작성하세요"

                />
            </div>
            <div class="column-div">
          <span class="register-div__label"
          >이름<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="이름을 입력해주세요"
                        title="이 입력란을 작성하세요"
                        id="name"
                        name="name"
                />
            </div>
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
                <button type="button" id="email_btn" class="open-modal-btn" value="2">중복확인</button>
            </div>
            <div class="column-div">
          <span class="register-div__label"
          >휴대폰<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="숫자만 입력해주세요"
                        title="이 입력란을 작성하세요"
                        id="telNo"
                        name="telNo"
                />
                <button type="button" class="open-modal-btn" value="3" id="telNo_btn">인증번호 받기</button>
            </div>
            <div class="column-div">
          <span class="register-div__label"
          >주소<span class="Required-entr__label">*</span></span
          >
                <button class="register-div__btn">주소검색</button>
            </div>
            <div class="order-info__label">
                배송지에 따라 상품정보가 달라질 수 있습니다.
            </div>
            <div class="column-div">
                <span class="register-div__label">성별</span>
                <input type="radio" id="sex-m" name="sex" value="M"/>
                <label for="sex-m">남자</label>
                <input type="radio" id="sex-f" name="sex" value="F"/>
                <label for="sex-f">여자</label>
                <input type="radio" id="sex-none" name="sex" value="N"/>
                <label for="sex-none">선택안함</label>
            </div>
            <div class="birth-div column-div">
                <span class="register-div__label">생년월일</span>
                <div class="birth-div__column">
                    <input type="text" id="yyyy" placeholder="YYYY" /><span>/</span>
                    <input type="text" id="mm" placeholder="MM" /><span>/</span>
                    <input type="text" id="dd" placeholder="DD" />
                    <input type="hidden" id="yyyymmdd" value="" name="birthDt">
                </div>
            </div>
        </div>
        <hr />
        <div class="agreement-div">
        <span class="register-div__label"
        >이용약관동의<span class="Required-entr__label">*</span></span
        >
            <div class="agreement-div__column">
                <div>
                    <input type="radio" id="agreement1" /><label for="agreement1"
                >전체 동의합니다.</label
                >
                    <div class="agreement-label">
                        <label>
                            선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를
                            이용할 수 있습니다.
                        </label>
                    </div>
                </div>
            </div>
            <div class="agreement-div__column">
                <input type="radio" id="agreement2" /><label for="agreement2"
            >이용약관 동의<span>(필수)</span></label
            >
                <a href="#"
                ><span><label>약관보기></label></span></a
                >
            </div>
            <div class="agreement-div__column">
                <input type="radio" id="agreement3" /><label for="agreement3"
            >개인정보 수집 이용 동의<span>(필수)</span></label
            >
                <a href="#"
                ><span><label>약관보기></label></span></a
                >
            </div>
            <div class="agreement-div__column">
                <input type="radio" id="agreement4" /><label for="agreement4"
            >개인정보 수집 이용 동의<span>(선택)</span></label
            >
                <a href="#"
                ><span><label>약관보기></label></span></a
                >
            </div>
            <div class="agreement-div__column">
                <input type="radio" id="agreement5" /><label for="agreement5"
            >무료배송,할인쿠폰 등 혜택/정보 수신 동의<span>(선택)</span></label
            >
            </div>
            <div class="agreement-div__column">
                <input type="radio" id="agreement6" /><label for="agreement6"
            >본인은 만 14세 이상입니다.<span>(필수)</span></label
            >
            </div>
        </div>
        <hr />
        <button type="button" class="register-btn">가입하기</button>
    </section>
</form>
<script>
    $(document).ready(function () {
        let modal = document.querySelector(".modal");
        let openModalBtns = document.querySelectorAll(".open-modal-btn");
        let modalContent = document.querySelector("#modal_content");
        let closeModalBtn = document.querySelector(".close-modal-btn");

        let custId = document.querySelector("#custId");
        let telNoBtn = document.querySelector("#telNo_btn");

        // id 중복확인 버튼
        let custIdBtn = document.querySelector("#custId_btn");
        let email = document.querySelector("#email");

        // 가입하기 btn
        let regBtn = document.querySelector(".register-btn");

        // [].forEach.call(openModalBtns, function (openModalBtn) {
        //     // 하나의 클래스명으로 다른 값을 얻어 alert의 내용을 바꾸는 fun.
        //     openModalBtn.addEventListener("click", setMessage, false);
        // });

        // btn에 따른 조건식 변경 fun.
        function setMessage(val) {
            let msg = "";
            if (val == 1) {  // 아이디 중복 확인
                if(checkId()) {  // 1. NULL , 2. LENGTH
                    msg = "6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합";
                    openModal(msg);
                }
            } else if (val == 2) {
                if(checkEmail()){
                    // 이메일 중복 확인
                    msg = "이메일을 입력해주세요";
                    openModal(msg);
                }
            } else if (this.value == 3){
                // 휴대폰 인증번호 발송
                // telNoRegExp();
                msg = "인증번호가 발송되었습니다";
                openModal(msg);
            }


        }

        function checkId(){
            return custId.value.trim() == "" || custId.value.length < 6 || 17 < custId.value.length;
        }

        function checkEmail(){
            return email.value.trim() == "";
        }

        // modal open
        function openModal(msg) {
            modal.style.display = "flex";
            document.body.style.overflow = "hidden"; // 모달 작동 시 스크롤바 비활성화
            modalContent.innerHTML = `<p>${'${msg}'}</p>`; //

        }

        // function telNoRegExp(){
        //
        //     let regEx = /0[]{9,11}/;
        //     let inputed = document.getElementById("telNo").value;
        //
        //
        //     console.log(inputed);
        //     console.log(regEx.test(inputed));
        // }

        // modal close
        closeModalBtn.addEventListener("click", () => {
            modal.style.display = "none";
            document.body.style.overflow = "unset"; // 모달 작동 시 스크롤바 활성화

        });


        // $(document).ready(function () {
        // id check - length
        custId.addEventListener("input", () => {
            let custIdVal = $("#custId").val().trim(); // id의 길이
            let idInfoDiv =  $(".id-info-div");

            $.ajax({
                success: function () {
                    if (custIdVal.length < 6 || 17 < custIdVal.length) {
                        idInfoDiv.css("display", "block");
                    }else{
                        idInfoDiv.css("display","none");
                    }
                },
            });
        });

        //    id 중복체크 btn
        custIdBtn.addEventListener("click", () => {
            if(checkId()){
                setMessage(1);
                return false;
            }else{
                let custIdVal = $("#custId").val();
                $.ajax({
                    type : 'GET',
                    url : '/member/signup/'+custIdVal,
                    success : function(result){
                        alert("사용 할 수 있는 아이디입니다");
                        $("#custId_btn").attr("disabled",true);
                        $("#custId_btn").css("color","#dddddd");
                        $("#custId_btn").css("border-color","#dddddd");
                    },
                    error : function(){
                        alert("사용 불가능한 아이디입니다");
                    }
                }); // end of ajax
            }
        });

        // email 중복체크 btn
        $("#email_btn").click(function(){
            if(checkEmail()){
                setMessage(2);
                return false;
            }else{
                let emailVal = $("#email").val();
                $.ajax({
                    type : 'GET',
                    url : '/member/signup/email/'+emailVal,
                    success : function(result){
                        alert("사용 할 수 있는 이메일입니다");
                        $("#email_btn").attr("disabled",true);
                        $("#email_btn").css("color","#dddddd");
                        $("#email_btn").css("border-color","#dddddd");
                    },
                    error : function(){
                        alert("사용 불가능한 이메일입니다");
                    }
                }); // end of ajax
            }
        });

        // 휴대폰번호 인증 api
        telNoBtn.addEventListener("click", () => {
            let telNoVal = $("#telNo").val(); // 휴대폰 번호
            $.ajax({
                type : "POST",
                url : "/sms/telNoCheck",
                data : {telNo : telNoVal},
                cache : false,
                success : function(data) {
                    if (data == "err") { // 실패시
                        alert("SEND ERR");
                    } else {
                        alert("SEND OK");
                        // 성공시 데이터 저장
                    }
                }
            });
        });

        // function sendSignup(){
        //     // 생년월일 합치기
        //     let yyyy = document.querySelector("#yyyy").value;
        //     let mm = document.querySelector("#mm").value;
        //     let dd = document.querySelector("#dd").value;
        //     let yyyymmdd = document.querySelector("#yyyymmdd").value;
        //     yyyymmdd = yyyy+mm+dd;
        //     alert("test");
        //     return true;
        // }

        regBtn.addEventListener("click", () =>{
            // 생년월일 합치기
            let yyyy = document.querySelector("#yyyy").value;
            let mm = document.querySelector("#mm").value;
            let dd = document.querySelector("#dd").value;
            let yyyymmdd = document.querySelector("#yyyymmdd");
            yyyymmdd.value = yyyy+mm+dd;


            let signupFrm = document.querySelector("#frm");
            signupFrm.submit();

        });
        // let sendMessage = function(){
        //     let telNoVal = $("#telNo").val(); // 휴대폰 번호
        //     alert(telNoVal);
        //     $.ajax({
        //         type : "POST",
        //         url : "/sms/telNoCheck",
        //         data : {telNo : telNoVal},
        //         cache : false,
        //         success : function(data) {
        //             if (data == "err") { // 실패시
        //                 alert("SEND ERR");
        //             } else {
        //                 alert("SEND OK");
        //                 // 성공시 데이터 저장
        //             }
        //         }
        //     });
        // }


    });


</script>
</body>
</html>