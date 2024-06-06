package com.brokurly.dto.payment;

import com.brokurly.entity.payment.PaymentAmount;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDetailsResponseDto {
    // 결제 정보
    private String payNo;
    private String payMthd;
    private String payStat;
    private Timestamp payReqDt;
    private Timestamp payConfDt;
    private String orderId;
    private String itemName;
    // 결제 금액
    private PaymentAmountResponseDto paymentAmount;
}
