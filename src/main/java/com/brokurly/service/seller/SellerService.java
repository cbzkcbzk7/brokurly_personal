package com.brokurly.service.seller;


import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.dto.seller.SellerAndLoginDto;
import com.brokurly.dto.seller.SellerBsnsNoDto;
import org.springframework.validation.Errors;

import java.util.Map;

public interface SellerService {

    Map<String, String> validateHandling(Errors errors);

    SellerAndLoginDto localLogin(SellerAndLoginDto sellerAndLoginDto);

    SellerBsnsNoDto selectBsnsNo(String id);

}