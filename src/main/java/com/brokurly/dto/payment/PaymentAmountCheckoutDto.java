package com.brokurly.dto.payment;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentAmountCheckoutDto {
    private int orderAmt;
    private int itemAmt;
    private int itemDcAmt;
    private int shipFee;
    private int point;
    private int payAmt;
}
