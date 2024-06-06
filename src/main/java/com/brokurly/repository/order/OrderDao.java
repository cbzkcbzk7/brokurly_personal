package com.brokurly.repository.order;

import com.brokurly.entity.order.Order;
import com.brokurly.entity.order.OrderAndPayment;
import com.brokurly.entity.order.OrderItems;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderDao {
    // CREATE
    int insert(Order order);

    int insertItemList(OrderItems itemList);

    // READ
    List<Order> selectByCustId(String custId);
    List<OrderAndPayment> selectByCustIdWithJoin(String custId);
    Order selectByOrderId(String orderId);

    List<OrderItems> selectItemList(String orderId);

    // UPDATE
    int updateOrderStatus(@Param("orderStat") String status, @Param("orderId") String orderId);

    // DELTE
    int deleteById(String orderId);
}
