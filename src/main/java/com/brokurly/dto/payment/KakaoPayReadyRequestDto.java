package com.brokurly.dto.payment;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoPayReadyRequestDto {
    private String cid; // 가맹점 코드, 테스트 결제용 가맹점 번호 -> TC0ONETIME
    private String partner_order_id; // 주문번호
    private String partner_user_id; // 회원 아이디
    private String item_name; // 상품명
    private Integer quantity; // 상품 수량
    private Integer total_amount; // 상품 총액
    private Integer tax_free_amount; // 상품 비과세 금액
    private String approval_url; // 결제 성공 시 redirect url
    private String cancel_url; // 결제 취소 시 redirect url
    private String fail_url; // 결제 실패 시 redirect url
}
