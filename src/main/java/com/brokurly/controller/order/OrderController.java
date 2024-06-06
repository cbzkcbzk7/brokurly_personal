package com.brokurly.controller.order;

import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.dto.mypage.ShippingLocationCurrDto;
import com.brokurly.dto.order.CheckoutDto;
import com.brokurly.dto.order.ReceiverDetailsRequestDto;
import com.brokurly.dto.order.ReceiverDetailsResponseDto;
import com.brokurly.dto.payment.PaymentAmountCheckoutDto;
import com.brokurly.service.cart.CustomerCartService;
import com.brokurly.service.member.MemberService;
import com.brokurly.service.mypage.PointService;
import com.brokurly.service.mypage.ShippingLocationService;
import com.brokurly.service.order.OrderService;
import com.brokurly.service.order.ReceiverDetailsService;
import com.brokurly.utils.DateUtils;
import com.brokurly.utils.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Slf4j
@Controller
@RequestMapping("/order")
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final MemberService memberService;
    private final PointService pointService;
    private final CustomerCartService customerCartService;
    private final ReceiverDetailsService receiverDetailsService;
    private final ShippingLocationService shippingLocationService;

    @GetMapping("/checkout")
    public String showCheckout(Model model, HttpSession session) {
        MemberAndLoginDto loginMember = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        if (loginMember == null)
            return "redirect:/member/login";

        ShippingLocationCurrDto location;
        try {
            location = shippingLocationService.getCurrShippingLocationByCustomer(loginMember.getCustId());
        } catch (RuntimeException e) {
            log.error("showCheckout -> ", e);
            return "redirect:/mypage/address";
        }

        MemberAndSignupDto member = memberService.readMemberByOne(loginMember.getCustId());

        CheckoutDto checkout = null;
        try {
            checkout = orderService.getCheckoutInfo(location.getShipLocaId(), loginMember.getCustId());
        } catch (IllegalStateException e) {
            log.error("상품 목록이 존재하지 않음", e);
        }

        if (checkout != null && checkout.getReceiverDetails() != null)
            session.setAttribute("receiverDetails", checkout.getReceiverDetails());

        model.addAttribute("location", location);
        model.addAttribute("loginMember", member);
        model.addAttribute("checkout", checkout);

        return "order/checkout";
    }

    @GetMapping("/checkout/success")
    public String paymentSuccess(Model model, HttpSession session) {
        MemberAndLoginDto loginMember = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        if (loginMember == null)
            return "redirect:/member/login"; // 중간 페이지 필요

        PaymentAmountCheckoutDto amount = (PaymentAmountCheckoutDto) session.getAttribute("paymentAmount");
        String orderId = (String) session.getAttribute("orderId");

        // 포인트 서비스 필요
        int point = (int) (amount.getOrderAmt() * 0.05);

        ShippingLocationCurrDto location;
        try {
            location = shippingLocationService.getCurrShippingLocationByCustomer(loginMember.getCustId());
        } catch (RuntimeException e) {
            log.error("paymentSuccess -> ", e);
            return "redirect:/mypage/address";
        }

        pointService.usePointsWhenOrder(orderId, loginMember.getCustId(), point);
        // 장바구니에서 주문이 끝난 상품 제거
        List<CustomerCartDto> customerCart = customerCartService.getCartList(loginMember.getCustId(), true);
        customerCart.forEach(customerCartService::vacateCart);

        model.addAttribute("name", loginMember.getName());
        model.addAttribute("dayOfWeek", DateUtils.nDaysAfterDayOfWeek(1)); // 도착 요일
        model.addAttribute("addr", location.getAddr()); // 배송 주소
        model.addAttribute("specAddr", location.getSpecAddr()); // 배송 상세 주소
        model.addAttribute("orderId", orderId); // 주문번호
        model.addAttribute("amount", amount.getOrderAmt()); // 결제된 금액
        model.addAttribute("point", point); // 적립된 금액
        return "order/success";
    }

    @GetMapping("/receiver-details")
    public String showReceiverDetails(Model model, HttpSession session) {
        ReceiverDetailsResponseDto receiverDetails = (ReceiverDetailsResponseDto) session.getAttribute("receiverDetails");

        MemberAndLoginDto loginMember = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        if (loginMember == null)
            return "redirect:/member/login"; // 중간 페이지 필요

        MemberAndSignupDto member = memberService.readMemberByOne(loginMember.getCustId());

        log.info("member = {}", member);

        model.addAttribute("member", member);
        model.addAttribute("receiverDetails", receiverDetails);
        return "order/receiver-details";
    }

    @PostMapping("/receiver-details")
    @ResponseBody
    public ResponseEntity<ReceiverDetailsResponseDto> saveReceiverDetails(
            @ModelAttribute ReceiverDetailsRequestDto requestSaveDto,
            BindingResult bindingResult, HttpSession session) {

        if (bindingResult.hasErrors())
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        MemberAndLoginDto loginMember = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);

        ShippingLocationCurrDto location =
                shippingLocationService.getCurrShippingLocationByCustomer(loginMember.getCustId());

        requestSaveDto.setShipLocaId(location.getShipLocaId());
        requestSaveDto.setCustId(loginMember.getCustId());

        ReceiverDetailsResponseDto savedReceiverDetails = receiverDetailsService.saveReceiverDetails(requestSaveDto);
        return new ResponseEntity<>(savedReceiverDetails, HttpStatus.OK);
    }

    @PatchMapping("/receiver-details")
    @ResponseBody
    public ResponseEntity<ReceiverDetailsResponseDto> modifyReceiverDetails(
            @ModelAttribute ReceiverDetailsRequestDto requestChangeDto,
            BindingResult bindingResult, HttpSession session) {

        if (bindingResult.hasErrors())
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        MemberAndLoginDto loginMember = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);

        ShippingLocationCurrDto location =
                shippingLocationService.getCurrShippingLocationByCustomer(loginMember.getCustId());

        ReceiverDetailsResponseDto changedReceiverDetails =
                receiverDetailsService.modifyReceiverDetails(location.getShipLocaId(), requestChangeDto);
        return new ResponseEntity<>(changedReceiverDetails, HttpStatus.OK);
    }
}
