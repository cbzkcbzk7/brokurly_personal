<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sookyung
  Date: 2024/02/07
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/seller/productsCreate.css'/>"/>

    <title>Title</title>

</head>
<body>
<div class="productsCreateMain" style="margin-left:20%;padding:1px 16px;height:1000px;">

    <form id="forma" action="/seller/productsCreate/write" method="post" style="margin-top: 55px">


        <!-- 카테고리 -->

        <ui-view name="category">
            <div class="form-section">
                <div class="title-line" role="button">
                    <label class="col-lg-2 col-sm-3 col-xs-5 control-label">카테고리 </label>
                    <div class="col-lg-10 col-sm-9 col-xs-7 input-content">
                        <div class="set-option no-set"></div>
                    </div>
                </div><!---->

                <div class="inner-content input-content">
                    <div class="form-section-sub">
                        <div class="form-sub-wrap">
                            <div class="input-content"><!---->

                                <!-- 3섹션 폼 -->
                                <div class="seller-data-list category-list" style="">
                                    <div><!---->
                                        <ul class="data-group"><!---->
                                            <%--          DB에 있는 대분류 값 for문 돌리기       --%>
                                            <c:forEach var="selectMainC" items="${selectMain}" varStatus="status">
                                                <li>
                                                    <button type="button" id="maincate${status.count}" href=""
                                                            onclick="s_ajax(${status.count});"
                                                            value="${selectMainC.codeId}">${selectMainC.exp}
                                                    </button>
                                                </li>
                                                <!---->
                                            </c:forEach>

                                        </ul>
                                    </div>
                                    <div class=""><!---->
                                        <%--   DB에 있는 중분류값 for문 돌리기 Ajax --%>
                                        <ul class="data-group" id="middledata"><!---->

                                        </ul>
                                    </div>


                                </div><!---->
                                <div>
                                    <div class="input-content">
                                        <input type="text"
                                               class="form-control ng-pristine ng-untouched ng-valid ng-empty"
                                               style="width: 100%; height: 1px;" disabled>
                                    </div>
                                </div><!---->

                                선택한 카테고리 :
                                <div class="Cate-result" style="display: inline-block"></div>

                                <p class="sub-text text-primary">상품과 맞지 않는 카테고리에 등록할 경우 강제 이동되거나 판매중지, 판매금지 될 수
                                    있습니다.</p>
                                <br><!----><!----><!----><!----><!----><!---->
                            </div>
                        </div><!----></div>
                </div><!----></div>
        </ui-view>

        <!-- 상품명 -->
        <ui-view name="item_name">
            <div class="form-section">
                <div class="title-line">
                    <label class="col-lg-2 col-sm-3 col-xs-6 control-label">상품명
                    </label>
                </div>
                <!---->
                <div class="inner-content input-content">
                    <div class="form-section-sub">
                        <div class="form-sub-wrap">
                            <div class="input-content">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="seller-input-wrap" style="width: 1000px">
                                            <input name="name"
                                                   type="text"
                                                   class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                   maxlength="160"
                                                   value="${goodsDto.name}"
                                            <%--                                          ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                   title="상품명 입력"
                                        </div>
                                    </div>
                                </div>
                                <!----><!----><!---->
                                <p class="sub-text text-primary">
                                    판매 상품과 직접 관련이 없는 다른 상품명, 스팸성키워드 입력 시 관리자에 의해 판매 금지될 수있습니다.
                                    <br>유명 상품 유사문구를 무단으로 도용하여 ~스타일, ~st 등과 같이 기재하는 경우 별도 고지 없이 제재될수 있습니다.
                                    <br>전용 상품명을 사용 중인 경우 대표 상품명 수정시에도 전용 상품명으로 노출됩니다.<br><br>
                                </p>
                                <!---->
                                <div
                                        class="form-sub-wrap"
                                >
                                    <label class="control-label2" for="search3"
                                    >짧은 설명</label
                                    ><br><br>
                                    <div class="input-content">
                                        <div class="form-group">
                                            <div class="seller-input-wrap">
                                                <input
                                                        name="exp"
                                                        type="text"
                                                        class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern ng-valid-maxlength"
                                                        placeholder=""
                                                        id="search3"
                                                        value="${goodsDto.exp}"
                                                        maxlength="160"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---->
                    </div>
                    <!---->
                </div>
                <!---->
            </div>
        </ui-view>

        <!-- 판매가 -->
        <ui-view id="anchor-price-benefit"
        ><!---->
            <div class="form-section" id="price-benefit">
                <!---->
                <div
                        class="title-line"
                >
                    <label class="col-lg-1 col-sm-2 col-xs-4 control-label"
                    >판매가
                    </label>
                    <div class="col-lg-11 col-sm-10 col-xs-8 input-content">
                        <div
                                class="set-option no-set"
                        >
                        </div>
                    </div>
                </div>
                <!---->
                <div
                        class="inner-content input-content"
                >
                    <div class="form-section-sub">
                        <!---->
                        <div
                                class="form-sub-wrap"
                        >
                            <div class="input-content">
                                <div class="form-inline">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="seller-input-wrap">
                                                <input name="price"
                                                       class="form-control ng-pristine ng-untouched ng-empty ng-valid-min ng-valid-max ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
                                                       id="prd_price"
                                                       placeholder="숫자만 입력"
                                                       type="text"
                                                       value="${goodsDto.price}"
                                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                />
                                            </div>
                                            <span class="input-group-addon">원</span>
                                        </div>
                                    </div>

                                </div>
                                <!----><!---->
                                <p class="sub-text text-primary">
                                    브로컬리을 통한 주문일 경우 브로컬리
                                    매출연동수수료 2%가
                                    과금됩니다.
                                </p>
                                <!----><!---->
                                <p
                                        class="sub-text text-primary"
                                >
                                    판매가, 할인가를 활용한 비정상 거래는 자동
                                    탐지되어 판매지수에 포함되지 않으니 유의해주세요.<br>
                                </p>
                                <!----><!---->
                            </div>
                        </div>
                        <br>
                        <!----><!---->
                        <fieldset>
                            <div class="form-sub-wrap">
                                <label class="control-label">할인 </label>


                                <div class="input-content">

                                    <div class="seller-input-toggle form-group">

                                    </div>
                                    <!---->
                                </div>

                            </div>

                            <div
                                    class="form-sub-detail"
                                    style=""
                            >
                                <!----><!----><!---->
                                <div
                                        class="form-sub-detail-wrap"
                                >
                                    <div class="input-content">
                                        <div
                                                class="form-inline"
                                                id="error_reservedDiscountPolicy_value"
                                        >
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <!---->
                                                    <div
                                                            class="seller-input-wrap"
                                                            style=""
                                                    >
                                                        <input name="dcRt"
                                                               class="form-control ng-pristine ng-untouched ng-empty ng-valid-min ng-valid-max ng-valid-pattern ng-valid-minlength ng-valid-maxlength ng-valid ng-valid-required"
                                                               id="prd_sale"
                                                               placeholder="판매가에서"
                                                               title="할인가 입력"
                                                               type="text"
                                                               min="0"
                                                               max="100"
                                                               onkeyup="ShowPrice()"
                                                               value="${goodsDto.dcRt}"
                                                        <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                               oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                        />
                                                        <input name="dcRt1"
                                                               type="hidden">
                                                    </div>
                                                    <!----><!---->
                                                    <span class="input-group-addon">%</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div>
                                            <!---->
                                            <div class="total-price">
                                                <div class="input-content">
                                                    <div id="showResult"></div>

                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                        <!---->

                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <!----><!----><!----><!---->
                        <br>
                    </div>
                </div>
            </div>
        </ui-view>
        <!-- 재고수량 -->
        <ui-view name="stock" id="anchor-stock"
        ><!---->
            <div class="form-section">
                <div class="title-line" role="button">
                    <label
                            class="col-lg-1 col-sm-2 col-xs-4 control-label"
                            for="stock"
                    >재고수량</label>
                </div>
                <!---->
                <div class="inner-content input-content">
                    <div class="form-section-sub">
                        <div class="form-sub-wrap">
                            <div class="input-content">
                                <div class="form-inline">
                                    <div class="form-group has-error">
                                        <div class="input-group">
                                            <div class="seller-input-wrap">
                                                <input name="itemQty"
                                                       type="text"
                                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                       class="form-control ng-empty ng-valid-max ng-invalid ng-invalid-required ng-valid-maxlength ng-dirty ng-valid-parse ng-touched"
                                                       id="stock"
                                                       value="${goodsDto.itemQty}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                       placeholder="숫자만 입력"
                                                />
                                            </div>
                                            <span class="input-group-addon">개</span>
                                        </div>
                                        <br>
                                    </div>
                                    <!---->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ui-view>
        <!----><!----><!---->

        <!-- 판매자 -->
        <ui-view name="stock" id="anchor-stock"
        ><!---->
            <div class="form-section">
                <div class="title-line" role="button">
                    <label
                            class="col-lg-1 col-sm-2 col-xs-4 control-label"
                            for="stock"
                    >판매자 정보</label>
                </div>
                <!---->
                <div class="inner-content input-content">
                    <div class="form-section-sub">
                        <div class="form-sub-wrap">
                            <div class="input-content">
                                <div class="form-inline" id="error_stockQuantity">
                                    <div class="form-group has-error">
                                        <div class="input-group">
                                            <div class="seller-input-wrap">
                                                <input name="bsnsNo"
                                                       type="text"
                                                       class="form-control ng-empty ng-valid-max ng-invalid ng-invalid-required ng-valid-maxlength ng-dirty ng-valid-parse ng-touched"
                                                       placeholder="사업자등록번호"
                                                       value="${goodsDto.bsnsNo}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                />

                                            </div>
                                            <div class="seller-input-wrap">
                                                <input name="sellerName"
                                                       type="text"
                                                       class="form-control ng-empty ng-valid-max ng-invalid ng-invalid-required ng-valid-maxlength ng-dirty ng-valid-parse ng-touched"
                                                       id="seller_name"
                                                       value="${goodsDto.sellerName}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                       placeholder="판매자이름"/>
                                            </div>
                                        </div>
                                        <br>
                                    </div>
                                    <!---->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ui-view>
        <!----><!----><!---->
        <!-- 상품 이미지 -->
        <ui-view name="images">
            <div class="form-section">
                <div
                        class="title-line"
                        role="button">
                    <label class="col-lg-2 col-sm-3 col-xs-6 control-label">상품이미지</label>
                    <div
                            class="col-lg-10 col-sm-9 col-xs-6 input-content"
                    ></div>
                </div>
                <!---->
                <div
                        class="input-content inner-content">
                    <div class="form-section-sub">
                        <div
                                class="ng-pristine ng-invalid ng-invalid-required"
                        >


                            <label class="control-label"> 대표이미지 <!----></label>
                            <input type="hidden"
                                   name="">

                            <div class="input-content">
                                <div class="pc">
                                    <div
                                            class="seller-product-img add-img"
                                    >
                                        <div class="wrap-img">
                                            <!----><!---->
                                            <div>
                                                <ul class="img-list"
                                                >

                                                    <li id>

                                                        <%--대표이미지 multipart-form data이용--%>
                                                        <%--form2--%>
                                                        <br>
                                                        <form name="formb" id="formb" action="/seller/img" method="post"
                                                              enctype="multipart/form-data">
                                                            <input type="file" id="file" name="file"
                                                                   accept=".jpg, .jpeg, .png"/>
                                                            <button type="button" id="sendButton" name="sendButton"
                                                                    onclick="img_ajax();">사진 전송
                                                            </button>

                                                        </form>
                                                        <%--form2 끝--%>

                                                        <!----><!---->

                                                        <%--                                                    <!----><!---->--%>
                                                        <%--                                                    <div--%>
                                                        <%--                                                            class="register-img"--%>
                                                        <%--                                                            style=""--%>
                                                        <%--                                                    >--%>
                                                        <%--&lt;%&ndash;                                                        <!-- 이미지 띄울 곳 -->&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;                                                        <div class="btn-add-img" id="image-show"></div>&ndash;%&gt;--%>

                                                        <%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
                                                        <%--                                                    <!---->--%>
                                                    </li>
                                                    <!---->
                                                </ul>
                                            </div>
                                            <!---->
                                        </div>
                                    </div>

                                    <!----><!---->
                                    <div
                                            class="form-group"
                                    >
                                        <p
                                                class="sub-text text-primary mg-reset"
                                        >
                                            권장 크기 : 1000 X 1000(윈도 대상 750 X
                                            1000), 300 X 300 이상
                                        </p>
                                    </div>
                                    <!----><!---->
                                </div>
                            </div>
                            <%--</form>--%>
                        </div>


                        <!-- 추가이미지  -->
                        <div
                                class="ng-pristine ng-valid ng-valid-required"
                        >

                            <div class="form-sub-wrap" method="post" enctype="multipart/form-data">
                                <label class="control-label"
                                >추가이미지
                                    <!----></label>

                                <!-- test -->
                                <%--                            <input type="file" accept="image/*" onchange="loadFile(this)"/>--%>


                                <div class="input-content">
                                    <div
                                            class="pc"
                                    >
                                        <div
                                                class="seller-product-img add-img"
                                        >
                                            <div class="wrap-img">
                                                <!----><!---->
                                                <div>
                                                    <ul class="img-list">
                                                        <!----><!---->
                                                        <li>
                                                            <!----><!---->
                                                            <div class="register-img"
                                                                 style=""
                                                            >

                                                                <!-- 추가 이미지 띄울 곳 -->
                                                                <div
                                                                        class="btn-add-img"
                                                                        id="image-show2"
                                                                ></div>

                                                            </div>
                                                            <!---->
                                                        </li>
                                                        <!---->
                                                    </ul>
                                                </div>
                                                <!---->
                                            </div>
                                        </div>
                                        <!----><!---->
                                        <div
                                                class="form-group"
                                        >
                                            <p
                                                    class="sub-text text-primary mg-reset"
                                            >
                                                권장 크기 : 1000 x 1000 (윈도대상 750 x
                                                1000)<br/>추가이미지는 최대 9개까지
                                                설정할 수 있습니다.<br/>jpg,jpeg,gif,png,bmp
                                                형식의 정지 이미지만 등록됩니다.<br/>
                                            </p>
                                        </div>
                                        <!----><!---->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!---->
            </div>
        </ui-view
        ><!---->

        <!-- 상세설명 -->
        <ui-view name="detailContent" id="anchor-detail-content"
        >
            <div class="form-section">
                <div
                        class="title-line"
                >
                    <label class="col-lg-2 col-sm-3 col-xs-6 control-label"
                    >상세설명
                        <!---->
                    </label>
                    <div class="col-lg-10 col-sm-9 col-xs-6 input-content">
                        <div class="set-option no-set"
                        ></div>
                    </div>
                </div>
                <!---->
                <div
                        class="input-content inner-content"
                >
                    <div class="form-section-sub">
                        <div class="form-sub-wrap">
                            <div
                                    class="seller-product-detail seller-tap-wrapper"
                            >
                                <ul
                                        class="seller-tap"
                                        role="tablist"
                                >
                                    <li
                                            role="tab"
                                            aria-selected="true"
                                    >

                                    </li>
                                </ul>
                                <!---->
                                <div
                                        class="content">
                                    <div class="form-group sr-only">
                                    </div>
                                    <p class="ico-status">
                                        <i class="fn-shopping fn-65 fn-shopping-caution1 icon-color-big"
                                           aria-hidden="true"
                                        ></i>
                                    </p>
                                    <p class="btn-area"></p>
                                </div>
                                <!----><!---->
                            </div>
                            <!---->
                            <div
                                    class="sub-text detail-content-info"
                            >
                                <div class="seller-input-wrap">
                                <textarea name="itemSpec"
                                          type="text"
                                          value=""
                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                          class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern
                                ng-valid-maxlength"
                                          style="height: 250px">${goodsDto.itemSpec} </textarea>
                                </div>
                                <br>
                                <span class="sub-text text-danger"
                                >외부 링크를 통한
                                  개인정보(휴대폰 번호, 이메일 주소) 수집은
                                  금지되므로 등록시 노출이 제재될 수 있습니다.
                                  <br
                                  /></span>
                                <span class="sub-text text-danger"
                                >http 이미지가 제대로 표시되지 않을 수
                                  있습니다. https 이미지로 등록해 주세요.<br
                                    /></span>
                                <p class="sub-text text-primary">
                                    상품명과 직접적 관련 없는 상세설명, 외부 링크
                                    입력 시 관리자에 의해 판매 금지 될 수
                                    있습니다.<br/>
                                    안전거래정책에 위배될 경우 관리자에 의해 제재조치가 있을
                                    수 있습니다.<br/>
                                    일부 외부링크, 스크립트 및
                                    태그는 자동 삭제될 수 있습니다.<br/>
                                    상세설명 권장 크기 : 가로 860px
                                    <br/>
                                </p>
                            </div>
                            <!---->

                            <!---->
                        </div>
                    </div>
                </div>
            </div>
            <!---->

            <!-- 상품주요정보 -->
            <ui-view name="attribute">
                <!---->
                <div class="form-section" id="_prod-attr-section">
                    <div class="title-line">
                        <label class="col-sm-3 col-xs-4 control-label"
                        >상품 주요정보</label>
                        <div class="col-sm-9 col-xs-8 input-content"></div>
                    </div>
                    <!---->
                    <div
                            class="inner-content input-content"
                            style=""
                    >
                        <div class="form-section-sub">
                            <!----><!----><!----><!---->
                            <div>
                                <div>
                                    <%--                                <div class="form-sub-wrap">--%>
                                    <%--                                    <label class="control-label"--%>
                                    <%--                                    >상호--%>
                                    <%--                                        <!----><!----></label>--%>
                                    <%--                                    <div class="input-content">--%>
                                    <%--                                        <div class="form-inline">--%>
                                    <%--                                            <div class="form-group">--%>
                                    <%--                                                <div class="input-group auto-complete">--%>
                                    <%--                                                    <div class="seller-input-wrap">--%>
                                    <%--                                                        <div--%>
                                    <%--                                                                class="selectize-control ng-pristine ng-untouched ng-valid single plugin-inputMaxlength"--%>
                                    <%--                                                        >--%>
                                    <%--                                                            <div--%>
                                    <%--                                                                    class="selectize-input items not-full ng-valid ng-pristine"--%>
                                    <%--                                                            >--%>
                                    <%--                                                                <input class="form-control"--%>
                                    <%--                                                                       type="text"--%>
                                    <%--                                                                       placeholder="상호명을 입력해주세요."--%>
                                    <%--                                                                       maxlength="50"--%>

                                    <%--                                                                />--%>
                                    <%--                                                            </div>--%>
                                    <%--                                                        </div>--%>
                                    <%--                                                    </div>--%>
                                    <%--                                                </div>--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <!---->--%>
                                    <%--                                        <div class="form-group">--%>
                                    <%--                                            <div class="seller-input narrow-input">--%>
                                    <%--                                                <div>--%>
                                    <%--                                                    <!---->--%>
                                    <%--                                                    <!---->--%>
                                    <%--                                                </div>--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <!---->--%>
                                    <%--                                    </div>--%>
                                    <%--                                </div>--%>
                                    <!---->

                                    <!-- 포장타입 -->
                                    <div class="form-sub-wrap">
                                        <label class="control-label"
                                        >포장타입
                                        </label>
                                        <div class="input-content">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <div class="input-group auto-complete">
                                                        <div class="seller-input-wrap">
                                                            <div
                                                                    class="selectize-control ng-pristine ng-untouched ng-valid single plugin-inputMaxlength"
                                                            >
                                                                <div
                                                                        class="selectize-input items not-full ng-valid ng-pristine"
                                                                >
                                                                    <input name="pkgType"
                                                                           type="text"
                                                                           class="form-control"
                                                                           value="${goodsDto.pkgType}"
                                                                    <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                                           placeholder="포장타입(상온, 냉장, 냉동)"
                                                                           maxlength="50"
                                                                    />
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                </div>
                            </div><!---->
                            <!----><!----><!----><!----><!----><!---->

                            <!-- 원산지 -->
                            <div class="" style="">
                                <div>
                                    <!---->
                                    <div
                                            class="form-sub-wrap"
                                    >
                                        <label class="control-label"
                                        >원산지<!----><!----></label
                                        >
                                        <div class="input-content">
                                            <div class="seller-fix-input2">
                                                <div class="fix-wrap">
                                                    <div class="fix-area1">
                                                        <div class="form-group">
                                                            <div
                                                                    class="selectize-control ng-pristine ng-untouched ng-valid single"
                                                            >
                                                                <div
                                                                        class="selectize-input items has-options ng-valid ng-pristine full has-items"
                                                                >
                                                                    <div data-value="LOCAL"
                                                                         class="item">

                                                                        <input name="origin" type="text"
                                                                               class="form-control"
                                                                               placeholder="ex.국산/수입산(미국)"
                                                                               value="${goodsDto.origin}"
                                                                        <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                                        >
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!----><!---->
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                </div>
                            </div>
                            <!----><!----><!----><!----><!---->

                            <div
                                    class="form-sub-wrap"
                            >
                                <label
                                        class="control-label"
                                >쿠폰 적용 가능 여부</label
                                >
                                <div class="input-content">
                                    <div class="seller-input-toggle form-group">
                                        <input
                                                type="radio"
                                                id="coupon"
                                                class="ng-pristine ng-untouched ng-valid ng-not-empty"
                                                name="cpnElgFl"
                                                value="Y"
                                        <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                <c:if test="${goodsDto.cpnElgFl eq 'Y'}">checked</c:if>
                                        />
                                        <label
                                                for="coupon"
                                                class=""
                                        >가능</label>
                                        <input
                                                type="radio"
                                                id="coupon2"
                                                class="r-no-set ng-pristine ng-untouched ng-valid ng-not-empty"
                                                name="cpnElgFl"
                                                value="N"
                                        <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                <c:if test="${goodsDto.cpnElgFl eq 'N'}">checked</c:if>

                                        />
                                        <label for="coupon2">불가능</label>
                                    </div>
                                </div>
                            </div>

                            <!-- 적립금 적용 가능 여부 -->
                            <div
                                    class="form-sub-wrap"
                            >
                                <label
                                        class="control-label"
                                >적립금 적용 가능 여부</label
                                >
                                <div class="input-content">
                                    <div class="seller-input-toggle form-group">
                                        <input
                                                type="radio"
                                                id="point1"
                                                class="ng-pristine ng-untouched ng-valid ng-not-empty"
                                                name="pointFl"
                                                value="Y"
                                        <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                <c:if test="${goodsDto.pointFl eq 'Y'}">checked</c:if>

                                        />
                                        <label
                                                for="point1"
                                                class=""
                                        >가능</label>
                                        <input
                                                type="radio"
                                                id="point2"
                                                class="r-no-set ng-pristine ng-untouched ng-valid ng-not-empty"
                                                name="pointFl"
                                                value="N"
                                        <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                <c:if test="${goodsDto.pointFl eq 'N'}">checked</c:if>

                                        />
                                        <label for="point2">불가능</label>
                                    </div>
                                </div>
                            </div>

                            <!-- 미성년자 구매 가능 여부 -->
                            <div
                                    class="form-sub-wrap"
                            >
                                <label
                                        class="control-label"
                                >미성년자 구매</label
                                >
                                <div class="input-content">
                                    <div class="seller-input-toggle form-group">
                                        <input
                                                type="radio"
                                                id="child1"
                                                class="ng-pristine ng-untouched ng-valid ng-not-empty"
                                                name="adultVerifFl"
                                                value="Y"
                                        <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                <c:if test="${goodsDto.adultVerifFl eq 'Y'}">checked</c:if>

                                        />
                                        <label
                                                for="child1"
                                                class=""
                                        >가능</label>
                                        <input
                                                type="radio"
                                                id="child2"
                                                class="r-no-set ng-pristine ng-untouched ng-valid ng-not-empty"
                                                name="adultVerifFl"
                                                value="N"
                                        <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                <c:if test="${goodsDto.adultVerifFl eq 'N'}">checked</c:if>

                                        />
                                        <label for="child2">불가능</label>
                                    </div>
                                    <p
                                            class="sub-text text-primary ng-hide"
                                    >
                                        성인상품은 만 19세 미만의 미성년자는 구매할 수
                                        없습니다.
                                    </p>
                                    <br>
                                </div>
                            </div>
                            <!----><!----><!---->
                        </div>
                    </div>
                    <!---->
                </div>
            </ui-view><!---->

            <!-- 상품정보제공고시 -->

            <%--    --%>
            <ui-view name="provided-notice"
            ><!----><!---->
                <div
                        class="form-section"
                >
                    <!---->
                    <div
                            class="title-line"
                    >
                        <label class="col-lg-2 col-sm-3 col-xs-6 control-label"
                        >상품정보제공고시
                            <!----><!----></label>
                        <div class="col-lg-10 col-sm-9 col-xs-6 input-content">
                            <div
                                    class="set-option"
                            ></div>
                        </div>
                    </div>
                    <!---->
                    <fieldset>
                        <!---->
                        <div
                                class="input-content inner-content"
                        >
                            <div class="form-section-sub">
                                <!----><!----><!---->
                                <div class="form-sub-wrap">
                                    <label class="control-label"
                                    >상품군<!----><!---->
                                        <input name="itemAnnCate"
                                               type="hidden"
                                               value="상품군"/>
                                    </label
                                    >
                                    <div class="input-content">
                                        <div class="form-inline">
                                            <div
                                                    class="form-group"
                                                    style="min-width: 350px"
                                            >
                                                <div
                                                        class="selectize-control ng-pristine ng-untouched ng-valid single"
                                                >
                                                    <div
                                                            class="selectize-input items has-options full has-items ng-valid ng-dirty"
                                                    >
                                                        <div data-value="FOOD" class="item">
                                                            식품(농.축.수산물)
                                                            <input name="itemAnn"
                                                                   type="hidden"
                                                                   value="식품(농.축.수산물)"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!----><!---->
                                <div
                                        class=""
                                        style=""
                                >
                                    <!---->
                                    <div class="form-sub-wrap">
                                        <label class="control-label"
                                        >품목 또는 명칭<!---->
                                            <input name="itemAnnCate"
                                                   type="hidden"
                                                   value="품목 또는 명칭"
                                            />
                                        </label>
                                        <div class="input-content form-group">
                                            <div class="seller-input-wrap">
                                                <input name="itemAnn"
                                                       type="text"
                                                       value="${goodsAnnouncement[1]}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid
                                            ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                       id="prd_foodItem"
                                                       maxlength="200"

                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label class="control-label"
                                        >중량/용량<!----><i class="icon-must"
                                        ></i
                                        >
                                            <input name="itemAnnCate"
                                                   type="hidden"
                                                   value="중량/용량"
                                            /><!----></label
                                        >
                                        <div class="input-content form-group">
                                            <div class="seller-input-wrap">
                                                <input name="capa"
                                                       type="text"
                                                       value="${goodsAnnouncement[2]}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid
                                            ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                       id="prd_weight"
                                                />
                                                <input name="itemAnn"
                                                       type="hidden"
                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                       id="prd_weight2"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label class="control-label" for="prd_amount"
                                        >판매단위<!----><i
                                                class="icon-must"
                                        ></i
                                        >
                                            <input name="itemAnnCate"
                                                   type="hidden"
                                                   value="${goodsAnnouncement[2]}"
                                            <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                            />
                                            <!----></label>
                                        <div class="input-content form-group">
                                            <div class="seller-input-wrap">
                                                <input name="sellUnit"
                                                       type="text"
                                                       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                       id="prd_amount"
                                                       value="${goodsAnnouncement[3]}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                       maxlength="200"
                                                       placeholder="숫자만입력"
                                                />
                                                <input name="itemAnn"
                                                       type="hidden"
                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                       id="prd_amount2"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label class="control-label"
                                        >제조연월일<!---->
                                            <input name="itemAnnCate"
                                                   type="hidden"
                                                   value="제조연월일"
                                            /><!----></label
                                        >
                                        <div class="input-content">
                                            <div class="input-content provided-notice">
                                                <!----><!---->
                                                <div
                                                        class="form-inline"
                                                >
                                                    <div class="form-group only-date">
                                                        <div class="seller-calendar">
                                                            <div
                                                                    class="input-daterange date form-inline"
                                                            >
                                                                <div
                                                                        class="form-group _date_dropdown seller-datetime-picker _error_date_4808870775 dropdown"
                                                                >
                                                                    <div
                                                                            class="input-group dropdown-toggle dropdown_7791242947"
                                                                    >
                                                                        <label for="date">
                                                                            <input name="itemAnn"
                                                                                   type="date"
                                                                                   id="date"
                                                                                   max="2060-12-31"
                                                                                   min="TODAY"
                                                                                   value="${goodsAnnouncement[4]}"
                                                                            <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                                                   class="form-control ng-pristine ng-untouched
                                                                        ng-empty ng-valid-date-time-input ng-invalid
                                                                        ng-invalid-required"

                                                                            /></label>
                                                                        <!---->
                                                                    </div>
                                                                    <!---->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!---->
                                            </div>

                                        </div>
                                    </div>

                                    <div class="form-sub-wrap">
                                        <label class="control-label"
                                        >소비기한 또는 품질유지기한<!----><i
                                                class="icon-must"
                                        ></i
                                        ><!---->
                                            <input name="itemAnnCate"
                                                   type="hidden"
                                                   value="소비기한 또는 품질유지기한"
                                            /></label
                                        >
                                        <div class="input-content">
                                            <div class="input-content provided-notice">

                                                <!----><!---->
                                                <div
                                                        class="form-inline"
                                                        style=""
                                                >
                                                    <div class="form-group only-date">
                                                        <div class="seller-calendar">
                                                            <div
                                                                    class="input-daterange date form-inline"
                                                            >
                                                                <div
                                                                        class="form-group _date_dropdown seller-datetime-picker _error_date_3561540492 dropdown"
                                                                >
                                                                    <div
                                                                            class="input-group dropdown-toggle dropdown_9313997422"
                                                                            data-toggle="dropdown"
                                                                    >
                                                                        <label for="date">
                                                                            <input name="itemAnn"
                                                                                   type="date"
                                                                                   max="20620-12-31"
                                                                                   min="TODAY"
                                                                                   value="${goodsAnnouncement[5]}"
                                                                            <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                                                   class="form-control ng-pristine ng-untouched
                                                                        ng-empty ng-valid-date-time-input ng-invalid
                                                                        ng-invalid-required"

                                                                            /></label>
                                                                        <!----><!----><!---->
                                                                    </div>
                                                                    <!---->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!---->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label class="control-label" for="prd_producer"
                                        >생산자<!----><i
                                                class="icon-must"
                                                aria-label="필수항목"
                                        ></i
                                        ><input name="itemAnnCate"
                                                type="hidden"
                                                value="생산자"
                                        />
                                            <!----></label
                                        >
                                        <div class="input-content form-group">
                                            <div class="seller-input-wrap">
                                                <input name="itemAnn"
                                                       type="text"
                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                       id="prd_producer"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                       value="${goodsAnnouncement[6]}"
                                                       maxlength="200"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label
                                                class="control-label"
                                        >세부 품목군별 표시사항<!----><i
                                                aria-label="필수항목"
                                                class="icon-must"
                                        >
                                            <input name="itemAnnCate"
                                                   type="hidden"
                                                   value="세부 품목군별 표시사항"
                                            />
                                        </i
                                        ><!----></label
                                        >
                                        <div class="input-content form-group">
                                            <div class="seller-input">

                                            </div>
                                            <div
                                                    class="seller-input-wrap2"
                                            >
                                                <input name="itemAnn"
                                                       type="text"
                                                       value="${goodsAnnouncement[7]}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid
                                            ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                       id="prd_relevantLawContent"
                                                />

                                                <p class="sub-text text-primary">
                                                    농산물 - ｢농수산물 품질관리법｣에 따른
                                                    유전자변형농수산물 표시, 지리적 표시
                                                </p>
                                                <p class="sub-text text-primary">
                                                    축산물 - 축산법에 따른 등급 표시 등급 (1++
                                                    국내산 쇠고기의 경우 ｢소·돼지 식육의
                                                    표시방법 및 부위 구분기준｣에 따라
                                                    근내지방도 정보를 포함하여 표시), ｢가축 및
                                                    축산물 이력관리에 관한 법률｣에 따른
                                                    이력관리대상축산물 유무
                                                </p>
                                                <p class="sub-text text-primary">
                                                    수입 농수축산물 - 수입식품안전관리특별법에
                                                    따른 수입신고를 필함
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label
                                                class="control-label"
                                        >상품구성<!----><i
                                                class="icon-must"
                                                aria-label="필수항목"
                                        ></i
                                        ><!----><input name="itemAnnCate"
                                                       type="hidden"
                                                       value="상품구성"
                                        /></label
                                        >
                                        <div class="input-content form-group">
                                            <div class="seller-input-wrap">
                                                <input name="itemAnn"
                                                       type="text"
                                                       value="${goodsAnnouncement[8]}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid
                                            ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                       id="prd_productComposition"
                                                       maxlength="200"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label class="control-label"
                                        >보관방법 또는 취급방법<!----><i
                                                class="icon-must"
                                                aria-label="필수항목"
                                        ><input name="itemAnnCate"
                                                type="hidden"
                                                value="보관방법 또는 취급방법"
                                        /></i
                                        ><!----></label
                                        >
                                        <div class="input-content form-group">
                                            <input name="itemAnn"
                                                   class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                   rows="3"
                                            <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>
                                                   value="${goodsAnnouncement[9]}"
                                                   id="prd_keep"
                                                   maxlength="500"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label class="control-label"
                                        >소비자 안전을 위한 주의사항<!----><i
                                                class="icon-must"
                                        ><input name="itemAnnCate"
                                                type="hidden"
                                                value="소비자 안전을 위한 주의사항"
                                        /></i
                                        ><!----></label
                                        >
                                        <div class="input-content form-group">
                                            <input name="itemAnn"
                                                   class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                                   rows="3"
                                                   value="${goodsAnnouncement[10]}"
                                            <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                   id="prd_adCaution"
                                            ></input>
                                            <p class="sub-text text-primary">
                                                ｢식품 등의 표시ㆍ 광고에 관한 법률 시행규칙｣
                                                제5조 및 [별표 2]에 따른 표시사항을 말함
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-sub-wrap">
                                        <label
                                                class="control-label"
                                        >소비자 상담 관련 전화번호<!----><i
                                                aria-label="필수항목"
                                                class="icon-must"
                                        ><input name="itemAnnCate"
                                                type="hidden"
                                                value="소비자 상담 관련 전화번호"
                                        /></i
                                        ><!----></label
                                        >
                                        <div class="input-content form-group">
                                            <div class="seller-input-wrap">
                                                <input name="itemAnn"
                                                       type="text"
                                                       value="${goodsAnnouncement[11]}"
                                                <%--                        ${mode=="new"? '': 'readonly="readonly"'}--%>

                                                       class="form-control ng-pristine ng-untouched ng-empty ng-invalid
                                            ng-invalid-required ng-valid-maxlength"
                                                       id="prd_customerServicePhoneNumber"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <!----><!----></ui-view
            ><!---->
            <%--    상품정보제공고시 끝    --%>

            <!-- 배송, 반품, 교환 -->
            <ui-view name="delivery"
            ><!---->
                <div
                        class="seller-alert-tip-wrap"
                >
                    <div class="seller-alert-tip"></div>
                </div>
                <!----><!----><!---->
                <div
                        class="form-section"
                >
                    <!---->
                    <div
                            class="title-line"
                    >
                        <label class="col-lg-2 col-sm-2 col-xs-3 control-label">배송<!---->
                            <i class="icon-must"
                               aria-label="필수항목"
                            ></i><!---->
                            <!----><!----></label>
                        <div
                                class="col-lg-10 col-sm-10 col-xs-9 input-content"
                        ></div>
                    </div>
                    <!----><!---->
                    <div
                            class="input-content inner-content"
                    >
                        <div class="form-section-sub">
                            <!----><!----><!----><!----><!---->
                            <div
                                    class="form-sub-detail ng-hide"
                            >
                                <div class="form-sub-detail-wrap">
                                    <label class="control-label"></label>
                                    <div class="input-content">
                                    </div>
                                </div>
                            </div>
                            <!----><!----><!----><!---->

                            <!----><!---->
                            <div>
                                <div class="">
                                    <div class="form-sub-wrap ng-valid ng-dirty ng-valid-parse">
                                        <label class="control-label"
                                        >배송속성<!----><i
                                                class="icon-must"
                                                aria-label="필수항목"
                                        ></i><!----></label
                                        >
                                        <div class="input-content">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <div class="seller-input-toggle">
                                                        <!----><input
                                                            type="radio"
                                                            name="shipType"
                                                            id="NORMAL"
                                                            class="ng-valid ng-not-empty ng-touched ng-dirty"
                                                            value="일반배송"
                                                            <c:if test="${goodsDto.shipType eq '일반배송'}">checked</c:if>
                                                    />
                                                        <label ng-repeat-end="" for="NORMAL"
                                                        >일반배송</label
                                                        ><!----><input
                                                            type="radio"
                                                            name="shipType"
                                                            id="TODAY"
                                                            class="ng-valid ng-not-empty ng-dirty ng-touched ng-valid-parse"
                                                            value="샛별배송"
                                                            <c:if test="${goodsDto.shipType eq '샛별배송'}">checked</c:if>

                                                    />
                                                        <label for="TODAY"
                                                        >샛별배송</label
                                                        ><!---->
                                                    </div>
                                                </div>

                                            </div>
                                            <!----><!----><!----><!----><!---->
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <!----><!---->
                            </div><!----><!----><!----><!---->
                            <div
                                    class="ng-pristine ng-valid-max ng-valid-pattern ng-valid-maxlength ng-valid-required ng-invalid ng-invalid-min ng-invalid-minlength"
                            >
                                <div
                                        class="form-sub-detail">
                                    <div
                                            class="form-sub-detail-wrap ng-hide"
                                    >
                                        <label class="control-label" for="basic_price"
                                        >기본 배송비<!----><i
                                                class="icon-must"></i
                                        ><!----></label
                                        >
                                        <div class="input-content">
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="seller-input-wrap">
                                                            <input
                                                                    name="product.deliveryInfo.deliveryFee.baseFee"
                                                                    class="form-control ng-pristine ng-untouched ng-not-empty ng-valid-max ng-valid-required ng-valid-pattern ng-valid-maxlength ng-invalid ng-invalid-min ng-invalid-minlength"
                                                                    id="basic_price"
                                                                    placeholder="3000"
                                                                    value="3000"
                                                                    type="text"
                                                                    readonly
                                                                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                            />
                                                        </div>
                                                        <span class="input-group-addon">원</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                    </div>
                                    <br>
                                    <!----><!----><!----><!---->
                                </div>
                            </div>
                            <!----><!---->
                        </div>
                    </div>
                    <!---->
                </div>

                <!-- 반품/교환 -->
                <div
                        class="form-section"
                >
                    <div
                            class="title-line"
                            role="button"
                    >
                        <label class="col-lg-2 col-sm-3 col-xs-4 control-label"
                        >반품/교환<!----><i
                                class="icon-must"
                        ></i><!---->
                        </label>
                        <div
                                class="col-lg-10 col-sm-9 col-xs-8 input-content"
                        ></div>
                    </div>
                    <!---->
                    <div
                            class="inner-content input-content"
                    >
                        <div class="form-section-sub">
                            <!---->
                            <div
                                    class="ng-pristine ng-valid-min ng-valid-max ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
                            >
                                <div
                                        class="form-sub-wrap"
                                >
                                    <label class="control-label"
                                    >반품/교환 택배사<!----><i
                                            class="icon-must"
                                            aria-label="필수항목"
                                    ></i
                                    ><!----></label
                                    >
                                    <div class="input-content">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <div
                                                        class="selectize-control ng-pristine ng-untouched ng-valid single"
                                                >
                                                    <div
                                                            class="selectize-input items ng-valid ng-pristine has-options full has-items"
                                                    >
                                                        <div data-value="2542631" class="item">
                                                            기본 반품택배사(한진택배)
                                                        </div>
                                                        <input
                                                                type="text"
                                                                autocomplete="off"
                                                                tabindex="0"
                                                                style="
                                            width: 4px;
                                            opacity: 0;
                                            position: absolute;
                                            left: -10000px;
                                          "
                                                        />
                                                    </div>
                                                    <div
                                                            class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
                                                            style="
                                          display: none;
                                          visibility: visible;
                                          width: 206px;
                                          top: 34px;
                                          left: 0px;
                                        "
                                                    >
                                                        <div class="selectize-dropdown-content">
                                                            <div
                                                                    class="option selected"
                                                            >
                                                                기본 반품택배사(한진택배)
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input
                                                        name="_returnDeliveryCompany"
                                                        class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
                                                        style="
                                        width: 4px;
                                        opacity: 0;
                                        position: absolute;
                                        left: -10000px;
                                      "
                                                />
                                            </div>
                                        </div>
                                        <!---->
                                        <p
                                                class="sub-text text-primary"
                                        >
                                            기본 반품택배사는 브로컬리
                                            지정택배(한진택배)로 최초 자동설정 됩니다.</span><br/>
                                        </p>
                                        <!---->
                                    </div>
                                </div>
                                <div class="form-sub-wrap">
                                    <label class="control-label" for="return_price"
                                    >반품배송비(편도)<!----><i
                                            class="icon-must"
                                            aria-label="필수항목"
                                    ></i
                                    ><!---->
                                    </label
                                    >
                                    <div class="input-content">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="seller-input-wrap">
                                                        <input
                                                                name="product.deliveryInfo.claimDeliveryInfo.returnDeliveryFee"
                                                                type="text"
                                                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                                class="form-control ng-pristine ng-untouched ng-empty ng-valid-min ng-valid-max ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
                                                                id="return_price"
                                                        <%--                                                            placeholder="숫자만 입력"--%>
                                                                placeholder="3000"
                                                                value="3000"/>
                                                    </div>
                                                    <span class="input-group-addon">원</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!---->
                                    </div>
                                </div>
                                <div class="form-sub-wrap">
                                    <label class="control-label" for="exchange_price"
                                    >교환배송비(왕복)<!----><i
                                            class="icon-must"
                                    ></i
                                    ><!----></label>
                                    <div class="input-content">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="seller-input-wrap">
                                                        <input
                                                                name="product.deliveryInfo.claimDeliveryInfo.exchangeDeliveryFee"
                                                                type="text"
                                                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                                                class="form-control ng-pristine ng-untouched ng-empty ng-valid-min ng-valid-max ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
                                                                id="exchange_price"
                                                        <%--                                                            placeholder="숫자만 입력"--%>
                                                                placeholder="3000"
                                                                value="3000"
                                                        />
                                                    </div>
                                                    <span class="input-group-addon">원</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!---->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!---->
                </div>
                <!----></ui-view
            ><!----><!---->


            <!-- 검색설정 -->
            <ui-view name="searchConfig">
                <div class="form-section">
                    <div
                            class="title-line"
                            role="button"
                    >
                        <label class="col-sm-2 col-xs-4 control-label"
                        >검색설정
                            <!----><!----></label>
                    </div>
                    <!---->
                    <div
                            class="inner-content input-content"
                            style=""
                    >
                        <div
                                class="form-section-sub"
                        >
                            <div class="form-sub-wrap">
                                <label class="control-label">태그</label>
                                <div class="input-content">
                                    <div class="info-result">
                                        <div class="form-group">
                                            <div class="seller-input">
                                                <label
                                                >
                                                    태그 직접 입력(최대 3개)<span></span
                                                ></label>
                                            </div>
                                        </div>
                                        <!---->
                                        <div
                                                class="input-tag"
                                        >
                                            <div class="form-group">
                                                <div
                                                        class="selectize-control ng-pristine ng-untouched ng-valid multi"
                                                >
                                                    <div
                                                            class="selectize-input items not-full ng-valid ng-pristine"
                                                    >
                                                        <input name="keyword"
                                                               type="text"
                                                               class="form-control"
                                                               value="${keyword[0]}"
                                                               placeholder="태그1"/>

                                                        <input name="keyword"
                                                               type="text"
                                                               class="form-control"
                                                               value="${keyword[1]}"
                                                               placeholder="태그2"/>
                                                        <input name="keyword"
                                                               type="text"
                                                               class="form-control"
                                                               value="${keyword[2]}"
                                                               placeholder="태그3"/>

                                                        <%--  할인 될 가격  --%>
                                                        <input name="itemDcAmt"
                                                               id="dc_price"
                                                               value="${goodsDto.itemDcAmt}"
                                                               type="hidden"
                                                               class="form-control"
                                                               placeholder="할인가격"
                                                        />

                                                        <%--                                                    itemId 생성--%>
                                                        <%
                                                            String itemId = request.getParameter("itemId");
                                                            if (itemId != null && !itemId.isEmpty()) {
                                                        %>
                                                        <input type="hidden" name="itemId" id="itemId"
                                                               value="<%= itemId %>" readonly="readonly"/>
                                                        <input type="hidden" name="itemId1" id="itemId1"
                                                               value="<%= itemId %>" readonly="readonly"/>
                                                        <%
                                                        } else {
                                                        %>

                                                        <input type="hidden" name="itemId" id="itemId" value=""
                                                               readonly="readonly"/>
                                                        <input type="hidden" name="itemIdList" id="itemId1" value=""
                                                               readonly="readonly"/>
                                                        <% }
                                                        %>


                                                        <input name="cateCode"
                                                               id="cateCode"
                                                               type="hidden"
                                                               class="form-control"
                                                               placeholder="카테고리코드"
                                                        />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!---->
                                    </div>
                                    <p class="sub-text text-primary">
                                        입력하신 태그 중 일부는 내부 기준에 의해검색에
                                        노출되지 않을 수 있습니다.<br/>카테고리/ 브랜드/
                                        판매처명이 포함된 태그의 경우는 등록되지
                                        않습니다.<br/>판매상품과 직접 관련 없는 태그를
                                        입력 시 판매금지될 수 있습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ui-view><!----><!----><!---->
            <%--        <button type="button" onclick="submitForm('forma')">submit</button>--%>
    </form>
    <%--form 태그 끝--%>


    <!-- 삭제 버튼 -->
    <div class="seller-btn-area btn-group-xlg hidden-xs">
        <button id="removeBtn"
                type="button"
                class="btn">
            삭제
        </button>

        <%--    저장버튼 --%>
        <button
                id=""
                name="actionBtn"
                type="button"
                class="btn">

        </button>


    </div>
