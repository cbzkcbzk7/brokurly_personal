package com.brokurly.repository.cart;

import com.brokurly.dto.cart.CartDto;
import com.brokurly.entity.cart.Cart;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartDao {  //2. 반환값/mapper에서 사용할 쿼리 아이디/넣을 값
  List<Cart> getCart(String custId);  //장바구니 목록
  List<Cart> selectByCustId(String custId);
  Cart selectByItemId(String itemId); //상품 아이디로 검색
  int deleteOneItem(Cart cart); //장바구니 상품 하나 삭제
  int deleteAll(Cart cart);//장바구니 전체삭제
  int update(Cart cart); //장바구니 수정
  int insert(Cart cart); //장바구니 추가??



}
