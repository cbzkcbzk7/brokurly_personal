package com.brokurly.entity.mypage;

import com.brokurly.dto.mypage.WishListDto;
import com.brokurly.dto.mypage.WishListItemDto;
import lombok.*;

@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class WishListItem {
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
    

    public WishListItemDto makeFullWishListItem(){
        return WishListItemDto.builder()
                .itemId(itemId)
                .custId(custId)
                .name(name)
                .exp(exp)
                .price(price)
                .dcRt(dcRt)
                .itemDcAmt(itemDcAmt)
                .origin(origin)
                .pointFl(pointFl)
                .cpnElgFl(cpnElgFl)
                .shipType(shipType)
                .sellerName(sellerName)
                .pkgType(pkgType)
                .capa(capa)
                .sellUnit(sellUnit)
                .adultVerifFl(adultVerifFl)
                .cateCode(cateCode)
                .itemQty(itemQty)
                .bsnsNo(bsnsNo)
                .itemSpec(itemSpec)
                .build();

    }

    public void changeStatus(WishListItemDto wishListItemDto) {
        this.itemId = wishListItemDto.getItemId();
        this.custId = wishListItemDto.getCustId();
    }
}
