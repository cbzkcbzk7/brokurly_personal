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
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/shipping-address-result.css'/>"/>
    <title>컬리 - 마켓컬리/뷰티컬리</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    window.onload = () => {
        $(".submit").click((e) => {
            e.preventDefault();

            // console.dir(this);
            // const formData = $(this).serialize();
            // const formData = $(".form").serialize();
            let formData = new FormData();
            const addr = $("input[name=addr]").val();
            const specAddr = $("input[name=specAddr]").val();
            const defAddrFl = $("input[name=defAddrFl]").prop("checked");
            /*console.log(addr);
            console.log(specAddr);
            console.log(defAddrFl);*/
            /*formData.append("addr", addr);
            formData.append("specAddr", specAddr);*/

            $.ajax({
                url: "/mypage/address",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify({
                    "addr": addr,
                    "specAddr": specAddr,
                    "defAddrFl": defAddrFl
                }),
                success: function (response) {
                    window.close();
                    window.opener.location.reload(); // 해당 팝업을 연 페이지를 reload함
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error(textStatus, errorThrown);
                }
            })
        })
    }
</script>
<body>
<div class="form">
    <strong>
        <span type="direct">샛별배송</span>
        지역입니다.
        <p>매일 새벽, 문 앞까지 신선함을 전해드려요.</p>
    </strong>
    <div class="row1">
        <input name="addr" value="${addr}" readonly>
        <button width="120" height="44" radius="3" onclick="history.back()">
          <span>
            <img
                    src="https://res.kurly.com/pc/service/common/2006/ico_search.svg"
            />재검색
          </span>
        </button>
    </div>
    <div class="row2">
        <input
                data-testid="input-box"
                id="specAddr"
                name="specAddr"
                placeholder="나머지 주소를 입력해 주세요"
                type="text"
        />
    </div>
    <div class="row3">
        <label>
            <input type="checkbox" name="defAddrFl" />
            <span style="margin-left: 5px">기본 배송지로 저장</span>
        </label>
    </div>
    <button class="submit" height="44" radius="3">
        <span>저장</span>
    </button>
    <div class="notice">
        <strong>샛별배송 지역 중 배송불가 장소 안내</strong>
        <p>
            관공서 / 학교 / 병원 / 시장 / 공단지역 / 산간지역 / 백화점 등
            <button>자세히 보기<span></span></button>
        </p>
    </div>
</div>
</body>
</html>
