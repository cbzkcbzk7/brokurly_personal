package com.brokurly.service.order;

import com.brokurly.dto.order.OrderItemsResponseDto;
import com.brokurly.dto.order.OrderLogResponseDto;
import com.brokurly.dto.order.OrderResponseDto;
import com.brokurly.dto.order.ReceiverDetailsResponseDto;
import com.brokurly.dto.payment.PaymentDetailsResponseDto;
import com.brokurly.service.mypage.ShippingLocationService;
import com.brokurly.service.payment.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderLogService {
    private final OrderService orderService;
    private final PaymentService paymentService;
    private final ReceiverDetailsService receiverDetailsService;

    public OrderLogResponseDto showOrderLogDetails(String orderId) {
        OrderLogResponseDto orderLogResponseDto = new OrderLogResponseDto();

        OrderResponseDto order = orderService.findOrderByOrderId(orderId);
        orderLogResponseDto.setOrder(order);

        ReceiverDetailsResponseDto receiverDetails = receiverDetailsService.findReceiverDetails(order.getShipLocaId());
        orderLogResponseDto.setReceiverDetails(receiverDetails);

        PaymentDetailsResponseDto paymentDetails = paymentService.findPaymentLogByOrderId(orderId);
        orderLogResponseDto.setPaymentDetails(paymentDetails);

        List<OrderItemsResponseDto> orderItemList = orderService.findOrderItemListByOrderId(orderId);
        orderLogResponseDto.setOrderItemList(orderItemList);

        return orderLogResponseDto;
    }
}
