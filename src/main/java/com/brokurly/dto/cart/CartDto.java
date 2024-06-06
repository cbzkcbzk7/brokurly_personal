package com.brokurly.dto.cart;

import lombok.*;

@Getter
@Setter
@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
public class CartDto {
  private String itemId;
  private int itemCnt;  //카트에 담긴 상품 개수
  private String custId; //-------------------------------

//  //상품테이블
//  private String name;  //상품이름
  private int price;  //상품 가격
//  private String shipType;  //샛별배송여부
//  private String pkgType;   //포장타입
  private int itemDcAmt;  //할인되는 금액

  //추가
//  private int salePrice;  //할인이 들어간 가격
//  private int totalPrice; //수량에 따른 총 가격
//
//  public void initSaleTotal(){
//    salePrice = price - itemDcAmt;
//    totalPrice = salePrice * itemCnt;
//    //검증 추가해야됨
//  }

}
