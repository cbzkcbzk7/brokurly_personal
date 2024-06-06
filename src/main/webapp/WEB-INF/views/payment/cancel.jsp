<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap"
            rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/payment/cancel.css'/>"/>
    <script>
        function redirect() {
            window.location.href = "/order/checkout";
        }
    </script>
</head>
<body>
<div class="small-modal">
    <div class="small-modal-border">
        <div class="small-modal-content">결제를 취소했습니다.</div>
        <div class="small-modal-buttons">
            <button id="small-modal-ok" onclick="redirect()">확인</button>
        </div>
    </div>
</div>
</body>
</html>

