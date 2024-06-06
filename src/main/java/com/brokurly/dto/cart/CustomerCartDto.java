package com.brokurly.dto.cart;

import lombok.*;

@Getter
@Setter
@Builder
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class CustomerCartDto {
    private String itemId;
    private int itemCnt;  //카트에 담긴 상품 개수
    private String custId;
    private String itemCk;  //추가사항 - 상품 체크여부

    //상품테이블
    private String name;  //상품이름
    private int price;  //상품 가격
    private String shipType;  //샛별배송여부
    private String pkgType;   //포장타입
    private int itemDcAmt;  //할인되는 금액
    private int itemQty; //재고량

    //추가
    private int salePrice;  //할인이 들어간 가격
    private int totalPrice; //수량에 따른 총 가격

}
