package com.brokurly.service.payment;

import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.order.CheckoutDto;
import com.brokurly.dto.payment.*;
import com.brokurly.service.order.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.client.reactive.ClientHttpConnector;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.server.ResponseStatusException;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
@PropertySource("classpath:application.properties")
public class KakaoPayService {
    private final WebClient webClient;
    @Value("${kakaopay.clientId}")
    private String clientId;
    @Value("${kakaopay.secretKey}")
    private String secretKey;

    private final PaymentService paymentService;
    private final OrderService orderService;

    public KakaoPayService(ClientHttpConnector clientHttpConnector, PaymentService paymentService, OrderService orderService) {
        this.webClient = WebClient.builder()
                .baseUrl("https://open-api.kakaopay.com")
                .clientConnector(clientHttpConnector)
                .build();
        this.paymentService = paymentService;
        this.orderService = orderService;
    }

    public Mono<KakaoPayReadyResponseDto> ready(CheckoutDto checkoutDto, String orderId, String custId) {
        KakaoPayReadyRequestDto requestDto = KakaoPayReadyRequestDto.builder()
                .cid(clientId)
                .partner_order_id(orderId)
                .partner_user_id(custId)
                .item_name(checkoutDto.getItemName())
                .quantity(getQuantity(checkoutDto.getCustomerCart()))
                .total_amount(checkoutDto.getPaymentAmount().getOrderAmt())
                .tax_free_amount(0)
                .approval_url("http://localhost:8080/payment/kakaopay/success")
                .cancel_url("http://localhost:8080/payment/cancel")
                .fail_url("http://localhost:8080/payment/fail")
                .build();

        return webClient.post()
                .uri("/online/v1/payment/ready")
                .headers(httpHeaders -> {
                    httpHeaders.set("Authorization", "SECRET_KEY " + secretKey);
                    httpHeaders.setContentType(MediaType.APPLICATION_JSON);
                })
                .body(BodyInserters.fromValue(requestDto))
                .retrieve()
                .onStatus(HttpStatus::isError, clientResponse -> {
                    throw new ResponseStatusException(clientResponse.statusCode());
                })
                .bodyToMono(KakaoPayReadyResponseDto.class)
                .map(response -> {
                    response.setPartner_order_id(requestDto.getPartner_order_id());
                    response.setPartner_user_id(requestDto.getPartner_user_id());
                    return response;
                });
    }

    // JS에서 처리하는 걸로 대체
    private String getItemName(List<CustomerCartDto> list) {
        if (list.isEmpty())
            throw new IllegalArgumentException();

        CustomerCartDto customerCartDto = list.get(0);
        // 문자열 포맷: XXX 외 N개
        return String.format("%s 외 %d개", customerCartDto.getName(), list.size());
    }

    private Integer getQuantity(List<CustomerCartDto> list) {
        if (list.isEmpty())
            throw new IllegalArgumentException();

        return list.stream()
                .mapToInt(CustomerCartDto::getItemCnt)
                .sum();
    }

    @Transactional
    public Mono<KakaoPayApproveResponseDto> approve(String pg_token, Map<String, String> paramMap) {
        KakaoPayApproveRequestDto requestDto = KakaoPayApproveRequestDto.builder()
                .cid(clientId)
                .tid(paramMap.get("tid"))
                .partner_order_id(paramMap.get("orderId"))
                .partner_user_id(paramMap.get("userId"))
                .pg_token(pg_token)
                .build();

        return webClient.post()
                .uri("/online/v1/payment/approve")
                .headers(httpHeaders -> {
                    httpHeaders.set("Authorization", "SECRET_KEY " + secretKey);
                    httpHeaders.setContentType(MediaType.APPLICATION_JSON);
                })
                .body(BodyInserters.fromValue(requestDto))
                .retrieve()
                .bodyToMono(KakaoPayApproveResponseDto.class);
    }

    @Transactional
    public Mono<KakaoPayCancelResponseDto> cancel(PaymentDetailsResponseDto payment) {
        KakaoPayCancelRequestDto requestDto = KakaoPayCancelRequestDto.builder()
                .cid(clientId)
                .tid(payment.getPayNo())
                .cancel_amount(payment.getPaymentAmount().getOrderAmt())
                .cancel_tax_free_amount(0)
                .build();

        Mono<KakaoPayCancelResponseDto> responseDto = webClient.post()
                .uri("/online/v1/payment/cancel")
                .headers(httpHeaders -> {
                    httpHeaders.set("Authorization", "SECRET_KEY " + secretKey);
                    httpHeaders.setContentType(MediaType.APPLICATION_JSON);
                })
                .body(BodyInserters.fromValue(requestDto))
                .retrieve()
                .bodyToMono(KakaoPayCancelResponseDto.class);

        paymentService.changePaymentStatus("결제취소", payment.getPayNo());
        orderService.changeOrderStatus("주문취소", payment.getOrderId());

        return responseDto;
    }
}
