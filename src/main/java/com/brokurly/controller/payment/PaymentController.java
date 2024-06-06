package com.brokurly.controller.payment;

import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.mypage.ShippingLocationCurrDto;
import com.brokurly.dto.order.CheckoutDto;
import com.brokurly.dto.payment.*;
import com.brokurly.service.mypage.ShippingLocationService;
import com.brokurly.service.order.OrderService;
import com.brokurly.service.payment.KakaoPayService;
import com.brokurly.service.payment.PaymentService;
import com.brokurly.utils.IdGenerator;
import com.brokurly.utils.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {
    private final OrderService orderService;
    private final PaymentService paymentService;
    private final KakaoPayService kakaoPayService;

    @PostMapping("/kakaopay")
    @CrossOrigin(origins = "http://localhost:8080")
    public ResponseEntity<String> kakaoPayReady(@RequestBody CheckoutDto checkout, HttpSession session) {
        String orderId = IdGenerator.generateOrderId();
        MemberAndLoginDto loginMember = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);

        KakaoPayReadyResponseDto response;
        try {
            response = kakaoPayService.ready(checkout, orderId, loginMember.getCustId()).block();
        } catch (ResponseStatusException e) {
            return new ResponseEntity<>(HttpStatus.SERVICE_UNAVAILABLE);
        }

        orderService.placeOrder(checkout, orderId, loginMember.getCustId());

        if (response == null)
            return new ResponseEntity<>(HttpStatus.SERVICE_UNAVAILABLE);

        session.setAttribute("tid", response.getTid());
        session.setAttribute("userId", response.getPartner_user_id());
        session.setAttribute("orderId", response.getPartner_order_id());
        session.setAttribute("paymentAmount", checkout.getPaymentAmount());
        return new ResponseEntity<>(response.getNext_redirect_pc_url(), HttpStatus.OK);
    }

    @GetMapping("/kakaopay/success")
    public String kakaoPaySuccess(@RequestParam String pg_token, HttpSession session) {
        KakaoPayApproveResponseDto response = kakaoPayService.approve(pg_token, setParamMap(session)).block();

        if (response == null) {
            log.info("response 없음");
            return "/order/checkout";
        }

        PaymentAmountCheckoutDto paymentAmount = (PaymentAmountCheckoutDto) session.getAttribute("paymentAmount");
        paymentService.savePaymentLog(response, paymentAmount);

        return "redirect:/order/checkout/success";
    }

    private Map<String, String> setParamMap(HttpSession session) {
        Map<String, String> paramMap = new HashMap<>();

        String tid = (String) session.getAttribute("tid");
        String userId = (String) session.getAttribute("userId");
        String orderId = (String) session.getAttribute("orderId");

        paramMap.put("tid", tid);
        paramMap.put("userId", userId);
        paramMap.put("orderId", orderId);

        return paramMap;
    }

    @GetMapping("/kakaopay/cancel") // 카카오페이 결제 취소
    public String kakaoPayCancel(String orderId) {
        PaymentDetailsResponseDto paymentLog = paymentService.findPaymentLogByOrderId(orderId);
        KakaoPayCancelResponseDto response = kakaoPayService.cancel(paymentLog).block();

        return "order/cancel";
    }

    @GetMapping("/cancel") // 결제 도중 취소
    public String cancel(HttpSession session) {
        // 결제 실패 시 DB에서 해당 주문 건을 삭제
        orderService.cancelOrder((String) session.getAttribute("orderId"));
        return "payment/cancel";
    }

    @GetMapping("/fail")
    public String fail() {
        log.info("fail in");
        return "payment/fail";
    }
}
