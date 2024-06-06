package com.brokurly.dto.goods;

import lombok.*;

@Getter
@Setter
@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
public class GoodsByBsnsNoDto {
    private String itemId;
    private String name;
    private int price;
    private int dcRt;
    private int itemDcAmt;
    private String bsnsNo;
}
