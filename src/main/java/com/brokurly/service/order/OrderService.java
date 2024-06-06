package com.brokurly.service.order;

import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.mypage.ShippingLocationCurrDto;
import com.brokurly.dto.order.*;
import com.brokurly.dto.payment.PaymentDetailsResponseDto;
import com.brokurly.entity.order.Order;
import com.brokurly.entity.order.OrderItems;
import com.brokurly.entity.payment.PaymentAmount;
import com.brokurly.repository.order.OrderDao;
import com.brokurly.service.cart.CustomerCartService;
import com.brokurly.service.goods.GoodsService;
import com.brokurly.service.mypage.ShippingLocationService;
import com.brokurly.service.payment.PaymentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

@Slf4j
@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderDao orderDao;
    private final GoodsService goodsService;
    private final CustomerCartService cartService;
    private final PaymentService paymentService;
    private final ReceiverDetailsService receiverDetailsService;
    private final ShippingLocationService shippingLocationService;

    public CheckoutDto getCheckoutInfo(String shipLocaId, String custId) {
        List<CustomerCartDto> cartList = cartService.getCartList(custId, true);
        ReceiverDetailsResponseDto receiverDetails = receiverDetailsService.findReceiverDetails(shipLocaId);

        if (cartList == null)
            throw new IllegalStateException("주문을 위해서는 반드시 상품 목록이 필요합니다.");

        List<String> imgList = new ArrayList<>();
        for (CustomerCartDto customerCartDto : cartList) {
            String img = goodsService.searchGoodsImage(customerCartDto.getItemId()).getImg();
            imgList.add(img);
        }

        return CheckoutDto.builder()
                .receiverDetails(receiverDetails)
                .customerCart(cartList)
                .imgList(imgList)
                .paymentAmount(new PaymentAmount().toCheckoutDto(cartList))
                .build();
    }

    public OrderResponseDto findOrderByOrderId(String orderId) {
        return orderDao.selectByOrderId(orderId).toResponseDto();
    }

    public List<OrderLogListResponseDto> findOrdersByCustId(String custId) {
        List<Order> orders = orderDao.selectByCustId(custId);
        List<OrderResponseDto> orderList = orders.stream()
                .map(Order::toResponseDto)
                .toList();

        List<OrderLogListResponseDto> orderLogList = new ArrayList<>();
        for (OrderResponseDto orderResponseDto : orderList) {
            OrderLogListResponseDto orderLog = new OrderLogListResponseDto();
            orderLog.setOrder(orderResponseDto);

            PaymentDetailsResponseDto payment = paymentService.findPaymentLogByOrderId(orderResponseDto.getOrderId());
            orderLog.setItemName(payment.getItemName());
            orderLog.setPayMthd(payment.getPayMthd());

            orderLogList.add(orderLog);
        }
        return orderLogList;
    }

    public List<OrderItemsResponseDto> findOrderItemListByOrderId(String orderId) {
        return orderDao.selectItemList(orderId).stream()
                .map(OrderItems::toResponseDto)
                .toList();
    }

    @Transactional
    public void placeOrder(CheckoutDto checkoutDto, String orderId, String custId) {
        if (checkoutDto == null)
            throw new IllegalArgumentException();

        ShippingLocationCurrDto location;
        try {
            location = shippingLocationService.getCurrShippingLocationByCustomer(custId);
        } catch (RuntimeException e) {
            log.error("shippingLocation -> ", e);
//            location = ShippingLocationCurrDto.builder()
//                    .shipLocaId("123")
//                    .addr("서울 강남구 강남대로 364")
//                    .specAddr("미왕빌딩 10층")
//                    .currAddrFl("Y")
//                    .build();
            throw new NoSuchElementException();
        }

        // 주문 내역 저장
        Order order = new Order();

        order.changeOrder(checkoutDto, orderId, custId, location);
        orderDao.insert(order);

        // 주문 상품 목록 저장
        for (CustomerCartDto customerCartDto : checkoutDto.getCustomerCart()) {
            OrderItems itemList = new OrderItems();
            itemList.changeOrderItemList(customerCartDto, orderId);
            orderDao.insertItemList(itemList);
        }
    }

    public void changeOrderStatus(String status, String orderId) {
        orderDao.updateOrderStatus(status, orderId);
    }

    @Transactional
    public void cancelOrder(String orderId) {
        orderDao.deleteById(orderId);
    }
}
