package com.brokurly.dto.mypage;

import lombok.*;

@Getter
@Setter
@Builder
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class WishListItemDto {
    private String itemId;
    private String custId;

    //상품 테이블
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

}
