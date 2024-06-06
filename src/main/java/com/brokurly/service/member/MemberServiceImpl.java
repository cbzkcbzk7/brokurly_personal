package com.brokurly.service.member;



import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.entity.member.Member;
import com.brokurly.repository.member.MemberDao;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
    private final MemberDao memberDao;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    MemberServiceImpl(MemberDao memberDao,BCryptPasswordEncoder bCryptPasswordEncoder){
        this.memberDao = memberDao;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Override
    // 회원가입 시 , 유효성 체크
    public Map<String, String> validateHandling(Errors errors){
        Map<String, String> validatorRs = new HashMap<>();

        for(FieldError err : errors.getFieldErrors()) {  // 유효성 검사에 실패한 필드 목록을 가져옴
            String validKeyName = String.format("valid_%s", err.getField()); // 실패한 필드명을 가져옴
            validatorRs.put(validKeyName, err.getDefaultMessage()); // 실패한 필드에 정의된 메시지를 가져옴

        }

        return validatorRs;
    }
    @Override
    public int signUp(MemberAndSignupDto memberAndSignupDto) {
        memberAndSignupDto.setPwd(bCryptPasswordEncoder.encode(memberAndSignupDto.getPwd()));
        Member member = new Member();
        member.changeStatus(memberAndSignupDto);
        return memberDao.insert(member);
    }

    // mypage/info/modify
    @Override
    public MemberAndSignupDto readMemberByOne(String custId){
        Member member = new Member();
        member = memberDao.selectMemberByOne(custId);

        return member.makeFullDto();
    }
    /**
     * @desc local 로그인 id/pwd 체크
     * @param memberAndLoginDto
     * @return memberAndLoginDt
     */
    @Override
    public MemberAndLoginDto localLogin(MemberAndLoginDto memberAndLoginDto){
        Member member = new Member();
        // 1. 사용자가 입력한 아이디와 맞는 id,pwd를 가져옴
        member.changeStatus(memberAndLoginDto);
        member = memberDao.selectMemberByLogin(member);

        // 2. 사용자 입력한 pwd와 가져온 pwd가 match 되는지 확인
        if(bCryptPasswordEncoder.matches(memberAndLoginDto.getPwd(),member.makeLoginDto().getPwd())){
            // 3. 일치하면 객체 return
            return member.makeLoginDto();
        }

        return null;
    }

    // 카카오 로그인 start
    @Override
    public MemberAndSignupDto signUpBySns(String snsId){
        Member member = memberDao.selectMemberBySnsId(snsId);

        return member.makeFullDto();
    }

    @Override
    public void kakaoJoin(MemberAndSignupDto memberAndSignupDto){
        Member member = new Member();
        member.changeStatus(memberAndSignupDto);
        memberDao.insertSnsMember(member);

        String custId = memberAndSignupDto.getCustId();
        log.debug("custId = {} ", custId);

    }
    @Override
    public int kakaoLogin(String snsId){
        log.debug("snsId = {}",snsId);

        return memberDao.selectSnsMember(snsId);
    }
    @Override
    public String findBySnsId(String snsId){
        String findSnsId = memberDao.findBySnsId(snsId);

        return findSnsId;
    }

    // 카카오 로그인 end
    @Override
    public int getCountAll(){
        return memberDao.countMemberAll();
    }

    @Override
    public int getCount(String custId){
        return memberDao.countMember(custId);
    }

    @Override
    public int getCountEmail(String email) { return memberDao.countEmail(email); }

    @Override
    public int emailAuthFail(String custId){
        return memberDao.emailAuthFail(custId);
    }

    @Override
    public int updateMailKey(MemberAndMailAuthDto memberAndMailAuthDto){
        Member member = new Member();
        member.changeStatus(memberAndMailAuthDto);

        return memberDao.updateMailKey(member);
    }
    @Override
    public int updateMailAuth(MemberAndMailAuthDto memberAndMailAuthDto){
        Member member = new Member();
        member.changeStatus(memberAndMailAuthDto);

        return memberDao.updateMailAuth(member);
    }

    @Override
    public int chageNewPwd(MemberAndLoginDto memberAndLoginDto){
        memberAndLoginDto.setPwd(bCryptPasswordEncoder.encode(memberAndLoginDto.getPwd()));
        Member member = new Member();
        member.changeStatus(memberAndLoginDto);

        return memberDao.updateMemberByPwd(member);
    }
    @Override
    public int removeAll(){
        return memberDao.deleteMemberAll();
    }
}