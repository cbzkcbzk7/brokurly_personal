package com.brokurly.controller.oauth;

import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.service.oauth.KaKaoService;
import com.brokurly.service.member.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@Slf4j
@AllArgsConstructor
public class KakaoController {
    private KaKaoService kaKaoService;
    private MemberService memberService;

    @GetMapping("/kakao_callback")
    public String redirectkakao(@RequestParam String code, HttpServletRequest req) throws IOException{

        // 접속토큰 get
        String kakaoToken = kaKaoService.getReturnAccessToken(code);

        // 접속자 정보 get
        Map<String, Object> result = kaKaoService.getUserInfo(kakaoToken);
        String snsId = (String)result.get("id");
        String userName = (String)result.get("name");
        String email = (String)result.get("email");
        String userpw = snsId;
        String telNo = (String)result.get("phoneNum");
        telNo = telNo.replace("+82 ","0").replaceAll("-","");


        String birthYear = (String)result.get("birthYear");
        String birthDay = (String)result.get("birthDay");
        String birthDt = birthYear+birthDay; // yyyymmdd


        String sex = (String)result.get("gender");
        sex = sex.equals("female") ? "F" : "M";


        MemberAndSignupDto memberAndSignupDto = new MemberAndSignupDto();

        // log.info(" memberServiece.kakaoLogin(snsId) = {} ", memberService.kakaoLogin(snsId));

        // oauthId(email) , custId(email 앞의 id), sns비밀번호(snsId), userName, regDate
        // 1. customer 테이블에 일치하는 snsId 없을 시 oauth 테이블에 회원가입
        // 1-1. customer 테이블 확인
        if (memberService.kakaoLogin(snsId) == 0) {
            log.info("kakao register");
            memberAndSignupDto.setCustId(email);
            memberAndSignupDto.setPwd(userpw);
            memberAndSignupDto.setName(userName);
            memberAndSignupDto.setTelNo(telNo);
            memberAndSignupDto.setSex(sex);
            memberAndSignupDto.setBirthDt(birthDt);
            memberAndSignupDto.setSnsId(snsId);
            // 1-2. customer 테이블에 insert
            memberService.kakaoJoin(memberAndSignupDto);
        }else{
//            2. 가입된 아이디가 있을 경우
//                2-1. redirect:/member/login
//                2-2. msg = '이미 가입된 계정이 있습니다'
        }

        // 1.로그인 폼을 거치지 않고 컨트롤러에서 로그인 처리
        // 2. 로그인에 성공하면, Access Token을 클라이언트에 전송한다.
        // 3. 최초 로그인 성공 후, 다음부턴 Access Token을 서버에 요청을 함으로써 매번 로그인 과정 생략가능하다.

        // 일치하는 snsId가 있으면 멤버객체(회원정보)에 담음
        log.warn("카카오로 로그인");
        String userId = memberService.findBySnsId(snsId);

        HttpSession session = req.getSession();
        session.setAttribute("loginName", userName);
        //   MemberAndSignupDto dto = memberService.findByUserId(userId);


        //  log.warn("memberAndSignupDto : " + dto);
//        Authentication auth = new AbstractAuthenticationToken(user, null, roles);

        return  "redirect:/categories/best-page";
    }
}