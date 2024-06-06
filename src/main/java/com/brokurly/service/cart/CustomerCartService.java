package com.brokurly.service.cart;

import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.goods.GoodsImageDto;
import com.brokurly.entity.cart.CustomerCart;
import com.brokurly.entity.goods.GoodsImage;
import com.brokurly.repository.cart.CustomerCartDao;
import com.brokurly.repository.goods.GoodsImageDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
@Slf4j
@Service
@RequiredArgsConstructor
public class CustomerCartService {

    private final CustomerCartDao customerCartDao;
    private final GoodsImageDao goodsImageDao;

    @Transactional
    public int addCart(CustomerCartDto customerCartDto) {   //장바구니 상품 추가

        CustomerCart customerCart = new CustomerCart(); //비어있는 CustomerCart 도메인 만들기
        customerCart.changeStatus(customerCartDto); //customerCartDto 있는 값으로 customerCart의 상태를 변경한다.
        //장바구니 데이터 유무 체크
        CustomerCart checkCart = customerCartDao.checkCart(customerCart);

        if (checkCart != null) {
//            int updatedItemCnt = customerCart.getItemCnt() + customerCartDto.getItemCnt();
//            customerCartDto.setItemCnt(updatedItemCnt);
            return customerCartDao.duplicationAdd(customerCart);

//            return 2;   //이걸 이제 개수를 추가하는걸로 변경해야됨
//            int DBItemCnt = customerCartDto.getItemCnt();
//            int totakItemCnt = makeFullDto.getItemCnt()+DBItemCnt;
        }
        try {   //장바구니 등록 & 에러 시 0 반환
            return customerCartDao.insert(customerCart);
        } catch (Exception e) {
            log.info("result=",e);
            return 0;
        }
    }

    public List<CustomerCartDto> getCartList(String custId, boolean flag) {    //장바구니 상품 불러오기
        List<CustomerCart> cartList = customerCartDao.getCart(custId, flag);
        List<CustomerCartDto> customerCartDto = new ArrayList<>();

        for (CustomerCart customerCart : cartList) {    //cartList에서 CustomerCart(엔티티)를 하나씩 꺼내서
            /* 종합 정보 초기화 */
            customerCart.initSaleTotal();   //가격 계산해서 계산값 담기
            customerCartDto.add(customerCart.makeFullDto());    //makeDto메서드를 이용해 Dto로 만들어
            /* 이미지 정보 얻기 */
//            int itemId = customerCart.getItemId();
//            List<AttachImageVO> imageList = customerCartDao.getAttachList(itemId);
//            customerCart.setImageList(imageList);
        }
        return customerCartDto;
    }

    @Transactional
    public CustomerCartDto update(CustomerCartDto customerCartDto){     //장바구니 상품 수량 변경

        CustomerCart customerCart = new CustomerCart();
        customerCart.changeStatus(customerCartDto);
        customerCart.initSaleTotal();

        //장바구니 등록 & 에러 시 0 반환
        try {
            customerCartDao.update(customerCart);
            return customerCart.makeFullDto();
        } catch (Exception e) {
            log.info("result=",e);
            throw new RuntimeException(e);
        }
    }
    public GoodsImageDto searchGoodsImage(String itemId){     //상품 대표 이미지 불러오기
        GoodsImage goodsImage = goodsImageDao.selectByItemId(itemId);
        return goodsImage.makeFullDto();
    }


//    public List<GoodsImageDto> searchListByItemId(String itemId){     //상품 대표 이미지 불러오기
//        List<GoodsImage> goodsImageList = goodsImageDao.selectListByItemId(itemId);
//        List<GoodsImageDto> goodsImageDto = new ArrayList<>();
//
//        for (GoodsImage goodsImage : goodsImageList){
//            goodsImageDto.add(goodsImage.makeFullDto());
//        }
//        return goodsImageDto;
//    }

    @Transactional
    public List<CustomerCartDto> updateAll(String custId) {     //장바구니 상품 수량 변경
        List<CustomerCart> cartList = customerCartDao.selectByCustId(custId);
        List<CustomerCartDto> customerCartDto = new ArrayList<>();

        for (CustomerCart customerCart : cartList) {
            customerCartDao.updateAll(custId);
            customerCartDto.add(customerCart.makeFullDto());
        }

        return customerCartDto;
    }

    @Transactional
    public CustomerCartDto deleteCart(CustomerCartDto customerCartDto) {   //장바구니 상품 삭제

        CustomerCart customerCart = new CustomerCart(); //비어있는 CustomerCart 도메인 만들기
        customerCart.changeStatus(customerCartDto); //customerCartDto 있는 값으로 customerCart의 상태를 변경한다
        customerCartDao.deleteOneItem(customerCart);
        return customerCartDto;
    }

    @Transactional
    public CustomerCartDto vacateCart(CustomerCartDto customerCartDto) {   //주문완료 후 장바구니 비우기

        CustomerCart customerCart = new CustomerCart(); //비어있는 CustomerCart 도메인 만들기
        customerCart.changeStatus(customerCartDto); //customerCartDto 있는 값으로 customerCart의 상태를 변경한다
        customerCartDao.vacateCart(customerCart);
        return customerCartDto;
    }

}
