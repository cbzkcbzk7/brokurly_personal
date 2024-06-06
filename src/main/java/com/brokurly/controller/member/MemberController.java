package com.brokurly.controller.member;


import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.service.member.MemberService;
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
import java.net.URLEncoder;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

@Slf4j
@Controller
@RequestMapping("/member")
@PropertySource("classpath:application.properties")
public class MemberController {


    private final MemberService memberService;
    private final JavaMailSender javaMailSender;

    @Value("${email.username}")
    private String email;

    MemberController(MemberService memberService, JavaMailSender javaMailSender){
        this.memberService = memberService;
        this.javaMailSender = javaMailSender;
    }

    // local signup start
    @GetMapping("/signup")
    public String signUp(){
        return "/member/signupForm";
    }

    @GetMapping("/signup/{custId}")
    @ResponseBody
    public ResponseEntity<String> checkId(@PathVariable String custId){
        try{
            if(memberService.getCount(custId) == 1){
                throw new Exception("Member IdChk failed.");
            }
            return new ResponseEntity<String>("IDCHK_OK", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("IDCHK_ERR", HttpStatus.BAD_REQUEST);
        }

    }


    @GetMapping("/signup/email/{email}")
    @ResponseBody
    public ResponseEntity<String> checkEmail(@PathVariable String email, Integer cnt){

        //1. chk가 1일 경우 회원가입을 위한 이메일인증으로 카운트 0 (중복 불가)
        //2. chk가 0일 경우 비밀번호 재설정을 위한 이메일 인증으로 카운트 1(가입 확인)
        try{

                if (memberService.getCountEmail(email) == cnt) {
                    log.info("memberService.getCountEmail(email) = {}", memberService.getCountEmail(email));
                    throw new Exception("Member EmailChk failed.");
                }
                return new ResponseEntity<String>("EMAILCHK_OK", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("EMAILCHK_ERR", HttpStatus.BAD_REQUEST);
        }

    }



    @PostMapping("/signup")
    public String signUp(@Valid MemberAndSignupDto memberAndSignupDto, Errors errors, Model model) {
        log.info("member = {}", memberAndSignupDto);
        if(errors.hasErrors()) {    // 유효성 검사에 실패한 필드가 있는지 확인
            // 회원가입 실패시, 입력 데이터를 유지
            model.addAttribute("memberAndSignupDto", memberAndSignupDto);

            // 유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorRs = memberService.validateHandling(errors);
            Stream<String> streamValidatorRs = validatorRs.keySet().stream();
            streamValidatorRs.forEach(i -> model.addAttribute(i));
//            streamValidatorRs.forEach(i -> log.info("i = {} ", i));


            return "redirect:/member/signup";
        }

        memberService.signUp(memberAndSignupDto);

        return  "/member/success";
    }

    @GetMapping("/success")
    public String success(){
        return "/member/success";
    }


    //local login start

    @GetMapping("/login")
    public String login(){
        return "/member/loginForm";
    }

    /**
     * @des   로그인 기능
     * @param memberAndLoginDto
     * @param reqURI
     * @param errors
     * @param res
     * @param req
     * @param model
     * @return String
     */
    @PostMapping("/login")
    public String login(@Valid MemberAndLoginDto memberAndLoginDto, String reqURI, Errors errors, HttpSession session, Model model, RedirectAttributes Ra){
        // 비밀번호는 암호화 처리 되어있음.

        // 1. 로그인 정보 넘어오면 유효성 확인
        if(errors.hasErrors()){
            model.addAttribute("memberAndLoginDto", memberAndLoginDto);

            Map<String,String> validatorRs = memberService.validateHandling(errors);
            Stream<String> streamValidatorRs = validatorRs.keySet().stream();
            streamValidatorRs.forEach(i -> model.addAttribute(i));

            return "/member/loginForm";
        }
        MemberAndLoginDto resultLoginDto = null;
        try {
            // 2. 비밀번호 암호화 부분 값 확인
            resultLoginDto = new MemberAndLoginDto();
            resultLoginDto = memberService.localLogin(memberAndLoginDto);

            // 2-1. 불일치
            if(resultLoginDto == null){
                errors.reject("id","아이디 또는 비밀번호가 맞지 않습니다.");
                model.addAttribute("msg","아이디 또는 비밀번호가 맞지 않습니다.");

                return "/member/loginForm";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 3. 일치하면 세션에 저장
//        HttpSession session = req.getSession();
        //  3-1. 세션 있으면 있는 세션 반환, 없으면
        //  신규 생성 후 메인 이동 (기본값 true)
        session.setAttribute(SessionConst.LOGIN_MEMBER, resultLoginDto);
        MemberAndLoginDto custIdDto = (MemberAndLoginDto) session.getAttribute(SessionConst.LOGIN_MEMBER);

        String loginName = custIdDto.getName();
//        String custId = custIdDto.getCustId();


        session.setAttribute("loginName",loginName);
//        session.setAttribute("custId",custId);
//        Ra.addFlashAttribute("loginName",loginName);
//        return "redirect:/categories/best-page" *** db 연결 후 수정;
        // 4. reqURL 여부에 따른 이동
        reqURI = reqURI == null || reqURI.equals("") ? "/market-newproduct" : reqURI;

        if (!"/categories/best-page".equals(reqURI)) {
            Pattern pattern = Pattern.compile("[ㄱ-ㅎㅏ-ㅣ가-힣]+");
            Matcher matcher = pattern.matcher(reqURI);

            StringBuilder result = new StringBuilder();
            while (matcher.find()) {
                String koreanText = matcher.group();
                try {
                    String encodedText = URLEncoder.encode(koreanText, "UTF-8");
                    matcher.appendReplacement(result, encodedText);
                } catch (UnsupportedEncodingException e) {
                    System.err.println("Unsupported encoding: " + e.getMessage());
                }
            }
            matcher.appendTail(result);
            reqURI = result.toString();
        }
        return "redirect:"+reqURI;
    }


    @GetMapping("/logout")
    public String logout(HttpSession session){
        // create : false > 세션이 있으면 기존 세션을 반환하고,
        // 없으면 새로운 세션을 생성하지 않고 null을 반환한다
//        HttpSession session = req.getSession(false);

        if(session != null){
            session.invalidate();

        }

        return "redirect:/market-newproduct";

//        return "redirect:/";
    }

    //local login end

    //find id&pwd
    @GetMapping("/find/password")
    public String findIdByEmail(){
        return "/member/findForm";
    }

    // email 인증을 통한 pwd 재설정
    @PostMapping("/find/password/{email}")
    @ResponseBody
    public String sendEmail(@PathVariable String email){
        MemberAndMailAuthDto memberAndMailAuthDto = new MemberAndMailAuthDto();
        // 랜덤 문자열을 생성해서 mailKey에 넣기
        String mailKey = new MailTempKey().getKey();
        memberAndMailAuthDto.setMailKey(mailKey);
        memberAndMailAuthDto.setEmail(email);

        log.info("mailKey = {}", mailKey);

        try {
            // 이메일 발송
            MailHandler sendMail = new MailHandler(javaMailSender);
            sendMail.setSubject("[Brokurly] 인증코드 안내]"); // 메일 제목
            sendMail.setText(
                    "<h1>Brokurly 비밀번호 재설정</h1>" +
                            "<br>아래의 인증 번호를 확인해주세요<br>" +
                            "<h3>" +mailKey + "</h3>"+
                            "<br><br>이메일 인증 절차에 따라 이메일 인증코드를 발급해드립니다."+
                            "<br>인증코드는 이메일 발송 시점으로부터 3분동안 유효합니다."
            );
            sendMail.setFrom(this.email,"브로컬리");
            sendMail.setTo(memberAndMailAuthDto.getEmail());
            sendMail.send();

        } catch (MessagingException e) {
            throw new RuntimeException(e);

        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

        return mailKey;
    }

    // mypage/info/modify
    @GetMapping("/info/modify")
    public String modify(HttpServletRequest req, Model model){
        HttpSession session = req.getSession(false);
        MemberAndLoginDto dto = (MemberAndLoginDto)session.getAttribute(SessionConst.LOGIN_MEMBER);

        MemberAndSignupDto memberDto = new MemberAndSignupDto();
        memberDto = memberService.readMemberByOne(dto.getCustId());

        model.addAttribute("memberDto", memberDto);

        return "/member/modifyForm";
    }


    /**
     * @des   비밀번호 재설정
     * @return
     */
    @PostMapping("/find/password/reset")
    public String changePassword(String emailHidden,Model model){

        model.addAttribute("email",emailHidden);
        return "/member/resetPwdForm";
    }

    @PatchMapping("/find/password/reset/{email}/{pwd}")
    @ResponseBody
    public ResponseEntity<String> changePassword(@PathVariable String email, @PathVariable String pwd){
       // 새 비밀번호 암호화 후 업로드
        MemberAndLoginDto memberAndLoginDto = new MemberAndLoginDto();

        memberAndLoginDto.setCustId(email);
        memberAndLoginDto.setPwd(pwd);

        try {
            if(memberService.chageNewPwd(memberAndLoginDto) == 0){
               new Exception("비밀번호 변경 에러입니다.");
            }
            return new ResponseEntity<String>("비밀번호 변경이 완료되었습니다.", HttpStatus.OK);

        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<>("비밀번호 변경에 실패하였습니다.", HttpStatus.BAD_REQUEST);
        }

    }
}