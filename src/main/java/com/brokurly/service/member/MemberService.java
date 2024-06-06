package com.brokurly.service.member;


import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.entity.member.Member;
import org.springframework.validation.Errors;

import java.util.Map;

public interface MemberService {

    Map<String, String> validateHandling(Errors errors);

    // mypage/info/modify
    MemberAndSignupDto readMemberByOne(String custId);
    MemberAndLoginDto localLogin(MemberAndLoginDto memberAndLoginDto);
    MemberAndSignupDto signUpBySns(String snsId);
    void kakaoJoin(MemberAndSignupDto memberAndSignupDto);
    int signUp(MemberAndSignupDto memberAndSignupDto);
    int kakaoLogin(String snsId);
    String findBySnsId(String snsId);
    int getCountAll();
    int getCount(String custId);
    int getCountEmail(String email);
    int emailAuthFail(String custId);
    int updateMailKey(MemberAndMailAuthDto memberAndMailAuthDto);
    int updateMailAuth(MemberAndMailAuthDto memberAndMailAuthDto);
    int chageNewPwd(MemberAndLoginDto memberAndLoginDto);
    int removeAll();
}