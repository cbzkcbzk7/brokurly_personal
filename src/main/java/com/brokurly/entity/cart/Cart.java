package com.brokurly.entity.cart;

import com.brokurly.dto.cart.CartDto;
import com.brokurly.dto.goods.GoodsDto;
import com.brokurly.dto.goods.GoodsForCartDto;
import lombok.*;

@Getter
@Builder
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Cart {   //1. insert(넣을 값)할  값을 담을 Dto를 만듦
  private String custId;
  private String itemId;
  private int itemCnt;


  public CartDto makeFullDto(GoodsForCartDto goodsDto){   //setter
    return CartDto.builder()
            .itemId(itemId)
            .itemCnt(itemCnt)
//            .name(goodsDto.getName()) //상품이름
//            .price(goodsDto.getPrice()) //상품 원가
//            .shipType(goodsDto.getShipType()) //배송타입(새벽배송)
//            .pkgType(goodsDto.getPkgType()) //포장타입(냉장,냉동)
            .build();
  }
    public void changeStatus (CartDto cartDto){ //getter
    this.custId = cartDto.getCustId();
    this.itemId = cartDto.getItemId();
    this.itemCnt = cartDto.getItemCnt();

  }

}
