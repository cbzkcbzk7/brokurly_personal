<%--
  Created by IntelliJ IDEA.
  User: Sora
  Date: 2024-03-13
  Time: 오후 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/resources/css/member/member_modal.css'/>"/>
    <title>Title</title>
</head>
<body>
<%--모달창 시작--%>
<div role="presentation" class="MuiModal-root MuiDialog-root css-98q5jm">
    <div aria-hidden="true" class="MuiBackdrop-root css-919eu4"
         style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
    <div tabindex="0" data-test="sentinelStart"></div>
    <div class="MuiDialog-container MuiDialog-scrollPaper css-ekeie0" role="presentation" tabindex="-1"
         style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">
        <div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation24 MuiDialog-paper MuiDialog-paperScrollPaper MuiDialog-paperWidthSm css-uhb5lp"
             role="dialog" aria-labelledby="customized-dialog-title">
            <div class="css-qfuix0 e1xnucib5">
                <div class="msg-div"></div>
            </div>
            <div class="css-1toes8l e1vslu8h0">
                <button class="exist-modal modal-btn e4nu7ef3" type="button" height="56"><span
                        class="css-nytqmg e4nu7ef1">닫기</span></button>
            </div>
        </div>
    </div>
    <div tabindex="0" data-test="sentinelEnd"></div>
</div>
<%--모달창 끝 --%>
</body>
</html>
