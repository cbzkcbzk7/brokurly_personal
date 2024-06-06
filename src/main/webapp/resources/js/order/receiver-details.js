window.onload = () => {
    // 배송 요청사항 주문자 정보 불러오기 기능
    $(".sameCheck input").on("change", function (e) {
        if (e.target.checked) {
            $("#receiver-name").val($("#hidden-name").text());
            $("#receiver-phone").val($("#hidden-tel-no").text());
        } else {
            $("#receiver-name").val("");
            $("#receiver-phone").val("");
        }
    });

    // 받으실 장소 선택 시 다른 form 숨기기
    const $doorRadioList = $("#door-radio-list");
    const $etcRadioList = $("#etc-radio-list");

    if ($("input[name=rcvPlace]:checked").val() === "문 앞")
        showDoorRadioList();
    else
        showEtcRadioList();


    $("#front-door").click(() => {
        showDoorRadioList();
        $("#password-radio").click();
    });
    $("#etc-place").click(() => {
        showEtcRadioList();
        $("#etc").click();
    });

    function showDoorRadioList() {
        $doorRadioList.show();
        $etcRadioList.hide();
    }

    function showEtcRadioList() {
        $doorRadioList.hide();
        $etcRadioList.show();
    }

    const $passwordText = $("#password-text"); // 공동현관 비밀번호 상세
    const $doorPasswordGuide = $(".door-password-guide"); // 공동현관 비밀번호 입력 가이드 상단
    const $doorPwdGuideContent = $(".door-password-guide-content"); // 공동현관 비밀번호 입력 가이드 하단
    const $showHideButton = $(".show-hide-button"); // 공동현관 비밀번호 입력 가이드 여닫기 버튼
    const $securityCallTextarea = $(".security-call-textarea"); // 경비실 호출 상세
    const $doorEtcTextarea = $(".door-etc-textarea"); // 기타 상세

    const $etcTextarea = $(".etc-textarea"); // 기타 상세
    const $receivingRoomTextarea = $(".receiving-room-textarea"); // 택배 수령실 상세

    const $checkedEnterMthd = $("input[name=enterMthd]:checked");
    switch ($checkedEnterMthd.val()) {
        case "공동현관 비밀번호":
            showPassword();
            break;
        case "자유 출입 가능":
            showFreeEntry();
            break;
        case "경비실 호출":
            showSecurityCall();
            break;
        case "문 앞 기타":
            showDoorEtc();
            break;
        case "기타 장소 기타":
            showEtc();
            break;
        case "택배 수령실":
            showReceivingRoom();
            break;
        case "공동현관 앞":
            showFrontGate();
    }

    // &xwedge; -> 위 화살표
    // &xvee; -> 아래 화살표
    // 공동현관 비밀번호 입력 가이드 창 보이기/숨기기 기능
    $showHideButton.click(() => {
        if ($showHideButton.html() === "⋁") {
            $showHideButton.html("&xwedge;");
            $doorPwdGuideContent.show();
        } else {
            $showHideButton.html("&xvee;");
            $doorPwdGuideContent.hide();
        }
    });

    // 공동현관 출입방법 라디오 버튼 이벤트리스너 등록
    $("#password-radio").click(showPassword);
    $("#free-entry-radio").click(showFreeEntry);
    $("#security-call-radio").click(showSecurityCall);
    $("#door-etc-radio").click(showDoorEtc);

    // 기타장소 세부사항 라디오 버튼 이벤트리스너 등록
    $("#etc").click(showEtc);
    $("#receiving-room").click(showReceivingRoom);
    $("#front-gate").click(showFrontGate);

    function showPassword() {
        if ($doorPwdGuideContent.css("display") !== "block") {
            $showHideButton.click();
            $showHideButton.html("&xwedge;");
        }
        $doorPasswordGuide.css("display", "flex");
        $passwordText.show();
        $doorPwdGuideContent.show();
        $securityCallTextarea.hide();
        $doorEtcTextarea.hide();
    }

    function showFreeEntry() {
        $passwordText.hide();
        $doorPasswordGuide.hide();
        $doorPwdGuideContent.hide();
        $securityCallTextarea.hide();
        $doorEtcTextarea.hide();
    }

    function showSecurityCall() {
        $passwordText.hide();
        $doorPasswordGuide.hide();
        $doorPwdGuideContent.hide();
        $securityCallTextarea.show();
        $doorEtcTextarea.hide();
    }

    function showDoorEtc() {
        $passwordText.hide();
        $doorPasswordGuide.hide();
        $doorPwdGuideContent.hide();
        $securityCallTextarea.hide();
        $doorEtcTextarea.show();
    }

    function showEtc() {
        $etcTextarea.show();
        $receivingRoomTextarea.hide();
    }

    function showReceivingRoom() {
        $etcTextarea.hide();
        $receivingRoomTextarea.show();
    }

    function showFrontGate() {
        $etcTextarea.hide();
        $receivingRoomTextarea.hide();
    }

    $('textarea[name="placeExp"]').prop('disabled', true);

    $('input[type=radio][name=enterMthd]').click(function () {
        let selectedId = $(this).attr('id');

        $('textarea[name="placeExp"]').prop('disabled', true).val('');

        if (selectedId === 'password-radio') {
            $('#password-text').prop('disabled', false);
        } else if (selectedId === 'security-call-radio') {
            $('.security-call-textarea textarea').prop('disabled', false);
        } else if (selectedId === 'door-etc-radio') {
            $('.door-etc-textarea textarea').prop('disabled', false);
        } else if (selectedId === 'etc') {
            $('.etc-textarea textarea').prop('disabled', false);
        } else if (selectedId === 'receiving-room') {
            $('.receiving-room-textarea textarea').prop('disabled', false);
        }
    });

    $('input[type=radio][name=enterMthd]:checked').click();

    // 배송 요청사항 등록/변경 시 서버에 Ajax 요청을 보냄
    $(".receiver-info").on("submit", function (e) {
        e.preventDefault();

        $.ajax({
            url: "/order/receiver-details",
            method: "POST",
            data: $(this).serialize(),
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            success: (receiverDetails) => {
                if ($(".check-receiver-details").text() === 'false') {
                    window.opener.modifyReceiverDetails(receiverDetails);
                } else {
                    window.opener.saveReceiverDetails(receiverDetails);
                }
                window.close();
            },
            error: (jqXHR, textStatus, errorThrown) => {
                alert("fail");
                console.error(textStatus, errorThrown);
            }
        });
    });
}