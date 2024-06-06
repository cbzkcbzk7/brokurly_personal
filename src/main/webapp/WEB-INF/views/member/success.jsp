<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com%22%3E"/>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
            rel="stylesheet"
    />
    <title>회원가입 완료</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<style>

    .background {
        /*width: 100%;*/
        height: 60%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .outer {
        width: 400px;
        height: 90%;
        padding: 30px;
        background-color: #ffffff;
        box-sizing: border-box;
        border-radius: 2px;
    }

    .inner {
        width: 100%;
        height: 100%;
    }

    .check {
        display: flex;
        justify-content: center;
        margin-top: 40px;
    }

    .greeting {
        margin-bottom: 20px;
        text-align: center;
        font-size: 18px;
    }

    .greeting span {
        font-weight: 600;
    }

    .loginBtn {
        width: 100%;
        height: 55px;
        padding: 10px;
        margin-bottom: 10px;
        font-weight: 600;
        border-radius: 3px;
        background-color: #11967f;
        color: white;
        border: 1px solid #11967f;
    }

</style>
<body>
<section>
<div class="background">
    <div class="outer">
        <div class="inner">
            <div class="check">
                <img src="<c:url value='/resources/image/check-circle.png'/>" width="80" height="80"/>
            </div>
            <p class="greeting">
                회원가입이 완료되었습니다!<br/>
            </p>
            <button class="loginBtn">로그인하기</button>
        </div>
    </div>
</div>
</section>
</body>
<script>
    window.onload = () => {
        $(".loginBtn").on("click", () => {
            window.location.href = "/member/login";
        });

    }
</script>
</html>

