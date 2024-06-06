package com.brokurly.dto.order;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderResponseDto {
    private String orderId;
    private String custId;
    private String orderStat;
    private Timestamp orderDt;
    private int totalItemQty;
    private int totalPrice;
    private int totalDcAmt;
    private int orderAmt;
    private int shipFee;
    private String shipLocaId;
    private String addr;
    private String shipNo;
}
