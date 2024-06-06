package com.brokurly.dto.payment;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentAmountResponseDto {
    private int orderAmt;
    private int itemAmt;
    private int itemDcAmt;
    private int shipFee;
    private int cpnDcAmt;
    private int cardDcAmt;
    private int pointDcAmt;
    private int payAmt;
}
