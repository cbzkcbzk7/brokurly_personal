package com.brokurly.entity.payment.kakaopay;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Amount { // 카카오페이 결제 정보
    private Integer total; // 전체 결제 금액
    private Integer tax_free; // 비과세 금액
    private Integer vat; // 부가세 금액
    private Integer point; // 사용한 포인트 금액
    private Integer discount; // 할인 금액
}
