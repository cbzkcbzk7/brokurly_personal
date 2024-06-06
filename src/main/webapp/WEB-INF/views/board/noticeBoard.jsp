<%--
  Created by IntelliJ IDEA.
  User: atomosphere
  Date: 2/5/24
  Time: 7:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>브로컬리</title>
    <link rel="stylesheet" href="/resources/css/board/noticeBoard.css">
</head>
<body>
<div class="css-1i60c0e emilzgk3">
    <div class="css-1uvp5r6 emilzgk2">
        <div class="css-qwe8mt emilzgk1">공지사항</div>
        <div class="css-1funedv emilzgk0">
            브로컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.
        </div>
    </div>
    <div class="css-1t45bai erzmnr90">
        <div class="css-1dhg94g e1pwb5hv0">
            <div class="css-1xrh39a e1pwb5hv2">제목</div>
            <div class="css-8vgw34 e1pwb5hv1">
                ${noticeBoardDto.title}
            </div>
        </div>
        <div class="css-1dhg94g e1pwb5hv0">
            <div class="css-1xrh39a e1pwb5hv2">작성자</div>
            <div class="css-8vgw34 e1pwb5hv1">${noticeBoardDto.adminId}</div>
        </div>
        <div class="css-1dhg94g e1pwb5hv0">
            <div class="css-1xrh39a e1pwb5hv2">작성일</div>
            <div class="css-8vgw34 e1pwb5hv1">${noticeBoardDto.regDt}</div>
        </div>
        <div class="css-1xvp3jp ezf0ge90">
            <div>
                <p>
                    ${noticeBoardDto.content}
                    <br>
                    <br>
                    <br>
                    <br>
                    <img
                            alt="image"
                            src="//lacms-board.kurly.com/board/notice/20231120/15d2f28f-fa29-40fa-8105-1628f334224e.png"
                    />
                </p>
            </div>
        </div>
        <div class="css-d7qwpj e1p3kiis0">
            <button
                    class="css-214ym4 e4nu7ef3"
                    type="button"
                    width="150"
                    height="42"
                    radius="0"
<%--                    해당 게시글을 누른 시점의 페이지를 저장하고 그 페이지로 돌아가도록 하고 싶다.--%>
<%--                    onclick="location.href='http://localhost:8080/board/notice?page=${pageNo}'"--%>
<%--                    컨트롤러를 호출하는 링크 어떻게? 직접적이지 않게.--%>
            >
                <span class="css-nytqmg e4nu7ef1">목록</span>
            </button>
        </div>
    </div>
</div>
</body>
</html>
