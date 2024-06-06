package com.brokurly.service.payment;

import com.brokurly.dto.payment.KakaoPayApproveResponseDto;
import com.brokurly.dto.payment.PaymentAmountCheckoutDto;
import com.brokurly.dto.payment.PaymentDetailsResponseDto;
import com.brokurly.entity.payment.PaymentAmount;
import com.brokurly.entity.payment.PaymentDetails;
import com.brokurly.repository.order.PaymentDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class PaymentService {
    private final PaymentDao paymentDao;

    @Transactional
    public void savePaymentLog(KakaoPayApproveResponseDto kakaoPayResponse, PaymentAmountCheckoutDto paymentAmount) {
        if (kakaoPayResponse == null || paymentAmount == null)
            throw new IllegalArgumentException();

        String method = kakaoPayResponse.getPayment_method_type().equals("CARD") ? "카드" : "페이머니";

        PaymentDetails paymentDetails = PaymentDetails.builder()
                .payNo(kakaoPayResponse.getTid())
                .payMthd(String.format("카카오페이(%s)", method))
                .payReqDt(kakaoPayResponse.getCreated_at())
                .payConfDt(kakaoPayResponse.getApproved_at())
                .orderId(kakaoPayResponse.getPartner_order_id())
                .itemName(kakaoPayResponse.getItem_name())
                .paymentAmount(
                        PaymentAmount.builder()
                                .orderAmt(paymentAmount.getOrderAmt())
                                .itemAmt(paymentAmount.getItemAmt())
                                .itemDcAmt(paymentAmount.getItemDcAmt())
                                .shipFee(paymentAmount.getShipFee())
                                .pointDcAmt(paymentAmount.getPoint())
                                .payAmt(paymentAmount.getPayAmt())
                                .build()
                )
                .build();

        paymentDao.insert(paymentDetails);
    }

    public PaymentDetailsResponseDto findPaymentLogByOrderId(String orderId) {
        return paymentDao.selectByOrderId(orderId).toResponseDto();
    }

    public void changePaymentStatus(String status, String tid) {
        paymentDao.updatePayStat(status, tid);
    }
}
