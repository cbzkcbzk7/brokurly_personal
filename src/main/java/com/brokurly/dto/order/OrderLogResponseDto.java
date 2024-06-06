package com.brokurly.dto.order;

import com.brokurly.dto.payment.PaymentDetailsResponseDto;
import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderLogResponseDto {
    private OrderResponseDto order;
    private ReceiverDetailsResponseDto receiverDetails;
    private PaymentDetailsResponseDto paymentDetails;
    private List<OrderItemsResponseDto> orderItemList;
}
