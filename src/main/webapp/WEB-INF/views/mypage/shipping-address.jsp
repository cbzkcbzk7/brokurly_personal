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
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage/shipping-address.css'/>"/>
    <title>컬리 - 마켓컬리/뷰티컬리</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = () => {
        // 우편번호 찾기 찾기 화면을 넣을 element
        const element_wrap = document.getElementById("wrap");
        sample3_execDaumPostcode(element_wrap);
        element_wrap.style.height = "100vh";
    };
    function sample3_execDaumPostcode(elem) {
        const element_wrap = elem;
        // 현재 scroll 위치를 저장해놓는다.
        let currentScroll = Math.max(
            document.body.scrollTop,
            document.documentElement.scrollTop
        );
        new daum.Postcode({
            oncomplete: function (data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ""; // 주소 변수
                let extraAddr = ""; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === "R") {
                    // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else {
                    // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === "R") {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== "" && data.apartment === "Y") {
                        extraAddr +=
                            extraAddr !== ""
                                ? ", " + data.buildingName
                                : data.buildingName;
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== "") {
                        extraAddr = " (" + extraAddr + ")";
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample3_extraAddress").value = extraAddr;
                } else {
                    // document.getElementById("sample3_extraAddress").value = "";
                }

                addr += extraAddr;

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // document.getElementById("sample6_postcode").value = data.zonecode;
                // document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                // document.getElementById("sample6_detailAddress").focus();
                console.log(addr);
                console.log(extraAddr);
                console.log(data.zonecode);

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                // element_wrap.style.display = "none";

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                // document.body.scrollTop = currentScroll;

                // GET
                // window.location.href="/mypage/address/shipping-address/result/" + addr + extraAddr;

                // POST
                const formElem = document.querySelector("#addr");
                formElem.querySelector("input[name='addr']").value = addr;
                formElem.submit();

                /*$.ajax({
                    url: "/mypage/address/shipping-address/result",
                    type: "GET",
                    dataType: "JSON",
                    data: {
                        "fullAddr" : addr + extraAddr
                    },
                    success: function(result) {
                        console.log(result);
                    },
                    error: function (request, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                })*/
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            // onresize: function (size) {
            //   element_wrap.style.height = size.height + "px";
            // },
            width: "100%",
            height: "100%",
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        // element_wrap.style.display = "block";
    }
</script>
<body>
<form id="addr" action="/mypage/address/shipping-address/result" method="post">
    <input name="addr" type="hidden" />
</form>
<div id="wrap"></div>
</body>
</html>
