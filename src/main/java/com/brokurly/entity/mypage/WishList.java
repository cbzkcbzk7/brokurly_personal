package com.brokurly.entity.mypage;

import com.brokurly.dto.mypage.WishListDto;
import com.brokurly.dto.mypage.WishListItemDto;
import lombok.*;

@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class WishList {
    private String itemId;
    private String custId;

    public WishListDto makeFullDto(){
        return WishListDto.builder()
                .itemId(itemId)
                .custId(custId)
                .build();
    }

    public void changeStatus(WishListDto wishListDto) {
        this.itemId = wishListDto.getItemId();
        this.custId = wishListDto.getCustId();
    }

}
