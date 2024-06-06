package com.brokurly.entity.order;

import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.order.OrderItemsResponseDto;
import lombok.*;

@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class OrderItems {
    private String orderId;
    private String itemId;
    private String itemName;
    private int itemQty;
    private int itemPrice;
    private int itemDcPrice;

    public void changeOrderItemList(CustomerCartDto cartDto, String orderId) {
        this.orderId = orderId;
        this.itemId = cartDto.getItemId();
        this.itemQty = cartDto.getItemCnt();
        this.itemPrice = cartDto.getPrice();
        this.itemDcPrice = cartDto.getItemDcAmt();
    }

    public OrderItemsResponseDto toResponseDto() {
        return OrderItemsResponseDto.builder()
                .orderId(orderId)
                .itemId(itemId)
                .itemName(itemName)
                .itemQty(itemQty)
                .itemPrice(itemPrice)
                .itemDcPrice(itemDcPrice)
                .build();
    }
}
