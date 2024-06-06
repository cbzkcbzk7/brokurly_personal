package com.brokurly.dto.payment;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPayApproveRequestDto {
    private String cid; // 가맹점 코드
    private String tid; // 결제 고유번호
    private String partner_order_id; // 주문번호
    private String partner_user_id; // 회원 아이디
    private String pg_token; // 결제승인 요청을 인증하는 토큰
}
