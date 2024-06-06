package com.brokurly.controller.mypage;


import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.mypage.PointAndPointLogEarningDto;
import com.brokurly.dto.mypage.PointLogExpDto;
import com.brokurly.dto.mypage.PointLogUsageDto;

import com.brokurly.dto.mypage.*;

import com.brokurly.dto.order.OrderLogListResponseDto;
import com.brokurly.dto.order.OrderLogResponseDto;
import com.brokurly.service.mypage.PointLogService;
import com.brokurly.service.mypage.PointService;
import com.brokurly.service.mypage.ShippingLocationService;
import com.brokurly.service.mypage.WishListItemService;
import com.brokurly.service.order.OrderLogService;
import com.brokurly.service.order.OrderService;
import com.brokurly.utils.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
    private final PointLogService pointLogService;
    private final PointService pointService;
    private final ShippingLocationService shippingLocationService;
    private final WishListItemService wishListItemService;
    private final OrderService orderService;
    private final OrderLogService orderLogService;

    @GetMapping("/point/usage")
    String pointUsageLog(@RequestParam(defaultValue = "3") Integer period, Model model, HttpServletRequest httpServletRequest) {
        String custId = getLoggedInCustId(httpServletRequest);
        if (custId == null)
            return "login-check";

        List<PointLogUsageDto> pointLogUsageList = pointLogService.findPointLogUsageByCustomerAndPeriod(custId, period);
        int pointLogUsageCount = pointLogService.getPointLogUsageCountByCustomerAndPeriod(custId, period);
        int totalAvailPoints = pointService.getTotalAvailPoints(custId);
        int totalAccumulPoints = pointLogService.getTotalAccumulPoints(custId);
        int totalPointsToBeExpired = pointService.getTotalPointsToBeExpired(custId);

        model.addAttribute("type", "사용");
        model.addAttribute("period", period);
        model.addAttribute("pointLogUsageList", pointLogUsageList);
        model.addAttribute("pointLogUsageCount", pointLogUsageCount);
        model.addAttribute("totalAvailPoints", totalAvailPoints);
        model.addAttribute("totalAccumulPoints", totalAccumulPoints);
        model.addAttribute("totalPointsToBeExpired", totalPointsToBeExpired);

        log.info("{}", pointLogUsageList);

        return "/mypage/point-usage-log";
    }

    @GetMapping("/point/exp")
    String pointExpLog(@RequestParam(defaultValue = "3") Integer period, Model model, HttpServletRequest httpServletRequest) {
        String custId = getLoggedInCustId(httpServletRequest);

        if (custId == null)
            return "login-check";

        List<PointLogExpDto> pointLogExpList = pointLogService.findPointLogExpByCustomerAndPeriod(custId, period);
        int pointLogExpCount = pointLogService.getPointLogExpCountByCustomerAndPeriod(custId, period);
        int totalAvailPoints = pointService.getTotalAvailPoints(custId);
        int totalAccumulPoints = pointLogService.getTotalAccumulPoints(custId);
        int totalPointsToBeExpired = pointService.getTotalPointsToBeExpired(custId);

        model.addAttribute("type", "소멸");
        model.addAttribute("period", period);
        model.addAttribute("pointLogExpList", pointLogExpList);
        model.addAttribute("pointLogExpCount", pointLogExpCount);
        model.addAttribute("totalAvailPoints", totalAvailPoints);
        model.addAttribute("totalAccumulPoints", totalAccumulPoints);
        model.addAttribute("totalPointsToBeExpired", totalPointsToBeExpired);

        log.info("{}", pointLogExpCount);

        return "/mypage/point-exp-log";
    }

    @GetMapping("/point/earning")
    String pointEarningLog(@RequestParam(defaultValue = "3") Integer period, Model model, HttpServletRequest httpServletRequest) {
        String custId = getLoggedInCustId(httpServletRequest);

        if (custId == null)
            return "login-check";

        List<PointAndPointLogEarningDto> pointLogEarningList = pointLogService.findPointLogEarningByCustomerAndPeriod(custId, period);

//        for (PointLogEarningDto pointLogEarningDto : pointLogEarningList_) {
//            String orderId = pointLogUsageDto.getOrderId();
//            int pointAmt = pointLogUsageDto.getPointAmt();
//            Date procDt = pointLogUsageDto.getProcDt();
//            String pointSpec = pointLogUsageDto.getPointSpec();
//
//            /*String pointSpecDetails = "";
//            if (orderId == null) {
//                pointSpecDetails = new SimpleDateFormat("MM/dd까지 사용가능").format(pointLogUsageDto.getProcDt());
//            } else {
//                pointSpecDetails = String.format("주문번호 (%s)", orderId);
//            }*/
//
//            String pointStat = pointLogUsageDto.getPointStat();
//            Date expDt = pointService.findPointByPointId(pointLogUsageDto.get)
//
//            pointLogEarningList.add(new PointLogEarningDto(pointNo, orderId, pointAmt, procDt, pointSpec, pointStat, expDt));
//        }


        int pointLogEarningCount = pointLogService.getPointLogEarningCountByCustomerAndPeriod(custId, period);
        int totalAvailPoints = pointService.getTotalAvailPoints(custId);
        int totalAccumulPoints = pointLogService.getTotalAccumulPoints(custId);
        int totalPointsToBeExpired = pointService.getTotalPointsToBeExpired(custId);

        model.addAttribute("type", "적립");
        model.addAttribute("period", period);
        model.addAttribute("pointLogEarningList", pointLogEarningList);
        model.addAttribute("pointLogEarningCount", pointLogEarningCount);
        model.addAttribute("totalAvailPoints", totalAvailPoints);
        model.addAttribute("totalAccumulPoints", totalAccumulPoints);
        model.addAttribute("totalPointsToBeExpired", totalPointsToBeExpired);

        return "/mypage/point-earning-log";
    }

    @GetMapping("/address")
    String manageAddress(Model model, HttpServletRequest httpServletRequest) {
        String custId = getLoggedInCustId(httpServletRequest);
        List<ShippingLocationDto> shippingLocationList = shippingLocationService.getShippingLocationListByCustomer(custId);
        model.addAttribute("shippingLocationList", shippingLocationList);
        return "/mypage/address";
    }

    @PostMapping("/address")
    @ResponseBody
    HttpStatus addShippingAddress(@RequestBody ShippingLocationAddFormDto shippingLocationAddFormDto, HttpServletRequest httpServletRequest) {
        String custId = getLoggedInCustId(httpServletRequest);

        String addr = shippingLocationAddFormDto.getAddr();
        String specAddr = shippingLocationAddFormDto.getSpecAddr();
        String defAddrFl = Boolean.parseBoolean(shippingLocationAddFormDto.getDefAddrFl()) ? "Y" : "N";
        log.info("@PostMapping(\"/address\") addShippingAddress addr: {} specAddr: {} defAddrFl: {}", addr, specAddr, defAddrFl);

        // 기본 배송지로 설정할 경우, 나머지 기본 배송지 설정을 해제
        if (defAddrFl.equals("Y"))
            shippingLocationService.unflagDefAddr(custId);

        shippingLocationService.addNewShippingLocation(custId, addr, specAddr, defAddrFl);
//        List<ShippingLocationDto> shippingLocationListByCustomer = shippingLocationService.getShippingLocationListByCustomer(custId);

//        return new ResponseEntity<>("배송지 추가", HttpStatus.OK);
        return HttpStatus.OK;
    }

    @GetMapping("/address/shipping-address/update/{shipLocaId}")
    String modifyShippingLocation(@PathVariable String shipLocaId, HttpServletRequest httpServletRequest, Model model) {
        ShippingLocationModifyPageDto shippingLocationModifyPageDto = shippingLocationService.getShippingLocationToModifyByShipLocaId(shipLocaId);
        model.addAttribute("shippingLocationModifyPageDto", shippingLocationModifyPageDto);
        return "/mypage/address-update";
    }

    @PatchMapping("/address/shipping-address/update/{shipLocaId}")
    @ResponseBody
