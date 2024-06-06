package com.brokurly.entity.payment;

import com.brokurly.dto.payment.PaymentDetailsResponseDto;
import lombok.*;

import java.sql.Timestamp;

@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDetails {
    // 결제 정보
    private String payNo;
    private String payMthd;
    private String payStat;
    private Timestamp payReqDt;
    private Timestamp payConfDt;
    private String orderId;
    private String itemName;
    // 결제 금액
    private PaymentAmount paymentAmount;

    public PaymentDetailsResponseDto toResponseDto() {
        return PaymentDetailsResponseDto.builder()
                .payNo(payNo)
                .payMthd(payMthd)
                .payStat(payStat)
                .payReqDt(payReqDt)
                .payConfDt(payConfDt)
                .orderId(orderId)
                .itemName(itemName)
                .paymentAmount(paymentAmount.toResponseDto())
                .build();
    }
}