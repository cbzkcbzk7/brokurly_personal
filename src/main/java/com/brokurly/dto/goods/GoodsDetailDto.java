package com.brokurly.dto.goods;

import lombok.*;

@Getter
@Setter
@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
public class GoodsDetailDto {
    private String itemId;
    private String name;
    private String exp;
    private int price;
    private int dcRt;
    private int itemDcAmt;
    private String origin;
    private String pointFl;
    private String cpnElgFl;
    private String shipType;
    private String sellerName;
    private String pkgType;
    private String capa;
    private int sellUnit;
    private String adultVerifFl;
    private String cateCode;
    private int itemQty;
    private String bsnsNo;
    private String itemSpec;

    private String stdySellerFl;
    //추가
    private int salePrice;  //할인이 들어간 가격
}
