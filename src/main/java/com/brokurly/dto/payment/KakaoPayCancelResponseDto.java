package com.brokurly.dto.payment;

import com.brokurly.entity.payment.kakaopay.Amount;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPayCancelResponseDto {
    private String aid; // 요청 고유번호
    private String tid; // 결제 고유번호
    private String cid; // 가맹점 코드
    private String status; // 결제 상태
    private String partner_order_id; // 주문번호
    private String partner_user_id; // 고객 아이디
    private String payment_method_type; // 결제 수단
    private Amount amount; // 결제 금액
    private String item_name; // 상품명
    private Integer quantity; // 수량
    private Timestamp created_at; // 결제 준비 요청 시각
    private Timestamp approved_at; // 결제 승인 시각
    private Timestamp canceled_at; // 결제 취소 시각
}
