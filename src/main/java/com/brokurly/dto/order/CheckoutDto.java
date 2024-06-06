package com.brokurly.dto.order;

import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.payment.PaymentAmountCheckoutDto;
import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CheckoutDto {
    private String itemName;
    // 배송 요청사항 정보
    private ReceiverDetailsResponseDto receiverDetails;
    // 주문 상품 목록
    private List<CustomerCartDto> customerCart;
    // 상품 이미지 리스트
    private List<String> imgList;
    // 결제 금액
    private PaymentAmountCheckoutDto paymentAmount;
}