</div>
<%--Ajax--%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    for (var i = 0; i < 13; i++) {
        function s_ajax(i) {

            let codeId = $("#maincate" + i).val();
            let codeExp = $("#maincate" + i).html();

            alert(codeId)
            $.ajax({
                url: "/seller/ajax",
                type: "get",
                dataType: 'json',
                data: {
                    "codeId": codeId
                },
                success: function (list) {
                    const $middledata = $("#middledata");
                    $("ul#middledata").children().remove();
                    $.each(list, function (i, data) {
                        let li = document.createElement('li');
                        let button = document.createElement('a');

                        button.role = "button";
                        button.textContent = data.exp;
                        button.name = "categorys";
                        button.id = "child_button" + i;

                        //중분류 클릭하면 카테고리 코드가 중분류의 번호로 바뀌어야 함
                        button.addEventListener('click', function () {
                            $('#cateCode').val(data.codeId);

                            // 선택한 카테고리 :
                            $('.Cate-result').text(codeExp + " > " + data.exp);
                            $('.Cate-result').css("color", "#003103");
                            $('.Cate-result').css("font-weight", "bold");
                            $('.Cate-result').css("font-size", "14px");


                            $('a').removeClass('clicked'); // 모든 버튼에서 clicked 클래스 제거
                            $(this).addClass('clicked'); // 클릭된 버튼에 clicked 클래스 추가

                            // $('.clicked').closest('li').css("background-color","#0147097e");
                            // $('.clicked').closest('li').css("color","#ffffff");

                            alert("button clicked");

                        });
                        li.appendChild(button);
                        $middledata.append(li);

                    })

                },
                error: function (request, error) {
                    alert("error");
                    alert(this.data)

                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                },

            })
        }
    }

    //대표이미지 저장
    function img_ajax() {

        //formData객체 생성
        let formData = new FormData();
        let fileInput = document.querySelector("#file");

        let itemId = document.getElementById("itemId").value
        let tmpPath = URL.createObjectURL(fileInput.files[0]);
        formData.append('file', fileInput.files[0]);
        formData.append('img', tmpPath);
        formData.append('repImgFl', 'Y');
        formData.append('itemId', itemId);


        console.log(formData);

        $.ajax({
            url: '/seller/img',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                alert("Image uploaded successfully:", response);

                alert(tmpPath);

            },
            error: function (error) {
                alert("Error uploading image:", error);
                // 에러 처리 코드 추가
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                alert("error:" + error);
            }
        });

    }


    // 할인율 계산
    function ShowPrice() {
        var originPrice = document.querySelector("#prd_price").value;
        var rate = document.querySelector("#prd_sale").value;

        var savePrice = Math.floor(originPrice * (rate / 100) / 10) * 10;
        var resultPrice = originPrice - savePrice;
        document.querySelector("#showResult").innerHTML = resultPrice + "원 (" + savePrice + " 원 할인)";
        document.querySelector("#dc_price").value = savePrice;
        // document.querySelector("#salePrice").value = resultPrice;
    }

    // 동시입력 가능
    $("#prd_weight").change(function () {
        $('#prd_weight2').val($(this).val());
    });
    $("#prd_amount").change(function () {
        $('#prd_amount2').val($(this).val());
    });


    //난수 만들기
    var newId = function () {
        return new Date().getTime();
        // 1970/1/1 12:00 기준 경과한 밀리 초 -> 중복 발생X
        // 1초=1000밀리초
    }
    // itemId 값이 이미 존재한다면 생성하지 않음
    if (!document.getElementById("itemId").value) {
        document.getElementById("itemId").value = newId();
    }

    // itemId1 값이 이미 존재한다면 생성하지 않음
    if (!document.getElementById("itemId1").value) {
        document.getElementById("itemId1").value = newId();
    }


    // 버튼 제어

    var actionBtn = document.getElementsByName("actionBtn")[0]; // name으로 요소 선택

    // mode에 따라 id 설정
    actionBtn.id = "${mode == 'new' ? 'writeBtn' : 'modifyBtn'}";

    // 버튼 타입 설정
    actionBtn.type = "${mode == 'new' ? 'button' : 'button'}";
    actionBtn.value = "${mode == 'new' ? 'submit' : 'modify'}";
    actionBtn.innerHTML = "${mode == 'new' ? '저장하기' : '수정저장'}";

    // 클릭 이벤트 핸들러 설정
    actionBtn.onclick = function () {
        if ("${mode == 'new'}") {
            // 수정저장 버튼의 동작
            // 예: submitForm('forma');
        } else {
            // 저장하기 버튼의 동작
            // 예: form.submit();
        }
    };


    // 이미지------------------------------------------------

    // // 이미지 넣기
    // var acc = document.getElementsByClassName("menuitem");
    // var i;
    //
    // for (i = 0; i < acc.length; i++) {
    //     acc[i].addEventListener("click", function () {
    //         this.classList.toggle("active");
    //         var panel = this.nextElementSibling;
    //         if (panel.style.maxHeight) {
    //             panel.style.maxHeight = null;
    //         } else {
    //             panel.style.maxHeight = panel.scrollHeight + "px";
    //         }
    //     });
    // }
    //
    // // 대표 이미지 파일 가져오기
    // function loadFile(input) {
    //     let file = input.files[0]; // 선택된 파일 가져오기
    //
    //     let newImage = document.createElement("img"); //새 이미지 추가
    //
    //     //이미지 source 가져오기
    //
    //     newImage.src = URL.createObjectURL(file);
    //     newImage.name = "img";
    //     newImage.id = "img-id";
    //     newImage.style.width = "100%";
    //     newImage.style.height = "100%";
    //     newImage.style.objectFit = "cover";
    //
    //     //이미지를 image-show div에 추가
    //     let container = document.getElementById("image-show");
    //     container.appendChild(newImage);
    // }
    //
    // // 추가 이미지 파일 가져오기
    // function loadFile(input) {
    //     let file2 = input.files[0]; // 선택된 파일 가져오기
    //
    //     let newImage = document.createElement("img"); //새 이미지 추가
    //
    //     //이미지 source 가져오기
    //     newImage.src = URL.createObjectURL(file2);
    //     newImage.value = URL.createObjectURL(file2);
    //     newImage.id = "img-id";
    //     newImage.style.width = "100%";
    //     newImage.style.height = "100%";
    //     newImage.style.objectFit = "cover";
    //
    //     //이미지를 image-show div에 추가
    //     let container = document.getElementById("image-show");
    //     container.appendChild(newImage);
    // }


    $(document).ready(function () { //main()


        $('#writeBtn').on("click", function () {
            let form = $('#forma');

            form.attr("action", "<c:url value='/seller/productsCreate/write'/>");
            form.attr("method", "post");
            form.submit();
            alert("저장되었습니다.");

        });

        $('#modifyBtn').on("click", function () {
            let form = $('#forma');

            form.attr("action", "<c:url value='/seller/productsCreate/modify'/>");
            form.attr("method", "post");
            form.submit();
            alert("저장되었습니다.");

        });


        //삭제버튼
        $(document).ready(function () { //main()
            $('#removeBtn').on("click", function () {
                if (!confirm("정말로 삭제하시겠습니까?")) return;
                let form = $('#forma');
                form.attr("action", "<c:url value='/seller/productsCreate/remove'/>");
                form.attr("method", "get");
                form.submit();
            });
        })
    })
</script>

</body>
</html>
