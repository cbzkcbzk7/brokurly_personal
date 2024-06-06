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
public class KakaoPayReadyResponseDto {
    private String tid; // 결제 고유 번호, 20자
    private String next_redirect_pc_url; // 요청 클라이언트가 PC 웹일 경우
    private Timestamp created_at; // 결제 준비 요청 시간

    private String partner_order_id;
    private String partner_user_id;
}