//    ResponseEntity<String> modifyShippingAddress(@ModelAttribute ShippingLocationUpdateDto shippingLocationUpdateDto) {
    HttpStatus modifyShippingLocation(@PathVariable String shipLocaId, @ModelAttribute ShippingLocationModifyDto shippingLocationModifyDto, HttpServletRequest httpServletRequest) {
        String custId = getLoggedInCustId(httpServletRequest);

        shippingLocationModifyDto.setShipLocaId(shipLocaId);
        String specAddr = shippingLocationModifyDto.getSpecAddr();

        String defAddrFl = shippingLocationModifyDto.getDefAddrFl().equals("on") ? "Y" : "N";
        shippingLocationModifyDto.setDefAddrFl(defAddrFl);

        String telNo = shippingLocationModifyDto.getTelNo().isEmpty() ? null : shippingLocationModifyDto.getTelNo();
        shippingLocationModifyDto.setTelNo(telNo);

        String recName = shippingLocationModifyDto.getRecName();

        /*// 현재 배송지 수정
        String currAddrFl = shippingLocationModifyDto.getCurrAddrFl().equals("on") ? "Y" : "N";
        if ("Y".equals(currAddrFl)) {
            shippingLocationService.modifyCurrShippingLocation(custId, shipLocaId);
            return HttpStatus.OK;
        }*/

        /*log.info("ship_loca_id: {} specAddr: {} defAddrFl: {} telNo: {} recName: {} currAddrFl: {}",
                shipLocaId, specAddr, defAddrFl, telNo, recName, currAddrFl
        );*/
        log.info("ship_loca_id: {} specAddr: {} defAddrFl: {} telNo: {} recName: {}",
                shipLocaId, specAddr, defAddrFl, telNo, recName
        );

        shippingLocationService.modifyShippingLocation(custId, shippingLocationModifyDto);

        return HttpStatus.OK;
    }

    @PatchMapping("/address/shipping-address/update-curraddr/{shipLocaId}")
    @ResponseBody
