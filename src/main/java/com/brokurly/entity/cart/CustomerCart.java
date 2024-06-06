package com.brokurly.entity.cart;


import com.brokurly.dto.cart.CustomerCartDto;
import lombok.*;

@Builder
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class CustomerCart {
    private String itemId;
    private int itemCnt;  //카트에 담긴 상품 개수
    private String custId;
    private String itemCk = "N";  //추가사항 - 상품 체크여부

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

    public void initSaleTotal() {
        salePrice = price - itemDcAmt;
        totalPrice = salePrice * itemCnt;
        if (salePrice < 0) {
            throw new RuntimeException("할인된 가격은 0원 이하일 수 없습니다.");
        } else if (itemCnt < 1) {
            throw new RuntimeException("상품 개수가 1개 이상이어야합니다");
        }
    }

    public CustomerCartDto makeFullDto() {   //setter

        return CustomerCartDto.builder()
                .itemId(itemId)
                .itemCnt(itemCnt)
                .custId(custId)
                .name(name) //상품이름
                .price(price) //상품 원가
                .shipType(shipType) //배송타입(새벽배송)
                .pkgType(pkgType) //포장타입(냉장,냉동)
                .itemDcAmt(itemDcAmt)
                .salePrice(salePrice)
                .totalPrice(totalPrice)
                .itemQty(itemQty)
                .itemCk(itemCk)
                .build();
    }

    public void changeStatus(CustomerCartDto customerCartDto) { //getter
        this.custId = customerCartDto.getCustId();
        this.itemId = customerCartDto.getItemId();
        this.itemCnt = customerCartDto.getItemCnt();
        this.name = customerCartDto.getName();
        this.price = customerCartDto.getPrice();
        this.shipType = customerCartDto.getShipType();
        this.pkgType = customerCartDto.getPkgType();
        this.itemDcAmt = customerCartDto.getItemDcAmt();
        this.salePrice = customerCartDto.getSalePrice();
        this.totalPrice = customerCartDto.getTotalPrice();
        this.itemQty = customerCartDto.getItemQty();
        this.itemCk = customerCartDto.getItemCk();
    }



}
