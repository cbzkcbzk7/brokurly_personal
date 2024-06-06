package com.brokurly.dto.goods;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class GoodsListDto {
    private String itemId;
    private String name; //이름
    private String exp; //짧은설명
    private int price; //원가
    private int dcRt; //할인률
    private int itemDcAmt; // 할인되는 가격
    private int revCnt; // 후기 개수
    private int disPrice;
    private String shipType; // 배송종류



    private String img;
   // private String repImgFl;
}
