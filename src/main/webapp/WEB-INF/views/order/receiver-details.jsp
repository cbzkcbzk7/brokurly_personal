<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>브로컬리</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/order/receiver-details.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/order/receiver-details.js'/>"></script>
</head>
<body>
<div class="header">
    <h2>배송 요청사항</h2>
    <label class="sameCheck">
        <input type="checkbox" checked="checked"/>
        <span style="font-size: 15px; margin-left: 10px">주문자 정보와 동일</span>
    </label>
</div>
<form action="" method="post" class="receiver-info">
    <c:if test="${receiverDetails != null}">
        <input type="hidden" name="_method" value="patch">
    </c:if>
    <!-- 배송 대상자 정보 -->
    <div>
        <div>
            <label for="receiver-name" class="name title">받으실 분<span class="star">*</span></label>
            <div id="hidden-name" style="display:none">${member.name}</div>
            <input
                    id="receiver-name"
                    name="rcvName"
                    placeholder="이름을 입력해 주세요"
                    type="text"
                    value="${fn:trim(receiverDetails != null ? receiverDetails.rcvName : member.name)}"/>
        </div>
        <div>
            <label for="receiver-phone" class="name title">휴대폰<span class="star">*</span></label>
            <div id="hidden-tel-no" style="display:none">${member.telNo}</div>
            <input
                    id="receiver-phone"
                    name="telNo"
                    placeholder="숫자만 입력해 주세요"
                    maxlength="11"
                    type="text"
                    value="${fn:trim(receiverDetails != null ? receiverDetails.telNo : member.telNo)}"/>
        </div>
    </div>

    <div>
        <div class="title">받으실 장소<span class="star">*</span></div>
        <div style="margin-top: 10px">
            <div>
                <div class="receive-place">
                    <div style="width: 50%">
                        <label for="front-door" class="receive-place-label">
                            <input
                                    type="radio"
                                    name="rcvPlace"
                                    id="front-door"
                                    class="receive-place"
                                    <c:if test="${receiverDetails == null || receiverDetails.rcvPlace == '문 앞'}">checked</c:if>
                                    value="문 앞"/>
                            <span style="margin-left: 10px">문 앞</span>
                        </label>
                    </div>
                    <div style="width: 50%">
                        <label for="etc-place" class="receive-place-label">
                            <input
                                    type="radio"
                                    name="rcvPlace"
                                    id="etc-place"
                                    class="receive-place"
                                    <c:if test="${receiverDetails.rcvPlace == '기타 장소'}">checked</c:if>
                                    value="기타 장소"/>
                            <span style="margin-left: 10px">기타 장소</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="notice">
                <img src="<c:url value="/resources/image/info.png"/>" alt="information mark">
                <span style="margin-left: 5px;">경비실과 무인택배함 배송이 종료되었어요.</span>
            </div>

            <!-- 공동현관 출입방법 라디오 목록  -->
            <div id="door-radio-list">
                <div class="door-detail title">공동현관 출입방법<span class="star">*</span></div>
                <label for="password-radio" class="receive-place-label">
                    <input type="radio" name="enterMthd" id="password-radio" value="공동현관 비밀번호"
                           <c:if test="${receiverDetails == null || receiverDetails.enterMthd == '공동현관 비밀번호'}">checked</c:if>/>
                    <span style="margin-left: 10px">공동현관 비밀번호</span>
                </label>
                <input
                        type="text"
                        name="placeExp"
                        id="password-text"
                        placeholder="출입에 필요한 버튼을 모두 입력해주세요."/>
                <div class="door-password-guide">
                    <div>공동현관 비밀번호 입력 가이드</div>
                    <button type="button" class="show-hide-button">⋁</button>
                </div>
                <div class="door-password-guide-content">
                    <p>입력 시 한글 혹은 특수문자(#,*)를 활용해주세요</p>
                    <ul>
                        <li>
                            <span>호수 🔑 비밀번호 🔔 📢</span>
                            <span>></span>
                            <span class="copy-template">101 열쇠 1234 종 호출</span>
                        </li>
                        <li>
                            <span>👮🏻‍♂️ # 호수 # 비밀번호 *</span>
                            <span>></span>
                            <span class="copy-template">경비 # 101 # 1234 *</span>
                        </li>
                        <li>
                            <span>🔔 비밀번호</span>
                            <span>></span>
                            <span class="copy-template">종 1234</span>
                        </li>
                        <li>
                            <span># 비밀번호 *</span>
                            <span>></span>
                            <span class="copy-template"># 1234 *</span>
                        </li>
                    </ul>
                </div>
                <label for="free-entry-radio" class="receive-place-label">
                    <input type="radio" name="enterMthd" id="free-entry-radio" value="자유 출입 가능"
                           <c:if test="${receiverDetails.enterMthd == '자유 출입 가능'}">checked</c:if>/>
                    <span style="margin-left: 10px">자유 출입 가능</span>
                </label>
                <label for="security-call-radio" class="receive-place-label">
                    <input type="radio" name="enterMthd" id="security-call-radio" value="경비실 호출"
                           <c:if test="${receiverDetails.enterMthd == '경비실 호출'}">checked</c:if>/>
                    <span style="margin-left: 10px">경비실 호출</span>
                </label>
                <div class="textarea-div security-call-textarea">
                            <textarea
                                    name="placeExp"
                                    maxlength="100"
                                    placeholder="경비실 호출 방법을 자세히 입력해주세요.&#13;&#10;예 : 공동현관에서 경비실 모양 버튼"></textarea>
                </div>
                <label for="door-etc-radio" class="receive-place-label">
                    <input type="radio" name="enterMthd" id="door-etc-radio" value="문 앞 기타"
                           <c:if test="${receiverDetails.enterMthd == '문 앞 기타'}">checked</c:if>/>
                    <span style="margin-left: 10px">기타</span>
                </label>
                <div class="textarea-div door-etc-textarea">
                            <textarea
                                    name="placeExp"
                                    maxlength="100"
                                    placeholder="출입방법을 상세히 기재해주세요."></textarea>
                </div>
            </div>

            <!-- 기타장소 세부사항 라디오 목록 -->
            <div id="etc-radio-list">
                <div class="etc-detail title">기타장소 세부사항<span class="star">*</span></div>
                <label for="etc" class="receive-place-label">
                    <input type="radio" name="enterMthd" id="etc" value="기타 장소 기타"
                           <c:if test="${receiverDetails.enterMthd == '기타 장소 기타'}">checked</c:if>/>
                    <span style="margin-left: 10px">기타</span>
                </label>
                <div class="textarea-div etc-textarea">
                            <textarea
                                    name="placeExp"
                                    maxlength="100"
                                    placeholder="원하시는 장소를 자세히 입력해주세요.&#13;&#10;예 : 계단 밑, 주택단지 앞 경비초소를 지나 A동 출입구"></textarea>
                </div>
                <label for="receiving-room" class="receive-place-label">
                    <input type="radio" name="enterMthd" id="receiving-room" value="택배 수령실"
                           <c:if test="${receiverDetails.enterMthd == '택배 수령실'}">checked</c:if>/>
                    <span style="margin-left: 10px">택배 수령실</span>
                </label>
                <div class="textarea-div receiving-room-textarea">
                            <textarea
                                    name="placeExp"
                                    maxlength="100"
                                    placeholder="원하시는 장소를 자세히 입력해주세요.&#13;&#10;예 : 1층 출입구 오른쪽 택배수령실에 배송해주세요."></textarea>
                </div>
                <label for="front-gate" class="receive-place-label">
                    <input type="radio" name="enterMthd" id="front-gate" value="공동현관 앞"/>
                    <span style="margin-left: 10px">공동현관(대문) 앞</span>
                </label>
            </div>
        </div>

        <!-- 배송 완료 메시지 라디오 목록 -->
        <div class="title">배송 완료 메시지 전송<span class="star">*</span></div>
        <div>
            <div class="receive-place">
                <div style="width: 50%">
                    <label for="after-shipping" class="receive-place-label">
                        <input type="radio" name="msgTime" id="after-shipping" class="receive-place"
                               <c:if test="${receiverDetails == null || receiverDetails.msgTime == '배송 직후'}">checked</c:if>
                               value="배송 직후"/>
                        <span style="margin-left: 10px">배송 직후</span>
                    </label>
                </div>
                <div style="width: 50%">
                    <label for="7am" class="receive-place-label">
                        <input type="radio" name="msgTime" id="7am" class="receive-place"
                               <c:if test="${receiverDetails.msgTime == '오전 7시'}">checked</c:if>
                               value="오전 7시"/>
                        <span style="margin-left: 10px">오전 7시</span>
                    </label>
                </div>
            </div>
        </div>
        <div class="result-buttons">
            <button type="button" class="cancel" onclick="window.close()">취소</button>
            <button type="submit" class="save">저장</button>
        </div>
    </div>
</form>
</body>
</html>