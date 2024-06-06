package com.brokurly.repository.cart;



import com.brokurly.entity.cart.CustomerCart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CustomerCartDao {

    List<CustomerCart> getCart(@Param("custId") String custId, @Param("flag") boolean flag);  //장바구니 목록
    List<CustomerCart> selectByCustId(String custId);
    CustomerCart selectByItemId(String itemId); //상품 아이디로 검색
    int deleteOneItem(CustomerCart customerCart); //장바구니 상품 하나 삭제
    int deleteAll(String custId); //장바구니 전체삭제
    int update(CustomerCart customerCart); //장바구니 수정

    int duplicationAdd(CustomerCart customerCart);  //장바구니에 있을때 넣기
    int insert(CustomerCart customerCart) throws Exception; //장바구니 추가??
    CustomerCart checkCart(CustomerCart customerCart);  //카트 확인

    int vacateCart(CustomerCart customerCart);  //주문 후 장바구니 비우기
    void updateAll(String custId);    //장바구니 itemCk 리셋
}
