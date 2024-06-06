package com.brokurly.entity.payment;

import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.payment.PaymentAmountCheckoutDto;
import com.brokurly.dto.payment.PaymentAmountResponseDto;
import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentAmount {
    private int orderAmt;
    private int itemAmt;
    private int itemDcAmt;
    private int shipFee;
    private int cpnDcAmt;
    private int cardDcAmt;
    private int pointDcAmt;
    private int payAmt;

    private static final int SHIPPING_FEE = 3000;
    private static final int FREE_SHIPPING_AMOUNT = 40000;

    public PaymentAmountCheckoutDto toCheckoutDto(List<CustomerCartDto> itemList) {
        for (CustomerCartDto item : itemList) {
            // 상품 금액
            itemAmt += item.getPrice() * item.getItemCnt();
            // 상품 할인 금액
            itemDcAmt += item.getItemDcAmt() * item.getItemCnt();
        }
        // 주문 금액 = 상품 금액 - 상품 할인 금액
        orderAmt += itemAmt - itemDcAmt;
        // 배송비
        shipFee = itemAmt >= FREE_SHIPPING_AMOUNT ? 0 : SHIPPING_FEE;
        payAmt += orderAmt + shipFee;

        return PaymentAmountCheckoutDto.builder()
                .itemAmt(itemAmt)
                .itemDcAmt(itemDcAmt)
                .orderAmt(orderAmt)
                .shipFee(shipFee)
                .payAmt(payAmt)
                .build();
    }

    public PaymentAmountResponseDto toResponseDto() {
        return PaymentAmountResponseDto.builder()
                .orderAmt(orderAmt)
                .itemAmt(itemAmt)
                .itemDcAmt(itemDcAmt)
                .shipFee(shipFee)
                .cpnDcAmt(cpnDcAmt)
                .cardDcAmt(cardDcAmt)
                .pointDcAmt(pointDcAmt)
                .payAmt(payAmt)
                .build();
    }
}
