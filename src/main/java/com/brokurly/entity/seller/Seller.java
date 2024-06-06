package com.brokurly.entity.seller;

import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.dto.seller.SellerAndLoginDto;
import com.brokurly.dto.seller.SellerBsnsNoDto;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;


@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Seller {
    private String bsnsNo;
    private String id;
    private String pwd;
    private String name;
    private String email;
    private String telNo;
    private String sex;
    private String birthDt;
    private String regDt;
    private String actStat;


    public SellerAndLoginDto makeLoginDto(){
        return SellerAndLoginDto.builder()
                .id(id)
                .pwd(pwd)
                .name(name)
                .build();
    }

    public void changeStatus(SellerAndLoginDto sellerAndLoginDto){
        this.id = sellerAndLoginDto.getId();
        this.pwd = sellerAndLoginDto.getPwd();
        this.name = sellerAndLoginDto.getName();
    }


    public SellerBsnsNoDto makeBsnsDto(){
        return SellerBsnsNoDto.builder()
                .name(name)
                .bsnsNo(bsnsNo)
                .build();
    }

//    public void makeBsnsNo(SellerBsnsNoDto sellerBsnsNoDto){
//        this.bsnsNo = sellerBsnsNoDto.getBsnsNo();
//        this.name = sellerBsnsNoDto.getName();
//    }

}