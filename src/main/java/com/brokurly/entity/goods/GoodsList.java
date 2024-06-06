package com.brokurly.entity.goods;


import com.brokurly.dto.goods.GoodsListDto;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.Date;

@ToString
@EqualsAndHashCode
@AllArgsConstructor
public class GoodsList {
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
    private Date regDt;
    private String adultVerifFl;
    private String cateCode;
    private int itemQty;
    private int wishCnt;
    private String bsnsNo;
    private String itemSpec;
    private int sellCnt;
    private int revCnt;
    private String stdySellerFl;
    private String img;
    private String repImgFl;

    public GoodsListDto makeThumbnailGoodsDto(){
        return GoodsListDto.builder()
                .itemId(itemId)
                .name(name)
                .exp(exp)
                .price(price)
                .dcRt(dcRt)
                .itemDcAmt(itemDcAmt)
                .revCnt(revCnt)
                .shipType(shipType)
                .build();
    }
}



