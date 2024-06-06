package com.brokurly.controller.goods;


import com.brokurly.dto.goods.*;
import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.mypage.WishListDto;
import com.brokurly.entity.goods.GoodsReviewBoard;
import com.brokurly.service.goods.GoodsService;
import com.brokurly.utils.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/goods")
@RequiredArgsConstructor
public class GoodsController {

    private final GoodsService goodsService;

    // 상품 상세페이지로 값 전달
    @GetMapping("/{itemId}")
    public String goods(@PathVariable("itemId") String itemId, Model model, HttpSession session) {
        // 세션에서 로그인 멤버 정보 가져오기
        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        // 만약 로그인 멤버 정보가 없으면 로그인 페이지로 리다이렉트
        if (custIdDto == null)
            return "login-check";
        // 로그인 멤버 정보에서 필요한 값을 추출
        String custId = custIdDto.getCustId();
        // 세션에 고객 ID 저장
//        session.setAttribute("member", custId);

//        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
//        String custId = custIdDto.getCustId();
//        session.setAttribute("member", custId);

        GoodsDetailDto goods = goodsService.searchGoods(itemId);  // 상품정보
        GoodsAnnouncementDto announcement = goodsService.searchGoodsAnnouncement(itemId); //상품고시정보
        GoodsImageDto goodsImage = goodsService.searchGoodsImage(itemId); //상품 이미지
        List<GoodsImageDto> imgList = goodsService.searchGoodsImageList(itemId); //상품 이미지
        List<GoodsInquiryLogDto> inquiry = goodsService.searchGoodsInquiryLog(itemId);  //상품 문의사항
        int wishList = goodsService.searchWish(itemId, custId); //상품 찜
        List<GoodsReviewBoardDto> review = goodsService.searchReview(itemId);

        model.addAttribute("custId",custId);
        model.addAttribute("goods", goods);
        model.addAttribute("announcement", announcement);
        model.addAttribute("goodsImage", goodsImage);
        model.addAttribute("imgList", imgList);
        model.addAttribute("inquiry", inquiry);
        model.addAttribute("wishList", wishList);
        model.addAttribute("review", review);
        return "goods/goods";
    }

    @PostMapping("/addWish")
    @ResponseBody
    public ResponseEntity<String> addWishPost(WishListDto wishListDto) {
        int result = goodsService.addWish(wishListDto); //String 이기에 int값 먼저 넣어줌
        return new ResponseEntity<>(result + "", HttpStatus.OK);
    }

    @PostMapping("/deleteWish")
    @ResponseBody
    public ResponseEntity<String> deleteWishPost(WishListDto wishListDto) {
        int result = goodsService.deleteWish(wishListDto); //String 이기에 int값 먼저 넣어줌
        return new ResponseEntity<>(result + "", HttpStatus.OK);
    }
//
//    @PostMapping("/dateSort")
//    @ResponseBody
//    public ResponseEntity<List<GoodsReviewBoardDto>> sortReview(@ModelAttribute GoodsReviewBoardDto goodsReviewBoardDto, String itemId, Model model, HttpSession session) {
//        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
//        String custId = custIdDto.getCustId();
//        goodsReviewBoardDto.setCustId(custId);
//        List<GoodsReviewBoardDto> review = goodsService.sortReview(itemId);
//        model.addAttribute("review", review);
//        return new ResponseEntity<>(review, HttpStatus.OK);
//    }



//    @PostMapping("/updateLikeCount")
//    @ResponseBody
//    public void likeCntUpdate(@ModelAttribute GoodsReviewBoardDto goodsReviewBoardDto) {
//        int review = goodsService.likeCntUpdate(goodsReviewBoardDto);
//    }


}