//    ResponseEntity<String> modifyShippingAddress(@ModelAttribute ShippingLocationUpdateDto shippingLocationUpdateDto) {
    HttpStatus modifyShippingLocation(@PathVariable String shipLocaId, HttpServletRequest httpServletRequest) {
        String custId = getLoggedInCustId(httpServletRequest);

        // 현재 배송지 수정
        shippingLocationService.modifyCurrShippingLocation(custId, shipLocaId);
        return HttpStatus.OK;
    }

    @DeleteMapping("/address/{shipLocaId}")
    @ResponseBody
    HttpStatus removeShippingLocation(@PathVariable String shipLocaId) {
        shippingLocationService.removeShippingLocation(shipLocaId);
        return HttpStatus.OK;
    }

    @GetMapping("/address/shipping-address")
    String shippingAddress() {
        return "/mypage/shipping-address";
    }

    @PostMapping("/address/shipping-address/result")
    String shippingAddressResult(String addr, Model model) {
        log.info("@PostMapping(\"/address/shipping-address/result\") shippingAddressResult addr: {}", addr);
        model.addAttribute("addr", addr);

        return "/mypage/shipping-address-result";
    }

    @GetMapping("/address/shipping-address/list")
    String shippingAddressList(HttpServletRequest httpServletRequest, Model model) {
        String custId = getLoggedInCustId(httpServletRequest);
        if (custId == null)
            return "login-check";

        List<ShippingLocationDto> shippingLocationList = shippingLocationService.getShippingLocationListByCustomer(custId);
        model.addAttribute("shippingLocationList", shippingLocationList);
        return "/cart/delivery-address";
    }

    @GetMapping("/pick/list")
    String pickList(HttpServletRequest httpServletRequest, Model model) {
        String custId = getLoggedInCustId(httpServletRequest);
        if (custId == null)
            return "login-check";

        List<WishListItemDto> wishListItemList = wishListItemService.searchWishList(custId);
        int wishListItemCounter = wishListItemService.getWishListCounter(custId);

        model.addAttribute("wishListItemList", wishListItemList);
        model.addAttribute("wishListItemCounter", wishListItemCounter);

        return "/mypage/pick-list";
    }

    @DeleteMapping("/pick/remove/{itemId}")
    HttpStatus removePick(@PathVariable String itemId, HttpServletRequest httpServletRequest) {
        String custId = getLoggedInCustId(httpServletRequest);
        wishListItemService.deleteWish(itemId, custId);
        return HttpStatus.OK;
    }

    @GetMapping("/order/list")
    String orderList(HttpServletRequest httpServletRequest, Model model) {
        String custId = getLoggedInCustId(httpServletRequest);
        if (custId == null)
            return "login-check";

        List<OrderLogListResponseDto> orderLogList = orderService.findOrdersByCustId(custId);
        model.addAttribute("orderLogList", orderLogList);
        model.addAttribute("orderLogCnt", orderLogList.size());
        return "/mypage/order-list";
    }

    @GetMapping("/order/{orderId}")
    String orderDetail(@PathVariable String orderId, Model model) {
        OrderLogResponseDto orderLog = orderLogService.showOrderLogDetails(orderId);
        model.addAttribute("orderLog", orderLog);
        log.info("{}", orderLog);
        return "/mypage/order-detail";
    }

    String getLoggedInCustId(HttpServletRequest httpServletRequest) {
        HttpSession httpSession = httpServletRequest.getSession(false);
        MemberAndLoginDto memberAndLoginDto = (MemberAndLoginDto) httpSession.getAttribute(SessionConst.LOGIN_MEMBER);

        if (memberAndLoginDto == null)
            return null;

        return memberAndLoginDto.getCustId();
    }
}
