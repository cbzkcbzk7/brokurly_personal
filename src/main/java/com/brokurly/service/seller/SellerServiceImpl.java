package com.brokurly.service.seller;



import com.brokurly.dto.goods.GoodsDto;
import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.dto.seller.SellerAndLoginDto;
import com.brokurly.dto.seller.SellerBsnsNoDto;
import com.brokurly.entity.goods.Goods;
import com.brokurly.entity.member.Member;
import com.brokurly.entity.seller.Seller;
import com.brokurly.repository.member.MemberDao;
import com.brokurly.repository.seller.SellerDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class SellerServiceImpl implements SellerService {
    private final SellerDao sellerDao;

    SellerServiceImpl(SellerDao sellerDao) {
        this.sellerDao = sellerDao;
    }

    @Override
    // 회원가입 시 , 유효성 체크
    public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorRs = new HashMap<>();

        for (FieldError err : errors.getFieldErrors()) {  // 유효성 검사에 실패한 필드 목록을 가져옴
            String validKeyName = String.format("valid_%s", err.getField()); // 실패한 필드명을 가져옴
            validatorRs.put(validKeyName, err.getDefaultMessage()); // 실패한 필드에 정의된 메시지를 가져옴

        }

        return validatorRs;
    }

    /**
     * @param sellerAndLoginDto
     * @return memberAndLoginDt
     * @desc local 로그인 id/pwd 체크
     */
    @Override
    public SellerAndLoginDto localLogin(SellerAndLoginDto sellerAndLoginDto) {
        Seller seller = new Seller();
        // 1. 사용자가 입력한 아이디와 맞는 id,pwd를 가져옴
        seller.changeStatus(sellerAndLoginDto);
        seller = sellerDao.selectSellerByLogin(seller);

        if (seller != null) {
            return seller.makeLoginDto();
        }

        return null;

    }

    //id로 bsnsNo 불러오기
    @Override
    public SellerBsnsNoDto selectBsnsNo(String id) {
        Seller seller = sellerDao.selectBsnsNoById(id);
        return seller.makeBsnsDto();
    }
}