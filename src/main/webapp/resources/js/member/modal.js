
window.onload = () => {
    // 상품리스트 모달창
    $(".MuiModal-root").hide();

    function existModal(msg){
        let message = '아이디 확인';
        let msgDiv = $(".msg-div");
        msgDiv.text(message);

        $(".MuiModal-root").show();
    }
    // $('.css-x0zbdy.e4nu7ef3').on("click", function (event) {
    //   //  event.preventDefault();
    //     // const wishItemClicked = $(this).closest('.css-1pj4itr.e1jp10d17');
    //     // console.dir(wishItemClicked);
    //     //
    //     // //상품 태그에서 정보 가지고오기
    //     // const itemId = $(this).find('#itemId').val();
    //     let msgDiv = $(".msg-div");
    //     msgDiv.text("확인해주세요");
    //
    //     $(".MuiModal-root").show();
    // });

    // 모달창 끄기
    $(".exist-modal").click(function () {
        $('.modal-item-cnt').text("1");
        $(".MuiModal-root").fadeOut();
    });
}