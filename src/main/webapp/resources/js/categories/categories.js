
// let codeId = "";
// let uri = "";
// let sortedType;
// let filters = "";
//
// let page = 1;
// let endPage = 9999;
//
// $(document).ready(function () {
//     $(".css-19ce13b").each(function () {
//         $(this).on("click", function () {
//             switch ($(this).text()) {
//                 case "신상품순":
//                     sortedType = 1;
//                     break;
//                 case "판매량순":
//                     sortedType = 2;
//                     break;
//                 case "혜택순":
//                     sortedType = 3;
//                     break;
//                 case "낮은 가격순":
//                     sortedType = 4;
//                     break;
//                 case "높은 가격순":
//                     sortedType = 5;
//                     break;
//             }
//             page = 1;
//             extractCodeId();
//             loadNewGoodsList();
//         });
//     });
//
//     // 특정 페이지로 이동
//     $(document).on("click", ".page-number", function () {
//         page = parseInt($(this).text());//생성된 페이지 값을 page에 저장
//         loadNewGoodsList();
//     });
//
//     // 한 페이지씩 이동
//     $(document).on("click", ".move-once", function () {
//         if ($(this).hasClass("to-prev")) {
//             if (page - 1 < 1) return;
//                 page--;
//         } else {
//             if (page + 1 > endPage) return;
//                 page++;
//         }
//         loadNewGoodsList();
//     });
//
//     $(document).on("click", ".to-start", function () {
//         page = 1;
//         loadNewGoodsList();
//     });
//
//     $(document).on("click", ".to-end", function () {
//         page = endPage;
//         loadNewGoodsList();
//     })
// });
//
// function extractCodeId() {
//     let pathname = window.location.pathname;
//     codeId = pathname.replace("/categories/", "");
// }
//
// function loadNewGoodsList() {
//     console.log("IN");
//     $.ajax({
//         url: window.location.pathname, // /categories/901?page=1
//         type: "POST",
//         data: {
//             "codeId": codeId,
//             "sortedType": sortedType,
//             "page": page
//         },
//         success: function (response) {
//             let sortedGoodsList = response.sortedGoodsList;
//             let containerForSort = $('.best-itemlist');
//             containerForSort.html(" ");
//
//             let pageHandler = response.pageHandler;
//             endPage = pageHandler.endPage;
//
//             console.log(pageHandler);
//
//             let containerForPaging = $('.css-rdz8z7');
//             containerForPaging.html(" ");
//
//             sortedGoodsList.forEach(function (goods) {
//                 const itemHTML = '<a href="/goods/' + goods.itemId + '" class="css-9o2zup e1c07x4813">'
//                     + '<div class="css-0 e1c07x4811">' + '<div class="e1c07x4812 css-tou8lf e3um3060">'
//                     + '<span style="'
//                     + 'box-sizing: border-box;'
//                     + 'display: block;'
//                     + 'overflow: hidden;'
//                     + 'width: initial;'
//                     + 'height: initial;'
//                     + 'background: none;'
//                     + 'opacity: 1;'
//                     + 'border: 0px;'
//                     + 'margin: 0px;'
//                     + 'padding: 0px;'
//                     + 'position: absolute;'
//                     + 'inset: 0px;">'
//                     + '<img alt="상품 이미지" sizes="100vw" srcset='
//                     + 'https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg  640w,'
//                     + 'https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg  750w,'
//                     + 'https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg  828w,'
//                     + 'https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 1080w,'
//                     + 'https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 1200w,'
//                     + 'https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 1920w,'
//                     + 'https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 2048w,'
//                     + 'https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg 3840w"'
//                     + 'src="https://img-cf.kurly.com/cdn-cgi/image/fit=crop,width=360,height=468,quality=85/shop/data/goods/1646377916155l0.jpg"'
//                     + 'decoding="async" data-nimg="fill" class="css-0"'
//                     + 'style="'
//                     + 'position: absolute;'
//                     + 'inset: 0px;'
//                     + 'box-sizing: border-box;'
//                     + 'padding: 0px;'
//                     + 'border: none;'
//                     + 'margin: auto;'
//                     + 'display: block;'
//                     + 'width: 0px;'
//                     + 'height: 0px;'
//                     + 'min-width: 100%;'
//                     + 'max-width: 100%;'
//                     + 'min-height: 100%;'
//                     + 'max-height: 100%;'
//                     + 'object-fit: cover;'
//                     + '"></span>'
//                     + '</div>'
//                     + '</div>'
//                     + '<div class="button-wrapper">'
//                     + '<button type="button" class="css-13xu5fn e17x72af0">'
//                     + '<svg width="18" height="18" viewBox="0 0 18 18" fill="none"'
//                     + 'xmlns="http://www.w3.org/2000/svg">'
//                     + '<path d="M1.53516 '
//                     + '2.70001H3.93316L5.76816 10.609H13.6482L15.2992 '
//                     + '4.35901H4.86916M12.8582 14.933C13.0098 14.9375 13.1609 '
//                     + '14.9115 13.3024 14.8566C13.4438 14.8017 13.5728 14.7189 '
//                     + '13.6817 14.6132C13.7906 14.5075 13.8771 14.381 13.9363 '
//                     + '14.2412C13.9954 14.1015 14.0258 13.9513 14.0258 '
//                     + '13.7995C14.0258 13.6478 13.9954 13.4975 13.9363 '
//                     + '13.3578C13.8771 13.218 13.7906 13.0915 13.6817 '
//                     + '12.9858C13.5728 12.8801 13.4438 12.7974 13.3024 '
//                     + '12.7424C13.1609 12.6875 13.0098 12.6615 12.8582 '
//                     + '12.666C12.5634 12.6748 12.2836 12.798 12.0782 '
//                     + '13.0096C11.8727 13.2213 11.7578 13.5046 11.7578 '
//                     + '13.7995C11.7578 14.0944 11.8727 14.3778 12.0782 '
//                     + '14.5894C12.2836 14.801 12.5634 14.9243 12.8582 '
//                     + '14.933ZM6.49316 14.933C6.64484 14.9375 6.79589 14.9115 '
//                     + '6.93735 14.8566C7.07881 14.8017 7.20781 14.7189 7.31669 '
//                     + '14.6132C7.42558 14.5075 7.51214 14.381 7.57126 '
//                     + '14.2412C7.63037 14.1015 7.66083 13.9513 7.66083 '
//                     + '13.7995C7.66083 13.6478 7.63037 13.4975 7.57126 '
//                     + '13.3578C7.51214 13.218 7.42558 13.0915 7.31669 '
//                     + '12.9858C7.20781 12.8801 7.07881 12.7974 6.93735 '
//                     + '12.7424C6.79589 12.6875 6.64484 12.6615 6.49316 '
//                     + '12.666C6.19836 12.6748 5.91858 12.798 5.71315 '
//                     + '13.0096C5.50773 13.2213 5.39283 13.5046 5.39283 '
//                     + '13.7995C5.39283 14.0944 5.50773 14.3778 5.71315 '
//                     + '14.5894C5.91858 14.801 6.19836 14.9243 6.49316 14.933Z" '
//                     + 'stroke="#333333" stroke-linecap="square" stroke-linejoin="round"></path>'
//                     + '</svg>'
//                     + "담기"
//                     + '</button>'
//                     + '</div>'
//                     + '<div class="css-1kpzrna e1c07x489">'
//                     + '<span class="css-1qd61ut e1ms5t9c1">'
//                     + '<span class="css-1vdqr5b e1ms5t9c0">'
//                     + goods.shipType
//                     + '</span></span>'
//                     + '<span class="css-1dry2r1 e1c07x488">'
//                     + goods.name
//                     + '</span>'
//                     + '<p class="css-1wejlc3 e1c07x486">'
//                     + goods.exp
//                     + '</p>'
//                     + '<div class="e1c07x487 discount-price css-1tl7659 ei5rudb2">'
//                     + '<div>'
//                     + '<span class="dimmed-price css-18tpqqq ei5rudb1">'
//                     + goods.price
//                     + '<span class="won">'
//                     + '원'
//                     + '</span>'
//                     + '</span>'
//                     + '</div>'
//                     + '<div class="discount">'
//                     + '<span class="discount-rate css-19lkxd2 ei5rudb0">'
//                     + goods.dcRt + '%'
//                     + '</span>'
//                     + '<span class="sales-price css-18tpqqq ei5rudb1">'
//                     + goods.disPrice
//                     + '<span class="won">' + '원'
//                     + '</span></span>'
//                     + '</div>'
//                     + '</div>'
//                     + '<div class="review-count css-xezqwk e1c07x482">'
//                     + '<span class="css-mz5g71 e1c07x481">'
//                     + '<svg width="100%" height="100%" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">'
//                     + '<mask id="path-1-inside-1_1513_17755" fill="white">'
//                     + '<path fill-rule="evenodd" clip-rule="evenodd"'
//                     + 'd="M3 2C1.89543 2 1 2.89543 1 4V8.67201C1 '
//                     + '9.77658 1.89543 10.672 3 10.672H5.11212L6.33682 '
//                     + '12.7653C6.5299 13.0954 7.00688 13.0954 7.19995 '
//                     + '12.7653L8.42465 10.672H10.5C11.6046 10.672 12.5 9.77658 '
//                     + '12.5 8.67201V4C12.5 2.89543 11.6046 2 10.5 2H3Z"></path>'
//                     + '</mask>'
//                     + '<path fill="#999" '
//                     + 'd="M5.11212 10.672L5.97526 10.167L5.68564 '
//                     + '9.67201H5.11212V10.672ZM6.33682 12.7653L5.47369 '
//                     + '13.2703L5.47369 13.2703L6.33682 12.7653ZM7.19995 '
//                     + '12.7653L6.33682 12.2604L6.33682 12.2604L7.19995 '
//                     + '12.7653ZM8.42465 10.672V9.67201H7.85113L7.56152 '
//                     + '10.167L8.42465 10.672ZM2 4C2 3.44772 2.44772 3 3 '
//                     + '3V1C1.34315 1 0 2.34315 0 4H2ZM2 8.67201V4H0V8.67201H2ZM3 '
//                     + '9.67201C2.44772 9.67201 2 9.22429 2 8.67201H0C0 10.3289 '
//                     + '1.34315 11.672 3 11.672V9.67201ZM5.11212 '
//                     + '9.67201H3V11.672H5.11212V9.67201ZM7.19995 12.2604L5.97526 '
//                     + '10.167L4.24899 11.177L5.47369 13.2703L7.19995 '
//                     + '12.2604ZM6.33682 12.2604C6.5299 11.9304 7.00688 11.9304 '
//                     + '7.19995 12.2604L5.47369 13.2703C6.05291 14.2604 7.48386 '
//                     + '14.2604 8.06309 13.2703L6.33682 12.2604ZM7.56152 '
//                     + '10.167L6.33682 12.2604L8.06309 13.2703L9.28779 '
//                     + '11.177L7.56152 10.167ZM10.5 '
//                     + '9.67201H8.42465V11.672H10.5V9.67201ZM11.5 8.67201C11.5 '
//                     + '9.22429 11.0523 9.67201 10.5 9.67201V11.672C12.1569 '
//                     + '11.672 13.5 10.3289 13.5 8.67201H11.5ZM11.5 '
//                     + '4V8.67201H13.5V4H11.5ZM10.5 3C11.0523 3 11.5 3.44772 11.5 '
//                     + '4H13.5C13.5 2.34315 12.1569 1 10.5 1V3ZM3 3H10.5V1H3V3Z" '
//                     + 'mask="url(#path-1-inside-1_1513_17755)"></path>'
//                     + '<circle fill="#999" cx="4.34998" cy="6.17871" r="0.75"></circle>'
//                     + '<circle fill="#999" cx="6.75" cy="6.17871" r="0.75"></circle>'
//                     + '<circle fill="#999" cx="9.15002" cy="6.17871" r="0.75">'
//                     + '</circle></svg></span>'
//                     + '<span class="review-number css-l610kl e1c07x480">'
//                     + goods.revCnt
//                     + '</span>'
//                     + '</div>'
//                     + '<div class="css-1hrnl0u e1cvv2hm1">'
//                     + '</div>'
//                     + '</div>'
//                     + '</a>';
//                 containerForSort.append(itemHTML)
//             });
//
//             let pagingHTML = '';
//
//             let firstPageBtn = '<a class="css-1d20dg7 e82lnfz0 to-start">'
//                 + '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAHUlEQVR42mNgAIPi/8X/kWkwA8SE0UQIMJAsCKMBBzk27fqtkcYAAAAASUVORK5CYII=" alt="처음 페이지로 이동하기 아이콘"/>'
//                 + '</a>';
//
//             let prevBtn = '<a class="css-1d20dg7 e82lnfz0 move-once to-prev" >'
//                 + '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC" alt="이전 페이지로 이동하기 아이콘"/>'
//                 + '</a>';
//
//             pagingHTML += firstPageBtn + prevBtn;
//
//             for (let currentPage = 1; currentPage <= pageHandler.endPage; currentPage++) {
//                 let className = (pageHandler.page === currentPage ? "css-19yo1fh" : "css-1d20dg7");
//                 pagingHTML += '<a class="e82lnfz0 page-number ' + className + '" >' + currentPage + '</a>';
//             }
//
//             let nextBtn = '<a class="css-1d20dg7 e82lnfz0 move-once" >'
//                 + '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg==" alt="다음 페이지로 이동하기 아이콘"/>'
//                 + '</a>';
//
//             let endPageBtn = '<a class="css-1d20dg7 e82lnfz0 to-end" >'
//                 + '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAIElEQVR42mMo/l/8n4GBgQFGQ5kgDowmQZCwAMImhDkAb0k27Zcisn8AAAAASUVORK5CYII=" alt="마지막 페이지로 이동하기 아이콘"/>'
//                 + '</a>';
//
//             pagingHTML += nextBtn + endPageBtn;
//             containerForPaging.append(pagingHTML);
//         },
//         error: function (xhr, status, error) {
//             // 오류 처리 로직
//         }
//     });
// }
