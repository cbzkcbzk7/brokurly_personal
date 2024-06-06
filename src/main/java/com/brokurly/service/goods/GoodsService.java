package com.brokurly.service.goods;


import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.goods.*;
import com.brokurly.dto.mypage.WishListDto;
import com.brokurly.entity.goods.*;
import com.brokurly.entity.mypage.WishList;
import com.brokurly.repository.goods.GoodsDao;
import com.brokurly.repository.goods.GoodsImageDao;
import com.brokurly.repository.goods.GoodsInquiryLogDao;
import com.brokurly.repository.goods.GoodsReviewBoardDao;
import com.brokurly.repository.mypage.WishListDao;
import com.brokurly.repository.products.ProductsCreateDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class GoodsService {

    private final GoodsDao goodsDao;
    private final ProductsCreateDao productsCreateDao;
    private final GoodsImageDao goodsImageDao;
    private final GoodsInquiryLogDao goodsInquiryLogDao;
    private final WishListDao wishListDao;
    private final GoodsReviewBoardDao goodsReviewBoardDao;

    //상품 조회
    @Transactional
    public GoodsDetailDto searchGoods(String itemId) {    //상품정보 불러오기
        Goods goods = goodsDao.selectByItemId(itemId);
//        goods.initSaleTotal();  //할인가격 계산 값
        return goods.detailMakeFullDto();
    }

    @Transactional
    public GoodsForCartDto searchGoodsForCart(String itemId) {
        Goods goods = goodsDao.selectByItemId(itemId);
        return goods.toGoodsForCartDto();
    }

    @Transactional
    public GoodsAnnouncementDto searchGoodsAnnouncement(String itemId) {    //상품고시정보 불러오기
        GoodsAnnouncement goodsAnnouncement = productsCreateDao.findByItemId(itemId);
        return goodsAnnouncement.makeFullDto();
    }

    public GoodsImageDto searchGoodsImage(String itemId){     //상품 대표 이미지 불러오기
        GoodsImage goodsImage = goodsImageDao.selectByItemId(itemId);
        return goodsImage.makeFullDto();
    }
    public List<GoodsImageDto> searchGoodsImageList(String itemId){     //상품 상세 이미지 불러오기
        List<GoodsImage> goodsImageList = goodsImageDao.selectListByItemId(itemId);
        List<GoodsImageDto> goodsImageDto = new ArrayList<>();

        for (GoodsImage goodsImage : goodsImageList){
            goodsImageDto.add(goodsImage.makeFullDto());
        }
        return goodsImageDto;
    }

    @Transactional
    public List<GoodsInquiryLogDto> searchGoodsInquiryLog(String itemId){   //상품문의 불러오기
        List<GoodsInquiryLog> goodsInquiryLogList = goodsInquiryLogDao.selectByItemId(itemId);
        List<GoodsInquiryLogDto> goodsInquiryLogDto = new ArrayList<>();

        for(GoodsInquiryLog goodsInquiryLog : goodsInquiryLogList){
            goodsInquiryLogDto.add(goodsInquiryLog.makeFullDto());
        }

        return goodsInquiryLogDto;
    }

//    @Transactional
//    public List<WishListDto> searchWishList(String custId){
//        List<WishList> wishListList = wishListDao.searchByCustId(custId);
//        List<WishListDto> wishListDto = new ArrayList<>();
//
//        for( WishList wishList : wishListList){
//            wishListDto.add(wishList.makeFullDto());
//        }
//        return wishListDto;
//    }

//    @Transactional
//    public WishListDto searchWish(String itemId , String custId){   //찜 여부 불러오기
//        WishList wishList = wishListDao.selectByItemId(itemId, custId);
//        return wishList.makeFullDto();
//    }
@Transactional
public int searchWish(String itemId, String custId) {
    WishList wishList = wishListDao.selectByItemId(itemId, custId);
    if (wishList == null) {
        return 0; // 찜이 없는 경우
    } else {
        return 1; // 찜이 있는 경우
    }
}
    @Transactional
    public int addWish(WishListDto wishListDto){
        WishList wishList = new WishList();
        wishList.changeStatus(wishListDto);
        return wishListDao.insert(wishList);
    }
    @Transactional
    public int deleteWish(WishListDto wishListDto){
        WishList wishList = new WishList();
        wishList.changeStatus(wishListDto);
        return wishListDao.delete(wishList);
    }
    @Transactional
    public List<GoodsReviewBoardDto> searchReview(String itemId){
        List<GoodsReviewBoard> goodsReviewBoardList = goodsReviewBoardDao.selectByItemId(itemId);
        List<GoodsReviewBoardDto> goodsReviewBoardDto = new ArrayList<>();

        for(GoodsReviewBoard goodsReviewBoard : goodsReviewBoardList){
            goodsReviewBoardDto.add(goodsReviewBoard.makeFullDto());
        }
        return goodsReviewBoardDto;
    }

//    @Transactional
//    public List<GoodsReviewBoardDto> sortReview(String itemId){
//        List<GoodsReviewBoard> goodsReviewBoardList = goodsReviewBoardDao.dateSort(itemId);
//        List<GoodsReviewBoardDto> goodsReviewBoardDto = new ArrayList<>();
//
//        for(GoodsReviewBoard goodsReviewBoard : goodsReviewBoardList){
//            goodsReviewBoardDto.add(goodsReviewBoard.makeFullDto());
//        }
//        return goodsReviewBoardDto;
//    }

    @Transactional
    public int updateWishCnt(GoodsDto goodsDto){
        Goods goods = new Goods();
        goods.changeStatus(goodsDto);

        return goodsDao.update(goods);
    }


//    @Transactional
//    public int likeCntUpdate(GoodsReviewBoardDto goodsReivewBoardDto){
//
//        GoodsReviewBoard goodsReviewBoard = new GoodsReviewBoard();
//        goodsReviewBoard.changeStatus(goodsReivewBoardDto);
//
//        // 업데이트된 객체를 이용하여 likeCnt 업데이트
//         return goodsReviewBoardDao.likeCntUpdate(goodsReviewBoard);
//    }

}
