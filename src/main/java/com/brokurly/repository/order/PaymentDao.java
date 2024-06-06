package com.brokurly.repository.order;

import com.brokurly.entity.payment.PaymentDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PaymentDao {
    // CREATE
    int insert(PaymentDetails paymentDetails);

    // READ
    List<PaymentDetails> selectAll();

    PaymentDetails selectByOrderId(String orderId);

    // UPDATE
    int updatePayStat(@Param("payStat") String status, @Param("payNo") String tid);

    // DELETE
}
