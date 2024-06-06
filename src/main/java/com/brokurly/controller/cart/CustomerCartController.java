package com.brokurly.controller.cart;

import com.brokurly.dto.cart.CustomerCartDto;
import com.brokurly.dto.goods.GoodsImageDto;
import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.mypage.ShippingLocationCurrDto;
import com.brokurly.dto.mypage.ShippingLocationDto;
import com.brokurly.entity.goods.GoodsImage;
import com.brokurly.repository.mypage.ShippingLocationDao;
import com.brokurly.service.cart.CustomerCartService;
import com.brokurly.service.goods.GoodsService;
import com.brokurly.service.mypage.ShippingLocationService;
import com.brokurly.utils.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CustomerCartController {

    private final CustomerCartService customerCartService;
    private final ShippingLocationService shippingLocationService;
    private final GoodsService goodsService;
    /* 장바구니 추가 */
    @PostMapping("/add")
    @ResponseBody
    public String addCartPOST(@ModelAttribute CustomerCartDto customerCartDto, @RequestParam String uri, HttpSession session) {
        // 로그인 체크
//        String member = (String) session.getAttribute("member");
        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        log.info("custIdDto = {}", custIdDto);
        if (custIdDto == null) {
            log.info("uri = {}", uri);
            return uri;
        }
        String custId = custIdDto.getCustId();  //id값 가져와서

        //session.setAttribute("custId",custId);
        customerCartDto.setCustId(custId);  //id값 넣어주기
        customerCartDto.setItemCk("N");
//        log.info("customerCartDto.getCustId = {}",customerCartDto.getCustId());

//        if (custId == null) {
//            // 로그인 페이지로 리다이렉트
//            return "5";
//        }
        // 카트 등록
        int result = customerCartService.addCart(customerCartDto);
        return result + "";
    }

    /* 장바구니 페이지 이동 */
    @GetMapping("/cartList")
    public String cartPageGET( Model model, HttpSession session) {


        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        if (custIdDto == null)
            return "login-check";

        String custId = custIdDto.getCustId();

        List<CustomerCartDto> cart = customerCartService.getCartList(custId, false);
        List<GoodsImageDto> imgList = new ArrayList<>();
        for (CustomerCartDto customerCartDto: cart) {

            String itemId = customerCartDto.getItemId();
            GoodsImageDto goodsImageDto = customerCartService.searchGoodsImage(itemId);

//            String img = goodsImageDto.getImg();
//            imgList.add(img);
            imgList.add(goodsImageDto);
        }
//        log.info(imgList);
        List<CustomerCartDto> updateAll = customerCartService.updateAll(custId);

        ShippingLocationCurrDto address = shippingLocationService.getCurrShippingLocationByCustomer(custId);


//        Map<String, String> imgMap = new HashMap<>();
//        for (CustomerCartDto customerCartDto : cart) {
//            String img = goodsService.searchGoodsImage(customerCartDto.getItemId()).getImg();
//            imgMap.put(customerCartDto.getItemId(), img);
//        }

        // 이제는 새로운 CustomerCartDto 객체를 생성하여 값을 설정합니다.
        model.addAttribute("cart", cart);
        model.addAttribute("address", address);
        model.addAttribute("imgList",imgList);
        return "cart/cart";
    }

    //장바구니 수량 수정
    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<CustomerCartDto> updateCartPOST(@ModelAttribute CustomerCartDto customerCartDto,HttpSession session) {
//        log.info("cartDto = {}", customerCartDto);
        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        String custId = custIdDto.getCustId();
        customerCartDto.setCustId(custId);
        CustomerCartDto cartDto = customerCartService.update(customerCartDto);

        if (cartDto == null) {
            return new ResponseEntity<>(HttpStatus.SERVICE_UNAVAILABLE);
        }
        return new ResponseEntity<>(cartDto, HttpStatus.OK);
    }

    @PostMapping("/delete")
    @ResponseBody
    public String deleteCart(@ModelAttribute CustomerCartDto customerCartDto,HttpSession session) {
        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        String custId = custIdDto.getCustId();
        customerCartDto.setCustId(custId);
        CustomerCartDto cartDto = customerCartService.deleteCart(customerCartDto);
//        if (cartDto == null) {
//
//        }
        return "redirect:/cart/cartList";
    }

    @PostMapping("/vacate")
    @ResponseBody
    public void vacateCart(@ModelAttribute CustomerCartDto customerCartDto, HttpSession session) {
        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);
        String custId = custIdDto.getCustId();
        customerCartDto.setCustId(custId);
        CustomerCartDto cartDto = customerCartService.vacateCart(customerCartDto);


    }


}
