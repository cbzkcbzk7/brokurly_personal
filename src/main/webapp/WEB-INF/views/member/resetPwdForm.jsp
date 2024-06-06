<%--
  Created by IntelliJ IDEA.
  User: Sora
  Date: 2024-03-02
  Time: 오후 9:33
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
    <title>비밀번호 재설정</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/member/loginForm.css'/> ">
</head>
<style>

    input[type=password]{
        width: 340px;

    }


    .pwd-info-div,
    .pwdChk-info-div{
        display: flex;
        justify-content: center;
        padding-top: 4px;
        font-size: 13px;
        color: #ff0000;
        display: none;
        position: relative;
        top : -10px;
        z-index: -1;
    }

</style>
<body>
<form id="frm" action="<c:out value='/member/find/password/reset/${email}'/>" method="POST">
    <input type="hidden" name="_method" value="PATCH">
    <section>
        <!-- modal start -->
        <jsp:include page="../include/modal.jsp"/>
        <!-- modal end -->
        <span class="login-header">비밀번호 재설정</span>
        <div class="login-div">
            <div class="email-div">
                <div class="register-div__label">새 비밀번호 등록</div>
                <input
                        class="login-div__column"
                        id="pwd"
                        type="password"
                        name="pwd"
                        placeholder="새 비밀번호를 입력해주세요"
                        maxlength="15"
                />
            </div>
            <div class="pwd-info-div">
            </div>
                <div class="email-div">
                <div class="register-div__label">새 비밀번호 확인</div>
                <input
                        class="login-div__column"
                        id="pwdChk"
                        type="password"
                        name="pwdChk"
                        placeholder="새 비밀번호를 한 번 더 입력해주세요"
                        maxlength="15"
                />
            </div>
            <input type="hidden" id="email" value="${email}"/>
            <div class="pwdChk-info-div">
            </div>
            <button type="button" class="login-div__column loginBtn">확인</button>
        </div>

    </section>
    </form>
<script>
    $(document).ready(function () {
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

            location.href = '/member/login';
        });

        function regExp(value){
            const pwdRegEx = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$/; // 비밀번호 > 영문 특수문자 조합 8자 이상


            let inputed = "";
            let regEx = "";
             if(value === 4){
                inputed = document.querySelector("#pwd").value.trim();
                regEx = pwdRegEx;
            }

            return !regEx.test(inputed) || !inputed;
        }


        let pwdOrigin = document.querySelector("#pwd");
        let pwdChk = document.querySelector("#pwdChk");

        //  비밀번호 유효성 검사
        pwdOrigin.addEventListener("input", pwdRegExp);
        function pwdRegExp(){
            let pwdInfoDiv = document.querySelector(".pwd-info-div");

            if(pwdOrigin.value.length < 10){
                pwdInfoDiv.innerHTML = '최소 10자 이상 입력';
                pwdInfoDiv.style.display = "block";
                return false;
            }else{
                if(regExp(4)){
                    pwdInfoDiv.innerHTML = '영문/숫자/특수기호만 허용하며, 모두 조합';
                    pwdInfoDiv.style.display = "block";
                    return false;
                }else{
                    pwdInfoDiv.style.display = "none";
                    return true;
                }
            }
        }

        // 비밀번호 체크
        pwdChk.addEventListener("input" ,pwdChkRegExp);
        function pwdChkRegExp(){
            let pwdChkInfoDiv = document.querySelector(".pwdChk-info-div");

            if(pwdChk.value.length === 0) {
                pwdChkInfoDiv.innerHTML = '비밀번호를 한번 더 입력해주세요.';
                pwdChkInfoDiv.style.display = 'block';
                return false;
            }else if(pwdChk.value != pwdOrigin.value){
                pwdChkInfoDiv.innerHTML = '동일한 비밀번호를 입력';
                pwdChkInfoDiv.style.display = "block";
                return false;
            }else{
                pwdChkInfoDiv.style.display = 'none';
                return true;
            }
        }

        $(".loginBtn").click(function(){
            let emailVal = $('#email').val();
            let passwordVal = $('#pwd').val();

            $.ajax({
               type : 'PATCH',
                url : '/member/find/password/reset/'+emailVal+'/'+passwordVal,
                success : function (result){
                   existModal("비밀번호 변경이 완료되었습니다");

                },
                error : function(){
                   existModal("비밀번호 변경에 실패하였습니다");
                }

            });
        });

    });
</script>
</body>
</html>