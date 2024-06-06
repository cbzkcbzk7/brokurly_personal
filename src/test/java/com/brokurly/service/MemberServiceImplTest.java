package com.brokurly.service;

import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndMailAuthDto;
import com.brokurly.entity.member.Member;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.repository.member.MemberDao;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/root-context.xml"})
@Slf4j
class MemberServiceImplTest {
    @Autowired
    private MemberDao dao;


    @Test
//    @BeforeEach   // 모든 메서드에 해당될 때 붙여주면 가장 먼저 실행됨
    @Transactional
    public void delete(){
        dao.deleteMemberAll();
        assertTrue(dao.countMemberAll() == 0);

    }


    @Test
    @DisplayName("signUp() 테스트 : 회원가입")
    @Transactional
    public void insert(){
        BCryptPasswordEncoder chPwd = new BCryptPasswordEncoder();

        MemberAndSignupDto dto = new MemberAndSignupDto("aaaaa1234","1234","userA","adsf1234@gmail.com","01012341111","M","2024-02-25","0","testSnsid");
        dto.setPwd(chPwd.encode(dto.getPwd())); // 암호화 확인
        Member member = new Member();
        member.changeStatus(dto);


        assertTrue(dao.insert(member) == 1);
        assertTrue(dao.countMember("aaaaa1234") == 1);

        dto = new MemberAndSignupDto("asdf1234","1234","userA1","adsf1234@gmail.com","01012341111","M","2024-02-25","0","snsid");
        member.changeStatus(dto);

        assertTrue(dao.insert(member) == 1);
      //  assertTrue(dao.countMemberAll() == 2);
    }

    @Test
    @DisplayName("localLogin() 테스트 : 로컬 로그인 아이디/비밀번호 확인")
    @Transactional
    public void localLogin(){
        Member member = new Member();
        MemberAndLoginDto login = new MemberAndLoginDto("test1234","12345","test");
        member.changeStatus(login);

        member = dao.selectMemberByLogin(member); // 해당 id 여부
        assertTrue(member != null);

        log.info("member = {} ", member);

        if(member != null) { // 해당하는 id가 있으면 사용자 입력 비밀번호와 가져온 비밀번호 일치 여부 확인(암호화)
            log.info("login.getPwd() = {} ", login.getPwd());
            log.info("member.makeLoginDto().getPwd() = {}", member.makeLoginDto().getPwd());

            BCryptPasswordEncoder chPwd = new BCryptPasswordEncoder();

           assertTrue(chPwd.matches(login.getPwd(), member.makeLoginDto().getPwd()));

        }



    }

    @Test
    @DisplayName("signUpBySns() 테스트 : 카카오 로그인 객체반환")
    @Transactional
    public void selectBySns(){
        Member member = dao.selectMemberBySnsId("3346668815");
        log.info("memeber.makeFullDto = {}", member.makeFullDto());

    }

    @Test
    @DisplayName("updateMailKey() 테스트 : update 테스트")
    @Transactional
    public void updateMailKey(){
        MemberAndMailAuthDto dto = new MemberAndMailAuthDto();
        dto.setMailKey("testsKey");
        dto.setEmail("test1234@gmail.com");
        dto.setCustId("test1234@gmail.com");

        Member member = new Member();
        member.changeStatus(dto);

       assertTrue(dao.updateMailKey(member) == 1);
    }

    @Test
    @DisplayName("chageNewPwd() 테스트 : 비밀번호 변경(update")
    @Transactional
    void updatePwd(){
        BCryptPasswordEncoder chPwd = new BCryptPasswordEncoder();
        MemberAndLoginDto dto = new MemberAndLoginDto("cbzkcbzk7@naver.com","12345","test");
        dto.setPwd(chPwd.encode(dto.getPwd()));

        Member member = new Member();
        member.changeStatus(dto);

        assertTrue(dao.updateMemberByPwd(member) == 1);


    }

}