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

    .findPwd-div{
        height: 300px;
    }
    .loginBtn{
        disabled : true;
        background-color:#dddddd;
        border-color: #dddddd;
    }
    #email{
        width: 340px;

    }
    #email_btn{
        position: relative;
        left: 265px;
        top: -53px;
        background-color: #11967f;
        color: white;
        padding : 3px;
        height:30px;
        width: 65px;
        border-radius: var(--main-border-radius);
    }

    .loginBtn {
        margin-top: -60px;
    }
    @import url(https://fonts.googleapis.com/css?family=Lato:300);


    /*.box:nth-child(2n-1){*/
    /*    background-color: rgba(0,0,0,0.05);*/
    /*}*/

    .box{
        top:-300px;
        z-index:5;
        display: inline-block;
        height: 200px;
        width: 33.3%;
        float:left;
        position: relative;
        /*margin:0 -4px -5px -2px;*/
        transition: all .2s ease;
    }





    /* MEDIA QUERIES */
    @media (max-width: 700px){
        .box{
            width: 50%;
        }

        .box:nth-child(2n-1){
            background-color: inherit;
        }

        /*.box:nth-child(4n),.box:nth-child(4n-3) {*/
        /*    background-color: rgba(0,0,0,0.05);*/
        /*}*/

    }

    @media (max-width: 420px){
        .box{
            width: 100%;
        }

        .box:nth-child(4n),.box:nth-child(4n-3){
            background-color: inherit;
        }

        /*.box:nth-child(2n-1){*/
        /*    background-color:rgba(0,0,0,0.05);*/
        /*}*/

    }


    /* -------------- loader7 -------------- */

    .loader7{
        position: relative;
        width: 40px;
        height: 40px;

        top: 40%;
        top: -webkit-calc(50% - 20px);
        top: calc(50% - 20px);
        left: 43%;
        left: -webkit-calc(50% - 20px);
        left: calc(50% - 20px);

        /*background-color: rgba(255, 255, 255, .2);*/
    }

    .loader7:before{
        content: "";
        position: absolute;
        background-color: var(--main-color);
        height: 10px;
        width: 10px;
        border-radius: 10px;
        -webkit-animation: loader7 2s ease-in-out infinite;
        animation: loader7 2s ease-in-out infinite;
    }

    .loader7:after{
        content: "";
        position: absolute;
        background-color: var(--main-color);
        top: 0px;
        left: 0px;
        height: 40px;
        width: 0px;
        z-index: 2;
        opacity: 1;
        -webkit-animation: loader72 10s ease-in-out infinite;
        animation: loader72 10s ease-in-out infinite;
    }


    @-webkit-keyframes loader7{
        0%{left: -12px; top: -12px;}
        25%{left:42px; top:-12px;}
        50%{left: 42px; top: 42px;}
        75%{left: -12px; top: 42px;}
        100%{left:-12px; top:-12px;}
    }

    @keyframes loader7{
        0%{left: -12px; top: -12px;}
        25%{left:42px; top:-12px;}
        50%{left: 42px; top: 42px;}
        75%{left: -12px; top: 42px;}
        100%{left:-12px; top:-12px;}
    }

    @-webkit-keyframes loader72{
        0%{width: 0px;}
        70%{width: 40px; opacity: 1;}
        90%{opacity: 0; width: 40px;}
        100%{opacity: 0;width: 0px;}
    }

    @keyframes loader72{
        0%{width: 0px;}
        70%{width: 40px; opacity: 1;}
        90%{opacity: 0; width: 40px;}
        100%{opacity: 0;width: 0px;}
    }

</style>
<body>
<form id="frm" action="<c:out value='/member/find/password/reset'/>" method="POST">
    <input type="hidden" name="_method" value="POST">
    <section>
        <!-- modal start -->
        <jsp:include page="../include/modal.jsp"/>
        <!-- modal end -->
        <span class="login-header">비밀번호 재설정</span>
        <div class="login-div findPwd-div">
            <div class="email-div">
                <span class="register-div__label">가입하신 이메일을 입력해주세요</span>
                <input
                        class="login-div__column"
                        id="email"
                        type="text"
                        name="email"
                        placeholder="가입하신 이메일을 입력해주세요"
                        maxlength="33"
                />
                <button type="button" id="email_btn" class="open-modal-btn btn">확인</button>
            </div>
            <button type="button" class="login-div__column loginBtn" id="sendEmail" disabled>이메일로 인증코드 받기</button>
        </div>

        <%-- 로딩 중 표시--%>
        <div class="box" style="display:none">
        </div>
    </section>
</form>
<script>
    $(document).ready(function (){
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

        // modal end

        let msg = "${msg}";

        if(msg != ''){
            existModal(msg);
        }

        let chkCnt = 0; //  이메일 인증 or 인증번호 인증을 위한 cnt
        let authNum = '';
        let emailHidden = '';

        function chkAuthNum(){
            let chkNum = document.querySelector("#email").value;

            if(chkNum === authNum){
                $(".loginBtn").attr("disabled",false);
                $(".loginBtn").css("background-color","#11967f");
                $(".loginBtn").css("border-color","#11967f");

                $("#email_btn").attr("disabled",true);
                $("#email_btn").css("background-color","#dddddd");
                $("#email_btn").css("border-color","#dddddd");
                $("#email_btn").html("확인 완료");

                $("#email").attr("disabled",true);

                chkCnt += 1;

            }else{
                existModal("올바른 인증코드가 아닙니다.");
            }

        }


        function submitNewPwd(){

            const frm = document.querySelector("#frm");

            // input 생성 후 email값 가져가기
            const data_1 = document.createElement('input');
            data_1.setAttribute('type', 'hidden');
            data_1.setAttribute('name', 'emailHidden');
            data_1.setAttribute('value', emailHidden);

            // form 태그에 input 태그 넣고 summit 가능하게 처리
            frm.appendChild(data_1);
            document.body.appendChild(frm);


            frm.submit();
        }

        function regExp(value){
            const emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i; // 이메일 정규식

            let inputed = "";
            let regEx = "";

          if(value === 2){
                inputed = document.querySelector("#email").value.trim();
                regEx = emailRegEx;
            }
            return !regEx.test(inputed) || !inputed;
        }

        // email 중복체크 btn
        // 1. 있는 메일인지 확인한다
        // 1-1. 없으면 알람창
        // 1-2. 있으면 이메일로 인증코드 받기 버튼 활성화
        $("#email_btn").click(function(){

            if(chkCnt === 0){
            if(regExp(2)){
                existModal("이메일 형식으로 입력해 주세요");
                return false;
            }else{
                let emailVal = $("#email").val();
                $.ajax({
                    type : 'GET',
                    url : '/member/signup/email/'+emailVal+'?cnt=0',
                    success : function(result){
                        $("#email_btn").attr("disabled",true);
                        $("#email_btn").css("background-color","#dddddd");
                        $("#email_btn").css("border-color","#dddddd");
                        $("#email_btn").html("확인 완료");

                        $("#email").attr("disabled",true);

                        $(".loginBtn").attr("disabled",false);
                        $(".loginBtn").css("background-color","#11967f");
                        $(".loginBtn").css("border-color","#11967f");

                        chkCnt += 1;

                    },

                    error : function(){
                        existModal("등록된 이메일 주소가 아닙니다.");
                    }
                }); // end of ajax
            }
            }else if(chkCnt === 1){
                    chkAuthNum();
            }
        });

        $("#sendEmail").click(function(){
            let emailVal = $("#email").val();

            if(chkCnt === 1){
            $.ajax({
                type:'POST',
                url : '/member/find/password/'+emailVal,
                success : function (result){
                    existModal("입력한 이메일로 인증 메일이 \n발송되었습니다.");

                    emailHidden = emailVal;

                     //  인증번호 확인 화면으로 변경
                     $(".register-div__label").html("이메일로 받은 인증코드를 입력해주세요");
                     $("#email").attr("disabled",false);
                     $("#email").val('');
                     $("#email").attr("placeholder","인증코드를 입력해주세요");

                     $("#email_btn").attr("disabled",false);
                     $("#email_btn").css("background-color","#11967f");
                     $("#email_btn").css("border-color","#11967f");
                     $("#email_btn").html("확인");

                    $(".loginBtn").attr("disabled",true);
                    $(".loginBtn").css("background-color","#dddddd");
                    $(".loginBtn").css("border-color","#dddddd");
                    $(".loginBtn").html("비밀번호 재설정하기");

                    authNum = result;
                },
                beforeSend: function() {
                    $('.box').html(' <div class="loader7"></div>');
                    $('.box').css('display',"block");
                    $('.modal').css('display',"flex");


                },
                complete: function() {
                    $('.box').css('display',"none");
                    $('.modal').css('display',"none");

                },
                error : function (){
                    existModal("메일 보내기에 실패하였습니다.");
                }

            });

            }else if(chkCnt === 2){
                submitNewPwd();

                chkCnt = 0;
            }
        });
    });
</script>
</body>
</html>