package com.brokurly.controller.seller;


import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.dto.seller.SellerAndLoginDto;
import com.brokurly.service.member.MemberService;
import com.brokurly.service.seller.SellerService;
import com.brokurly.utils.MailHandler;
import com.brokurly.utils.MailTempKey;
import com.brokurly.utils.SessionConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.stream.Stream;

@Slf4j
@Controller
@RequestMapping("/seller")
public class SellerController {


    private final SellerService sellerService;
    SellerController(SellerService sellerService){
        this.sellerService = sellerService;

    }



    //local login start

    @GetMapping("/login")
    public String login(HttpSession session){

        if(session.getAttribute("sellerName") == null){
            return "/seller/loginForm";
        }

        return "redirect:/seller/productsOriginList";
    }

    /**
     * @des   로그인 기능
     * @param sellerAndLoginDto
     * @param reqURI
     * @param errors
     * @param model
     * @return String
     */
    @PostMapping("/login")
    public String login(@Valid SellerAndLoginDto sellerAndLoginDto, String reqURI, Errors errors,HttpSession session, Model model){

            log.info("sellerAndLoginDto = {}", sellerAndLoginDto);
        // 1. 로그인 정보 넘어오면 유효성 확인
        if(errors.hasErrors()){
            model.addAttribute("sellerAndLoginDto", sellerAndLoginDto);

            Map<String,String> validatorRs = sellerService.validateHandling(errors);
            Stream<String> streamValidatorRs = validatorRs.keySet().stream();
            streamValidatorRs.forEach(i -> model.addAttribute(i));

            return "/seller/loginForm";
        }
        SellerAndLoginDto resultLoginDto = null;
        try {
            // 2. 비밀번호 암호화 부분 값 확인
            resultLoginDto = new SellerAndLoginDto();
            resultLoginDto = sellerService.localLogin(sellerAndLoginDto);

            // 2-1. 불일치
            if(resultLoginDto == null){
                errors.reject("id","아이디 또는 비밀번호가 맞지 않습니다.");
                model.addAttribute("msg","아이디 또는 비밀번호가 맞지 않습니다.");

                return "/seller/loginForm";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 3. 일치하면 세션에 저장
//        HttpSession session = req.getSession();
        //  3-1. 세션 있으면 있는 세션 반환, 없으면 신규 생성 후 메인 이동 (기본값 true)
        session.setAttribute(SessionConst.LOGIN_SELLER, resultLoginDto);
        SellerAndLoginDto nameDto = (SellerAndLoginDto) session.getAttribute(SessionConst.LOGIN_SELLER);


        String loginName = nameDto.getName();
        session.setAttribute("sellerName",loginName);


        // 4. reqURL 여부에 따른 이동
        reqURI = reqURI == null || reqURI.equals("") ? "/seller/productsOriginList" : reqURI;

        return "redirect:"+reqURI;
    }


    @GetMapping("/logout")
    public String logout(HttpServletRequest req){
        // create : false > 세션이 있으면 기존 세션을 반환하고,
        // 없으면 새로운 세션을 생성하지 않고 null을 반환한다
        HttpSession session = req.getSession(false);

        if(session != null){
            session.invalidate();
        }

        return "redirect:/seller/login";

    }

    //local login end


}