<%--
  Created by IntelliJ IDEA.
  User: Sora
  Date: 2024-03-03
  Time: 오전 1:39
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

        <span class="register-header">개인 정보 수정</span>
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
                        placeholder="아이디를 입력해 주세요"
                        title="이 입력란을 작성하세요"
                        id="custId"
                        name="custId"
                        maxlength="17"
                        value="${memberDto.custId}"
                />
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
                        placeholder="비밀번호를 입력해 주세요"
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
                        placeholder="비밀번호를 한번 더 입력해 주세요"
                        title="이 입력란을 작성하세요"

                />
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
                        value="${memberDto.name}"
                />
            </div>
            <div class="name-info-div">
          <span
          >이름을 입력해 주세요</span
          >
            </div>
            <div class="column-div">
          <span class="register-div__label"
          >이메일<span class="Required-entr__label">*</span></span
          >
                <input
                        type="text"
                        placeholder="예: brokurly@gmail.com"
                        title="이 입력란을 작성하세요"
                        id="email"
                        name="email"
                />
                <button type="button" id="email_btn" class="open-modal-btn">중복확인</button>
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
                <button type="button" class="open-modal-btn" value="3" id="telNo_btn">인증번호 받기</button>
            </div>
            <div class="telNo-info-div">
          <span
          >휴대폰 번호를 입력해 주세요</span
          >
            </div>
            <%--            <div class="column-div">--%>
            <%--          <span class="register-div__label"--%>
            <%--          >주소<span class="Required-entr__label">*</span></span--%>
            <%--          >--%>
            <%--                <button class="register-div__btn">주소검색</button>--%>
            <%--            </div>--%>
            <%--            <div class="order-info__label">--%>
            <%--                배송지에 따라 상품정보가 달라질 수 있습니다.--%>
            <%--            </div>--%>
            <%--            <div class="column-div">--%>
            <%--                <span class="register-div__label">성별</span>--%>
            <%--                <input type="radio" id="sex-m" name="sex" value="M"/>--%>
            <%--                <label for="sex-m">남자</label>--%>
            <%--                <input type="radio" id="sex-f" name="sex" value="F"/>--%>
            <%--                <label for="sex-f">여자</label>--%>
            <%--                <input type="radio" id="sex-none" name="sex" value="N"/>--%>
            <%--                <label for="sex-none">선택안함</label>--%>
            <div class="css-82a6rk e744wfw3 column-div">
                <span class="register-div__label">성별</span>
                <div class="css-14wodj6 es1pbny0">
                    <label class="css-z9g6s0 et8nqc33" for="sex-man">
                        <input data-testid="radio-MALE" id="sex-man" name="sex" type="radio" class="css-1pes2r6 et8nqc32" value="M">
                        <span class="css-5xw1m2 e2sqze61"><div class="css-1vic0rk e2sqze60"></div></span>
                        <span aria-labelledby="sex-man" class="css-mgd87h et8nqc31">남자</span>
                    </label>
                    <label class="css-z9g6s0 et8nqc33" for="sex-woman">
                        <input data-testid="radio-FEMALE" id="sex-woman" name="sex" type="radio" class="css-1pes2r6 et8nqc32" value="F">
                        <span class="css-5xw1m2 e2sqze61"><div class="css-1vic0rk e2sqze60"></div></span>
                        <span aria-labelledby="sex-woman" class="css-mgd87h et8nqc31">여자</span>
                    </label>
                    <label class="css-z9g6s0 et8nqc33" for="sex-none">
                        <input data-testid="radio-NONE" id="sex-none" name="sex" type="radio" class="css-1pes2r6 et8nqc32" value="N" checked="">
                        <span class="css-198i9ca e2sqze61"><div class="css-1dahn5m e2sqze60"></div></span>
                        <span aria-labelledby="sex-none" class="css-mgd87h et8nqc31">선택안함</span>
                    </label>
                </div>
            </div>
            <%--            </div>--%>
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
        let modalContent = document.querySelector("#modal_content");
        let closeModalBtn = document.querySelector(".close-modal-btn");

        let custId = document.querySelector("#custId");
        let name = document.querySelector("#name");
        let email = document.querySelector("#email");
        let telNo = document.querySelector("#telNo");

        let regBtn = document.querySelector(".register-btn");


        // modal open
        function openModal(msg) {
            modal.style.display = "flex";
            document.body.style.overflow = "hidden"; // 모달 작동 시 스크롤바 비활성화
            modalContent.innerHTML = `<p>${'${msg}'}</p>`; //

        }

        // modal close
        closeModalBtn.addEventListener("click", () => {
            modal.style.display = "none";
            document.body.style.overflow = "unset"; // 모달 작동 시 스크롤바 활성화

        });


        function regExp(value){
            const idRegEx = /^[a-z]+[a-z0-9]{5,17}$/g; // 아이디 정규식
            const emailRegEx = /[a-z0-9]+@gmail.com/; // 이메일 정규식 > 추후에 메일인증을 gmail로 구현할 예정
            const telNoRegEx = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;  // 휴대폰번호 > 숫자만 가능 01?-4자리-4자리

            let inputed = "";
            let regEx = "";

            if(value === 1){  // 아이디 정규식
                inputed = custId.value.trim();
                regEx = idRegEx;
            }else if(value === 2){
                inputed = document.querySelector("#email").value.trim();
                regEx = emailRegEx;
            }else if(value === 3){
                let telNo = document.querySelector("#telNo").value.trim();
                inputed = telNo.slice(0,3)+'-'+telNo.slice(3,7)+"-"+telNo.slice(7,telNo.length);
                regEx = telNoRegEx;
            }

            return !regEx.test(inputed) || !inputed;
        }

        telNo.addEventListener("input", () => {
            const regEx = /[^-0-9]/g;
            let telNoInfoDiv = document.querySelector(".telNo-info-div");

            if(regEx.test(telNo.value)){
                telNo.value = telNo.value.replace(/[^-0-9]/g, "");
                telNoInfoDiv.style.display = "block";
            }else{
                telNoInfoDiv.style.display = "none";
            }

        });

        // // 이름 유효성 검사
        name.addEventListener("input", () => {
            let nameInfoDiv = document.querySelector(".name-info-div");

            if(!name.value.trim()){
                nameInfoDiv.style.display = "block";
            }else{
                nameInfoDiv.style.display = "none";
            }
        });

        // 아이디 ajax로 유효성 검사
        $("#custId").keydown(function(){
            let idInfoDiv =  $(".id-info-div");

            $.ajax({
                success: function () {
                    if (regExp(1)) {
                        idInfoDiv.css("display", "block");
                        $("#custId_btn").attr("disabled",false);
                        $("#custId_btn").css("color","#11967f");
                        $("#custId_btn").css("border-color","#11967f");
                    }else{
                        idInfoDiv.css("display","none");
                    }
                },
            });
        });




        // 이메일 ajax로 유효성 검사
        $("#email").keydown(function(){
            let emailInfoDiv =  $(".email-info-div");

            $.ajax({
                success: function () {
                    if (regExp(2)) {
                        emailInfoDiv.css("display", "block");
                        $("#email_btn").attr("disabled",false);
                        $("#email_btn").css("color","#11967f");
                        $("#email_btn").css("border-color","#11967f");
                    }else{
                        emailInfoDiv.css("display","none");
                    }
                },
            });
        });


        //    id 중복체크 btn
        $("#custId_btn").click(function(){
            if(regExp(1)){
                openModal("6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합");
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
            if(regExp(2)){
                openModal("이메일 형식으로 입력해 주세요");
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
        $("#telNo_btn").click(function(){
            if(regExp(3)){
                openModal("telNo is failed") // 1. 숫자아니면 버튼 활성화 안함
                return false;
            }else{
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
                });     // end of ajax
            }
        });


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


    });


</script>
</body>
</html>
