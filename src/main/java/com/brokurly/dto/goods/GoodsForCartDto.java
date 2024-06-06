package com.brokurly.dto.goods;

import lombok.*;

@Data
@Builder
public class GoodsForCartDto {
    private String name;
    private int price;
    private int itemDcAmt;
    private String shipType;
    private String pkgType;
}
