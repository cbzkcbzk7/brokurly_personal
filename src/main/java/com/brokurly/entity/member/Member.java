package com.brokurly.entity.member;

import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.dto.member.MemberAndSignupDto;

import lombok.*;


import java.util.Date;



@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private String custId;
    private String pwd;
    private String name;
    private String email;
    private String telNo;
    private String sex;
    private String birthDt;
    private Date regDt;
    private String adultVerifDt;
    private int cartCnt;
    private int point;
    private String consent;
    private String actStat;
    private String grade;

    private String snsId;

    private Integer mailAuth;
    private String  mailKey;

    public MemberAndSignupDto makeFullDto(){
        return MemberAndSignupDto.builder()
                .custId(custId)
                .pwd(pwd)
                .name(name)
                .email(email)
                .telNo(telNo)
                .sex(sex)
                .birthDt(birthDt)
                .consent(consent)
                .snsId(snsId)
                .build();
    }

    public MemberAndLoginDto makeLoginDto(){
        return MemberAndLoginDto.builder()
                .custId(custId)
                .pwd(pwd)
                .name(name)
                .build();
    }

    public MemberAndMailAuthDto makeMailDto(){
        return MemberAndMailAuthDto.builder()
                .custId(custId)
                .email(email)
                .mailAuth(mailAuth)
                .mailKey(mailKey)
                .build();
    }
    public void changeStatus(MemberAndSignupDto memberAndSignupDto) {
        this.custId = memberAndSignupDto.getCustId();
        this.pwd = memberAndSignupDto.getPwd();
        this.name = memberAndSignupDto.getName();
        this.email = memberAndSignupDto.getEmail();
        this.telNo = memberAndSignupDto.getTelNo();
        this.sex = memberAndSignupDto.getSex();
        this.birthDt = memberAndSignupDto.getBirthDt();
        this.consent = memberAndSignupDto.getConsent();
        this.snsId = memberAndSignupDto.getSnsId();
    }

    public void changeStatus(MemberAndLoginDto memberAndLoginDto){
        this.custId = memberAndLoginDto.getCustId();
        this.pwd = memberAndLoginDto.getPwd();
        this.name = memberAndLoginDto.getName();
    }


    public void changeStatus(MemberAndMailAuthDto memberAndMailAuthDto){
        this.custId = memberAndMailAuthDto.getCustId();
        this.email = memberAndMailAuthDto.getEmail();
        this.mailAuth = memberAndMailAuthDto.getMailAuth();
        this.mailKey = memberAndMailAuthDto.getMailKey();
    }
}