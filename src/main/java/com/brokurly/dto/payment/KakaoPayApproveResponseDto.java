package com.brokurly.dto.payment;

import com.brokurly.entity.payment.kakaopay.Amount;
import com.brokurly.entity.payment.kakaopay.CardInfo;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPayApproveResponseDto {
    private String aid; // 요청 고유번호 - 승인/취소가 구분됨
    private String tid; // 결제 고유번호 - 승인/취소가 동일함
    private String cid; // 가맹점 코드
    private String partner_order_id; // 주문번호
    private String partner_user_id; // 회원 아이디
    private String payment_method_type; // 결제 수단 (CARD, MONEY)
    private Amount amount; // 결제 금액 정보
    private CardInfo card_info; // 결제 상세 정보
    private String item_name; // 상품 이름
    private String item_code; // 상품 코드
    private String quantity; // 상품 수량
    private Timestamp created_at; // 결제 준비 요청 시각
    private Timestamp approved_at; // 결제 승인 시각
    private String payload; // 결제 승인 요청에 대해 저장한 값, 요청 시 전달된 내용
}
