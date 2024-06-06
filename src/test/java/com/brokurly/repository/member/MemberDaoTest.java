package com.brokurly.repository.member;

import com.brokurly.dto.member.MemberAndLoginDto;
import com.brokurly.dto.member.MemberAndSignupDto;
import com.brokurly.entity.member.Member;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/root-context.xml"})
@Slf4j
class MemberDaoTest {

    @Autowired
    MemberDao dao;

    @Test
    @Transactional
    void countMemberByLogin() {
        dao.deleteMemberAll();
        Member member = new Member();
        MemberAndSignupDto dto = new MemberAndSignupDto("aaaaa1234","1234","userA","adsf1234@gmail.com","01012341111","M","2024-02-25","0","testSnsid");
        member.changeStatus(dto);
        assertTrue(dao.insert(member) == 1);

        // 아이디 비밀번호 둘 다 없을 때
        MemberAndLoginDto dtoL = new MemberAndLoginDto("asdf1234","5555","userA");
        member.changeStatus(dtoL);
        assertTrue(dao.countMemberByLogin(member) == 0);

        // 아이디만 있을 때
        dtoL = new MemberAndLoginDto("aaaaa1234","5555","userA");
        member.changeStatus(dtoL);
        assertTrue(dao.countMemberByLogin(member) == 0);

        // 아이디 비밀번호 일치할 때
        dtoL = new MemberAndLoginDto("aaaaa1234","1234","userA");
        member.changeStatus(dtoL);
                assertTrue(dao.countMemberByLogin(member) == 1);
   }

    @Test
    @Transactional
    void selectMemberByLogin() {

        // 파라미터값 해당 멤버객체 부르기
        MemberAndLoginDto dto = new MemberAndLoginDto("aaaaa1234","1234","userA");
        Member member = new Member();
        member.changeStatus(dto);
        assertTrue(dao.selectMemberByLogin(member) != null);

    }

    @Test
    @Transactional
    void selectMemberByOne(){
       Member member = new Member();
        member = dao.selectMemberByOne("test1234");
        log.info("memeber = {}", member);
        assertTrue(member != null);
    }

    @Test
    @Transactional
    void updatePwd(){
        MemberAndLoginDto dto = new MemberAndLoginDto("cbzkcbzk7@naver.com","123456","test");
        Member member = new Member();
        member.changeStatus(dto);

        assertTrue(dao.updateMemberByPwd(member) == 1);

    }
}