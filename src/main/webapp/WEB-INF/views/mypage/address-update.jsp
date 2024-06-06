<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/address-update.css'/>"/>
    <title>컬리 - 마켓컬리/뷰티컬리</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    window.onload = () => {
        const shipLocaId = $('input[name=shipLocaId]').val();

        $(".modify").on("click", function (e) {
            e.preventDefault();

            $.ajax({
                url: "/mypage/address/shipping-address/update/" + shipLocaId,
                method: "POST",
                data: $(".shippingLoca").serialize(),
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (response) {
                    window.close();
                    window.opener.location.reload(); // 해당 팝업을 연 페이지를 reload함
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error(textStatus, errorThrown);
                }
            })
        });

        $(".delete").on("click", function (e) {
            e.preventDefault();

            fetch("/mypage/address/" + shipLocaId, {
                method: "DELETE"
            })
                .then((response) => {
                    window.close();
                    window.opener.location.reload(); // 해당 팝업을 연 페이지를 reload함
                })
                .catch((error) => {
                    console.log(error);
                })
        });
    };
</script>
<body>
<form class="shippingLoca">
    <input type="hidden" name="_method" value="patch"/>
    <input type="hidden" name="shipLocaId" value="${shippingLocationModifyPageDto.shipLocaId}"/>
    <h2>배송지 수정</h2>
    <div padding-top="24px">
        <c:if test="${shippingLocationModifyPageDto.defAddrFl eq 'Y'}">
            <span class="default-deli">기본 배송지</span>
        </c:if>
        <div class="input">
            <label for="specAddr">
                ${shippingLocationModifyPageDto.addr}
            </label>
            <div>
                <c:set var="specAddr" value=""/>
                <c:if test="${not empty shippingLocationModifyPageDto.specAddr}">
                    <c:set var="specAddr" value="${shippingLocationModifyPageDto.specAddr}"/>
                </c:if>
                <input
                        data-testid="input-box"
                        id="specAddr"
                        name="specAddr"
                        placeholder="나머지 주소를 입력해 주세요"
                        type="text"
                        value="${specAddr}"
                />
            </div>
        </div>
        <div class="input">
            <label for="recName">받으실 분</label>
            <div>
                <c:set var="recName" value=""/>
                <c:if test="${not empty shippingLocationModifyPageDto.recName}">
                    <c:set var="recName" value="${shippingLocationModifyPageDto.recName}"/>
                </c:if>
                <input
                        data-testid="input-box"
                        id="recName"
                        name="recName"
                        placeholder="이름을 입력해 주세요"
                        type="text"
                        value="${recName}"
                />
            </div>
        </div>
        <div class="input">
            <label for="telNo">휴대폰</label>
            <div>
                <c:set var="telNo" value=""/>
                <c:if test="${not empty shippingLocationModifyPageDto.telNo}">
                    <c:set var="recName" value="${shippingLocationModifyPageDto.telNo}"/>
                </c:if>
                <input
                        data-testid="input-box"
                        id="telNo"
                        name="telNo"
                        placeholder="번호를 입력해 주세요"
                        type="text"
                        value="${telNo}"
                />
            </div>
        </div>
        <c:if test="${shippingLocationModifyPageDto.defAddrFl eq 'N'}">
            <div class="defAddrCheckbox">
                <input type="checkbox" name="defAddrFl"/>
                <span style="margin-left: 5px">기본 배송지로 저장</span>
            </div>
        </c:if>
        <button class="modify" height="44" radius="3">
            <span>저장</span>
        </button>
        <c:if test="${shippingLocationModifyPageDto.defAddrFl eq 'N'}">
            <button class="delete" height="44" radius="3">
                <span>삭제</span>
            </button>
        </c:if>
    </div>
</form>
</body>
</html>
