package com.brokurly.dto.order;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemsResponseDto {
    private String orderId;
    private String itemId;
    private String itemName;
    private int itemQty;
    private int itemPrice;
    private int itemDcPrice;
}
